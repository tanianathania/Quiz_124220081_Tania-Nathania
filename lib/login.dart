import 'package:flutter/material.dart';
import 'package:kuismobile/home.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

bool isLoginSuccess = true;

class _LoginPagesState extends State<LoginPages> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Image(image: AssetImage("assets/BLUE DOORZ.png"), width: 100,),
            SizedBox(width: 40,),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
            SizedBox(width: 30,),
          ],
        ),
        )
      ));;
  }

  Widget _usernameField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red)
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: (isLoginSuccess) ? const Color(0xFF2196F3) : Colors.red,
        ),
        onPressed: (){
        String text = "";
        if (username == "" || password == "") {
            // SnackBar snackBar = const SnackBar(content: Text('username & password harus diisi !'),
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context){
            return HomePage(username : username);
          }));
        }
        else if(password == "123"){
          setState(() {
            text = "login berhasil !";
            isLoginSuccess = true;
          });
          Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context){
            return HomePage(username : username);
          }));
        }
        else {
          setState(() {
            text = "login gagal !";
            isLoginSuccess = false;
          });
        }
        SnackBar snackBar = SnackBar(content: Text(text));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }, 
      child: const Text('Login')),
    );
  }
}