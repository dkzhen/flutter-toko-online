// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/BottomNavBar.dart';

class DetailPesanan extends StatelessWidget {
  int? id;
  String? name;
  String? price;
  String? nama;
  String? alamat;
  String? noHp;
  DetailPesanan(
      {Key? key,
      this.id,
      this.name,
      this.price,
      this.nama,
      this.alamat,
      this.noHp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pesanan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Pesanan Anda Berhasil!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Terima Kasih Karena Telah Melakukan Pembelian",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Detail Pesanan Anda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 350.0,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Pesanan :",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        "$name",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Harga :",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        "$price",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Total :",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        "$price",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 19, top: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Nama   : $nama",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 19, top: 25),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Alamat : $alamat",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 19, top: 25),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "No Hp   : $noHp",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/home", (route) => false);
                },
                child: const Text("Back to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
