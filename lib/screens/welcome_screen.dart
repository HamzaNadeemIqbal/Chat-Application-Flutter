import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
//  using the word static, a modifier,which assosiates string id with class hence
// we dont have to make an object each time which is more effecient
  static String id = 'welcome_screen';
  //we d have to make a class each time if we use string in such way so we d
//  have to call it this way WelcomeScreen().id which is not effecient

  //  String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
//upper bound cant be greater than 1 for curved animation
//      upperBound: 100.0,
    );
//    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
//    controller.reverse(from: 1.0);
    controller.forward();
    //    controller.forward();
    controller.addListener(() {
//      animation.addStatusListener((status) {
//        print(status);
//        if (status == AnimationStatus.completed) {
//          controller.reverse(from: 1.0);
//        } else if (status == AnimationStatus.dismissed) {
//          controller.forward();
//        }
//      });
      setState(() {});
//      print(animation.value);
    });
  }

// writing dispose override is important otherwise even after quiitting app
//  our resources will still be in use by the controller which is waste of resources
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
//      backgroundColor: Colors.red.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
//                    height: controller.value,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
//                  '${controller.value.toInt()}%',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
