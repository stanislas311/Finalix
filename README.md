# 🏋️ Fitness Program Plan — Flutter UI

Reproduction d'une maquette Dribbble en Flutter.

## 🔗 Maquette originale

👉 [Fitness App — Dribbble](https://dribbble.com/shots/26913868-Fintess-app)

## 📱 Description

Application mobile Flutter reproduisant une interface fitness moderne composée de 3 écrans :

| Écran | Description |
|---|---|
| **Program Plan** | Vue d'ensemble du programme : stats personnelles, progress bar 24% |
| **Pick a Challenge** | Sélection du défi : carte workout, compteur utilisateurs |
| **Plan for Success** | Objectif de poids, graphique barres, calendrier 30-day Shred |

## 🎨 Design

- **Palette** : Blanc `#FFFFFF`, Noir `#000000`, Vert `#7DC67E`, Gris `#F5F5F5`
- **Typographie** : SF Pro Display (poids light + bold)
- **Style** : Minimaliste, cards avec ombres légères, boutons rounded

## 🚀 Lancer le projet

```bash
flutter pub get
flutter run
```

## 📁 Structure

```
lib/
├── main.dart
└── screens/
    ├── program_plan_screen.dart   # Écran 1
    ├── pick_challenge_screen.dart # Écran 2
    └── plan_success_screen.dart   # Écran 3
```

## ⚠️ Difficultés rencontrées

- Reproduction fidèle du graphique en barres sans librairie externe
- Gestion du calendrier interactif avec état sélectionné
- Équilibre entre l'image hero et le titre sur l'écran 1
- Responsive sur différentes tailles d'écran Android/iOS

## 📊 Critères d'évaluation

| Critère | Points |
|---|---|
| Respect de la maquette | /8 |
| Qualité du code | /4 |
| Structure du projet | /3 |
| Responsive Design | /3 |
| Documentation (README) | /2 |
| **Total** | **/20** |