// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'Order.dart';

class Makanan extends StatelessWidget {
  Makanan({Key? key}) : super(key: key);
  List<String> makanan = [
    "Soto Ayam",
    "Bakso Mercon",
    "Ayam Geprek",
  ];
  List<Color> warna = [
    Color.fromARGB(255, 221, 250, 94),
    Color.fromARGB(255, 65, 178, 248),
    Color.fromARGB(255, 243, 127, 158),
  ];
  List<String> gambar = ["sotoAyam.jpg", "baksoMercon.jpg", "ayamGeprek.jpeg"];
  List<String> price = [
    "Rp.15000",
    "Rp.25000",
    "Rp.8000",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ListTile(
              title: Text("Home"),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: makanan.length,
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
                      makanan[index],
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
                              name: makanan[index],
                              price: price[index],
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
                      price[index],
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
                      child: Image.asset('assets/images/' + gambar[index])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
