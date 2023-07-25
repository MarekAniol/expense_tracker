# Flutter Application

This is a Flutter application developed with a series of robust technologies for seamless functionality and top-notch user experience.

## Getting Started

To get started with this project, you need to perform a couple of steps:

1. Clone the repository
2. Make sure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
3. This project uses [FVM](https://fvm.app/). Ensure you have it installed or install it via `pub global activate fvm`.
4. Use FVM to install the necessary Flutter version. Currently, we are using the "stable" version of Flutter. Run `fvm use stable`.

**NOTE:** We use the "stable" version of Flutter for stability and reliable performance. However, this could lead to potential version conflicts in case of major Flutter updates. You may want to pin a specific version of Flutter based on your project requirements.

To switch to a specific version of Flutter with FVM, use the command `fvm use <version>`, for example, `fvm use 3.10.2`.


## Architecture

This project follows the principles of Clean Architecture, which helps to separate concerns, making the codebase easier to maintain and test.

## Technologies & Libraries

- **Hive:** For efficient and robust data management.
- **Mockito:** Utilized for effective unit testing.
- **Freezed:** A Flutter package that helps in generating immutable classes, making the process of managing immutable states quite easy.
- **Bloc:** A scalable state management library which helps in managing states using simple logic.

After cloning the repository and setting up the necessary environment, you will need to rebuild the project in order for it to function correctly. 

fvm flutter packages pub run build_runner build --delete-conflicting-outputs

----------------------------------------------------------------------------------------------------------------
