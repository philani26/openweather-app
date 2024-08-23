import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:open_weather_example_flutter/src/features/weather/application/providers.dart';
import 'package:open_weather_example_flutter/src/features/weather/presentation/city_search_box.dart';
import 'package:provider/provider.dart';

class MockWeatherProvider extends Mock implements WeatherProvider {}


void main() {
  late MockWeatherProvider mockWeatherProvider;

  setUp(() {
    mockWeatherProvider = MockWeatherProvider();
    when(mockWeatherProvider.city).thenReturn('London');
  });

  Widget createWidgetUnderTest() {
    return ChangeNotifierProvider<WeatherProvider>.value(
      value: mockWeatherProvider,
      child: const MaterialApp(
        home: Scaffold(
          body: CitySearchBox(),
        ),
      ),
    );
  }

  testWidgets('should display initial city in the search box',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Verify the initial value of the text field
    expect(find.text('London'), findsOneWidget);
  });

  testWidgets('should call getWeatherData when search button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());


    await tester.enterText(find.byType(TextField), 'New York');

    await tester.tap(find.byType(InkWell));
    await tester.pump();

    verify(mockWeatherProvider.city = 'New York').called(1);
    verify(mockWeatherProvider.getWeatherData()).called(1);
  });

  testWidgets('should call getWeatherData when text field is submitted',
      (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    await tester.enterText(find.byType(TextField), 'Paris');

    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();
    verify(mockWeatherProvider.city = 'Paris').called(1);
    verify(mockWeatherProvider.getWeatherData()).called(1);
  });
}
