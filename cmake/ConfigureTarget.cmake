cmake_minimum_required(VERSION 2.8.11)

function(configure_target target_NAME target_BITNESS)
  if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    if(${target_BITNESS} EQUAL 32)
      set_target_properties(${target_NAME} PROPERTIES COMPILE_FLAGS "-m32")
      set_target_properties(${target_NAME} PROPERTIES LINK_FLAGS "-m32")
    else()
      set_target_properties(${target_NAME} PROPERTIES COMPILE_FLAGS "-m64")
      set_target_properties(${target_NAME} PROPERTIES LINK_FLAGS "-m64")
    endif()
  elseif(APPLE)
    if(${target_BITNESS} EQUAL 32)
      set_target_properties(${target_NAME} PROPERTIES OSX_ARCHITECTURES "i386")
    else()
      set_target_properties(${target_NAME} PROPERTIES OSX_ARCHITECTURES "x86_64")
    endif()
  elseif(MSVC)
    if(${target_BITNESS} EQUAL 32)
      set_target_properties(${target_NAME} PROPERTIES COMPILE_FLAGS "/D WIN32=1")
    else()
      set_target_properties(${target_NAME} PROPERTIES COMPILE_FLAGS "/MACHINE:X64 /D WIN64=1")
    endif()
  endif()
endfunction()
