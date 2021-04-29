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

#include "globals.h"
#include "errno.h"
#include "types.h"

#include "mm/mm.h"
#include "mm/tlb.h"
#include "mm/mman.h"
#include "mm/page.h"

#include "proc/proc.h"

#include "util/string.h"
#include "util/debug.h"

#include "fs/vnode.h"
#include "fs/vfs.h"
#include "fs/file.h"

#include "vm/vmmap.h"
#include "vm/mmap.h"

/*
 * This function implements the mmap(2) syscall, but only
 * supports the MAP_SHARED, MAP_PRIVATE, MAP_FIXED, and
 * MAP_ANON flags.
 *
 * Add a mapping to the current process's address space.
 * You need to do some error checking; see the ERRORS section
 * of the manpage for the problems you should anticipate.
 * After error checking most of the work of this function is
 * done by vmmap_map(), but remember to clear the TLB.
 */
int
do_mmap(void *addr, size_t len, int prot, int flags,
        int fd, off_t off, void **ret)
{
        //NOT_YET_IMPLEMENTED("VM: do_mmap");
        if (!((flags & MAP_SHARED) || (flags & MAP_PRIVATE) || (flags & MAP_ANON) || (flags & MAP_FIXED)))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }

        if (!PAGE_ALIGNED(off))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }
        if (addr == NULL && (flags & MAP_FIXED))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }

        if (addr != NULL && ((uint32_t)addr < USER_MEM_LOW || (uint32_t)addr + len > USER_MEM_HIGH))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }

        if (len <= 0 || len > USER_MEM_HIGH - USER_MEM_LOW)
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }

        if ((fd < 0 || fd >= NFILES) && !(MAP_ANON & flags))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EBADF;
        }

        if (curproc->p_files[fd] == NULL && !(MAP_ANON & flags))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EBADF;
        }
        file_t *cur_file = curproc->p_files[fd];

        if (!(flags & MAP_ANON) && (flags & MAP_SHARED) && (prot & PROT_WRITE) && !(curproc->p_files[fd]->f_mode & FMODE_WRITE))
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EACCES;
        }

        vnode_t *cur_vnode = cur_file->f_vnode;
        if (flags & MAP_ANON)
        { 
                cur_vnode = NULL;
                dbg(DBG_PRINT, "(GRADING3D 2)\n");
        }
        else
        {
                cur_vnode = curproc->p_files[fd]->f_vnode;
                dbg(DBG_PRINT, "(GRADING3A)\n");
        }

        int reval;
        vmarea_t *res_vma;
        reval = vmmap_map(curproc->p_vmmap, cur_vnode, ADDR_TO_PN((uint32_t)addr), (uint32_t)ADDR_TO_PN(PAGE_ALIGN_UP(len)),
                          prot, flags, off, VMMAP_DIR_HILO, &res_vma);
        if (reval >= 0)
        {
                *ret = PN_TO_ADDR(res_vma->vma_start);
                tlb_flush_all();
                dbg(DBG_PRINT, "(GRADING3A)\n");
        }
        KASSERT(NULL != curproc->p_pagedir); /* page table must be valid after a memory segment is mapped into the address space */
        dbg(DBG_PRINT, "(GRADING3A 2.a)\n");
        return reval;
}


/*
 * This function implements the munmap(2) syscall.
 *
 * As with do_mmap() it should perform the required error checking,
 * before calling upon vmmap_remove() to do most of the work.
 * Remember to clear the TLB.
 */
int
do_munmap(void *addr, size_t len)
{
        //NOT_YET_IMPLEMENTED("VM: do_munmap");
		uint32_t nadd = ADDR_TO_PN(addr);
        if (len <= 0 || len + USER_MEM_LOW > USER_MEM_HIGH)
        {
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }
        if((uint32_t)addr < USER_MEM_LOW || (uint32_t)addr + len > USER_MEM_HIGH){
        		dbg(DBG_PRINT, "(GRADING3D 1)\n");
                return -EINVAL;
        }
        int res = vmmap_remove(curproc->p_vmmap, nadd, (len - 1) / PAGE_SIZE + 1);
        tlb_flush_all();
        dbg(DBG_PRINT, "(GRADING3D 2)\n");
        return res;
}

