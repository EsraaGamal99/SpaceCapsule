# 🚀 Flutter Space App
### 👋 Welcome to our Flutter Space App!
##### This app provides information about rockets, dragons, launches, and landpods related to space exploration.

## 💻 Features
##### Rockets: Explore details about various rockets used in space missions.
##### Dragons: Learn about spacecraft developed by SpaceX, including Dragon capsules.
##### Launches: Stay updated with upcoming and past space launches.
##### Landpods: Discover information about man-made structures orbiting our planet.


## 🔻 Installation
#### To run the app locally, follow these steps:

Make sure you have Flutter installed on your machine. If not, follow the Flutter installation instructions.
Clone this repository to your local machine.
Navigate to the project directory.
Run flutter pub get to install the dependencies.
Run flutter run to launch the app on your device or simulator.

## 🛰️ Firebase Authentication and Profile Edits
#### This app uses Firebase for authentication and profile management. To integrate Firebase into your Flutter app:

Follow the instructions to add Firebase to your Flutter app as per the official documentation.
Enable Firebase Authentication and configure the sign-in methods you want to support.
Implement authentication features such as sign-up, sign-in, and password recovery in your app using the Firebase Authentication SDK.
Use Firebase Firestore or Firebase Realtime Database to store user profiles and allow users to edit their profiles within the app.

## 🗺️ Localization
#### This app supports localization using the flutter_localization package. Here's how to use localized texts:

Add translations for different languages in the lib/features/localization/logic/translation_generated_logic directory using the intl_translation package or use tools like Loco or Crowdin for managing translations.
Import the generated localization file (l10n.dart) into your code.
Use the generated localization class (S) to access localized strings in your app. For example, use S.of(context).appName to get the translated app name.
Implement a mechanism to change the app's locale based on user preferences. You can use packages like provider or flutter_bloc to manage app state and update the locale accordingly.



#### ℹ️ This app was developed by our team **[ِEsraa Gamal, Abdullah Mamdouh, Wrood, and Samaa Soltan]** and under **[Omar Ahmed]** supervision.
#### This app is inspired by the fascinating world of space exploration.
