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

#include "kernel.h"
#include "errno.h"
#include "globals.h"

#include "vm/vmmap.h"
#include "vm/shadow.h"
#include "vm/anon.h"

#include "proc/proc.h"

#include "util/debug.h"
#include "util/list.h"
#include "util/string.h"
#include "util/printf.h"

#include "fs/vnode.h"
#include "fs/file.h"
#include "fs/fcntl.h"
#include "fs/vfs_syscall.h"

#include "mm/slab.h"
#include "mm/page.h"
#include "mm/mm.h"
#include "mm/mman.h"
#include "mm/mmobj.h"

static slab_allocator_t *vmmap_allocator;
static slab_allocator_t *vmarea_allocator;

void
vmmap_init(void)
{
        vmmap_allocator = slab_allocator_create("vmmap", sizeof(vmmap_t));
        KASSERT(NULL != vmmap_allocator && "failed to create vmmap allocator!");
        vmarea_allocator = slab_allocator_create("vmarea", sizeof(vmarea_t));
        KASSERT(NULL != vmarea_allocator && "failed to create vmarea allocator!");
}

vmarea_t *
vmarea_alloc(void)
{
        vmarea_t *newvma = (vmarea_t *) slab_obj_alloc(vmarea_allocator);
        if (newvma) {
                newvma->vma_vmmap = NULL;
        }
        return newvma;
}

void
vmarea_free(vmarea_t *vma)
{
        KASSERT(NULL != vma);
        slab_obj_free(vmarea_allocator, vma);
}

/* a debugging routine: dumps the mappings of the given address space. */
size_t
vmmap_mapping_info(const void *vmmap, char *buf, size_t osize)
{
        KASSERT(0 < osize);
        KASSERT(NULL != buf);
        KASSERT(NULL != vmmap);

        vmmap_t *map = (vmmap_t *)vmmap;
        vmarea_t *vma;
        ssize_t size = (ssize_t)osize;

        int len = snprintf(buf, size, "%21s %5s %7s %8s %10s %12s\n",
                           "VADDR RANGE", "PROT", "FLAGS", "MMOBJ", "OFFSET",
                           "VFN RANGE");

        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink) {
                size -= len;
                buf += len;
                if (0 >= size) {
                        goto end;
                }

                len = snprintf(buf, size,
                               "%#.8x-%#.8x  %c%c%c  %7s 0x%p %#.5x %#.5x-%#.5x\n",
                               vma->vma_start << PAGE_SHIFT,
                               vma->vma_end << PAGE_SHIFT,
                               (vma->vma_prot & PROT_READ ? 'r' : '-'),
                               (vma->vma_prot & PROT_WRITE ? 'w' : '-'),
                               (vma->vma_prot & PROT_EXEC ? 'x' : '-'),
                               (vma->vma_flags & MAP_SHARED ? " SHARED" : "PRIVATE"),
                               vma->vma_obj, vma->vma_off, vma->vma_start, vma->vma_end);
        } list_iterate_end();

end:
        if (size <= 0) {
                size = osize;
                buf[osize - 1] = '\0';
        }
        /*
        KASSERT(0 <= size);
        if (0 == size) {
                size++;
                buf--;
                buf[0] = '\0';
        }
        */
        return osize - size;
}

/* Create a new vmmap, which has no vmareas and does
 * not refer to a process. */
vmmap_t *
vmmap_create(void)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_create");
        vmmap_t *new_map = (vmmap_t *) slab_obj_alloc(vmmap_allocator);
        if (new_map) {
                //init vmm_list
                new_map->vmm_proc = NULL;
                list_init(&new_map->vmm_list);
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        }
        dbg(DBG_PRINT, "(GRADING3B 1)\n");
        return new_map;
}

/* Removes all vmareas from the address space and frees the
 * vmmap struct. */
