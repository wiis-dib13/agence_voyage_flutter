import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _durationController = TextEditingController();
  String _durationMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du Voyage'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'assets/fond.jpg',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
          ),

          // Overlay sombre pour lisibilité
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          // Contenu principal
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),

                        // Titre principal
                        Text(
                          'Réservez votre voyage !',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),

                        // Instructions
                        Text(
                          'Indiquez la durée de votre voyage (en jours) :',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                          ),
                        ),
                        SizedBox(height: 10),

                        // Champ de texte pour la durée
                        TextField(
                          controller: _durationController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Ex: 7 jours',
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

                        // Bouton pour valider la durée
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _durationMessage = 'Durée du voyage: ${_durationController.text} jours';
                            });
                          },
                          child: Text('Valider'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 24,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Message de durée
                        if (_durationMessage.isNotEmpty)
                          Text(
                            _durationMessage,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        SizedBox(height: 30),

                        // Bouton pour réserver
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          icon: Icon(Icons.card_travel),
                          label: Text('Réserver ce voyage'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 30),
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
