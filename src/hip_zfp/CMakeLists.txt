###############################################################################
#
#  file: src/cuZFP/CMakeLists.txt 
#
###############################################################################

set(hipZFP_sources
    cuZFP.cu         # main entry point
    decode.cuh
    decode1.cuh
    decode2.cuh
    decode3.cuh
    encode.cuh
    encode1.cuh
    encode2.cuh
    encode3.cuh
    pointers.cuh
    type_info.cuh)

set(hipZFP_headers
    shared.h
    cuZFP.h
    ErrorCheck.h)


message(STATUS "**************************************Adding HIP files.")
SET(CMAKE_CXX_FLAGS_PREVIOUS ${CMAKE_CXX_FLAGS})
SET(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fPIC" )

hip_include_directories(${PROJECT_SOURCE_DIR}/include)
hip_add_library(hip_zfp STATIC ${hipZFP_sources})

#  hip_include_directories(${PROJECT_SOURCE_DIR}/include)
#hip_wrap_srcs(zfp OBJ zfp_hip_backend_obj hip_zfp/cuZFP.cu)
SET(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS_PREVIOUS})

add_definitions(-DZFP_WITH_HIP)


  

