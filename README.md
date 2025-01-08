# Advanced Flutter Todo App

Une application Todo List avancée développée avec Flutter, démontrant l'utilisation de fonctionnalités avancées comme BLoC, animations, et thèmes dynamiques.

## 📱 Fonctionnalités

### Gestion des Tâches
- ✅ Création de tâches avec titre et date d'échéance
- 🔄 Marquage des tâches comme terminées
- 🗑️ Suppression des tâches
- 🔍 Filtrage (Toutes/Actives/Terminées)
- 📊 Compteur de progression

### Interface Utilisateur
- 🌓 Thème clair/sombre avec persistance
- ✨ Animations fluides
- 💫 Transitions élégantes
- 📱 Design responsive
- 🎨 Material Design 3

### Fonctionnalités Techniques
- 🔄 Gestion d'état avec BLoC Pattern
- 💾 Persistance des données
- 🌍 Internationalisation (FR/EN)
- ⚡ Performances optimisées
- 🎯 Architecture propre

## 🚀 Installation

### Prérequis

- Flutter SDK (dernière version stable)
- Dart SDK
- Un éditeur (VS Code, Android Studio, etc.)
- Git

### Configuration

1. Clonez le repository
```bash
git clone https://github.com/yourusername/advanced_todo_app.git
```

2. Accédez au dossier du projet
```bash
cd advanced_todo_app
```

3. Installez les dépendances
```bash
flutter pub get
```

4. Lancez l'application
```bash
flutter run
```

## 📂 Structure du Projet

```
lib/
├── main.dart           # Point d'entrée
├── app.dart            # Configuration de l'application
├── blocs/             # Gestion d'état
│   ├── todo_bloc.dart
│   └── theme_bloc.dart
├── models/            # Modèles de données
│   └── todo.dart
├── screens/           # Écrans
│   └── home_page.dart
├── services/          # Services
│   └── storage_service.dart
├── theme/            # Configuration des thèmes
│   └── app_theme.dart
├── utils/            # Utilitaires
│   └── date_formatter.dart
└── widgets/          # Widgets réutilisables
    ├── animated_todo_item.dart
    ├── add_todo_bottom_sheet.dart
    └── custom_widgets.dart
```

## 🛠️ Technologies Utilisées

- **Flutter**: Framework UI
- **Provider**: Injection de dépendances
- **RxDart**: Programmation réactive
- **SharedPreferences**: Stockage local
- **Intl**: Internationalisation
- **Material Design 3**: Design system

## 📦 Dépendances Principales

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  provider: ^6.0.5
  rxdart: ^0.27.7
  shared_preferences: ^2.2.0
  intl: ^0.18.1
```

## 🎯 Architecture

L'application suit le pattern BLoC (Business Logic Component) avec une architecture en couches :

1. **UI Layer**: Widgets et écrans
2. **Business Logic Layer**: BLoCs
3. **Data Layer**: Services et modèles

## 🔄 Gestion d'État

- Utilisation du pattern BLoC
- Streams pour la réactivité
- Provider pour l'injection de dépendances
- Persistance automatique des données

## 🎨 Thèmes

L'application supporte deux thèmes :
- **Thème Clair**: Design épuré et lumineux
- **Thème Sombre**: Mode sombre élégant

Le choix du thème est automatiquement sauvegardé.

## 🤝 Contribution

1. Forkez le projet
2. Créez votre branche (`git checkout -b feature/AmazingFeature`)
3. Committez vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Poussez vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrez une Pull Request


## 👥 Auteurs

- **Yassine DRISS** - *Travail initial* - [](https://github.com/Cinex10)
- **Abdellah Medles** - *Travail initial* - [](https://github.com/abdellah-med)

---

Fait avec ❤️ et Flutter