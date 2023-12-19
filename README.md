# Lookup

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart

# Build APK
*To build apk replace the "run" on above commands with build apk
```

## Note
- This project follows clean architecture
- Clean architecture: https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/ , https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html

- This project uses very_good_analysis for lints

## Completed tasks
All of the tasks has been completed including the optional tasks
- Responsiveness
- State managent with Bloc
- Splash Screen with animations
- Login Screen with animations
- Google sign in functionality
- Sign up/ login user with firebase_auth
- Preloader screen with animations
- Home screen 
- Video Screen with like/share feature using offline storage (HIVE)

## Additional 
- Dependency injection with get_it
- build flavors
- 120 Hz refresh rate on supported devices
