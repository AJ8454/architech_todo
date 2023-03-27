import 'package:architech_todo/src/app/features/authentication/data/models/user_model.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserModel>> getUserData();
  Future<Either<Failure, Unit>> userLogOut();
}
