# Cloutgrid Flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Tips

- Run build: dart run build_runner watch --delete-conflicting-outputs


## File Structure

lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── router/
│   │   ├── router.dart
│   │   └── router.g.dart
│   └── theme/
│       └── app_theme.dart
│
├── core/
│   ├── network/
│   │   └── api_client.dart
│   ├── storage/
│   │   └── secure_storage.dart
│   ├── errors/
│   │   └── failures.dart
│   └── widgets/
│
├── models/
│   ├── auth/
│   │   └── auth_credentials.dart
│   ├── user/
│   │   └── user.dart
│   ├── home/
│   │   └── home_feed_item.dart
│   └── campaign/
│       ├── campaign.dart
│       └── campaign_application.dart
│
├── repositories/
│   ├── auth/
│   │   └── auth_repository.dart
│   ├── user/
│   │   └── user_repository.dart
│   └── campaign/
│       └── campaign_repository.dart
│
├── managers/
│   └── campaign/
│       └── campaign_matching_engine.dart
│
├── providers/
│   ├── auth/
│   │   ├── auth_notifier.dart
│   │   └── auth_notifier.g.dart
│   ├── user/
│   │   ├── current_user_notifier.dart
│   │   └── current_user_notifier.g.dart
│   ├── home/
│   │   ├── home_feed_notifier.dart
│   │   └── home_feed_notifier.g.dart
│   └── campaign/
│       ├── campaign_list_notifier.dart
│       └── campaign_list_notifier.g.dart
│
└── screens/
    ├── auth/
    │   ├── login_screen.dart
    │   └── widgets/
    │       └── login_form.dart
    ├── home/
    │   └── home_screen.dart
    ├── profile/
    │   └── profile_screen.dart
    └── campaign/
        ├── campaign_list_screen.dart
        ├── campaign_detail_screen.dart
        └── widgets/
            └── campaign_card.dart
