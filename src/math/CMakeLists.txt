add_library(mymath src/mymath.cpp)

target_include_directories(
    mymath
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

get_target_property(mymath_type mymath TYPE)

if (mymath_type STREQUAL "SHARED_LIBRARY")
    install(TARGETS mymath DESTINATION bin)
endif()
