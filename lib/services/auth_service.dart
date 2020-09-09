part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // note: Method SignUp
  static Future<SignInSignUpResult> signUp(
    String nama,
    String email,
    String golDarah,
    String tempatLahir,
    String tanggalLahir,
    String jenkel,
    String pekerjaan,
    String password,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //convert FirebaseUser to User
      User user = result.user.convertToUser(
        nama: nama,
        golDarah: golDarah,
        tempatLahir: tempatLahir,
        tanggalLahir: tanggalLahir,
        jenkel: jenkel,
        pekerjaan: pekerjaan,
      );

      //after convert send/save to Firestore
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (_) {
      return SignInSignUpResult(
          message: 'Email yang anda masukan sudah digunakan oleh akun lain !');
    }
  }

  // note: Method SignIn
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user);
    } catch (_) {
      return SignInSignUpResult(message: 'Email Atau Password anda salah');
    }
  }

  // note: Method SignOut
  static Future<void> signOut() async {
    await _auth.signOut();
  }

  // note: Method Forgot Password
  static Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //
  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  User user;
  String message;

  SignInSignUpResult({this.user, this.message});
}
