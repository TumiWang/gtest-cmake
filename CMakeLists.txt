cmake_minimum_required(VERSION 3.15)

project(example)

set(CXX_STANDARD 14)
set(CXX_STANDARD_REQUIRED ON)

if (APPLE)
    # set(CMAKE_INSTALL_RPATH "@executable_path")
    set(CMAKE_INSTALL_RPATH "@loader_path")
elseif(LINUX)
    set(CMAKE_INSTALL_RPATH "$ORIGIN")
endif()
set(CMAKE_SKIP_INSTALL_RPATH OFF)

if (MSVC)
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
    add_compile_options(/utf-8)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
endif()

include(cmake/RunGTestInBuilding.cmake)

add_subdirectory(third_party)

add_subdirectory(src)
