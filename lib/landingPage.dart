import 'package:flutter/material.dart';
import 'package:gosend/logInPage.dart';
import 'package:gosend/signIn.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 160, 149, 237),
      fixedSize: Size.fromWidth(278),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 184, 181, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/driver-icon.png'),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: (ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LogInPage();
                        }));
                      },
                      style: style,
                      child: Text("MASUK")))),
              Container(
                  margin: EdgeInsets.all(10),
                  child: (ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInPage();
                        }));
                      },
                      style: style,
                      child: Text("DAFTAR")))),
            ],
          ),
        ),
      ),
    );
  }
}
