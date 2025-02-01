import 'package:flutter/material.dart';
import 'package:kasir_coba/main.dart';
import 'package:kasir_coba/pelanggan/indexpelanggan.dart';
import 'package:kasir_coba/penjualan/indexpenjualan.dart';
import 'package:kasir_coba/produk/indexproduk.dart';

class HomePage extends StatelessWidget {
  // Membuat GlobalKey untuk Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // Menambahkan GlobalKey untuk Scaffold
        key: _scaffoldKey,
        // Membuat Drawer
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  'Menu Utama',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Beranda'),
                onTap: () {
                  Navigator.pop(context); // Menutup drawer setelah memilih item
                  print('Beranda dipilih');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Keluar'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())); // Menutup drawer
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_box_rounded), text: 'Pelanggan'),
              Tab(icon: Icon(Icons.money), text: 'Penjualan'),
              Tab(icon: Icon(Icons.shopping_bag), text: 'Produk'),
              Tab(icon: Icon(Icons.inventory), text: 'Detail Penjualan'),
            ],
          ),
          // Gantilah leading untuk membuka drawer
          leading: IconButton(
            icon: const Icon(Icons.menu), // Menambahkan ikon hamburger
            onPressed: () {
              // Menampilkan Drawer ketika tombol menu ditekan
              _scaffoldKey.currentState?.openDrawer(); // Membuka Drawer dengan GlobalKey
            },
          ),
          title: const Text("Beranda"),
          backgroundColor: Colors.amber,
        ),
        body: TabBarView(
          children: [
            PelangganTab(),
            PenjualanTab(),
            ProdukTab(),
            Center(child: Text('sooyy')),

          ],
        ),
      ),
    );
  }
}
