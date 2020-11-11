#ifndef CUZFP_POINTERS_CUH
#define CUZFP_POINTERS_CUH

#include "ErrorCheck.h"
#include <iostream>


namespace cuZFP
{
// https://gitlab.kitware.com/third-party/nvpipe/blob/master/encode.c
bool is_gpu_ptr(const void *ptr)
{
  hipPointerAttribute_t atts;
  const hipError_t perr = hipPointerGetAttributes(&atts, ptr);

  // clear last error so other error checking does
  // not pick it up
  hipError_t error = hipGetLastError();
#if CUDART_VERSION >= 10000
  return perr == hipSuccess &&
                (atts.type == cudaMemoryTypeDevice ||
                 atts.type == cudaMemoryTypeManaged);
#else
  return perr == hipSuccess && atts.memoryType == cudaMemoryTypeDevice;
#endif
}

} // namespace cuZFP

#endif
