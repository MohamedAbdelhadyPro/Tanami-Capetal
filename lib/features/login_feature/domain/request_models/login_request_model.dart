import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable {
  const LoginRequestModel({
    this.phone,
    this.password,
  });

  final String? phone;
  final String? password;

  @override
  List<Object?> get props => [phone, password];
}
