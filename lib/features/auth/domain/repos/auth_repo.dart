import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class IAuthRepo {
   Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword( String email, String password);
  Future<Either<Failure, UserEntity>> signInWithGoogle( String email, String password);
  Future<Either<Failure, UserEntity>> signInWithFacebook( String email, String password);
  Future<Either<Failure, UserEntity>> signInWithApple( String email, String password);
}
