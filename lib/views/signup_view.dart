import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_form_field.dart';
import 'widgets/custom_button.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> onSignup() async {
    setState(() {});
    if (_formKey.currentState!.validate()) {
      Get.offAllNamed('/home');
    }
    return;
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    return null;
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

  String? phoneValidation(String? value) {
    if (value!.isEmpty) {
      return 'Phone is required';
    }
    if (value.length != 9) {
      return 'Must be a valide number';
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

  String? confrimPasswordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Confrim password required';
    }
    if (value != passwordEditingController.text) {
      return "Password don't match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30.0),
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                CustomTextFormField(
                  hint: 'Name',
                  icon: Icons.person,
                  textEditingController: nameEditingController,
                  textInputType: TextInputType.name,
                  isObscured: false,
                  isValide: nameValidation(nameEditingController.text),
                ),
                const SizedBox(height: 25.0),
                CustomTextFormField(
                  hint: 'Email',
                  icon: Icons.email,
                  textEditingController: emailEditingController,
                  textInputType: TextInputType.emailAddress,
                  isObscured: false,
                  isValide: emailValidation(emailEditingController.text),
                ),
                const SizedBox(height: 25.0),
                CustomTextFormField(
                  hint: 'Phome',
                  icon: Icons.phone,
                  textEditingController: phoneEditingController,
                  textInputType: TextInputType.phone,
                  isObscured: false,
                  isValide: phoneValidation(phoneEditingController.text),
                ),
                const SizedBox(height: 25.0),
                CustomTextFormField(
                  hint: 'Password',
                  icon: Icons.lock,
                  textEditingController: passwordEditingController,
                  textInputType: TextInputType.visiblePassword,
                  isObscured: true,
                  isValide: passwordValidation(passwordEditingController.text),
                ),
                const SizedBox(height: 25.0),
                CustomTextFormField(
                  hint: 'Confirm password',
                  icon: Icons.lock,
                  textEditingController: confirmPasswordEditingController,
                  textInputType: TextInputType.visiblePassword,
                  isObscured: true,
                  isValide: confrimPasswordValidation(
                    confirmPasswordEditingController.text,
                  ),
                ),
                const SizedBox(height: 25.0),
                CustomButton(buttonText: 'Sign up', onTap: onSignup)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
