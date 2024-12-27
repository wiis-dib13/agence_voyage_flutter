import 'package:flutter/material.dart';
import 'PaymentPage.dart';
import 'LoginPage.dart';
import 'SignUpPage.dart'; // Importation de la page d'inscription
import 'HomePage.dart';
import 'VoyagesPage.dart';
import 'DetailsPage.dart';
import 'ReservationPage.dart';
import 'ConfirmationPage.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Voyage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home', // La page d'accueil est la page initiale
      routes: {
        '/': (context) => HomePage(), // Page d'accueil
        '/voyages': (context) => VoyagesPage(), // Page des voyages
        '/details': (context) => DetailsPage(), // Détails du voyage
        '/reservation': (context) => ReservationPage(), // Page de réservation
        '/login': (context) => LoginPage(), // Page de connexion
        '/signUp': (context) => SignUpPage(),
        '/PaymentPage': (context) => PaymentPage(), // Page de paiement
        '/confirmation': (context) => ConfirmationPage(), // Page de confirmation de réservation
      },
    );
  }
}
