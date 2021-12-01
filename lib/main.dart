import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '/models/history.dart';
import '/screens/history_page.dart';
import '/screens/home_page.dart';
import '/screens/info_page.dart';
import '/strings.dart';
import '/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HistoryList()),
      ],
      child: MaterialApp(
        title: Strings.title,
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          HistoryPage.routeName: (ctx) => const HistoryPage(),
          InfoPage.routeName: (ctx) => const InfoPage(),
        },
      ),
    );
  }
}
