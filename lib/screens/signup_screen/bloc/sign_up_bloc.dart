import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:user_listing_with_signup_demo/common/validator/field_validator.dart';

class SignUpBloc {
  ///Validate Name
  static StreamController<String> nameController = BehaviorSubject<String>();

  static Stream<String> get nameStream => nameController.stream;

  static Sink<String> get nameSink => nameController.sink;

  static getName(String data) => nameSink.add(validateName(data));

  ///Validate Email
  static StreamController<String> emailController = BehaviorSubject<String>();

  static Stream<String> get emailStream => emailController.stream;

  static Sink<String> get emailSink => emailController.sink;

  static getEmail(String data) => emailSink.add(validateEmail(data));

  static dispose() {
    nameController.close();
    emailController.close();
  }
}
