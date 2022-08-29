import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'formBody.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPXslsbCqD0qYlZts_TFlbmXjh9vTTYgzncQ&usqp=CAU'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            const Text(
              'Title',
              style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.35),
            AuthButton(
                title: 'Use Phone Number',
                icon: Icons.phone_android,
                primaryColor: Colors.white,
                backgroundColor: Colors.black.withOpacity(0.75)),
            AuthButton(
                title: 'Connect with Facebook',
                icon: FontAwesomeIcons.facebookF,
                primaryColor: Colors.white,
                backgroundColor: Colors.blueAccent),
            AuthButton(
                title: 'Connect with Google',
                icon: FontAwesomeIcons.google,
                primaryColor: Colors.black,
                backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  AuthButton(
      {Key? key,
      this.title,
      this.icon,
      this.primaryColor,
      this.backgroundColor})
      : super(key: key);

  String? title;
  IconData? icon;
  Color? primaryColor;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const FormBody()));
          },
          style: ElevatedButton.styleFrom(
              primary: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              fixedSize: const Size(300, 55)),
          child: Row(
            children: [
              Icon(icon, color: primaryColor),
              const SizedBox(width: 50),
              Text(
                title!,
                style: TextStyle(color: primaryColor),
              )
            ],
          )),
    );
  }
}
