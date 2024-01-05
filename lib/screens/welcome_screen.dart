import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/rounded_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController? controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller as Animation<double>);
    controller?.forward();
    controller?.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: animation.value,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(125, 20, 100, 200),
              Color.fromARGB(125, 60, 200, 180),
              Color.fromARGB(195, 250, 120, 160),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 70,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  const SizedBox(width: 15),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'CHATINATOR',
                          textStyle: const TextStyle(
                            fontSize: 40,
                            letterSpacing: 0.1,
                            fontWeight: FontWeight.w900,
                          ),
                          speed: const Duration(milliseconds: 100)),
                    ],
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 28),
              RoundedButton(
                  buttonText: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
              RoundedButton(
                  buttonText: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),
              const SizedBox(height: 150),
              SizedBox(
                height: 30,
                child: Image.asset('images/DP Logo.png'),
              ),
              const Text(
                'A Messaging App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              const Text(
                'By D.P. Shekhawat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
