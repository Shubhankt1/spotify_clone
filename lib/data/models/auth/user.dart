import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageUrl;

  UserModel({
    this.fullName,
    this.email,
    this.imageUrl,
  });

  UserModel.fromJson(Map<String, dynamic> userJson) {
    fullName = userJson['name'];
    email = userJson['email'];
  }
}

extension UserModelX on UserModel {
  User toEntity() {
    return User(
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
