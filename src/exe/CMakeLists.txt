add_executable(add main.cpp)

target_link_libraries(
    add
    PRIVATE mymath
)

install(TARGETS add)
