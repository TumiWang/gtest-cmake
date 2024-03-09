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

add_subdirectory(src)
