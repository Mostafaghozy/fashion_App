# Fashion E‑Commerce (Flutter)

A cross‑platform shopping app built with Flutter and Dart. The app showcases a modern fashion storefront with product discovery, favorites, cart, wishlist, notifications, and payment flows (PayPal and credit card). It uses a modular UI with reusable widgets, light/dark theming, and responsive previews.

## Features

- Product discovery
  - Home feed with curated sections (favorites, new arrivals, grid catalog)
  - Horizontal product lists and grid sections
  - Toggle favorites with local state
- Navigation
  - Custom bottom navigation bar (Home, Search, Cart, Wishlist, Notifications)
  - IndexedStack for preserving tab state
- Payments
  - PayPal and credit card flows (via community packages)
  - My Orders screen scaffolded
- Theming & UX
  - Light and Dark modes (ThemeMode.system)
  - Custom typography using the Jost font family
  - Asset‑based icons and product imagery
  - DevicePreview ready (disabled by default)
- Code quality
  - Enforced lints via flutter_lints
  - Basic widget test scaffold

## Tech Stack

- Flutter (Dart)
- Packages
  - device_preview: responsive previews during development
  - flutter_credit_card: credit card UI & validation
  - flutter_paypal_payment: PayPal checkout flow
  - flutter_svg, cupertino_icons

## Project Structure

```
lib/
  core/
    theme.dart                # AppThemes (light/dark), typography/colors
  features/
      data/
            model/
              productModel.dart       # Product entity with copyWith
            services/
              ProductDataService.dart # In‑memory product data and selectors
      presention/
            screens/                  # Feature screens grouped by domain (home, cart, ...)
                  home/
                    MainScreen.dart       # Tab scaffold and navigation
                    homeScreen.dart       # Home composition using widgets
                  payment/                # Payment screens (PayPal, Credit Card, Orders)
      ...
    widgets/                  # Reusable UI components
            CustomBottomNavBar.dart # Navigation bar
            ProductCardComponent.dart
            HorizontalProductList.dart
            ProductGridSection.dart
      ...
main.dart                     # App entry: MaterialApp, theming, initial route
```

Assets and fonts are configured in `pubspec.yaml`:

- Assets: `assets/`, `assets/icons/`, `assets/pay/`
- Fonts: Jost (Regular, Bold)

## Getting Started

### Prerequisites

- Flutter (stable channel) installed and configured
- Dart SDK >= 3.9.0 (aligned with `environment.sdk` in pubspec)

Verify your environment:

```bash
flutter --version
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

- Mobile (Android):
  ```bash
  flutter run -d android
  ```
- Mobile (iOS):
  ```bash
  # Requires macOS and Xcode
  flutter run -d ios
  ```
- Web (optional):
  ```bash
  flutter run -d chrome
  ```

To enable DevicePreview during development, uncomment the wrapper in `main.dart`:

```dart
// DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
```

## Configuration

- Theming: managed in `lib/core/theme.dart` (light/dark, colors, typography)
- Payments:
  - PayPal and credit card flows rely on community packages. If credentials or environment values are required, configure them in the payment screens (e.g., `lib/Ui/screens/payment/`) as per the package documentation.
- Assets & Fonts: declared in `pubspec.yaml`; ensure paths remain in sync if assets move.

## Scripts & Commands

- Analyze code style and lints:
  ```bash
  flutter analyze
  ```
- Run tests:
  ```bash
  flutter test
  ```
- Build release artifacts:
  - Android APK:
    ```bash
    flutter build apk --release
    ```
  - iOS (requires macOS):
    ```bash
    flutter build ios --release
    ```
  - Web:
    ```bash
    flutter build web --release
    ```

## Testing

- Framework: `flutter_test`
- Example: `test/widget_test.dart` contains a basic widget test scaffold
- Guidance:
  - Prefer widget tests for UI components (widgets in `lib/Ui/widgets`)
  - Add integration tests for end‑to‑end user flows (navigation, payments)
  - Keep ProductDataService side‑effects contained for predictable tests

## Design & UX Notes

- Maintain consistent spacing, typography, and color usage defined in `AppThemes`
- Favor reusable widgets in `lib/Ui/widgets` for product list cards, grids, headers
- Use `IndexedStack` to preserve state between tabs when adding new screens

## App Icons

This project is configured with `flutter_launcher_icons`. To regenerate:

```bash
flutter pub run flutter_launcher_icons
```

## Roadmap Ideas

- Real backend integration for products, cart, and orders
- User authentication and profile management
- State management (e.g., Provider, Riverpod, Bloc) for scalable data flows
- Expanded test coverage (widget + integration)

## Acknowledgements

- Flutter community packages (listed in Tech Stack)

---

This repository is intended as a professional Flutter app baseline for an e‑commerce experience with modular UI, theming, and payment flows. Adjust configuration and credentials as required for your environment.
