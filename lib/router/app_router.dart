import 'package:flutter/material.dart';
import 'package:nilcom/features/auth/views/sign_in.dart';
import 'package:nilcom/features/auth/views/sign_up.dart';
import 'package:nilcom/features/auth/views/sign_up_info.dart';
import 'package:nilcom/features/home/views/home.dart';
import 'package:nilcom/models/user_model.dart';
import 'package:nilcom/more/views/write_article.dart';
import 'package:nilcom/router/router_names.dart';

class AppRouter {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case AppRouteNames.signIn:
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
        );
      case AppRouteNames.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUp(),
        );
      case AppRouteNames.signUpContinue:
        final arguments = settings.arguments as Map<String, dynamic>;
        final email = arguments['email'] as String;
        return MaterialPageRoute(
          builder: (context) => SignUpInfo(email: email),
        );
      case AppRouteNames.writeArticle:
        final arguments = settings.arguments as Map<String, dynamic>;
        final currentUser = arguments['currentUser'] as UserModel;
        return MaterialPageRoute(
          builder: (context) => WriteArticle(currentUser: currentUser),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
        );
    }
  }
}
