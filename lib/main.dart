import 'package:anthony_and_april/view/home/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controllers/constants.dart';
import 'models/state_model.dart';
import 'models/theme_model.dart';
import 'view/error/error404.dart';
import 'view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setPathUrlStrategy();
  await GetStorage.init();
  runApp(MyApp());
}

final constantValues = Get.put(Constants());
var pageInfo = GetStorage();

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class ThemeProvider with ChangeNotifier {
  ThemeMode selectedThemeMode = ThemeMode.system;

  setSelectedThemeMode(bool comparator) {
    selectedThemeMode = comparator ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
      debugLogDiagnostics: true,
      errorBuilder: (context, state) => const Error404(),
      routes: [
        GoRoute(
          name: "splash",
          path: "/",
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          name: "home",
          path: "/home",
          builder: (context, state) => const HomePage(),
        ),
      ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    pageInfo.writeIfNull("isDarkTheme", false);
    final constantValues = Get.put(Constants());
    var color = constantValues.defaultColor;
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData(
        primarySwatch: MaterialColor(0xFFF4511E, color),
        colorScheme:
            ColorScheme.fromSeed(seedColor: constantValues.secondaryColor),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        brightness:
            pageInfo.read("isDarkTheme") ? Brightness.dark : Brightness.light,
      )),
      child:
          MaterialAppWithTheme(router: router, constantValues: constantValues),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    super.key,
    required GoRouter router,
    required this.constantValues,
  }) : _router = router;

  final GoRouter _router;
  final Constants constantValues;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return ChangeNotifierProvider(
        create: (context) => CustomStateModel(),
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            scrollBehavior: MyCustomScrollBehavior(),
            routerConfig: _router,
            title: "A&A",
            theme: theme.getTheme()
            // ThemeData(
            //     colorScheme: ColorScheme.fromSeed(
            //         seedColor: constantValues.secondaryColor),
            //     useMaterial3: true,
            //     textTheme:
            //         GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            //             .apply(bodyColor: constantValues.secondaryColor)
            //     // .copyWith(
            //     //   bodyLarge: TextStyle(color: constantValues.bodyTextColor),
            //     //   bodyMedium: TextStyle(color: constantValues.bodyTextColor)
            //     // )
            //     ),
            ));
  }
}
