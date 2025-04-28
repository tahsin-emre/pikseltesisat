# Piksel Tesisat - Flutter Project

A comprehensive Flutter application for managing plumbing and installation works, built with a feature-based architecture and Firebase integration.

## 🏗️ Architecture Overview

The project follows a feature-based architecture pattern with a clear separation of concerns. This architecture ensures:
- Modular and scalable code structure
- Easy maintenance and development
- Feature independence
- Testability

It's organized into two main directories:

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
│   └── view.dart
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
  flutter_bloc: ^8.1.6  # Provides state management using BLoC pattern
                        # Enables centralized state management
                        # Ensures clean separation between UI and business logic
  
  # Navigation
  go_router: ^14.4.1   # Modern and type-safe routing solution
                        # Deep linking support
                        # Nested navigation structure
  
  # Dependency Injection
  get_it: ^7.6.7       # Service locator pattern implementation
  injectable: ^2.3.2    # Automatic DI code generation
                        # Centralized dependency management
                        # Mock injection for testability
  
  # Firebase
  cloud_firestore: ^5.4.5  # Real-time database
  firebase_auth: ^5.3.2    # User authentication
  firebase_storage: ^12.3.5 # File storage
  
  # UI Components
  flutter_spinkit: ^5.2.1  # Loading animations
  skeletonizer: ^1.0.0     # Skeleton screen structure
  flutter_advanced_drawer: ^1.3.7  # Advanced drawer menu
  
  # Localization
  easy_localization: ^3.0.7  # Multi-language support
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
Each feature module follows this structure:
- **view/**: UI layer, screens and widgets
- **widget/**: Reusable UI components
- **mixin/**: Shared business logic
- **alerts/**: Notification and alert management

### 2. Dependency Injection (DI)
DI is used to manage application dependencies:
- **Advantages**:
  - Loose coupling
  - Testability
  - Code reusability
  - Centralized configuration
- **Use Cases**:
  - Service injection
  - Repository pattern
  - ViewModel injection

### 3. Routing
Modern navigation management with Go Router:
- **Features**:
  - Type-safe routing
  - Deep linking
  - Nested navigation
  - Route parameters
- **Usage**:
  - Path-based routing
  - Named routes
  - Route guards

### 4. Base Service Architecture
Base service structure:
- **Purpose**:
  - Prevent code duplication
  - Standardize service behavior
  - Centralize error handling
- **Features**:
  - Firebase integration
  - Common CRUD operations
  - Error management

## 🔐 Firebase Integration
Firebase services and their purposes:
- **Firestore**:
  - Real-time data synchronization
  - Offline data support
  - Secure data access
- **Authentication**:
  - User management
  - Social media login
  - Secure session management
- **Storage**:
  - File upload/download
  - Media storage
  - Secure file access

## 🌐 Localization
Multi-language support:
- **Features**:
  - Dynamic language switching
  - Fallback language support
  - Format string support
- **Usage**:
  - String translations
  - Date/time formats
  - Currency formats

## 🎨 UI/UX
User interface components:
- **Theme System**:
  - Material Design
  - Customizable colors
  - Responsive design
- **Components**:
  - Loading skeletons
  - Toast notifications
  - Custom form fields
  - Advanced drawer

## 🧪 Testing
Testing strategy:
- **Unit Tests**:
  - Business logic tests
  - Service tests
  - Utility tests
- **Widget Tests**:
  - UI component tests
  - Interaction tests
  - State tests

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
