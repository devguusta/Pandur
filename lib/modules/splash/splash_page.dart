import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pandur/utils/constants/app_colors.dart';
import 'package:pandur/utils/constants/app_images.dart';
import 'package:pandur/utils/constants/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer? disposer;

  @override
  void initState() { 
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) { 
      Future.delayed(Duration(seconds: 2)).then((value) => {
        Navigator.pushReplacementNamed(context, '/login'),
      });
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.kDarkBlue,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedCard(
                 direction: AnimatedCardDirection.top,
                 duration: Duration(seconds: 1),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 80,
                      child: Image.asset(
                        "assets/images/logocover.png",
                        // fit: BoxFit.contain,
                        width: size.width * 0.35,
                        height: size.height * 0.30,
                      ),
                    )
                  ],
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.bottom,
                duration: Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Desenvolvido por @guusta",style:AppTextStyles.kPoweredBy),
                      SizedBox(height: size.height * 0.25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
