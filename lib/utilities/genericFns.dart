import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class GenFunctions{
  callNumber(String number) async{
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}