part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  //
  static Future<void> updateUser(User user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'nama': user.nama,
      'golDarah': user.golDarah,
      'tempatLahir': user.tempatLahir,
      'tanggalLahir': user.tanggalLahir,
      'jenkel': user.jenkel,
      'pekerjaan': user.pekerjaan,
      'profilePicture': user.profilePicture ?? "",
    });
  }

  //
  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(
      id,
      snapshot.data['email'],
      nama: snapshot.data['nama'],
      golDarah: snapshot.data['golDarah'],
      tempatLahir: snapshot.data['tempatLahir'],
      tanggalLahir: snapshot.data['tanggalLahir'],
      jenkel: snapshot.data['jenkel'],
      pekerjaan: snapshot.data['pekerjaan'],
      profilePicture: snapshot.data['profilePicture'],
    );
  }
}
