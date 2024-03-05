import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCRUD{
  CollectionReference _userCollection = FirebaseFirestore.instance.collection('docData');

  ///read all doctors
  Stream<QuerySnapshot> readDocData() {
    return _userCollection.snapshots();
  }

  ///read doctor with specialisation
  Stream<QuerySnapshot> readDocSpec(specialisation){
    return _userCollection.where('specialisation', isEqualTo: specialisation).snapshots();
  }

  ///read doctor with location
  Stream<QuerySnapshot> readDocLocation(location){
    return _userCollection.where('location', isEqualTo: location).snapshots();
  }

  ///read doctor with location and specialisation
  Stream<QuerySnapshot> readDocLocationSpec(location,specialisation) {
    return _userCollection.
    where('location', isEqualTo: location).
    where('specialisation', isEqualTo: specialisation).
    snapshots();
  }

  ///update user upon update buttonclick
  Future<void> updateUser(
      String userId, String updateName, String updateEmail) async {
    var updatedValues = {"name": updateName, "email": updateEmail};
    return _userCollection
        .doc(userId)
        .update(updatedValues)
        .then((value) {
      print("User data updated successfully");
    }).catchError((error) {
      print("User data update failed");
    });
  }
}
