import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  final FirebaseService firebaseService;

  AuthRepoImpl({required this.firebaseService});
  @override
  // convert userModel to userEntity
  Future<Either<Failure, UserEntity>> signUp(
      String email, String password, String name) async {
    try {
      final user = await firebaseService.createUserWithEmailAndPassword(
        email,
        password,
      );
      return Right(UserModel.fromFireBase(user));
    } on CustomException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> logOut(String email, String password) {
    // TODO: implement logOut
    throw UnimplementedError();
  }
  
 
}
