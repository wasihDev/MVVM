import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_folderstructure/utils/routes/routes_name.dart';
import 'package:provider_folderstructure/utils/utils.dart';
import 'package:provider_folderstructure/view/auth_view_model.dart';

import '../resources/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  // provider for obsecuring text
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    _obsecurePassword.dispose();
    passwordController.dispose();
    numberController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    numberFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            focusNode: emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)),
            onFieldSubmitted: (val) {
              Utils.fieldFocussChange(
                  context, emailFocusNode, passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
            valueListenable: _obsecurePassword,
            builder: (context, value, child) {
              return TextFormField(
                focusNode: passwordFocusNode,
                controller: passwordController,
                obscureText: _obsecurePassword.value,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    suffixIcon: InkWell(
                        onTap: () {
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child: Icon(_obsecurePassword.value == false
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    prefixIcon: const Icon(Icons.lock)),
                onFieldSubmitted: (val) {
                  Utils.fieldFocussChange(
                      context, passwordFocusNode, numberFocusNode);
                },
              );
            },
          ),
          TextFormField(
            focusNode: numberFocusNode,
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                labelText: 'Number',
                hintText: 'number',
                prefixIcon: Icon(Icons.numbers)),
          ),
          const SizedBox(height: 50),
          RoundButton(
              loading: authViewModel.loading,
              title: 'Login',
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushbarErrorMsg("Enter Email", context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushbarErrorMsg("Enter Password", context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushbarErrorMsg(
                      "please enter 6 digit password", context);
                } else {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  authViewModel.loginApi(data, context);
                }
              })
        ],
      ),
    ));
  }
}
