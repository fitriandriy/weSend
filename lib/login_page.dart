import 'package:flutter/material.dart';
// import 'package:wesend/customers/homepage.dart';
import 'package:wesend/driver/homepage.dart';
import 'package:wesend/sign_in.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 160, 149, 237),
        fixedSize: const Size.fromWidth(258),
        textStyle: const TextStyle(fontSize: 24),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Container(
            color: Colors.white,
            // child:  Container(
            child: ListView(children: [
              Image.asset('images/driver-icon-white.png', width: 200),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Masukan email',
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukan password',
                  ),
                  style: TextStyle(fontSize: 24),
                ),
              ),
              ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomePageDriver();
                    }));
                  },
                  child: const Text("MASUK")),
              Container(
                margin: const EdgeInsets.only(top: 80, bottom: 100),
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  const Text("Belum memiliki akun?",
                      style: TextStyle(fontSize: 24)),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInPage();
                        }));
                      },
                      child: const Text("Buat Akun Baru",
                          style: TextStyle(fontSize: 24)))
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