void
vmmap_destroy(vmmap_t *map)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_destroy");
        KASSERT(NULL != map);
        dbg(DBG_PRINT, "(GRADING3A 3.a)\n");
        vmarea_t *vma;
        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink){
               list_remove(&vma->vma_plink);
               vma->vma_obj->mmo_ops->put(vma->vma_obj);
               if(list_link_is_linked(&vma->vma_olink)){
                       list_remove(&vma->vma_olink);
               }
               vmarea_free(vma);
               dbg(DBG_PRINT, "(GRADING3B 1)\n");
        } list_iterate_end();
        slab_obj_free(vmmap_allocator, map);
        dbg(DBG_PRINT, "(GRADING3B 1)\n");  
}

/* Add a vmarea to an address space. Assumes (i.e. asserts to some extent)
 * the vmarea is valid.  This involves finding where to put it in the list
 * of VM areas, and adding it. Don't forget to set the vma_vmmap for the
 * area. */
void
vmmap_insert(vmmap_t *map, vmarea_t *newvma)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_insert");
        //TODO may need combine if overlapped
        KASSERT(NULL != map && NULL != newvma);       
        KASSERT(NULL == newvma->vma_vmmap);           
        KASSERT(newvma->vma_start < newvma->vma_end); 
        KASSERT(ADDR_TO_PN(USER_MEM_LOW) <= newvma->vma_start && ADDR_TO_PN(USER_MEM_HIGH) >= newvma->vma_end);
        dbg(DBG_PRINT, "(GRADING3A 3.b)\n");
        newvma->vma_vmmap = map;
        vmarea_t *vma; 
        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink){
            dbg(DBG_PRINT, "(GRADING3B 1)\n");
                if(vma->vma_start >= newvma->vma_start){
                        list_insert_before(&vma->vma_plink, &newvma->vma_plink);
                        dbg(DBG_PRINT, "(GRADING3B 1)\n");
                        return;
                }
        } list_iterate_end(); 
        list_insert_tail(&map->vmm_list, &newvma->vma_plink);
        dbg(DBG_PRINT, "(GRADING3B 1)\n");
}

/* Find a contiguous range of free virtual pages of length npages in
 * the given address space. Returns starting vfn for the range,
 * without altering the map. Returns -1 if no such range exists.
 *
 * Your algorithm should be first fit. If dir is VMMAP_DIR_HILO, you
 * should find a gap as high in the address space as possible; if dir
 * is VMMAP_DIR_LOHI, the gap should be as low as possible. */
int
vmmap_find_range(vmmap_t *map, uint32_t npages, int dir)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_find_range");
        vmarea_t *vma; 
        uint32_t  range_start = 0;
        uint32_t  range_end = 0;
        if(dir == VMMAP_DIR_LOHI){
                range_start = ADDR_TO_PN(USER_MEM_LOW);
                list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink){
                        range_end = vma->vma_start;
                        if((range_end - range_start) >=npages){
                                dbg(DBG_PRINT, "(GRADING3D 2)\n");
                                return range_start;

                        }
                        range_start = vma->vma_end;
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                } list_iterate_end();
                if((ADDR_TO_PN(USER_MEM_HIGH) - range_start) >=npages){
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                        return range_start;
                }else{
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                        return -1;
                }   
        }else{
                range_start = ADDR_TO_PN(USER_MEM_HIGH);
                list_iterate_reverse(&map->vmm_list, vma, vmarea_t, vma_plink){
                        range_end = vma->vma_end;
                        if((range_start - range_end) >=npages){
                                dbg(DBG_PRINT, "(GRADING3B 1)\n");
                                return range_start - npages;

                        }
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                        range_start = vma->vma_start;
                } list_iterate_end();
                if(range_start - (ADDR_TO_PN(USER_MEM_LOW)) >= npages){
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                        return range_start - npages;
                }else{
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                        return -1;
                }   
        }
}

