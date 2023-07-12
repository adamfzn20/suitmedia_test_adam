import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_adam/view/first_screen/screen/first_screen.dart';
import 'package:suitmedia_test_adam/view_model/first_screen/name_provider.dart';
import 'package:suitmedia_test_adam/view_model/first_screen/palindrom_provider.dart';
import 'package:suitmedia_test_adam/view_model/third_screen/get_users_list_provider.dart';

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
          create: (context) => NameProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetUsersListProvider(),
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
          textTheme: GoogleFonts.poppinsTextTheme().copyWith(
            bodySmall: const TextStyle(
              color: Color(0xFF04021D),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            bodyMedium: const TextStyle(
              color: Color(0xff04021D),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: const TextStyle(
              color: Color(0xff04021D),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            labelMedium: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            labelSmall: const TextStyle(
              color: Color(0xFF686777),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            titleLarge: const TextStyle(
              color: Color(0xFF04021D),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
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
