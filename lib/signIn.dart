import 'package:flutter/material.dart';
import 'package:gosend/homePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 160, 149, 237),
      fixedSize: Size.fromWidth(200),
    );
    bool _checkbox = false;

    return Scaffold(
      body: Center(
        child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: ListView(children: [
                Image.asset('images/driver-icon-white.png', height: 150),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Lengkap',
                      hintText: 'Masukan nama lengkap',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Masukan email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Masukan password',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Alamat Lengkao',
                      hintText: 'Masukan alamat anda',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'No Telepon',
                      hintText: 'Masukan nomor telepon',
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Checkbox(
                        value: _checkbox,
                        onChanged: (value) {
                          setState(() {
                            _checkbox = !_checkbox;
                          });
                        },
                      ),
                    ),
                    Text('I am true now'),
                  ],
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return homePageCustomer();
                      }));
                    },
                    child: Text("MASUK")),
              ]),
            )),
      ),
    );
  }
}
