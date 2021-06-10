set(module_name mavlink-routerd)

add_executable(${module_name}
    # common sources
    common/conf_file.cpp
    common/log.cpp
    common/util.c
    common/xtermios.cpp

    # mavlink-routerd sources
    mavlink-router/main.cpp
    mavlink-router/autolog.cpp
    mavlink-router/timeout.cpp
    mavlink-router/binlog.cpp
    mavlink-router/mainloop.cpp
    mavlink-router/ulog.cpp
    mavlink-router/endpoint.cpp
    mavlink-router/logendpoint.cpp
    mavlink-router/pollable.cpp
)

set_property(
    TARGET ${module_name}
    PROPERTY CXX_STANDARD 14
)

set_property(
    TARGET ${module_name}
    PROPERTY COMPILE_OPTIONS -fPIC
)

target_compile_options(
    ${module_name}
    PRIVATE -Wno-c++11-narrowing
)

target_link_libraries(
    ${module_name}
    -lrt
)

if(CMAKE_ANDROID_NDK)
 target_link_libraries(
    ${module_name}
    log
 )
endif()