/* Find the vm_area that vfn lies in. Simply scan the address space
 * looking for a vma whose range covers vfn. If the page is unmapped,
 * return NULL. */
vmarea_t *
vmmap_lookup(vmmap_t *map, uint32_t vfn)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_lookup");
        KASSERT(NULL != map); /* the first function argument must not be NULL */
        dbg(DBG_PRINT, "(GRADING3A 3.c)\n");
        vmarea_t *vma; 
        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink){
                if((vma->vma_start <= vfn) && (vma->vma_end > vfn)){
                        dbg(DBG_PRINT, "(GRADING3B 1)\n");
                        return vma;
                }
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        } list_iterate_end();
        dbg(DBG_PRINT, "(GRADING3B 1)\n");
        return NULL;
}

/* Allocates a new vmmap containing a new vmarea for each area in the
 * given map. The areas should have no mmobjs set yet. Returns pointer
 * to the new vmmap on success, NULL on failure. This function is
 * called when implementing fork(2). */
vmmap_t *
vmmap_clone(vmmap_t *map)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_clone");
        vmarea_t *vma;
        vmmap_t *new_vmmap = vmmap_create();
        if(!new_vmmap){
                return NULL;
        }
        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink){
                vmarea_t * cur_vma = vmarea_alloc();
                if(!cur_vma){
                        return NULL;
                }
                cur_vma->vma_start = vma->vma_start;
                cur_vma->vma_end = vma->vma_end;
                cur_vma->vma_off = vma->vma_off;
                cur_vma->vma_prot = vma->vma_prot;
                cur_vma->vma_flags = vma->vma_flags;
                cur_vma->vma_vmmap = NULL;
                cur_vma->vma_obj = vma->vma_obj;
                cur_vma->vma_obj->mmo_ops->ref(cur_vma->vma_obj);
                list_link_init(&cur_vma->vma_plink);
                list_link_init(&cur_vma->vma_olink);
                vmmap_insert(new_vmmap, cur_vma);
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
                
        } list_iterate_end();
                dbg(DBG_PRINT, "(GRADING3B 1)\n");

        return new_vmmap;
}

/* Insert a mapping into the map starting at lopage for npages pages.
 * If lopage is zero, we will find a range of virtual addresses in the
 * process that is big enough, by using vmmap_find_range with the same
 * dir argument.  If lopage is non-zero and the specified region
 * contains another mapping that mapping should be unmapped.
 *
 * If file is NULL an anon mmobj will be used to create a mapping
 * of 0's.  If file is non-null that vnode's file will be mapped in
 * for the given range.  Use the vnode's mmap operation to get the
 * mmobj for the file; do not assume it is file->vn_obj. Make sure all
 * of the area's fields except for vma_obj have been set before
 * calling mmap.
 *
 * If MAP_PRIVATE is specified set up a shadow object for the mmobj.
 *
 * All of the input to this function should be valid (KASSERT!).
 * See mmap(2) for for description of legal input.
 * Note that off should be page aligned.
 *
 * Be very careful about the order operations are performed in here. Some
 * operation are impossible to undo and should be saved until there
 * is no chance of failure.
 *
 * If 'new' is non-NULL a pointer to the new vmarea_t should be stored in it.
 */
