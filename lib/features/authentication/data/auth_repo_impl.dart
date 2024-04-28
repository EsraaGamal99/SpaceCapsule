import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:space_app/core/errors/failure.dart';
import 'package:space_app/core/helpers/constants.dart';
import 'package:space_app/features/authentication/data/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:space_app/features/authentication/data/models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
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

  @override
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

      await createUser(
          name: name,
          email: email,
          password: password,
          uId: userCredential.user!.uid);

      return Right(userCredential);
    } catch (e) {
      debugPrint(e.toString());
      return Left(Failure(errMessage: 'Authentication failed: $e'));
    }
  }

  @override
  Future<Either<Failure, UserModel>> createUser(
      {required String name,
      required String email,
      required String password,
      required String uId}) async {
    try {
      UserModel model = UserModel(
        phone: '',
        email: email,
        name: name,
        uId: uId,
        image:
            'https://cdn-icons-png.flaticon.com/512/847/847969.png?w=740&t=st=1686120013~exp=1686120613~hmac=ca0d5c8214f5d5c563d6065dcdf2e669a9484b1ac0023c8b520fec708f0a6a81',
        cover:
            'https://img.freepik.com/free-photo/minimal-snowflake-christmas-social-media-banner-with-design-space_53876-160638.jpg?w=1480&t=st=1686120168~exp=1686120768~hmac=c2237f9b52b6cf8587784237bd6712bd695f72a8346ab734fd2d01e178c91da0',
        isVerification: false,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap());
      debugPrint('User added successfully!');
      return right(model);
    } catch (e) {
      debugPrint(e.toString());
      return left(Failure(errMessage: 'Create User failed: $e'));
    }
  }
}
