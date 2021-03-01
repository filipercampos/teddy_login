import 'package:dio/native_imp.dart';
import 'package:teddylogin/app/shared/services/local_storage_service.dart';

import 'interceptors/auth_interceptors.dart';

class CustomDio extends DioForNative {
  
  CustomDio(LocalStorageService service) {
    interceptors.add(AuthInterceptor(service));
  }
}
