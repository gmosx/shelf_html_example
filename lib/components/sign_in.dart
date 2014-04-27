library shelf_html_example.components.sign_in;

//import 'dart:html';
//import 'dart:convert' show JSON;

import 'package:polymer/polymer.dart';

@CustomTag('x-sign-in')
class SignInElement extends PolymerElement {
  bool get applyAuthorStyles => true;

  SignInElement.created() : super.created() {
  }

  void submit() {
    fire('auth', detail: 'dummytoken');
  }
}