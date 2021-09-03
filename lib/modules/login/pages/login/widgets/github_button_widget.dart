
import 'package:flutter/material.dart';
import 'package:pandur/utils/constants/app_text_styles.dart';

class SocialButton extends StatelessWidget {
  final String buttonText;
  final IconData? buttonIcon;
  final VoidCallback onTap;
  final String prefixIcon;
  final Color color;

  const SocialButton({
    Key? key,
    required this.buttonText,
    this.buttonIcon,
    required this.onTap,
    required this.prefixIcon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(5.0),
      ),
      onTap: onTap,
      child: Container(
         width: MediaQuery.of(context).size.width * 0.75,
         height:MediaQuery.of(context).size.width * 0.13,
        decoration:  BoxDecoration(
            color: color,
          // gradient: AppColors.kblueGradientAppBar,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(prefixIcon),
             const SizedBox(width: 12.0),
              Text(
                buttonText,
                style: AppTextStyles.kTextButtonGithub,
              ),
              const SizedBox(width: 0.0),
              Icon(
                buttonIcon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
