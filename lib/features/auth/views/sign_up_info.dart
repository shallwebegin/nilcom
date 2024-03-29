import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nilcom/common/colors.dart';
import 'package:nilcom/common/paths.dart';
import 'package:nilcom/features/auth/controller/auth_controller.dart';
import 'package:nilcom/models/user_model.dart';
import 'package:nilcom/router/router_names.dart';

class SignUpInfo extends StatefulWidget {
  const SignUpInfo({super.key, required this.email});
  final String email;

  @override
  State<SignUpInfo> createState() => _SignUpInfoState();
}

class _SignUpInfoState extends State<SignUpInfo> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _userNameController.dispose();
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
                image: AssetImage(signUpContinueImage),
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
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                          controller: _nameController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Name',
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
                          controller: _surnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Surname is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Surname',
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
                          controller: _userNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Username',
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
                                  UserModel userModel = UserModel(
                                      name: _nameController.text,
                                      surname: _surnameController.text,
                                      email: widget.email,
                                      userName: _userNameController.text);
                                  ref
                                      .read(authControllerProvider)
                                      .storeUserInfoFirebase(userModel)
                                      .whenComplete(() =>
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              AppRouteNames.home,
                                              (route) => false));
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
                                  'Sign Up',
                                  style: TextStyle(color: containerColor),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
