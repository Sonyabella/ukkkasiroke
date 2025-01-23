import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://scprqpzrjszikhgrnrpp.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNjcHJxcHpyanN6aWtoZ3JucnBwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY5MDUwMzIsImV4cCI6MjA1MjQ4MTAzMn0.jY-LzceQr7h76tH636sqrg3WymxEWQWUkk93wY2PZWw');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Pindah ke halaman beranda setelah login berhasil
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomePage()),
                  );
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
    );
  }
}
