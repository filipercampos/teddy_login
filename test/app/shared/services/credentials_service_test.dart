import 'package:flutter_test/flutter_test.dart';

import 'package:teddylogin/app/shared/services/credentials_service.dart';

void main() {
  CredentialsService service;

  setUp(() {
    service = CredentialsService();
  });

  group('CredentialsService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<CredentialsService>());
    });
  });
}
