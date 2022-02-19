import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:temp/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Should show dialog when second time call showDialog', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.longPress(find.text('Account'));
    await tester.pumpAndSettle();

    expect(find.text('Popup'), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();

    expect(find.text('Popup'), findsNothing);

    await tester.longPress(find.text('Account'));
    await tester.pumpAndSettle();

    expect(find.text('Popup'), findsOneWidget); // <-- Popup not displayed
  });
}
