import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bian_app/src/components/colors.dart';
import 'package:bian_app/src/pages/sign_in_2.dart';


class SignInFive extends StatefulWidget {
  const SignInFive({Key? key}) : super(key: key);

  @override
  State<SignInFive> createState() => _SignInFiveState();
}

class _SignInFiveState extends State<SignInFive> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Center(
              child: Stack(
                children: <Widget>[
                  //left side background design. I use a svg image here
                  Positioned(
                    left: -34,
                    top: 181.0,
                    child: SvgPicture.string(
                      // Group 3178
                      '<svg viewBox="-34.0 181.0 99.0 99.0" >'
                      '<path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" />'
                      '<path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" />'
                      '<path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      width: 99.0,
                      height: 99.0,
                    ),
                  ),

                  //right side background design. I use a svg image here
                  Positioned(
                    right: -52,
                    top: 45.0,
                    child: SvgPicture.string(
                      // Group 3177
                      '<svg viewBox="288.0 45.0 139.0 139.0" >'
                      '<path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" />'
                      '<path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" />'
                      '<path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      width: 139.0,
                      height: 139.0,
                    ),
                  ),

                  //content ui
                  Positioned(
                    top: 8.0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.06,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //logo section
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  logo(size.height / 8, size.height / 8),
                                  const SizedBox(height: 16),
                                  richText(23.12),
                                ],
                              ),
                            ),

                            //continue with email for sign in app text
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Continue with email for sign in App',
                                style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  color: AppColors.textLight,
                                ),
                              ),
                            ),

                            //email and password TextField here
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  emailTextField(size),
                                  const SizedBox(height: 8),
                                  passwordTextField(size),
                                  const SizedBox(height: 16),
                                  buildRemember(size),
                                ],
                              ),
                            ),

                            //sign in button & continue with text here
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  signInButton(size),
                                  const SizedBox(height: 16),
                                  //buildContinueText(),
                                ],
                              ),
                            ),

                            //footer section. google, facebook button and sign up text here
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 16),
                                  buildFooter(size),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logo(double height_, double width_) {
    return Image.asset(
      'assets/logo_ufpso.png',
      height: height_,
      width: width_,
      fit: BoxFit.contain,
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: 23.12,
          color: Colors.white,
          letterSpacing: 1.999999953855673,
        ),
        children: const [
          TextSpan(
            text: 'LOGIN',
            style: TextStyle(
              color: AppColors.textLight,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'PAGE',
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }

  Widget emailTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColors.primaryTransparent, // color del borde
          width: 1.0, // grosor del borde
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //mail icon
            const Icon(Icons.mail_rounded, color: AppColors.primaryTransparent),
            const SizedBox(width: 16),

            //divider svg
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" >'
              '<path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ec1c21" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
            ),
            const SizedBox(width: 16),

            //email address textField
            Expanded(
              child: TextField(
                maxLines: 1,
                cursorColor: AppColors.primaryTransparent,
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: AppColors.primaryTransparent,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: ' Enter your gmail address',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: AppColors.primaryTransparent,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColors.primaryTransparent, // color del borde
          width: 1.0, // grosor del borde
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //lock logo here
            const Icon(Icons.lock, color: AppColors.primaryTransparent),
            const SizedBox(width: 16),

            //divider svg
            SvgPicture.string(
              '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#EC1C21" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
              width: 1.0,
              height: 15.5,
            ),
            const SizedBox(width: 16),

            //password textField
            Expanded(
              child: TextField(
                maxLines: 1,
                cursorColor: AppColors.primaryTransparent,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: GoogleFonts.inter(
                  fontSize: 14.0,
                  color: AppColors.primaryTransparent,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 14.0,
                    color: AppColors.primaryTransparent,
                    fontWeight: FontWeight.w500,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRemember(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              rememberMe = !rememberMe;
            });
          },
          child: Container(
            alignment: Alignment.center,
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: AppColors.primaryTransparent, width: 1),
              color: rememberMe
                  ? AppColors.primary
                  : Colors.transparent,
            ),
            child: rememberMe
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Recuerdame',
          style: GoogleFonts.inter(
            fontSize: 14.0,
            color: AppColors.textLight,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget signInButton(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.primary,
      ),
      child: Text(
        'Sign in',
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildFooter(Size size) {
  return Align(
    alignment: Alignment.center,
    child: Text.rich(
      TextSpan(
        style: GoogleFonts.nunito(fontSize: 16.0, color: Colors.white),
        children: [
          TextSpan(
            text: 'Don’t have account? ',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w600,
              color: AppColors.textLight,
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInTwo(),
                  ),
                );
              },
              child: Text(
                'Sign up',
                style: GoogleFonts.nunito(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

}