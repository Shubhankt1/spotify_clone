import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUser createUser);
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUser createUser) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUser.email,
        password: createUser.password,
      );
      return const Right('Signup successful!');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      String message = e.message.toString();

      if (e.code == 'weak-password') {
        message = 'The password is too weak!';
      } else if (e.code == 'email-already-in-use') {
        message = 'Account Already Exists!';
      }
      return Left(message);
    }
  }
}
