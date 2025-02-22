cmake_minimum_required(VERSION 3.21)

project(pipe_overflow VERSION 0.1.0 LANGUAGES C)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(pipe_overflow)

file(GLOB pipe_overflow_files CONFIGURE_DEPENDS "src/**/*.c" "src/*.c")
target_sources(pipe_overflow PRIVATE ${pipe_overflow_files})

# Uncomment to add link library
# target_link_libraries(pipe_overflow PRIVATE #[[ link library here (-lm) ]])

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Werror -fsanitize=address")
    target_link_libraries(pipe_overflow PRIVATE -fsanitize=address)
endif()
