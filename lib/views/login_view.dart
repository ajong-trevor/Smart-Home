import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_form_field.dart';
import 'widgets/custom_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> onTap() async {
    if (_formKey.currentState!.validate()) {
      Get.offNamed('/home');
    }
    return;
  }

  String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password too short';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Smart-home.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            hint: 'Email',
                            icon: Icons.email,
                            textEditingController: emailEditingController,
                            textInputType: TextInputType.emailAddress,
                            isObscured: false,
                            isValide:
                                emailValidation(emailEditingController.text),
                          ),
                          const SizedBox(height: 25.0),
                          CustomTextFormField(
                            hint: 'Password',
                            icon: Icons.lock,
                            textEditingController: passwordEditingController,
                            textInputType: TextInputType.visiblePassword,
                            isObscured: true,
                            isValide: passwordValidation(
                                passwordEditingController.text),
                          ),
                          const SizedBox(height: 50.0),
                          CustomButton(buttonText: 'Login', onTap: onTap),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                          ),
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          child: Text(
                            "Create one",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
