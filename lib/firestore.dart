import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String uid, String email) async {
    try {
      await _firestore.collection('users').doc(uid).set({
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('Utilisateur ajouté avec succès à Firestore');
    } catch (e) {
      print('Erreur lors de l\'ajout de l\'utilisateur : $e');
      throw e; // Propager l'erreur si nécessaire
    }
  }
}
