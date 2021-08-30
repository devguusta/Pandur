import 'package:flutter/material.dart';
import 'package:pandur/modules/login/signin/widgets/github_button_widget.dart';
import 'package:pandur/shared/widgets/input_form_widget.dart';
import 'package:pandur/shared/widgets/login_buttom_widget.dart';
import 'package:pandur/utils/constants/app_colors.dart';
import 'package:pandur/utils/constants/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kDarkBlue,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Image.asset("assets/images/adaptive-icon.png",
                        height: size.height * 0.2, width: size.width * 0.4),
                  ),
                  Form(
                    child: Column(
                      children: [
                        InputForm(
                          labelText: "Email",
                          hintText: "Email",
                        ),
                        SizedBox(height: 40),
                        InputForm(
                          labelText: "Senha",
                          hintText: "Senha",
                        ),
                        SizedBox(height: 40),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text("Have a question?", style: AppTextStyles.kTextLoginMedium),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Text("We have the ", style: AppTextStyles.kTextSubTitleLogin),
                            ),
                            Text("answer", style: AppTextStyles.kAnswerLogin),
                          ],
                        ),
                        SizedBox(height: 20),
                       LoginButtomWidget(
                         buttonText: "Login",
                         onTap: (){},
                         color: Color(0xFF1f60f3),
                       ),
                      
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 8),
                         child: Text("ou", style: AppTextStyles.kSecondaryTextLoginPage),
                       ),
                       SocialButton(
                         prefixIcon: "assets/images/logo_github.png",
                         buttonText: "Login with github",
                         onTap: (){},
                         color: Color(0xFF1f60f3),
                         ),
                         SizedBox(height: size.height* 0.1),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
