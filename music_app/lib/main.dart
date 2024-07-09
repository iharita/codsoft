import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:music_app/di/servie_locator.dart';
import 'package:music_app/util/navigation/navigation_service.dart';
import 'package:music_app/util/navigation/routes.dart';
import 'package:music_app/util/navigation/screen_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ServiceLocator().setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Music App Ui',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          themeMode: ThemeMode.light,
          navigatorKey: GetIt.I.get<NavigationService>().navigatorKey,
          initialRoute: Routes.initial,
          onGenerateRoute: ScreenRouter.generateRoute,
        );
      },
    );
  }
}
