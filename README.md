# Piksel Tesisat - Flutter Project

A comprehensive Flutter application for managing plumbing and installation works, built with a feature-based architecture and Firebase integration.

## 🏗️ Architecture Overview

The project follows a feature-based architecture pattern with a clear separation of concerns. It's organized into two main directories:

```
lib/
├── feature/           # Feature-based modules
│   ├── dashboard/     # Dashboard feature
│   ├── customers/     # Customer management
│   ├── personals/     # Personnel management
│   ├── works/        # Work management
│   ├── price/        # Pricing management
│   ├── search/       # Search functionality
│   └── core_features/# Core application features
└── product/          # Core application components
    ├── models/       # Data models
    ├── services/     # Firebase and other services
    ├── init/         # Application initialization
    └── utils/        # Utility functions and constants
```

## 📁 Detailed Folder Structure

### 1. Feature Modules (`lib/feature/`)
Each feature module is organized as follows:

```
feature_name/
├── cubit/          # State management
│   ├── state.dart
│   └── cubit.dart
├── view/           # UI screens
│   ├── view.dart
│   └── view_model.dart
├── widget/         # UI components
│   └── custom_widgets.dart
└── mixin/          # Shared functionality
    └── feature_mixins.dart
```

#### 1.1 Feature Module Components
- **cubit/**: Contains state management logic using BLoC pattern
- **view/**: Contains UI screens and their view models
- **widget/**: Contains reusable UI components specific to the feature
- **mixin/**: Contains shared functionality and business logic

### 2. Product Layer (`lib/product/`)
The product layer contains shared components used across features:

```
product/
├── models/         # Data models and entities
├── services/       # Service implementations
├── init/          # Application initialization
└── utils/         # Helper functions and constants
```

#### 2.1 Product Layer Components
- **models/**: Data models used throughout the application
- **services/**: Service implementations (Firebase, API, etc.)
- **init/**: Application initialization code (DI, routing, etc.)
- **utils/**: Helper functions, constants, and utilities

### 3. Best Practices and Guidelines

#### 3.1 Feature Module Organization
- Each feature should be self-contained
- Minimize dependencies between features
- Use product layer for shared functionality
- Keep feature-specific code within the feature module

#### 3.2 File Naming Conventions
- Use snake_case for file names
- Use descriptive and meaningful names
- Group related files together
- Follow consistent naming patterns

#### 3.3 Code Organization
- Single responsibility principle
- Clear separation of concerns
- Consistent file structure
- Proper documentation

## 🛠️ Technical Stack

### Core Dependencies

```yaml
dependencies:
  # State Management
  flutter_bloc: ^8.1.6
  
  # Navigation
  go_router: ^14.4.1
  
  # Dependency Injection
  get_it: ^7.6.7
  injectable: ^2.3.2
  
  # Firebase
  cloud_firestore: ^5.4.5
  firebase_auth: ^5.3.2
  firebase_storage: ^12.3.5
  
  # UI Components
  flutter_spinkit: ^5.2.1
  skeletonizer: ^1.0.0
  flutter_advanced_drawer: ^1.3.7
  
  # Localization
  easy_localization: ^3.0.7
```

### Development Dependencies

```yaml
dev_dependencies:
  build_runner: ^2.4.13
  go_router_builder: ^2.7.1
  injectable_generator: ^2.4.1
  json_serializable: ^6.9.4
```

## 🔧 Key Components

### 1. Feature Structure

Each feature follows a consistent structure:

```
feature/
├── view/           # UI screens
├── widget/         # Feature-specific widgets
├── mixin/          # Shared logic
└── alerts/         # Notifications and alerts
```

Example of a feature implementation:

```dart
// lib/feature/works/view/work_list_view.dart
final class WorkListView extends StatefulWidget {
  const WorkListView({super.key});

  @override
  State<WorkListView> createState() => _WorkListViewState();
}

class _WorkListViewState extends State<WorkListView> with WorkListMixin {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dateNotifier,
      builder: (_, date, __) {
        return Column(
          children: [
            WorkListTimeSelector(
              onDateChange: changeDate,
              focusedDate: date ?? DateTime.now(),
            ),
            // ... other widgets
          ],
        );
      },
    );
  }
}
```

### 2. Dependency Injection

The project uses `get_it` and `injectable` for dependency injection:

```dart
// lib/product/init/di/locator.dart
final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  usesNullSafety: true,
)
Future<void> configureDependencies({String? environment}) async {
  locator.init(environment: environment);
}
```

### 3. Routing

Navigation is handled using `go_router`:

```dart
// lib/product/init/router/app_router.dart
final class AppRouter {
  const AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final mainShellKey = GlobalKey<NavigatorState>();

  static GoRouter config = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
  );
}
```

### 4. Base Service Architecture

Services extend from a base service class:

```dart
// lib/product/services/base_service.dart
abstract class BaseService {
  BaseService({
    required this.db,
    required this.auth,
    required this.storage,
  });

  final FirebaseFirestore db;
  final FirebaseAuth auth;
  final FirebaseStorage storage;

  // Common Firebase operations
  late final userCollection = db.collection(FirestoreCollections.users.name);
}
```

## 🔐 Firebase Integration

The application integrates with several Firebase services:

- **Firestore**: For data storage and real-time updates
- **Authentication**: For user management
- **Storage**: For file storage

## 🌐 Localization

The application supports multiple languages using `easy_localization`:

```dart
// lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LocalizationManager.app(const App()));
}
```

## 🎨 UI/UX

The application follows Material Design principles and includes:

- Custom themes
- Loading skeletons
- Advanced drawer navigation
- Toast notifications
- Custom form fields

## 🧪 Testing

The project includes test directories for unit and widget testing:

```
test/
├── unit/           # Unit tests
└── widget/         # Widget tests
```

## 🚀 Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add `google-services.json` to `android/app/`
   - Add `GoogleService-Info.plist` to `ios/Runner/`
4. Run the application:
   ```bash
   flutter run
   ```

## 📦 Build

To build the application:

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 🔍 Code Generation

The project uses code generation for various tasks:

```bash
# Generate routes
flutter pub run build_runner build --delete-conflicting-outputs

# Generate dependency injection
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🛠️ Scripts

The project uses the `rps` package for managing development scripts. All scripts are defined in `rps.yaml`:

```yaml
scripts:
  deploy_web:
    description: Deploy web version to Firebase
    command: flutter build web --release && firebase deploy --only hosting
    category: deployment

  pub_reload:
    description: Clean and reload pub dependencies
    command: flutter clean && flutter pub get
    category: development

  build_runner:
    description: Run build_runner to generate codes
    command: flutter pub run build_runner build --delete-conflicting-outputs
    category: development

  lang:
    description: Generate localization files
    command: dart run easy_localization:generate -O lib/product/init/localization -f keys -o locale_keys.g.dart --source-dir assets/localization
    category: development
```

### Using Scripts

To use the scripts, first install the `rps` package:

```bash
flutter pub add rps
```

Then you can run scripts using:

```bash
# List all available scripts
rps list

# Run a specific script
rps run deploy_web
rps run pub_reload
rps run build_runner
rps run lang

# List scripts by category
rps list --category deployment
rps list --category development
```

## 📝 License

This project is proprietary and confidential.

---

For more information, please contact the development team.
