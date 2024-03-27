import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/features/auth/repository/auth_repository.dart';
import 'package:nilcom/models/user_model.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
  ),
);

class AuthController {
  AuthController({required this.authRepository});
  final AuthRepository authRepository;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return authRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return authRepository.signUpWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return authRepository.signOut();
  }

  Future<void> storeUserInfoFirebase(UserModel userModel) async {
    return authRepository.storeUserInfoFirebase(userModel);
  }
}
