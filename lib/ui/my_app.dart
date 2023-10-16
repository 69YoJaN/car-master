import 'package:car_master/stores/get_all_details_store/get_all_details_store.dart';
import 'package:car_master/ui/car_master_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:car_master/constants/app_theme.dart';
import 'package:car_master/constants/strings.dart';
import 'package:car_master/data/repository.dart';
import 'package:car_master/stores/theme/theme_store.dart';
import 'package:car_master/utils/locale/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../di/components/service_locator.dart';
import '../stores/language/language_store.dart';
import '../utils/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final GetAllDetailsStore _getAllDetailsStore = GetAllDetailsStore(getIt<Repository>());


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<GetAllDetailsStore>(create: (_) => _getAllDetailsStore),

      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode
                // ? AppThemeData.darkThemeData
                // : AppThemeData.lightThemeData,
                ? themeDataDark
                : themeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: const [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const CarMasterMainScreen(),
          );
        },
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
 
//   final _visionSdkPlugin = VisionSdk.init();

//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//   }

//   requestPermission() async {
//     print('申请权限');
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.location,
//       Permission.bluetoothScan,
//       Permission.bluetoothConnect,
//     ].request();
//     print(statuses[Permission.bluetoothScan]);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       builder: FlutterSmartDialog.init(),
//       initialBinding: AllControllerBinding(),
//       home: Application(),
//       translations: Translation(),
//       locale: Get.deviceLocale, //跟随手机系统语言
//       fallbackLocale: const Locale("zh", "CN"), // 在配置错误的情况下,使用的语言
//     );
//   }
// }
