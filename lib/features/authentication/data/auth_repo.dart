import 'package:dartz/dartz.dart';
import 'package:space_app/core/errors/failure.dart';
import 'package:space_app/features/authentication/data/models/user_model.dart';

abstract class AuthRepo {
  
  Future<Either<Failure, dynamic>> userLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, dynamic>> userRegistration({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserModel>> createUser({
    required String name,
    required String email,
    required String password,
    required String uId,
  });
}
