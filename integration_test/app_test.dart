import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oorangadi/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app starts and displays landing page', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Oorangadi'), findsOneWidget);
    expect(find.text('Minimalistic Sales App'), findsOneWidget);
    expect(find.text('Design Pillars'), findsOneWidget);
  });
}
