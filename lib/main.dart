import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/repository/user_control_repository.dart';
import 'package:nilcom/router/app_router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final String initialRoute =
            ref.read(userControlRepositoryProvider).isUserSignedIn();
        return MaterialApp(
          title: 'Nilcom',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent, centerTitle: true),
            scaffoldBackgroundColor: scaffoldBGColor,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedItemColor: greyColor,
                type: BottomNavigationBarType.fixed,
                backgroundColor: bottomNavigationBGColor),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter.generate,
          initialRoute: initialRoute,
        );
      },
    );
  }
}