int
vmmap_map(vmmap_t *map, vnode_t *file, uint32_t lopage, uint32_t npages,
          int prot, int flags, off_t off, int dir, vmarea_t **new)
{
    /*
        vmarea_t * cand_vmarea;
        // find/create cand_vmarea
        if(lopage == 0){
                int start = vmmap_find_range(map, npages, dir);
                if(start < 0){
                        return start;
                }
                cand_vmarea = vmarea_alloc();
                if(!cand_vmarea){
                        return -ENOMEM;
                }
                cand_vmarea->vma_start = start;
                cand_vmarea->vma_end = start + npages;
                cand_vmarea->vma_off = ADDR_TO_PN(off);
                cand_vmarea->vma_prot = prot;
                cand_vmarea->vma_flags = flags;
                list_link_init(&cand_vmarea->vma_plink);
                list_link_init(&cand_vmarea->vma_olink);
                
        }else{
                if((vmmap_is_range_empty(map, lopage ,npages))==0){
                        vmmap_remove(map, lopage, npages);
                }
                cand_vmarea = vmarea_alloc();
                cand_vmarea->vma_start = lopage;
                cand_vmarea->vma_end = lopage + npages;
                cand_vmarea->vma_off = ADDR_TO_PN(off);
                cand_vmarea->vma_prot = prot;
                cand_vmarea->vma_flags = flags;
                list_link_init(&cand_vmarea->vma_plink);
                list_link_init(&cand_vmarea->vma_olink);
        }
        
        //KAASERT cand_vmarea not null
        KASSERT(NULL != cand_vmarea);
        // get vam_obj in 3 types
        mmobj_t * vma_obj;
        if(flags & MAP_PRIVATE){
                //TODO
                vma_obj = shadow_create();
        }
        if(file == NULL){
                vma_obj = anon_create();
        }else{
                file->vn_ops->mmap(file, cand_vmarea, &vma_obj);
        }
        //map
        cand_vmarea->vma_obj = vma_obj;
        vmmap_insert(map, cand_vmarea);
        if(new != NULL){
                *new = cand_vmarea;
        }
        return 0;
       */
    KASSERT(NULL != map);                                                       /* must not add a memory segment into a non-existing vmmap */
        KASSERT(0 < npages);                                                        /* number of pages of this memory segment cannot be 0 */
        KASSERT((MAP_SHARED & flags) || (MAP_PRIVATE & flags));                     /* must specify whether the memory segment is shared or private */
        KASSERT((0 == lopage) || (ADDR_TO_PN(USER_MEM_LOW) <= lopage));             /* if lopage is not zero, it must be a user space vpn */
        KASSERT((0 == lopage) || (ADDR_TO_PN(USER_MEM_HIGH) >= (lopage + npages))); /* if lopage is not zero, the specified page range must lie completely within the user space */
        KASSERT(PAGE_ALIGNED(off));                                                 /* the off argument must be page aligned */
        dbg(DBG_PRINT, "(GRADING3A 3.d)\n");
        vmarea_t *vmarea = vmarea_alloc();
        vmarea->vma_prot = prot;
        vmarea->vma_flags = flags;
        vmarea->vma_off = ADDR_TO_PN(off);
        list_init(&vmarea->vma_plink);
        list_init(&vmarea->vma_olink);
        if (lopage == 0)
        {
                int startvfn = vmmap_find_range(map, npages, dir);
                if (startvfn != -1)
                {
                        vmarea->vma_start = startvfn;
                        dbg(DBG_PRINT, "(GRADING3B 1)\n");
                }
                else
                {
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                        return -ENOMEM;
                }
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        }
        else
        {
                if (vmmap_is_range_empty(map, lopage, npages))
                {
                        vmarea->vma_start = lopage;
                        dbg(DBG_PRINT, "(GRADING3B 1)\n");
                }
                else
                {
                        vmmap_remove(map, lopage, npages);
                        vmarea->vma_start = lopage;
                        dbg(DBG_PRINT, "(GRADING3B 1)\n");
                }
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        }
        vmarea->vma_end = vmarea->vma_start + npages;

        if (file == NULL)
        {
                if (MAP_PRIVATE & flags)
                {
                        vmarea->vma_obj = shadow_create();
                        vmarea->vma_obj->mmo_un.mmo_bottom_obj = anon_create();
                        vmarea->vma_obj->mmo_shadowed = vmarea->vma_obj->mmo_un.mmo_bottom_obj;
                        dbg(DBG_PRINT, "(GRADING3B 7)\n");
                }
                else
                {
                        vmarea->vma_obj = anon_create();
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                }
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        }
        else
        {
                if (MAP_PRIVATE & flags)
                {
                        vmarea->vma_obj = shadow_create();
                        file->vn_ops->mmap(file, vmarea, &(vmarea->vma_obj->mmo_un.mmo_bottom_obj));
                        vmarea->vma_obj->mmo_shadowed = vmarea->vma_obj->mmo_un.mmo_bottom_obj;
                        dbg(DBG_PRINT, "(GRADING3B 7)\n");
                }
                else
                {
                        file->vn_ops->mmap(file, vmarea, &(vmarea->vma_obj));
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        }

        if (new)
        {

                *new = vmarea;
                dbg(DBG_PRINT, "(GRADING3B 1)\n");
        }
        vmmap_insert(map, vmarea);
        dbg(DBG_PRINT, "(GRADING3B 1)\n");
        return 0;
}

/*
 * We have no guarantee that the region of the address space being
 * unmapped will play nicely with our list of vmareas.
 *
 * You must iterate over each vmarea that is partially or wholly covered
 * by the address range [addr ... addr+len). The vm-area will fall into one
 * of four cases, as illustrated below:
 *
 * key:
 *          [             ]   Existing VM Area
 *        *******             Region to be unmapped
 *
 * Case 1:  [   ******    ]
 * The region to be unmapped lies completely inside the vmarea. We need to
 * split the old vmarea into two vmareas. be sure to increment the
 * reference count to the file associated with the vmarea.
 *
 * Case 2:  [      *******]**
 * The region overlaps the end of the vmarea. Just shorten the length of_
 * the mapping.
 *
 * Case 3: *[*****        ]
 * The region overlaps the beginning of the vmarea. Move the beginning of
 * the mapping (remember to update vma_off), and shorten its length.
 *
 * Case 4: *[*************]**
 * The region completely contains the vmarea. Remove the vmarea from the
 * list.
 */
int
vmmap_remove(vmmap_t *map, uint32_t lopage, uint32_t npages)
{
        vmarea_t *vma;
        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink)
        {
                // case 1
                if (vma->vma_start < lopage && vma->vma_end > lopage + npages)
                {
                        vmarea_t *new_vmarea = vmarea_alloc();
                        new_vmarea->vma_start = lopage + npages;
                        new_vmarea->vma_end = vma->vma_end;
                        vma->vma_end = lopage;
                        new_vmarea->vma_off = vma->vma_off + lopage + npages - vma->vma_start;
                        new_vmarea->vma_prot = vma->vma_prot;
                        new_vmarea->vma_flags = vma->vma_flags;
                        new_vmarea->vma_vmmap = vma->vma_vmmap;

                        list_link_init(&new_vmarea->vma_olink);
                        list_link_init(&new_vmarea->vma_plink);

                        vmarea_t *next_vma = list_item(vma->vma_plink.l_next, vmarea_t, vma_plink);
                        list_insert_tail(&next_vma->vma_plink, &new_vmarea->vma_plink);

                        if (vma->vma_obj != NULL)
                        {
                                
                                vma->vma_obj->mmo_ops->ref(vma->vma_obj);
                                dbg(DBG_PRINT, "(GRADING3D 2)\n");
                        }
                        list_insert_tail(mmobj_bottom_vmas(vma->vma_obj), &new_vmarea->vma_olink);
                        mmobj_t *vma_shadowed = shadow_create();
                        mmobj_t *new_vma_shadowed = shadow_create();
                        vma_shadowed->mmo_shadowed = vma->vma_obj;
                        new_vma_shadowed->mmo_shadowed = vma->vma_obj;
                        vma_shadowed->mmo_un.mmo_bottom_obj = mmobj_bottom_obj(vma->vma_obj);
                        new_vma_shadowed->mmo_un.mmo_bottom_obj = mmobj_bottom_obj(vma->vma_obj);
                        vma->vma_obj = vma_shadowed;
                        new_vmarea->vma_obj = new_vma_shadowed;
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                }
                // case 2
                else if (vma->vma_start < lopage && vma->vma_end <= lopage + npages && vma->vma_end > lopage)
                {
            
                        vma->vma_end = lopage;
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                }
                // case 3
                else if (lopage <= vma->vma_start && lopage + npages < vma->vma_end && lopage + npages > vma->vma_start)
                {
                        vma->vma_start = lopage + npages;
                        vma->vma_off = vma->vma_off + lopage + npages - vma->vma_start;
                        dbg(DBG_PRINT, "(GRADING3D 2)\n");
                }
                // case 4
                else if (lopage <= vma->vma_start && lopage + npages >= vma->vma_end)
                {
                        mmobj_t *mmobj = vma->vma_obj;
                        mmobj->mmo_ops->put(mmobj);
                        if(list_link_is_linked(&vma->vma_olink))
                        {
                                list_remove(&vma->vma_olink);
                        }
                        list_remove(&vma->vma_plink);
                        vmarea_free(vma);
                        dbg(DBG_PRINT, "(GRADING3A)\n");
                }
                dbg(DBG_PRINT, "(GRADING3A)\n");
        }
        list_iterate_end();
        
        pt_unmap_range(curproc->p_pagedir, (uintptr_t)PN_TO_ADDR(lopage), (uintptr_t)PN_TO_ADDR(lopage + npages));
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return 0;
}


