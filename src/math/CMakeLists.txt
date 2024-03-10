add_library(mymath src/mymath.cpp)

target_include_directories(
    mymath
    PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)

get_target_property(mymath_type mymath TYPE)

if (mymath_type STREQUAL "SHARED_LIBRARY")
    install(TARGETS mymath DESTINATION bin)
endif()

enable_testing()
add_executable(mymath_test src/mymath_test.cpp)

target_link_libraries(
    mymath_test
    PRIVATE mymath gtest_main
)

include(GoogleTest)
gtest_add_tests(
    TARGET mymath_test
)

add_custom_target(
    mymath_test_run ALL
    COMMAND ${CMAKE_CTEST_COMMAND}
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

add_dependencies(mymath_test_run mymath_test)
