import 'package:flutter/material.dart';
import 'package:wesend/customers/homepage.dart';
import 'package:wesend/customers/chat.dart';
// import 'package:wesend/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wesend/auth/login_page.dart';
// import 'package:wesend/auth/fire_auth.dart';

// void main() {
//   runApp(const ProfileCustomer());
// }

class ProfileCustomer extends StatefulWidget {
  // const ProfileCustomer({Key? key, required this.user}) : super(key: key);
  final User user;
  const ProfileCustomer({required this.user});
  @override
  State<ProfileCustomer> createState() => _ProfileCustomerState();
}

class _ProfileCustomerState extends State<ProfileCustomer> {
  bool _isSigningOut = false;

  late User _currentUser;
  // late User user;

  final ButtonStyle style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 20),
      primary: const Color.fromARGB(255, 160, 149, 237),
      fixedSize: const Size.fromWidth(158),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  toHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePageCustomer();
    }));
  }

  toChatPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const Chat();
    }));
  }

  // toProfilePage() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return ProfileCustomer();
  //   }));
  // }

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      toHomePage();
    } else if (_selectedIndex == 1) {
      toChatPage();
    } else if (_selectedIndex == 2) {
      // toProfilePage();
    }
  }

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFIL", style: TextStyle(fontSize: 28)),
        backgroundColor: const Color.fromARGB(255, 160, 149, 237),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: (10.0), top: (20.0)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/fotoProfile.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama: ${_currentUser.displayName}',
                      style: const TextStyle(fontSize: 28, color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              '${_currentUser.email}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Tentang',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color.fromARGB(255, 160, 149, 237),
                    width: 2,
                  )
                  // color: Color.fromARGB(255, 167, 81, 81),

                  ),
              child: Column(children: [
                ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Nama', style: TextStyle(fontSize: 20)),
                    subtitle: Text('Nama: ${_currentUser.displayName}',
                        style: const TextStyle(fontSize: 20))),
                const Divider(),
                ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email', style: TextStyle(fontSize: 20)),
                    subtitle: Text('Email: ${_currentUser.email}',
                        style: const TextStyle(fontSize: 20))),
                const Divider(),
                const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('No. Telepon', style: TextStyle(fontSize: 20)),
                    subtitle:
                        Text('+6285232128433', style: TextStyle(fontSize: 20))),
                const Divider(),
                const ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Alamat', style: TextStyle(fontSize: 20)),
                    subtitle:
                        Text('Jl. Menanjak', style: TextStyle(fontSize: 20))),
              ]),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       setState(() {
          //         _isSigningOut = true;
          //       });
          //       await FirebaseAuth.instance.signOut();
          //       setState(() {
          //         _isSigningOut = false;
          //       });
          //       Navigator.of(context).pushReplacement(
          //         MaterialPageRoute(
          //           builder: (context) => LoginPage(),
          //         ),
          //       );
          //     },
          //     child: Text('Log Out'),
          //     style: style),

          _isSigningOut
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await FirebaseAuth.instance.signOut();
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('LOG OUT'),
                  style: style,
                ),

          const SizedBox(
            height: 365,
          ),
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(255, 160, 149, 237),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 40), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wechat, size: 40), label: 'chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.manage_accounts, size: 40),
                    label: 'account'),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              onTap: _onItemTapped),
        ],
      ),
    );
  }
}
