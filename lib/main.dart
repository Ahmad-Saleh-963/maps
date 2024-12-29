import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport/library/utils/colors.dart';
import 'package:sport/view/on_run_app/splashScreen.dart';
import 'library/utils/shared_preferences_helper.dart';
import 'library/utils/single_service_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  await SharedPreferencesHelper.initSupaBase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(

        statusBarColor: ColorsApp.primaryColor,
        statusBarIconBrightness: Brightness.light, // لون الأيقونات في شريط الحالة (فاتح)
        statusBarBrightness: Brightness.dark, // لون النصوص في شريط الحالة (لأنها داكنة على أندرويد)

        // إعدادات شريط التنقل السفلي
        systemNavigationBarColor: ColorsApp.primaryColor,// لون خلفية شريط التنقل
        systemNavigationBarDividerColor: ColorsApp.primaryColor, // لون الخط الفاصل (إذا كان موجوداً)
        systemNavigationBarIconBrightness: Brightness.light, // لون الأيقونات في شريط التنقل (فاتح)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setSystemUIOverlayStyle();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: ColorsApp.bgScaffold,
      ),
      navigatorKey: SingleInstanceService.navigatorKey,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      home: const SplashScreen(),
    );
  }
}
