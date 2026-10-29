import 'package:flutter_test/flutter_test.dart';

import 'package:fit_app/Principal.dart';

void main() {
  testWidgets('HomePage renders greeting', (WidgetTester tester) async {
    await tester.pumpWidget(const Principal());
    expect(find.text('fit.app'), findsOneWidget);
    expect(find.text('Olá, Cauã!'), findsOneWidget);
  });
}
