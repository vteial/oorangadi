import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oorangadi/main.dart';

void main() {
  testWidgets('Landing page renders title and pillars', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: OorangadiApp()));

    expect(find.text('Oorangadi'), findsOneWidget);
    expect(find.text('Minimalistic Sales App'), findsOneWidget);
    expect(find.text('Design Pillars'), findsOneWidget);
  });
}
