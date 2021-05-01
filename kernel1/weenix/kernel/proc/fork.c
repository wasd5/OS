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
        
        KASSERT(regs != NULL); /* the function argument must be non-NULL */
        KASSERT(curproc != NULL); /* the parent process, which is curproc, must be non-NULL */
        KASSERT(curproc->p_state == PROC_RUNNING); /* the parent process must be in the running state and not in the zombie state */
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");

        proc_t *newproc = proc_create("child");
        KASSERT(newproc->p_state == PROC_RUNNING); 
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");
        kthread_t *newthr = kthread_clone(curthr);
        KASSERT(newthr->kt_kstack != NULL); 
        dbg(DBG_PRINT, "(GRADING3A 7.a)\n");

        vmarea_t *cur_vma = NULL;
        vmarea_t *child_vma = NULL;

        vmmap_destroy(newproc->p_vmmap);

        vmmap_t *child_vmmap = vmmap_clone(curproc->p_vmmap);

        mmobj_t *csh = NULL;
        mmobj_t *psh = NULL;
        list_iterate_begin(&curproc->p_vmmap->vmm_list, cur_vma, vmarea_t, vma_plink) {
                child_vma = vmmap_lookup(child_vmmap, cur_vma->vma_start);
                if((cur_vma->vma_flags & MAP_PRIVATE) != MAP_PRIVATE) {
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                        cur_vma->vma_obj->mmo_ops->ref(cur_vma->vma_obj);
                        child_vma->vma_obj = cur_vma->vma_obj;
                } else {
                        dbg(DBG_PRINT, "(GRADING3B 7)\n");
                        cur_vma->vma_obj->mmo_ops->ref(cur_vma->vma_obj);
                        
                        csh = shadow_create();
                        psh = shadow_create();


                        csh->mmo_shadowed = cur_vma->vma_obj;
                        psh->mmo_shadowed = cur_vma->vma_obj;
                        
                        csh->mmo_un.mmo_bottom_obj = mmobj_bottom_obj(cur_vma->vma_obj);
                        psh->mmo_un.mmo_bottom_obj = mmobj_bottom_obj(cur_vma->vma_obj);
                        
                        child_vma->vma_obj = csh;
                        cur_vma->vma_obj = psh;
                }
                list_insert_tail(mmobj_bottom_vmas(cur_vma->vma_obj), &child_vma->vma_olink);
        } list_iterate_end();
        newproc->p_vmmap = child_vmmap;
        child_vmmap->vmm_proc = newproc;
        pt_unmap_range(curproc->p_pagedir, USER_MEM_LOW, USER_MEM_HIGH);
        tlb_flush_all();
        regs->r_eax = 0;

        newthr->kt_proc = newproc;
        newthr->kt_ctx.c_pdptr = newproc->p_pagedir;
        newthr->kt_ctx.c_kstack = (uintptr_t)newthr->kt_kstack;

        newthr->kt_ctx.c_kstacksz = DEFAULT_STACK_SIZE;
        newthr->kt_ctx.c_eip = (uintptr_t)userland_entry;


        newthr->kt_ctx.c_esp = fork_setup_stack(regs, newthr->kt_kstack);
        int count = 0;
        for(count = 0; count < NFILES; count++)
        {
            newproc->p_files[count] = curproc->p_files[count];


            if(curproc->p_files[count])
            {
                fref(newproc->p_files[count]);
                        dbg(DBG_PRINT, "(GRADING3B 7)\n");
            }
                dbg(DBG_PRINT, "(GRADING3B 7)\n");
        }
        newproc->p_start_brk = curproc->p_start_brk;
        newproc->p_cwd = curproc->p_cwd;
        newproc->p_brk = curproc->p_brk;

        list_insert_tail(&(newproc->p_threads), &(newthr->kt_plink));
        sched_make_runnable(newthr);


        dbg(DBG_PRINT, "(GRADING3B 7)\n");
        return newproc->p_pid;
}