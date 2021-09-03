import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pandur/modules/login/controllers/login_store.dart';
import 'package:pandur/shared/widgets/input_form_widget.dart';
import 'package:pandur/shared/widgets/login_buttom_widget.dart';
import 'package:pandur/utils/constants/app_colors.dart';
import 'package:pandur/utils/constants/app_text_styles.dart';
import 'package:pandur/utils/validators/text_validator.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final MaskedTextController _cpfController =
      MaskedTextController(mask: '000.000.000-00');

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kDarkBlue,
        body: Observer(builder: (_){
          return 
          Center(
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
                    key: formKey,
                    child: Column(
                      children: [
                        InputForm(
                          labelText: "Nome",
                          hintText: "Informe seu nome",
                          controller: _nameController,
                          validator: (String? value) =>
                              Validators().validateName(value!),
                        ),
                        SizedBox(height: size.height * 0.05),
                        InputForm(
                          labelText: "Cpf",
                          hintText: "Somente números",
                          controller: _cpfController,
                          validator: (String? value) =>
                              Validators().cpfValidator(value!),
                        ),
                        SizedBox(height: size.height * 0.05),
                        InputForm(
                          labelText: "Email",
                          hintText: "Informe seu melhor email",
                          controller: _emailController,
                          validator: (String? value) =>
                              Validators.validateEmail(value),
                        ),
                        SizedBox(height: size.height * 0.05),
                        InputForm(
                          labelText: "Senha",
                          hintText: "Senha",
                          controller: _passwordController,
                          validator: (String? value) =>
                              Validators().validatePassword(value!),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 48),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/signup');
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Have account? Click here",
                                      style: AppTextStyles.kCreateAccount)
                                ]),
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        LoginButtomWidget(
                          buttonText: "Create account",
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              try {
                                bool result = await LoginStore().createAccount(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text,
                                  cpf: _cpfController.text,
                                );
                                if (result) {
                                 Navigator.pushReplacementNamed(
                                            context, '/home');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Erro ao cadastrar, verifique sua conexão e tente novamente",
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Erro ao cadastrar, verifique sua conexão e tente novamente",
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          color: Color(0xFF1f60f3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        }) 
        
      ),
    );
  }
}
