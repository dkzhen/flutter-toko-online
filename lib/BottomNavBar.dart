// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:project_akhir_mobile/DrawerProduk.dart';
import 'Makanan.dart';
import 'Minuman.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> appbar = ["Daftar Makanan", "Beranda", "Daftar Minuman"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          appbar[_currentIndex],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange,
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 20),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ListTile(
                onTap: () {
                  int id = 1;
                  String title = "Terdekat";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrawerProduk(id: id, title: title),
                    ),
                  );
                },
                leading: Icon(Icons.near_me_outlined),
                title: Text(
                  "Terdekat",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  int id = 2;
                  String title = "Populer";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrawerProduk(
                        id: id,
                        title: title,
                      ),
                    ),
                  );
                },
                leading: Icon(Icons.rate_review_outlined),
                title: Text(
                  "Populer",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  int id = 3;
                  String title = "Diskon";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrawerProduk(id: id, title: title),
                    ),
                  );
                },
                leading: Icon(Icons.discount_outlined),
                title: Text(
                  "Diskon",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Makanan(),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 100.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              child: ListView(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40, right: 150),
                    child: Text(
                      "Selamat Datang!",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    height: 300.0,
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: Image.asset('assets/images/hero.jpg'),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 230),
                    child: Text(
                      "Menu Tersedia",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          _currentIndex = 0;
                          _pageController.jumpToPage(_currentIndex);
                        });
                      },
                      leading: Image.asset("assets/images/hero.jpg"),
                      title: Text(
                        "Makanan",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                          _pageController.jumpToPage(_currentIndex);
                        });
                      },
                      leading: Image.asset("assets/images/minuman.jpeg"),
                      title: Text(
                        "Minuman",
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Minuman(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Makanan'),
            icon: Icon(
              Icons.store_mall_directory_outlined,
            ),
          ),
          BottomNavyBarItem(
            title: Text('Beranda'),
            icon: Icon(
              Icons.apps,
            ),
          ),
          BottomNavyBarItem(
            title: Text('Minuman'),
            icon: Icon(
              Icons.local_drink_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
