import 'package:flutter_test/flutter_test.dart';

import 'package:teddylogin/app/shared/services/navigate_service.dart';

void main() {
  NavigateService service;

  setUp(() {
    service = NavigateService();
  });

  group('NavigateService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<NavigateService>());
    });
  });
}
