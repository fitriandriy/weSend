import 'package:flutter/material.dart';
import 'package:gosend/landingPage.dart';

class homePageCustomer extends StatefulWidget {
  const homePageCustomer({Key? key}) : super(key: key);

  @override
  State<homePageCustomer> createState() => _homePageCustomerState();
}

class _homePageCustomerState extends State<homePageCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        Text("Ini Home Page"),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LandingPage();
              }));
            },
            child: Text("Kembali ke Landing Page"))
      ])),
    );
  }
}
