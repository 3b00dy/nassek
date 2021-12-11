import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Changing with ChangeNotifier{
 // ignore: prefer_typing_uninitialized_variables
 var gender;
 int selectedIndex = 0;
int quantity=1;

 quantityIncrement(){
   quantity+=1;
   notifyListeners();
 }
 quantityDecrement(){
   if(quantity>1){
   quantity-=1;}

   notifyListeners();
 }

  setGender( genderValue){
    gender=genderValue;
    debugPrint('Gender... $gender');
    notifyListeners();
  }
  navigationIndex(int value){
selectedIndex=value;
debugPrint('.......$selectedIndex .....');

notifyListeners();

  }


}