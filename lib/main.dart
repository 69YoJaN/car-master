import 'package:car_master/ui/my_app.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'di/components/service_locator.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setPreferredOrientations();
    await setupLocator();

    // Initialize other stuff here...

    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://example@sentry.io/add-your-dsn-here';
      },
    );
    // or here
    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
  // WidgetsFlutterBinding.ensureInitialized();
  // await setPreferredOrientations();
  // await setupLocator();
  // return runZonedGuarded(() async {
  //   runApp(MyApp());
  // }, (error, stack) {
  //   print(stack);
  //   print(error);
  // });
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
