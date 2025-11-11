# Fashion E-Commerce Platform

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D3.9.0-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-%3E%3D3.9.0-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A sophisticated cross-platform e-commerce solution built with Flutter, delivering a premium shopping experience across mobile and web platforms. This application implements modern e-commerce patterns and best practices, featuring a comprehensive suite of shopping functionalities, secure payment integrations, and a responsive, theme-aware design system.

## Key Features

### Product Discovery & Catalog

- Dynamic home feed with curated product sections
- Advanced product categorization and filtering
- Intelligent favorites system with persistent state management
- High-performance product grid and list views

### User Experience

- Intuitive bottom navigation with state preservation
- Responsive design supporting multiple form factors
- Seamless light/dark theme transitions
- Custom typography with Jost font family
- Optimized asset delivery system

### Payment Integration

- Secure PayPal payment gateway integration
- PCI-compliant credit card processing
- Comprehensive order management system
- Transaction history and tracking

### Architecture & Quality

- Clean architecture with separation of concerns
- Modular widget system for maximum reusability
- Comprehensive lint rules enforcement
- Automated testing infrastructure
- Performance-optimized state management

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
SplashScreen.dart
```

Assets and fonts are configured in `pubspec.yaml`:

- Assets: `assets/`, `assets/icons/`,
- Fonts: Jost (Regular, Bold)

---

Copyright © 2025 Fashion E-Commerce Platform. All rights reserved.
