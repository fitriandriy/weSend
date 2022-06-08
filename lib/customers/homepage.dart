import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wesend/customers/buat_pesanan.dart';
import 'package:wesend/customers/detile_pesanan.dart';
import 'package:wesend/customers/chat.dart';

// import 'package:wesend/customers/profile.dart';

class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({Key? key}) : super(key: key);

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 20),
      primary: const Color.fromARGB(255, 160, 149, 237),
      fixedSize: const Size.fromWidth(278),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));

  int _selectedIndex = 0;

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

  toProfilePage() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return const ProfileCustomer();
    // }));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (_selectedIndex == 0) {
      toHomePage();
    } else if (_selectedIndex == 1) {
      toChatPage();
    } else if (_selectedIndex == 2) {
      toProfilePage();
    }
  }

  // static const List<Widget> _widgetOptions = <Widget>[
  //   HomePageCustomer(),
  //   Chat(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 160, 149, 237),
          title: Text(
            "GoSend",
            style: GoogleFonts.galada(fontSize: 30),
          )),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Text("Butuh mengirim barang?",
                style: TextStyle(fontSize: 20, color: Colors.grey[600])),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                    height: 250,
                    width: 580,
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('images/tagLoc.png'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: TextField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Pilih lokasi saat ini',
                                    ),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('JELAJAHI'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(15),
                                    textStyle: const TextStyle(fontSize: 20),
                                    primary: const Color.fromARGB(
                                        255, 160, 149, 237),
                                    fixedSize: const Size.fromWidth(78),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: style,
                            child: const Text("PESAN SEKARANG"),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const BuatPesanan();
                              }));
                            },
                          ),
                        ],
                      ),
                    ))),
            Text(
              "\nLihat pesananmu sebelumnya\n",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            Positioned(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("New",
                        style: TextStyle(
                            backgroundColor: Color.fromARGB(255, 255, 161, 161),
                            fontSize: 20)),
                    subtitle: const Text(
                        "Nama: Fitri\nAlamat: Temuguruh\nTujuan: Semu\nBiaya: Rp20.000\n",
                        style: TextStyle(fontSize: 20)),
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.calendar_today),
                    ),
                    trailing: const Icon(Icons.more_vert),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetilePesananCust();
                      }));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Barang Sampai",
                      style: TextStyle(
                          backgroundColor: Color.fromARGB(255, 147, 237, 148),
                          fontSize: 20),
                    ),
                    subtitle: const Text(
                      "Nama: Fitri\nAlamat: Temuguruh\nTujuan: Semu\nBiaya: Rp20.000",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.calendar_today),
                    ),
                    trailing: const Icon(Icons.more_vert),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetilePesananCust();
                      }));
                    },
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 160, 149, 237),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 40), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wechat, size: 40), label: 'chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts, size: 40), label: 'account'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped),
    );
  }
}
