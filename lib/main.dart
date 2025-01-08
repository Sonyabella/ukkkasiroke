import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Row(
            children: const <Widget>[
              Icon(Icons.shop),
              SizedBox(width: 8), 
              Text("Kasirnya"),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 200,
                width: double.infinity,
                child: Image(
                  image: AssetImage('asset/kasir.oke.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "USER LOGIN", 
                  style: TextStyle(fontSize: 30, color: Colors.amber),
                ),
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    icon: Icon(Icons.person, color: Colors.blue),
                    fillColor: Colors.amber[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    icon: Icon(Icons.vpn_key_sharp, color: Colors.blue),
                    fillColor: Colors.amber[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    fixedSize: const Size(110, 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
