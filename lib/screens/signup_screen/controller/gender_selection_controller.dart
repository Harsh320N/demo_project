import 'package:get/get.dart';

class GenderSelectionController extends GetxController{
  String _selected = "Male";

  String get selected => _selected;

  set selected(String value){
    _selected = value;
    update();
  }
}