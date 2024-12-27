import 'package:flutter/material.dart';

class VoyagesPage extends StatefulWidget {
  @override
  _VoyagesPageState createState() => _VoyagesPageState();
}

class _VoyagesPageState extends State<VoyagesPage> {
  final List<Map<String, String>> voyages = [
    {'nom': 'Voyage 1', 'destination': 'Paris', 'image': 'assets/PARIS.jpg', 'drapeau': '🇫🇷', 'prix': '1500€'},
    {'nom': 'Voyage 2', 'destination': 'Tokyo', 'image': 'assets/TOKYO.jpg', 'drapeau': '🇯🇵', 'prix': '2000€'},
    {'nom': 'Voyage 3', 'destination': 'New York', 'image': 'assets/NEW_YORK.jpg', 'drapeau': '🇺🇸', 'prix': '1800€'},
    {'nom': 'Voyage 4', 'destination': 'Londres', 'image': 'assets/LONDRES2.jpg', 'drapeau': '🇬🇧', 'prix': '1200€'},
    {'nom': 'Voyage 5', 'destination': 'Rome', 'image': 'assets/ROMES2.jpg', 'drapeau': '🇮🇹', 'prix': '1400€'},
    {'nom': 'Voyage 6', 'destination': 'Sydney', 'image': 'assets/SYDNEY.jpg', 'drapeau': '🇦🇺', 'prix': '2500€'},
    {'nom': 'Voyage 7', 'destination': 'Berlin', 'image': 'assets/BERLIN2.jpg', 'drapeau': '🇩🇪', 'prix': '1600€'},
    {'nom': 'Voyage 8', 'destination': 'Barcelone', 'image': 'assets/BARCELON2.jpg', 'drapeau': '🇪🇸', 'prix': '1300€'},
    {'nom': 'Voyage 9', 'destination': 'Tunis', 'image': 'assets/TUNIS.jpg', 'drapeau': '🇹🇳', 'prix': '900€'},
    {'nom': 'Voyage 10', 'destination': 'Alger', 'image': 'assets/ALGER.webp', 'drapeau': '🇩🇿', 'prix': '1100€'},
  ];

  List<Map<String, String>> filteredVoyages = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredVoyages = voyages;
    searchController.addListener(_filterVoyages);
  }

  void _filterVoyages() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredVoyages = voyages;
      } else {
        filteredVoyages = voyages
            .where((voyage) =>
                voyage['destination']!.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.flight_takeoff, color: Colors.white),
            SizedBox(width: 10),
            Text(
              'Voyages à découvrir',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barre de recherche
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Rechercher une destination...',
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  ),
                ),
                style: TextStyle(color: Colors.deepPurple[800]),
              ),
            ),
            SizedBox(height: 20),
            // Liste des voyages sous forme de grille
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.75,
                ),
                itemCount: filteredVoyages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: filteredVoyages[index]['nom'],
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(filteredVoyages[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            // Overlay semi-transparent
                            Positioned.fill(
                              child: Container(
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            // Drapeau flottant avec emoji
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Center(
                                child: Text(
                                  filteredVoyages[index]['drapeau']!,
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                            // Texte en bas
                            Positioned(
                              bottom: 15,
                              left: 15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filteredVoyages[index]['nom']!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    filteredVoyages[index]['destination']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    filteredVoyages[index]['prix']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
