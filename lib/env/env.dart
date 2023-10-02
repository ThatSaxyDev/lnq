import 'package:envied_flutter/envied.dart';
part 'env.g.dart';

@Envied(path: '.env.dev')
abstract class Env {

  @EnviedField(varName: 'API_KEY', defaultValue: '', obfuscate: true)
  static String apiKey = _Env.apiKey;  

  @EnviedField(varName: 'BASE_URL', defaultValue: '', obfuscate: true)
  static String baseUrl = _Env.baseUrl;
}