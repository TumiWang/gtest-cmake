
option(USING_RUN_GTEST_BUILDING "Run GTest in building" ON)

if (USING_RUN_GTEST_BUILDING)
    enable_testing()
    include(GoogleTest)

    macro(__target_run_gtest_in_building)
        set(option)
        set(oneValueArgs TARGET)
        set(multiValueArgs SOURCES)
        cmake_parse_arguments(CFG "${option}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

        string(COMPARE EQUAL "${CFG_TARGET}" "" no_target)
        string(COMPARE EQUAL "${CFG_SOURCES}" "" no_sources)
        if (no_target)
            message(FATAL_ERROR "macro __target_run_gtest_in_building no TARGET arguments")
        endif()
        if (no_sources)
            message(FATAL_ERROR "macro __target_run_gtest_in_building no SOURCES arguments")
        endif()

        set(TEST_TARGET "${CFG_TARGET}_TEST")
        set(RUN_TEST_TARGET "${CFG_TARGET}_TEST_RUN")

        add_executable(${TEST_TARGET} ${CFG_SOURCES})
        target_link_libraries(${TEST_TARGET} PRIVATE ${CFG_TARGET} gtest_main)
        gtest_add_tests(TARGET ${TEST_TARGET})

        if (MSVC)
            if (CMAKE_BUILD_TYPE)
                set(GTEST_RUN_BUILD_TYPE ${CMAKE_BUILD_TYPE})
            else()
                set(GTEST_RUN_BUILD_TYPE Debug)
            endif()
            add_custom_target(
                ${RUN_TEST_TARGET} ALL
                COMMAND ${CMAKE_CTEST_COMMAND} -C ${GTEST_RUN_BUILD_TYPE}
                WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            )
        else()
            add_custom_target(
                ${RUN_TEST_TARGET} ALL
                COMMAND ${CMAKE_CTEST_COMMAND}
                WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
            )
        endif()

        add_dependencies(${RUN_TEST_TARGET} ${TEST_TARGET})
    endmacro()
else()
    macro(__target_run_gtest_in_building)
    endmacro()
endif()
