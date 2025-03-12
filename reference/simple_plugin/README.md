# Simple Qt Plugin Example

This example demonstrates how to create and use a Qt plugin with QPluginLoader.

## Project Structure

- `interface.h` - Common interface shared between the plugin and host
- `plugin/` - Plugin implementation
- `host/` - Host application that loads and uses the plugin
- `CMakeLists.txt` - CMake build files

## Building the Example

### Using CMake

```bash
cd reference/simple_plugin
mkdir build
cd build
cmake ..
cmake --build .
```

### Using Qt Creator

1. Open the top-level `CMakeLists.txt` in Qt Creator
2. Configure the project for your Qt version
3. Build the project

### Using qmake (Alternative)

The project also includes qmake project files (.pro) for building with qmake:

```bash
cd reference/simple_plugin
mkdir build-qmake
cd build-qmake
qmake ../simple_plugin.pro
make
```

## Running the Example

After building with CMake, run the host application:

```bash
cd reference/simple_plugin/build/bin
./plugin_host
```

## How It Works

1. The `CalculatorInterface` defines the plugin interface with virtual methods
2. The `CalculatorPlugin` implements this interface
3. The host application loads the plugin using `QPluginLoader`
4. The host uses `qobject_cast` to access the plugin's interface
5. The host demonstrates using QMetaObject for runtime reflection

## Key Components

- `Q_PLUGIN_METADATA` - Marks the class as a plugin
- `Q_INTERFACES` - Declares which interfaces the plugin implements
- `QPluginLoader` - Loads the plugin at runtime
- `qobject_cast` - Safely casts to the plugin interface
- `QMetaObject` - Provides runtime reflection capabilities 