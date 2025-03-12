set(CMAKE_AUTOMOC ON)

# Host application sources
set(HOST_SOURCES
    main.cpp
    ../interface.h
)

# Create the host application
add_executable(plugin_host ${HOST_SOURCES})

# Link Qt libraries
target_link_libraries(plugin_host PRIVATE Qt${QT_VERSION_MAJOR}::Core)

# Include directories
target_include_directories(plugin_host PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/..
)

# Add compile definition for plugin path
if(WIN32)
    target_compile_definitions(plugin_host PRIVATE 
        PLUGIN_PATH="${CMAKE_BINARY_DIR}/plugins/calculator_plugin.dll")
elseif(APPLE)
    target_compile_definitions(plugin_host PRIVATE 
        PLUGIN_PATH="${CMAKE_BINARY_DIR}/plugins/libcalculator_plugin.dylib")
else()
    target_compile_definitions(plugin_host PRIVATE 
        PLUGIN_PATH="${CMAKE_BINARY_DIR}/plugins/libcalculator_plugin.so")
endif() 