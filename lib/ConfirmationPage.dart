import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  int _rating = 0; // Variable pour stocker la note de l'utilisateur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation de Réservation'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icône de confirmation
                Icon(
                  Icons.check_circle,
                  size: 100,
                  color: Colors.green,
                ),
                SizedBox(height: 30),

                // Texte principal de confirmation
                Text(
                  'Félicitations !\nVotre réservation a été confirmée.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // Message supplémentaire
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Vous recevrez bientôt un email de confirmation.\nMerci de choisir nos services.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),

                // Section de notation par étoiles
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Évaluez votre expérience :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: _rating > index
                                ? Icon(Icons.star, size: 40, color: Colors.amber) // Remplie
                                : Icon(Icons.star_border, size: 40, color: Colors.amber), // Vide
                            onPressed: () {
                              setState(() {
                                _rating = index + 1; // Change la note
                              });
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Votre note : $_rating étoiles',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                // Section de formulaire pour demandes spéciales
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Avez-vous des demandes spéciales ou des questions ?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Écrivez votre demande ou question...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          print('Demande spéciale envoyée');
                        },
                        child: Text('Envoyer ma demande'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 24,
                          ),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),

                // Bouton pour revenir à l'accueil
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: Text('Retour à l\'accueil'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 40,
                    ),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
