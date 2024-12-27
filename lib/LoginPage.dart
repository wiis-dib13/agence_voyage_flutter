import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Les champs email et mot de passe doivent être remplis';
      });
      return;
    }

    try {
      // Authentifier l'utilisateur avec Firebase
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si l'authentification réussit, on redirige vers la page de paiement
      Navigator.pushReplacementNamed(context, '/PaymentPage');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.message ?? 'Une erreur est survenue lors de la connexion.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion à Votre Voyage'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo ou image (remplacer par votre propre logo)
              Image.asset(
                'assets/logo.png',
                height: 100,
              ),
              SizedBox(height: 30),
              // Titre de la page
              Text(
                'Connectez-vous pour gérer vos voyages',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
              SizedBox(height: 40),
              // Champ pour l'email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Entrez votre email',
                  prefixIcon: Icon(Icons.email, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Champ pour le mot de passe
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre mot de passe',
                  prefixIcon: Icon(Icons.lock, color: Colors.teal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Affichage du message d'erreur si nécessaire
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              // Bouton de connexion
              SizedBox(height: 20),
              if (_isLoading)
                CircularProgressIndicator(),
              if (!_isLoading)
                ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    'Se connecter',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              // Option de mot de passe oublié
              TextButton(
                onPressed: () {
                  // Logique pour mot de passe oublié
                },
                child: Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              // Option pour s'inscrire
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pas encore de compte ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
