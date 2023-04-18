import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_cycles/core/keys/config_keys.dart';
import 'package:project_cycles/services/secure_storage_service.dart';

class DioConnection extends GetxController {
  final Dio dio = Dio();

  BaseOptions options = BaseOptions(
    baseUrl: 'https://oura-cycle-phases.link/',
    headers: {
      'Content-Type': 'application/json',
    },
  );

  Future<Map<String, String>> getAuthHeader() async {
    const SecureStorageService secureStorageService = SecureStorageService();
    Map<String, String> authHeaders = {
      'Content-Type': 'application/json',
    };
    final cookie = await secureStorageService.readOne(key: ConfigKeys.cookie);
    if (cookie != null) {
      authHeaders['cookie'] = cookie;
    }
    return authHeaders;
  }

  @override
  void onInit() {
    dio.options = options;
    super.onInit();
  }
}
