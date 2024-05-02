import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logout() {
    if(_auth.currentUser != null) {
      _auth.signOut();
    }
  }

  Future<User?> getUser() async {
    print('_auth.currentUser ${_auth.currentUser}');
    return _auth.currentUser;
  }

  updateEmail({required String email}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.verifyBeforeUpdateEmail(email);
    }
  }

  updatePassword({required String password}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.updatePassword(password);
    }
  }

  updateUsername({required String username}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.updateDisplayName(username);
    }
  }

  updatePhoto({required String photoURL}) async {
    final user = _auth.currentUser;
    if(user != null) {
      await user.updatePhotoURL(photoURL);
    }
  }
}