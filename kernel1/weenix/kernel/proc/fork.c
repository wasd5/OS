/******************************************************************************/
/* Important Spring 2021 CSCI 402 usage information:                          */
/*                                                                            */
/* This fils is part of CSCI 402 kernel programming assignments at USC.       */
/*         53616c7465645f5fd1e93dbf35cbffa3aef28f8c01d8cf2ffc51ef62b26a       */
/*         f9bda5a68e5ed8c972b17bab0f42e24b19daa7bd408305b1f7bd6c7208c1       */
/*         0e36230e913039b3046dd5fd0ba706a624d33dbaa4d6aab02c82fe09f561       */
/*         01b0fd977b0051f0b0ce0c69f7db857b1b5e007be2db6d42894bf93de848       */
/*         806d9152bd5715e9                                                   */
/* Please understand that you are NOT permitted to distribute or publically   */
/*         display a copy of this file (or ANY PART of it) for any reason.    */
/* If anyone (including your prospective employer) asks you to post the code, */
/*         you must inform them that you do NOT have permissions to do so.    */
/* You are also NOT permitted to remove or alter this comment block.          */
/* If this comment block is removed or altered in a submitted file, 20 points */
/*         will be deducted.                                                  */
/******************************************************************************/

#include "types.h"
#include "globals.h"
#include "errno.h"

#include "util/debug.h"
#include "util/string.h"

#include "proc/proc.h"
#include "proc/kthread.h"

#include "mm/mm.h"
#include "mm/mman.h"
#include "mm/page.h"
#include "mm/pframe.h"
#include "mm/mmobj.h"
#include "mm/pagetable.h"
#include "mm/tlb.h"

#include "fs/file.h"
#include "fs/vnode.h"

#include "vm/shadow.h"
#include "vm/vmmap.h"

#include "api/exec.h"

#include "main/interrupt.h"

/* Pushes the appropriate things onto the kernel stack of a newly forked thread
 * so that it can begin execution in userland_entry.
 * regs: registers the new thread should have on execution
 * kstack: location of the new thread's kernel stack
 * Returns the new stack pointer on success. */
static uint32_t
fork_setup_stack(const regs_t *regs, void *kstack)
{
        /* Pointer argument and dummy return address, and userland dummy return
         * address */
        uint32_t esp = ((uint32_t) kstack) + DEFAULT_STACK_SIZE - (sizeof(regs_t) + 12);
        *(void **)(esp + 4) = (void *)(esp + 8); /* Set the argument to point to location of struct on stack */
        memcpy((void *)(esp + 8), regs, sizeof(regs_t)); /* Copy over struct */
        return esp;
}


/*
 * The implementation of fork(2). Once this works,
 * you're practically home free. This is what the
 * entirety of Weenix has been leading up to.
 * Go forth and conquer.
 */
int
do_fork(struct regs *regs)
{
        vmarea_t *vma, *clone_vma;
        pframe_t *pf;
        mmobj_t *to_delete, *new_shadowed;

        // NOT_YET_IMPLEMENTED("VM: do_fork");
        // return 0;
        KASSERT(regs != NULL); /* the function argument must be non-NULL */
        KASSERT(curproc != NULL); /* the parent process, which is curproc, must be non-NULL */
        KASSERT(curproc->p_state == PROC_RUNNING); /* the parent process must be in the running state and not in the zombie state */
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");

        proc_t *newproc = proc_create("child");
        kthread_t *newthr = kthread_clone(curthr);
        vmmap_destroy(newproc->p_vmmap);
        vmmap_t *child_map = vmmap_clone(curproc->p_vmmap);
        KASSERT(newproc->p_state == PROC_RUNNING); /* new child process starts in the running state */
        KASSERT(newproc->p_pagedir != NULL); /* new child process must have a valid page table */
        KASSERT(newthr->kt_kstack != NULL); /* thread in the new child process must have a valid kernel stack */
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        list_iterate_begin(&curproc->p_vmmap->vmm_list, vma, vmarea_t, vma_plink) {
                clone_vma = vmmap_lookup(child_map, vma->vma_start);
                if(vma->vma_flags & MAP_PRIVATE) {
                        vma->vma_obj->mmo_ops->ref(vma->vma_obj);
                        mmobj_t *child_shadow = shadow_create();
                        mmobj_t *parent_shadow = shadow_create();
                        child_shadow->mmo_shadowed = vma->vma_obj;
                        parent_shadow->mmo_shadowed = vma->vma_obj;
                        child_shadow->mmo_un.mmo_bottom_obj = mmobj_bottom_obj(vma->vma_obj);
                        parent_shadow->mmo_un.mmo_bottom_obj = mmobj_bottom_obj(vma->vma_obj);
                        clone_vma->vma_obj = child_shadow;
                        vma->vma_obj = parent_shadow;
                        list_insert_tail(mmobj_bottom_vmas(vma->vma_obj), &clone_vma->vma_olink);
                        dbg(DBG_PRINT, "(GRADING3B 7)\n");
                } else {
                        vma->vma_obj->mmo_ops->ref(vma->vma_obj);
                        list_insert_tail(mmobj_bottom_vmas(vma->vma_obj), &clone_vma->vma_olink);
                        clone_vma->vma_obj = vma->vma_obj;
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }
        } list_iterate_end();
        newproc->p_vmmap = child_map;
        child_map->vmm_proc = newproc;

        pt_unmap_range(curproc->p_pagedir, USER_MEM_LOW, USER_MEM_HIGH);
    tlb_flush_all();

        regs->r_eax = 0;
        newthr->kt_proc = newproc;
        newthr->kt_ctx.c_pdptr = newproc->p_pagedir;
        newthr->kt_ctx.c_eip = (uintptr_t)userland_entry;
        newthr->kt_ctx.c_esp = fork_setup_stack(regs, newthr->kt_kstack);
        newthr->kt_ctx.c_kstack = (uintptr_t)newthr->kt_kstack;
        newthr->kt_ctx.c_kstacksz = DEFAULT_STACK_SIZE;

        for(int i = 0; i < NFILES; i++)
        {
            newproc->p_files[i] = curproc->p_files[i];
            if(curproc->p_files[i])
            {
                fref(newproc->p_files[i]);
                        dbg(DBG_PRINT, "(GRADING3B 7)\n");
            }
                dbg(DBG_PRINT, "(GRADING3B 7)\n");
        }

        newproc->p_cwd = curproc->p_cwd;
        newproc->p_brk = curproc->p_brk;
        newproc->p_start_brk = curproc->p_start_brk;

        list_insert_tail(&(newproc->p_threads), &(newthr->kt_plink));

        sched_make_runnable(newthr);
        dbg(DBG_PRINT, "(GRADING3B 7)\n");
        
        return newproc->p_pid;
}