/*
 * Returns 1 if the given address space has no mappings for the
 * given range, 0 otherwise.
 */
int
vmmap_is_range_empty(vmmap_t *map, uint32_t startvfn, uint32_t npages)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_is_range_empty");
         KASSERT((startvfn < startvfn+npages) && (ADDR_TO_PN(USER_MEM_LOW) <= startvfn) && (ADDR_TO_PN(USER_MEM_HIGH) >= startvfn+npages));
        
        dbg(DBG_PRINT, "(GRADING3A 3.e)\n");
        vmarea_t *vma; 
        list_iterate_begin(&map->vmm_list, vma, vmarea_t, vma_plink){
                // may be wrong
                if((vma->vma_start < startvfn+npages) && (vma->vma_end > startvfn)){
                        dbg(DBG_PRINT, "(GRADING3A)\n");
                        return 0;
                }
                if(vma->vma_start >= startvfn+npages){
                        dbg(DBG_PRINT, "(GRADING3A)\n");
                        return 1;
                }
        } list_iterate_end();
        dbg(DBG_PRINT, "(GRADING3A)\n");
        return 1;
}

/* Read into 'buf' from the virtual address space of 'map' starting at
 * 'vaddr' for size 'count'. To do so, you will want to find the vmareas
 * to read from, then find the pframes within those vmareas corresponding
 * to the virtual addresses you want to read, and then read from the
 * physical memory that pframe points to. You should not check permissions
 * of the areas. Assume (KASSERT) that all the areas you are accessing exist.
 * Returns 0 on success, -errno on error.
 */
