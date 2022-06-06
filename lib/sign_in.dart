import 'package:flutter/material.dart';
import 'package:wesend/customers/homepage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 160, 149, 237),
        fixedSize: const Size.fromWidth(150),
        textStyle: const TextStyle(fontSize: 24),
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));

    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: ListView(children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Image.asset('images/driver-icon-white.png',
                        height: 350)),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukan nama lengkap',
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Masukan email',
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
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
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alamat Lengkao',
                      hintText: 'Masukan alamat anda',
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No Telepon',
                      hintText: 'Masukan nomor telepon',
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomePageCustomer();
                      }));
                    },
                    child: const Text("DAFTAR")),
              ]),
            )),
      ),
    );
  }
}
