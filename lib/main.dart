import 'package:flutter/material.dart';
import 'core/app_routes.dart';
import 'screens/splash/splash_screen.dart';
import 'services/language_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// load default language
  await LanguageService.loadLanguage("en");

  runApp(const KrishiMitraApp());
}

class KrishiMitraApp extends StatefulWidget {
  const KrishiMitraApp({super.key});

  static void setLocale(BuildContext context, String lang) async {
    await LanguageService.loadLanguage(lang);

    final state =
        context.findAncestorStateOfType<_KrishiMitraAppState>();

    state?.changeLanguage();
  }

  @override
  State<KrishiMitraApp> createState() => _KrishiMitraAppState();
}

class _KrishiMitraAppState extends State<KrishiMitraApp> {

  void changeLanguage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KrishiMitra AI',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: '/splash',
      home: const SplashScreen(),

      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Route not found!')),
          ),
        );
      },
    );
  }
}