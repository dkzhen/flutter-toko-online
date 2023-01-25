// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:math';

import 'package:flutter/material.dart';

import 'Order.dart';

class DrawerProduk extends StatelessWidget {
  int? id;
  String? title;
  List<Color> warna = [
    Color.fromARGB(255, 221, 250, 94),
    Color.fromARGB(255, 65, 178, 248),
    Color.fromARGB(255, 210, 120, 245),
    Color.fromARGB(255, 243, 127, 158),
    Color.fromARGB(255, 182, 250, 144),
  ];
  List<String> terdekat = [
    "Soto Ayam",
    "Bakso Mercon",
    "Ayam Geprek",
    "Boba Milk Tea",
    "Jus Alpukat"
  ];
  List<String> gbrTerdekat = [
    "sotoAyam.jpg",
    "baksoMercon.jpg",
    "ayamGeprek.jpeg",
    "boba.jpeg",
    "jusAlpukat.jpg"
  ];
  List<String> priceTerdekat = [
    "Rp.15000",
    "Rp.25000",
    "Rp.8000",
    "Rp.15000",
    "Rp.4000"
  ];

  List<String> populer = [
    "Jus Alpukat",
    "Soto Kuning",
    "Es Boba",
    "Bakso Lava",
    "Ayam Geprek Wahyu"
  ];
  List<String> gbrPopuler = [
    "jusAlpukat.jpg",
    "sotoAyam.jpg",
    "boba.jpeg",
    "baksoMercon.jpg",
    "ayamGeprek.jpeg"
  ];
  List<String> pricePopuler = [
    "Rp.3500",
    "Rp.14000",
    "Rp.20000",
    "Rp.30000",
    "Rp.15000",
  ];

  List<String> diskon = [
    "Geprek Nusa",
    "Boba Milk",
    "Soto Betawi",
    "Bakso Level",
    "Jus Alpukat"
  ];
  List<String> gbrDiskon = [
    "ayamGeprek.jpeg",
    "boba.jpeg",
    "sotoAyam.jpg",
    "baksoMercon.jpg",
    "jusAlpukat.jpg"
  ];
  List<String> priceDiskon = [
    "Rp.7000",
    "Rp.14000",
    "Rp.20000",
    "Rp.18000",
    "Rp.2500"
  ];
  DrawerProduk({
    Key? key,
    this.id,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$title"),
      ),
      body: ListView.builder(
        itemCount: id == 1
            ? terdekat.length
            : id == 2
                ? populer.length
                : diskon.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: warna[index],
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      id == 1
                          ? terdekat[index]
                          : id == 2
                              ? populer[index]
                              : diskon[index],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Order(
                              id: index,
                              name: id == 1
                                  ? terdekat[index]
                                  : id == 2
                                      ? populer[index]
                                      : diskon[index],
                              price: id == 1
                                  ? priceTerdekat[index]
                                  : id == 2
                                      ? pricePopuler[index]
                                      : priceDiskon[index],
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Beli",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      id == 1
                          ? priceTerdekat[index]
                          : id == 2
                              ? pricePopuler[index]
                              : priceDiskon[index],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      child: id == 1
                          ? Image.asset('assets/images/' + gbrTerdekat[index])
                          : id == 2
                              ? Image.asset(
                                  'assets/images/' + gbrPopuler[index])
                              : Image.asset(
                                  'assets/images/' + gbrDiskon[index])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
