import 'package:flutter/material.dart';

class Pembayaran extends StatefulWidget {
  final String fullname;
  final String email;
  final String totalnight;
  final String totalroom;
  final String result;

  const Pembayaran({super.key, 
    required this.fullname,
    required this.email,
    required this.totalnight,
    required this.totalroom,
    required this.result,
    });

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment', style: TextStyle(color: Colors.white),),
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
                const Text('Informasi Pembayaran',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                  ),
                const SizedBox(height: 24,),

                Row(
                  children: [
                    const Text('Full Name : ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                    Text(widget.fullname,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),                
                const SizedBox(height: 24,),
                Row(
                  children: [
                    const Text('Email : ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                    Text(widget.email,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),                
                const SizedBox(height: 24,),
                Row(
                  children: [
                    const Text('Total Room :  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                    Text(widget.totalroom,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),                
                const SizedBox(height: 24,),
                Row(
                  children: [
                    const Text('Total Night : ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                    Text(widget.totalnight,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),                
                const SizedBox(height: 24,),
                
                Row(
                  children: [
                    const Text('Total Bayar',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                      Spacer(),
                    Text(widget.result,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),                
                const SizedBox(height: 24,),
                ElevatedButton(onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('pembayaran berhasil')),
                    );
                    }, 
                    child: Text('Bayar',
                     style: TextStyle(color: Colors.blue,
                    ),))
              ],
            ),
          ),
      ),
      )
    );
  }
}
