import 'package:architech_todo/src/app/features/authentication/data/models/user_model.dart';
import 'package:architech_todo/src/app/features/authentication/domain/entities/user_entity.dart';
import 'package:architech_todo/src/app/features/authentication/domain/repositories/auth_repo.dart';
import 'package:architech_todo/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class AuthUsecase {
  final AuthRepository _authRepository;

  AuthUsecase(this._authRepository);

  Future<Either<Failure, UserModel>> callCreateUser(UserEntity user) async {
    return await _authRepository.createUser(user);
  }
}
