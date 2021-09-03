import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandur/modules/login/controllers/login_controller.dart';
import 'package:pandur/modules/login/controllers/login_store.dart';

import 'package:pandur/modules/login/pages/login/widgets/github_button_widget.dart';

import 'package:pandur/shared/models/user_model.dart';

import 'package:pandur/shared/widgets/input_form_widget.dart';
import 'package:pandur/shared/widgets/login_buttom_widget.dart';
import 'package:pandur/utils/constants/app_colors.dart';
import 'package:pandur/utils/constants/app_text_styles.dart';
import 'package:pandur/utils/validators/text_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginStore();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Observer(builder: (_){
        return  Scaffold(
        backgroundColor: AppColors.kDarkBlue,
        body: controller.loading
            ? Center(child: Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
              
              ),)
            : Center(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Image.asset("assets/images/adaptive-icon.png",
                              height: size.height * 0.2,
                              width: size.width * 0.4),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputForm(
                                labelText: "Email",
                                hintText: "Email",
                                controller: _emailController,
                                validator: (String? value) =>
                                    Validators.validateEmail(value),
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                              ),
                              SizedBox(height: 40),
                              InputForm(
                                labelText: "Senha",
                                hintText: "Senha",
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.length < 8) {
                                    return 'A senha deve ter no mínimo 6 caracteres';
                                  }
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 48),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/signup');
                                  },
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("No have account? Click here",
                                            style: AppTextStyles.kCreateAccount)
                                      ]),
                                ),
                              ),
                              SizedBox(height: 40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 48.0),
                                    child: Text("Have a question?",
                                        style: AppTextStyles.kTextLoginMedium),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 48.0),
                                    child: Text("We have the ",
                                        style:
                                            AppTextStyles.kTextSubTitleLogin),
                                  ),
                                  Text("answer",
                                      style: AppTextStyles.kAnswerLogin),
                                ],
                              ),
                              SizedBox(height: 20),
                              LoginButtomWidget(
                                buttonText: "Login",
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      print(_emailController.text);
                                      print(_passwordController.text);
                                      UserModel? userModel =
                                          await LoginStore().login(
                                        email: _emailController.text,
                                        password: password,
                                      );
                                      //TODO: ajeitar o userModel vindo nulo
                                      print(userModel);
                                      if (userModel != null) {
                                        Navigator.pushReplacementNamed(
                                            context, '/home');
                                      } 
                                    } catch (e) {
                                      print(e);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text("Erro ao logar!")));
                                    }
                                  }
                                },
                                color: Color(0xFF1f60f3),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text("or",
                                    style:
                                        AppTextStyles.kSecondaryTextLoginPage),
                              ),
                              SocialButton(
                                prefixIcon: "assets/images/logo_github.png",
                                buttonText: "Login with github",
                                onTap: () {},
                                color: Color(0xFF1f60f3),
                              ),
                              SizedBox(height: size.height * 0.1),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      );
      })
     
    );
  }
}
