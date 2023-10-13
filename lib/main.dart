import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syrpronet/screens/navigation.dart';
import 'WelcomeScreen.dart';
import 'model/providers/buttonProvider.dart';
import 'model/providers/informationProvider.dart';
import 'model/providers/listProvider.dart';
import 'model/providers/theme.dart';
import 'model/providers/validateDropProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const syrpronet());
}

class syrpronet extends StatelessWidget {
  const syrpronet({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ButtonProvider>(
            create: (context) => ButtonProvider(),
          ),
          ChangeNotifierProvider<ListProvider>(
            create: (context) => ListProvider(),
          ),
          ChangeNotifierProvider<ValidateDropProvider>(
            create: (context) => ValidateDropProvider(),
          ),
          ChangeNotifierProvider<InformationProvider>(
            create: (context) => InformationProvider(),
          ),
          ChangeNotifierProvider<ThemeChanger>(
            create: (context) => ThemeChanger(ThemeMode.light),
          ),

        ],
        child: Builder(
          builder: (context) => MaterialApp(
            home: const WelcomeScreen(),
            debugShowCheckedModeBanner: false,
            themeMode: context.read<ThemeChanger>().getTheme(),
            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
          ),
        )
    );
  }
}
