import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

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
                  CustomTextFormField(
                    hint: 'Phone',
                    icon: Icons.phone,
                    textEditingController: phoneEditingController,
                    textInputType: TextInputType.phone,
                    isObscured: false,
                  ),
                  const SizedBox(height: 25.0),
                  CustomTextFormField(
                    hint: 'Password',
                    icon: Icons.lock,
                    textEditingController: passwordEditingController,
                    textInputType: TextInputType.visiblePassword,
                    isObscured: true,
                  ),
                  const SizedBox(height: 50.0),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 1,
                          60.0,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        // debugPrint(
                        //   'Phone: ${phoneEditingController.text}',
                        // );
                        // debugPrint(
                        //   'Password: ${passwordEditingController.text}',
                        // );
                        Get.offNamed('/home');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w900,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
