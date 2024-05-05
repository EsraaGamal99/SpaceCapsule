
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetChecker {
  Future<bool> get isConnected;
}

class InternetCheckerImpl implements InternetChecker {
  final InternetConnectionChecker connectionChecker;

  InternetCheckerImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}