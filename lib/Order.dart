// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project_akhir_mobile/DetailPesanan.dart';

class Order extends StatelessWidget {
  int? id;
  String? name;
  String? price;
  Order({Key? key, this.id, this.name, this.price}) : super(key: key);

  TextEditingController _nama = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _noHp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Formulir Pesanan",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                controller: _nama,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                controller: _alamat,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'No Handphone',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                controller: _noHp,
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 30),
                height: 200.0,
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                  _nama.text.isEmpty ? _nama.text = "-" : _nama.text;
                  _alamat.text.isEmpty ? _alamat.text = "-" : _alamat.text;
                  _noHp.text.isEmpty ? _noHp.text = "-" : _noHp.text;
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (DetailPesanan(
                          id: id,
                          name: name,
                          price: price,
                          nama: _nama.text,
                          alamat: _alamat.text,
                          noHp: _noHp.text,
                        )),
                      ),
                      (route) => false);
                },
                child: const Text("Pesan Sekarang"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
