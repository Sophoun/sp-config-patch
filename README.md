# SP Config Patch

A simple and powerful Dart-based CLI tool designed to automate string replacements across your project files. It can be used for any text-based project that requires environment-specific configurations (like switching between UAT, Pre-Prod, and Production).

## 🚀 Overview

`SP Config Patch` reads a configuration YAML file and applies a series of "find and replace" operations to all files in a target directory. It is particularly useful for:

- Switching API endpoints.
- Updating API keys.
- Changing package names or library references.
- Modifying build flags (e.g., `logEnable = true` to `false`).
- Updating signing configurations.

## ✨ Key Features

- **Recursive Processing**: Automatically scans all subdirectories.
- **Selective Exclusion**: Use the `skips` list to ignore sensitive or bulky directories (like `.git`, `.gradle`, or `build/`).
- **Batch Replacements**: Define multiple replacement pairs in a single configuration file.
- **Environment Driven**: Create different YAML files for different environments (e.g., `build_uat.yaml`, `build_prod.yaml`).

## 📋 Prerequisites

To run or build this project, you need:

- [Dart SDK](https://dart.dev/get-dart) (v3.0.5 or higher recommended)

## 🛠️ Installation

1. **Install as global**:

  ```bash
  dart pub global activate sp_config_patch
  ```

  or

   ```bash
   dart pub global activate --source git https://github.com/Sophoun/sp-config-patch.git
   ```

### 📦 Pre-compiled Binaries

For convenience, pre-compiled binaries are provided in the `bin/` directory:

- `sp-config-patch-linux`
- `sp-config-patch-mac`
- `sp-config-patch-windows` (executable)

You can run these directly without having the Dart SDK installed.

## ⚙️ Configuration

The tool uses YAML files to define what to change and what to skip.

### Example `build_prod.yaml`

```yaml
# Directories or files to ignore
skips: 
  - "./target-project/.git/"
  - "./target-project/node_modules/"
  - "./target-project/build/"

# String replacements to perform
changes:
  - from: "apiUrl = 'http://uat.example.com'"
    to: "apiUrl = 'https://api.example.com'"
  - from: "logEnable = true"
    to: "logEnable = false"
```

## 📖 Usage

### Running the compiled executable

```bash
sp-config-patch <path_to_yaml> <target_directory>
```

**Example:**

```bash
sp-config-patch ./bin/build_prod.yaml ./my-project
```

## 📂 Project Structure

- `bin/`: Contains the main entry point, build scripts, and example configurations.
- `lib/`: Contains the core logic for reading YAML and managing files.
- `pubspec.yaml`: Project metadata and dependencies.

## 🤝 Contributing

Contributions are welcome! Whether it's a bug report, a feature request, or a pull request, we appreciate your help in making this tool better.

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## ⚖️ License

Distributed under the MIT License. See `LICENSE` for more information.
