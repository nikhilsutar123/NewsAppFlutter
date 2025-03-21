import 'package:flutter/cupertino.dart';
import 'dart:developer';

dismissKeyboard(){
  FocusManager.instance.primaryFocus?.unfocus();
}

logConsole(dynamic message) => log("in-app message: $message");