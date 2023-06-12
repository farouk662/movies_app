import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnection{
  static Future<bool> get() async{
    return await InternetConnectionChecker().hasConnection;
  }
}