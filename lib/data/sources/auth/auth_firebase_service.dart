import 'dart:developer';
import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/core/config/constants/app_urls.dart';
import 'package:spotify_clone/data/models/auth/create_user.dart';
import 'package:spotify_clone/data/models/auth/signin_user.dart';
import 'package:spotify_clone/data/models/auth/user.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart' as user_entity;

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUser createUser);
  Future<Either> signin(SigninUser signinUser);
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUser signinUser) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUser.email,
        password: signinUser.password,
      );
      return const Right('Signin successful!');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      String message = e.message.toString();

      if (e.code == 'invalid-email') {
        message = 'Wrong Email!';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong Password!';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUser createUser) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUser.email,
        password: createUser.password,
      );
      FirebaseFirestore.instance.collection('Users').doc(user.user?.uid).set({
        'name': createUser.fullName,
        'email': user.user?.email,
      });
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

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore
          .collection('Users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);

      userModel.imageUrl =
          firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultProfileImage;

      user_entity.User userEntity = userModel.toEntity();
      return Right(userEntity);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
