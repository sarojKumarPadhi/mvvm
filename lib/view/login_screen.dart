import 'package:flutter/material.dart';
import 'package:mvvm/utils/utiles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obsecurePassword = ValueNotifier(true);

    TextEditingController emailController = TextEditingController();
    TextEditingController passWordController = TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passWordFocusNode = FocusNode();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.alternate_email)),
              onChanged: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passWordFocusNode);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    focusNode: passWordFocusNode,
                    obscureText: obsecurePassword.value,
                    obscuringCharacter: '*',
                    controller: passWordController,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              obsecurePassword.value = !obsecurePassword.value;
                            },
                            child: obsecurePassword.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility)),
                        labelText: 'Passwords',
                        hintText: 'Passwords'),
                  );
                })
          ],
        ),
      ),
    );
  }
}