int
vmmap_read(vmmap_t *map, const void *vaddr, void *buf, size_t count)
{
        //NOT_YET_IMPLEMENTED("VM: vmmap_read");
        //TODO KASSERT
        uint32_t offset = 0;
        uint32_t count_left = count;
        while(count_left > 0){
                pframe_t *pf;
                vmarea_t *vma = vmmap_lookup(map, ADDR_TO_PN(vaddr)+ADDR_TO_PN(offset));
                uint32_t pagenum = vma->vma_off + ADDR_TO_PN(vaddr) +ADDR_TO_PN(offset) - vma->vma_start;
                KASSERT(0 == pframe_lookup(vma->vma_obj, pagenum , 0, &pf));
               
                uint32_t page_left_size = PAGE_SIZE-PAGE_OFFSET((uint32_t)vaddr+offset);
                uint32_t cpy_size = 0;
                if(page_left_size <= count_left){
                        cpy_size = page_left_size;
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }else{
                        cpy_size = count_left;
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }
                memcpy((void*)((uint32_t)buf + offset), (void*)((uint32_t)(pf->pf_addr)+PAGE_OFFSET((uint32_t)vaddr+offset)), cpy_size);
                count_left = count_left - cpy_size;
                offset = offset + cpy_size; 
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
        }
        dbg(DBG_PRINT, "(GRADING3D 1)\n");
        return 0;
}

