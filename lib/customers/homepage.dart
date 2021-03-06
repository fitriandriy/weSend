import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wesend/auth/login_page.dart';
import 'package:wesend/customers/buat_pesanan.dart';
import 'package:wesend/customers/detile_pesanan.dart';
import 'package:wesend/chat/chatpage.dart';
import 'package:wesend/maps/location_tracking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({Key? key}) : super(key: key);

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      // padding: const EdgeInsets.all(15),
      textStyle: const TextStyle(fontSize: 18),
      primary: const Color.fromARGB(255, 160, 149, 237),
      // fixedSize: const Size.fromWidth(150),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

  int _selectedIndex = 0;
  late DocumentSnapshot documentSnapshot;

  toHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const HomePageCustomer();
    }));
  }

  toChatPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ChatPage();
    }));
  }

  toProfilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginPage();
    }));
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
                    color: Colors.white,
                    // padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Image.asset('images/tagLoc.png'),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // TOMBOL PESAN
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
                                // TOMBOL KE MAPS
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const LocationTracking();
                                    }));
                                  },
                                  child: const Text('JELAJAHI LOKASI'),
                                  style: style,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),

            // TEXT
            Text(
              "\nLihat pesananmu sebelumnya\n",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),

            // LIST PESANAN
            Positioned(
              child: StreamBuilder(
                // Reading Items form our Database Using the StreamBuilder widget
                stream: db.collection('orders').snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // NAH BAGIAN INI BUAT NAMPILIN TO DO NYA
                  return SizedBox(
                    height: 550,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, int index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data.docs[index];
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(stops: [
                              0.02,
                              0.02
                            ], colors: [
                              Color.fromARGB(255, 160, 149, 237),
                              Colors.white
                            ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(6.0)),
                          ),

                          child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset('images/distance (1).png'),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Driver '),
                                Text(
                                  ' ' + documentSnapshot['status'] + ' ',
                                  style: const TextStyle(
                                      backgroundColor:
                                          Color.fromARGB(255, 160, 149, 237),
                                      color: Colors.white),
                                )
                              ],
                            ),
                            isThreeLine: true,
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    // BERAT BARANG : HARGA
                                    documentSnapshot['berat_barang']
                                            .toString() +
                                        'kg : Rp. ' +
                                        (documentSnapshot['berat_barang'] *
                                                4000)
                                            .toString() +
                                        // PENJEMPUTAN
                                        '\ndari ' +
                                        documentSnapshot['penjemputan'] +
                                        // TUJUAN
                                        '\nmenuju ' +
                                        documentSnapshot['tujuan']),
                              ],
                            ),
                            onTap: () {
                              if (documentSnapshot['status'] == 'Baru') {
                                setState(() {
                                  this.documentSnapshot = documentSnapshot;
                                });

                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Batalkan pesanan?'),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetilePesananCust(
                                                                  index:
                                                                      index)));
                                                },
                                                child: const Text('Tidak')),
                                            ElevatedButton(
                                                onPressed: () {
                                                  db
                                                      .collection('orders')
                                                      .doc(documentSnapshot.id)
                                                      .delete();

                                                  toHomePage();
                                                },
                                                child: const Text('Iya')),
                                          ],
                                        ),
                                      );
                                    });
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        DetilePesananCust(index: index)));
                              }
                            },
                          ),

                          // LIST TILE
                          // child: ListTile(
                          //   leading: SizedBox(
                          //     width: 50,
                          //     height: 50,
                          //     child: Image.asset('images/distance (1).png'),
                          //   ),
                          //   title: const Text('Driver '),
                          //   isThreeLine: true,
                          //   subtitle: Text('dari ' +
                          //       documentSnapshot['penjemputan'] +
                          //       '\nmenuju ' +
                          //       documentSnapshot['tujuan']),
                          //   onTap: () {
                          //     Navigator.of(context).push(MaterialPageRoute(
                          //         builder: (context) =>
                          //             DetilePesananCust(index: index)));
                          //   },

                          //   // INI ICON BUAT DELETE
                          //   trailing: IconButton(
                          //     icon: const Icon(
                          //       Icons.delete_outline,
                          //     ),
                          //     onPressed: () {
                          //       // Here We Will Add The Delete Feature
                          //       db
                          //           .collection('todos')
                          //           .doc(documentSnapshot.id)
                          //           .delete();
                          //     },
                          //   ),
                          // ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
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
