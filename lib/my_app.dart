import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/view/first_screen/screen/first_screen.dart';
import 'package:suitmedia_test_adam/view_model/first_screen/user_provider.dart';
import 'package:suitmedia_test_adam/view_model/first_screen/palindrom_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PalindromeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff554AF0),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xff554AF0),
            selectionColor: Color(0xff554AF0),
            selectionHandleColor: Color(0xff554AF0),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              bodySmall: TextStyle(
                color: Color(0xFF04021D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              bodyMedium: TextStyle(
                color: Color(0xff04021D),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              bodyLarge: TextStyle(
                color: Color(0xff04021D),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              titleSmall: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)
              // Atur gaya dan warna teks lainnya sesuai kebutuhan
              ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 1,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const FirstScreen(),
      ),
    );
  }
}
