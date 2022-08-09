import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentVariables {
  const EnvironmentVariables._();

  static String? get host =>  dotenv.env['HOST'];
  static String? get scheme =>  dotenv.env['SCHEME'];
}