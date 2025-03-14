import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.id,
    this.username,
    this.phone,
    this.userPassword,
  });

  final int? id;
  final String? username;
  final String? phone;
  final String? userPassword;

  @override
  List<Object?> get props => [id, username, phone];
}
