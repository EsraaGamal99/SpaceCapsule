import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:space_app/core/errors/failure.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<Failure, dynamic>> userLogin(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      token = await userCredential.user!.getIdToken();

      return Right(userCredential);
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(errMessage: 'Authentication failed: $e'));
    }
  }

  Future<Either<Failure, dynamic>> userRegistration(
      {required String name,
        required String email,
        required String password}) async {
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential);
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(errMessage: 'Authentication failed: $e'));
    }
  }

}
