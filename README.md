# Flutter Project - PixelField Test

This project was developed as a test for PixelField company.

## Architecture

The project follows **Clean Architecture**, simplified to focus on the essential layers, without overcomplicating the
domain layer.

The app is modularized for easy testing and future expansion.

## State Management

State management is implemented using **BLoC** (Business Logic Component) with the **flutter_bloc** package, allowing
for clean separation of UI and business logic. This ensures that the UI reacts to state changes and allows for scalable
and maintainable code. The **Equatable** package is used for comparing objects efficiently in BLoC.

## Dependency Injection

For dependency injection, I used **GetIt** along with **Injectable** to simplify the management and initialization of
objects. This ensures that the dependencies are injected into the right places and helps in keeping the codebase
modular.

## Data Handling

Data is managed using the following:

- **Drift**: An ORM for SQLite, providing efficient and robust local database management.
- **SharedPreferences**: Stores lightweight, persistent key-value pairs for settings and preferences.
- **Dartz**: A functional programming library used to handle errors gracefully using the `Either` type.

**Connectivity** is handled using **internet_connection_checker** to monitor and react to changes in the network status.

## Code Generation

To reduce boilerplate code and improve maintainability, I used:

- **Freezed**: Generates immutable data classes and union types to streamline state management.
- **JsonSerializable**: Automates JSON serialization and deserialization for easier data manipulation.

## Dependencies

This project uses the following dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  # Dependency Injection & Service Locator
  get_it: ^8.0.3 # A service locator to manage dependencies and simplify dependency injection.

  # State Management
  flutter_bloc: ^9.1.0 # Implements the BLoC (Business Logic Component) pattern for efficient state management.
  equatable: ^2.0.7 # Simplifies object equality comparison, useful for state changes in BLoC.

  # Functional programming
  dartz: ^0.10.1 # Provides functional programming utilities, such as `Either` for better error handling.

  # Connectivity
  internet_connection_checker: ^3.0.1 # Checks internet connectivity and handles connection status updates.

  # Local Storage & Caching
  drift: ^2.26.0 # A powerful ORM for SQLite, enabling efficient local database management.
  sqlite3_flutter_libs: ^0.5.31  # Provides necessary SQLite libraries for Flutter apps.

  # Serialization & Code Generation
  freezed: 3.0.3  # Generates immutable classes and union types for better state management.
  freezed_annotation: ^3.0.0 # Provides annotations required for `freezed` code generation.
  json_serializable: ^6.9.4 # Automates JSON serialization and deserialization for model classes.
  json_annotation: ^4.9.0 # Provides annotations for `json_serializable` to generate JSON parsing code.

  # Dependency Injection Code Generation
  injectable: ^2.5.0 # Generates dependency injection boilerplate for use with `get_it`.

  # Utilities & UI Enhancements
  google_fonts: 6.2.1 # Allows easy integration of Google Fonts into the Flutter app.
  flutter_svg: 2.0.17  # Supports rendering of SVG images within the app.
  flutter_screenutil: ^5.9.3  # Helps in making the UI responsive across different screen sizes.

  # File System Utilities
  path_provider: ^2.1.5  # Provides commonly used locations on the filesystem (e.g., app documents directory).
  path: ^1.9.1 # A Dart package for cross-platform file path manipulation.

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^5.0.0
  #The build_runner package provides a concrete way of generating files using Dart code
  build_runner: ^2.4.15
  #the code generator
  freezed: ^3.0.3
  #to generate fromJson/toJson
  json_serializable: ^6.9.4
  #This library contains the generator that turns your Table classes from drift into database code
  drift_dev: ^2.26.0
  # add the generator to your dev_dependencies
  injectable_generator: any