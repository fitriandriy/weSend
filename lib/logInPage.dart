import 'package:flutter/material.dart';
import 'package:gosend/homePage.dart';
import 'package:gosend/signIn.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 160, 149, 237),
      fixedSize: Size.fromWidth(278),
    );
    bool _checkbox = false;

    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Column(children: [
                Image.asset('images/driver-icon-white.png', width: 229),
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
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(children: [
                    Text("Belum memiliki akun?"),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignInPage();
                          }));
                        },
                        child: Text("DAFTAR")),
                  ]),
                )
              ]),
            )),
      ),
    );
  }
}
