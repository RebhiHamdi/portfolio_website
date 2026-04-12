import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app.dart';

void main() {
  testWidgets('Portfolio app renders successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    // Verify the app loads with the hero section name
    expect(find.text('Hamdi Rebhi'), findsOneWidget);
  });
}