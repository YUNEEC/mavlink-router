# Cmake find modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

# vendor-specific setup goes here
add_definitions(-DVERSION=\"${MAVLINK_ROUTER_VERSION_GIT_REVISION}\" -DPACKAGE=\"mavlink-router\")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -pedantic -Wextra -fPIC")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -fno-strict-aliasing -pedantic -Wextra -Wno-implicit-fallthrough -fPIC")

include_directories(
    include/mavlink/ardupilotmega
    src
    src/common
    src/mavlink-router
)

add_subdirectory(src)