/* Write from 'buf' into the virtual address space of 'map' starting at
 * 'vaddr' for size 'count'. To do this, you will need to find the correct
 * vmareas to write into, then find the correct pframes within those vmareas,
 * and finally write into the physical addresses that those pframes correspond
 * to. You should not check permissions of the areas you use. Assume (KASSERT)
 * that all the areas you are accessing exist. Remember to dirty pages!
 * Returns 0 on success, -errno on error.
 */
int
vmmap_write(vmmap_t *map, void *vaddr, const void *buf, size_t count)
{
    /*
        uint32_t offset = 0;
        uint32_t count_left = count;
        while(count_left > 0){
                pframe_t *pf;
                vmarea_t *vma;
                KASSERT(NULL != (vma = vmmap_lookup(map, ADDR_TO_PN(vaddr)+ADDR_TO_PN(offset)))) ;
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
                uint32_t pagenum = vma->vma_off + ADDR_TO_PN(vaddr) + ADDR_TO_PN(offset) - vma->vma_start;
                KASSERT(0 == pframe_lookup(vma->vma_obj, pagenum , 1, &pf));
                uint32_t page_left_size = PAGE_SIZE-PAGE_OFFSET((uint32_t)vaddr+offset);
                uint32_t cpy_size = 0;
                if(page_left_size <= count_left){
                        cpy_size = page_left_size;
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }else{
                        cpy_size = count_left;
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }
                memcpy((void*)((uint32_t)(pf->pf_addr)+PAGE_OFFSET((uint32_t)vaddr+offset)), (void*)((uint32_t)buf + offset),cpy_size);
                pframe_dirty(pf);
                count_left = count_left - cpy_size;
                offset = offset + cpy_size; 
        }
        dbg(DBG_PRINT, "(GRADING3D 1)\n");
        return 0;
        */
        size_t count_left = count;
        uint32_t cur_addr = (uint32_t)vaddr;
        while (count_left > 0)
        {
                uint32_t vpn_cur_addr = ADDR_TO_PN(cur_addr);
                vmarea_t *varea = vmmap_lookup(map, vpn_cur_addr);
                pframe_t *pframe;
                uint32_t pagenum = vpn_cur_addr - varea->vma_start + varea->vma_off;
                pframe_lookup(varea->vma_obj, pagenum, 0, &pframe);
                void *src = (void *)((uint32_t)(pframe->pf_addr) + PAGE_OFFSET(cur_addr));
                if (count_left <= PAGE_SIZE && ADDR_TO_PN((uint32_t)vaddr + count) == ADDR_TO_PN(cur_addr))
                {
                        memcpy(src, buf, count_left);
                        buf = (void *)((uint32_t)(buf) + count_left);
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                        return 0;
                }

                uint32_t pgremain = PAGE_SIZE - PAGE_OFFSET(cur_addr);
                if (pgremain <= PAGE_SIZE)
                {
                        memcpy(src, buf, pgremain);
                        buf = (void *)((uint32_t)(buf) + pgremain);
                        count_left = count_left - pgremain;
                        cur_addr = cur_addr + pgremain;
                        dbg(DBG_PRINT, "(GRADING3D 1)\n");
                }
                dbg(DBG_PRINT, "(GRADING3D 1)\n");
        }
        dbg(DBG_PRINT, "(GRADING3D 1)\n");
        return 0;
}