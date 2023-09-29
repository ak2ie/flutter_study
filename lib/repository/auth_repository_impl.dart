import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_2/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// https://zenn.dev/ryota_iwamoto/articles/firebase_auth_and_riverpod

final authProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final authRepositoryImplProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.watch(authProvider)));

final authUserProvider = StreamProvider<User?>(
    (ref) => ref.watch(authRepositoryImplProvider).authStateChanges());

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<String?> signUp(
      {required String email, required String password}) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    return userCredential.user?.uid;
  }
}
