import 'package:flutter/material.dart';
import 'package:kuismobile/pembayaran.dart';

class Pemesanan extends StatefulWidget {
   final String namaproduk;
   final String harga;
  const Pemesanan({super.key, required this.namaproduk, required this.harga});

  @override
  State<Pemesanan> createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  String namaproduk = "";
  String harga = "";
  String fullname = "";
  String email = "";
  String totalroom = "";
  String totalnight = "";
  int? night;
  int? room;
  String result = "";

  void UbahString() {
    night = int.tryParse(totalnight);
    room = int.tryParse(totalroom);
  }

  void TotalBayar() {
    UbahString();
    int hargaperMalam = 500000;
    if(night != null && room != null) {
      setState(() {
        int totalBayar = hargaperMalam * room! * night!;
        result = 'Rp. $totalBayar';
      });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blue Doorz', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24, 
          vertical: 12),
          child: Center(
            child: Column(
              children: [
                Image(image: AssetImage("assets/hotel.jpg"), width: 500,),
                SizedBox(height: 24,),
                Row(
                  children: [
                    Text(widget.namaproduk,
                    style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(widget.harga,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Text('Booking Information',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 24,),
                _buildForm(),
                SizedBox(height: 24,),
                _buildButtonSubmit(),
              ],
            ),
          ),
      ),
      )
    );
  }

  Widget _formInput({
    required String hint,
    required String label,
    required Function(String value) SetStateInput,
    int maxLines = 1
  }) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.blue),
        ), 
      ),
      onChanged: SetStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(height: 12,),
        _formInput(
          hint: "Input Full Name", 
          label: "Full Name * ", 
          SetStateInput: (value){
            setState(() {
              fullname = value;
            });
          }),
        const SizedBox(height: 12,),
        _formInput(
          hint: "Input Email", 
          label: "Email * ", 
          SetStateInput: (value){
            setState(() {
              email = value;
            });
          }),
        const SizedBox(height: 12,),
        _formInput(
          hint: "Input Total Room", 
          label: "Total Room * ", 
          SetStateInput: (value){
            setState(() {
              totalroom = value;
            });
          }),
        const SizedBox(height: 12,),
        _formInput(
          hint: "Input Total Night", 
          label: "Total Night * ", 
          SetStateInput: (value){
            setState(() {
              totalnight = value;
            });
          }),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (fullname == "" || email == "" || totalnight == "" || totalroom == "") {
            SnackBar snackBar = const SnackBar(content: Text('* data tidak boleh kosong'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            TotalBayar();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Pembayaran (
                fullname : fullname,                
                email : email,
                totalnight : totalnight,
                totalroom : totalroom,
                result : result,
              );
            }));
          }
        },
        child: Text('Payment'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: TextStyle(fontSize: 16)
        ),
      ),
    );
  }
}
