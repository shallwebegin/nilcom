import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/common/sizes.dart';
import 'package:nilcom/features/auth/controller/auth_controller.dart';
import 'package:nilcom/router/router_names.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(signUpNewImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: scaffoldBGColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: vertical10,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: whiteColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: whiteColor,
                            filled: true,
                            hintStyle: const TextStyle(color: activeColor),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: borderColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            fillColor: whiteColor,
                            filled: true,
                            hintStyle: const TextStyle(color: activeColor),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: borderColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(authControllerProvider)
                                      .signUpWithEmailAndPassword(
                                          email: _emailController.text,
                                          password: _passwordController.text)
                                      .then((value) => Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  AppRouteNames.signUpContinue,
                                                  (route) => false,
                                                  arguments: {
                                                'email': _emailController.text
                                              }));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              color: activeColor,
                              minWidth: double.infinity,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Continue',
                                  style: TextStyle(color: containerColor),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Do you have an account ? ",
                                style: TextStyle(
                                    color: textButtonColor, fontSize: 14)),
                            TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(AppRouteNames.signIn),
                              child: const Text(
                                'Sign In',
                                style:
                                    TextStyle(color: whiteColor, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
