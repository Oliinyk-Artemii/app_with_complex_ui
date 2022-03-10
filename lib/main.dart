import 'package:complex_ui/pages/error/error_page.dart';
import 'package:complex_ui/utils/locale_utils.dart';
import 'package:complex_ui/utils/navigation/navigation.dart';
import 'package:complex_ui/utils/navigation/project_router.dart';
import 'package:complex_ui/utils/screen_utils.dart';
import 'package:complex_ui/utils/values/colors.dart';
import 'package:complex_ui/utils/values/gen/fonts.gen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // InAppPurchaseConnection.enablePendingPurchases();
  // GestureBinding.instance.resamplingEnabled = true;

  // await FirebaseInit.initialize();

  // DIUtils.injectDependencies();

  // await PreferencesUtils.initialize();

  await ScreenUtils.lockToPortraitView();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: LocaleUtils.localePath,
      supportedLocales: LocaleUtils.locales,
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final easyLocalization = EasyLocalization.of(context);
    final themeData = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        onBackground: blackColor,
        onPrimary: whiteColor,
        onError: blackColor,
        onSecondary: blackColor,
        onSurface: blackColor,
      ),
      scaffoldBackgroundColor: whiteColor,
      fontFamily: FontFamily.aktivGrotesk,
      textTheme: const TextTheme(
        headline4: TextStyle(
          letterSpacing: -0.01,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        button: TextStyle(
          letterSpacing: 0.01,
          fontSize: 17,
          color: whiteColor,
        ),
        caption: TextStyle(
          letterSpacing: 0.01,
        ),
        overline: TextStyle(
          letterSpacing: 0.02,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
    return MaterialApp(
      title: 'App',
      builder: (BuildContext context, Widget? widget) {
        ErrorWidget.builder = (details) {
          return ErrorPage(details: details, showStacktrace: true);
        };
        return widget!;
      },
      theme: themeData,
      initialRoute: Routes.hot.name,
      navigatorKey: Navigation.navigatorKey,
      onGenerateRoute: ProjectRouter.generateRoute,
      localizationsDelegates: easyLocalization!.delegates,
      supportedLocales: easyLocalization.supportedLocales,
      locale: easyLocalization.locale,
    );
  }
}
