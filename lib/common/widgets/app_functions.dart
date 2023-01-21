import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

///Internet connection
checkConnection() async {
  ConnectivityResult result = await Connectivity().checkConnectivity();
  return (result == ConnectivityResult.mobile ||
      result == ConnectivityResult.wifi);
}

///Dispose keyboard
void disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}
