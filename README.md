# docfinder

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A flutter project to book doctor appointment

## App Architecture and Folder Structure

The code of the app implements clean architecture to separate the UI, domain and data layers with a feature-first approach for folder structure.

### Folder Structure

```
lib
├── core
│   ├── configs
│   ├── exceptions
│   ├── models
│   ├── services
│   │   └── http
│   │   
│   └── widgets
├── features
│   ├── doctor
│       ├── models
│       ├── providers
│       ├── repository
│       ├── view
│       └── widget
│        
│  
├── main.dart
└── doc_app.dart
```

```shell
dart run build_runner watch --delete-conflicting-outputs
```



[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
