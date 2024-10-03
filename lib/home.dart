import 'package:flutter/material.dart';
import 'package:kuismobile/pemesanan.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, 
    required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";
  String namaproduk = "Blue Lagoon";
  String harga = "Rp 500.000/night";
  
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
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
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24, 
              vertical: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [                   
                    Image(image: AssetImage("assets/BLUE DOORZ.png"), width: 55,),
                    Text('Hallo ${widget.username}, Welcome to Blue Doorz',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    ElevatedButton(onPressed: () {
                      _launchURL('https://traveloka.com');
                    }, 
                      child: Text('About Us', style: TextStyle(color: Colors.blue, fontSize: 10,
                    ))),
                  ],
                )
              ),
          ),

         GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                  ),
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                      horizontal: 24, 
                      vertical: 12),
                      child: Column(
                        children: [
                          SizedBox(height: 18,),
                          Center(
                            child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,  // Warna border
                                width: 1,             // Ketebalan border
                              ),
                            ),
                            child: Image(image: AssetImage("assets/hotel.jpg"), width: 300,),
                          ),
                          ),
                          SizedBox(height: 2,),
                          Text(namaproduk, style: TextStyle(fontSize: 18)),
                          SizedBox(height: 2,),
                          Text(harga, style: TextStyle(fontSize: 18)),
                          ElevatedButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Pemesanan (
                                namaproduk : namaproduk,
                                harga : harga,
                              );
                            }));

                          }, child: Text('Book Now', style: TextStyle(color: Colors.blue, fontSize: 10,
                    ))),
                          SizedBox(height: 5,),
                        ],
                      ),
                    );
                  },
                ),
                
        ],
      ),
      )
    );
  }

}
