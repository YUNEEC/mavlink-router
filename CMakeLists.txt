cmake_minimum_required(VERSION 3.6)

project(mavlink_router C CXX)

set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_VISIBILITY_INLINES_HIDDEN 1)

find_package(Git)

if (GIT_FOUND)
    execute_process(
            COMMAND ${GIT_EXECUTABLE} describe --tags
            WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
            OUTPUT_VARIABLE MAVLINK_ROUTER_VERSION_GIT_REVISION
            OUTPUT_STRIP_TRAILING_WHITESPACE)

    message(STATUS "Building in git revision ${MAVLINK_ROUTER_VERSION_GIT_REVISION}")
else()
    set(MAVLINK_ROUTER_VERSION_GIT_REVISION "n/a")
    message(STATUS "Executable git is missing, choosing default value for git revision")
endif()

string(TIMESTAMP MAVLINK_ROUTER_VERSION_BUILD_TIMESTAMP "%Y-%m-%dT%H:%M:%S.000000Z" UTC)
message(STATUS "Building in build timestamp ${MAVLINK_ROUTER_VERSION_BUILD_TIMESTAMP}")

include(mavlink-router.cmake)
