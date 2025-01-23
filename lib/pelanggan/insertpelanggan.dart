import 'package:flutter/material.dart';
import 'package:kasir_coba/add.dart';
import 'package:kasir_coba/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddPelanggan extends StatefulWidget {
  const AddPelanggan({super.key});

  @override
  State<AddPelanggan> createState() => _AddPelangganState();
}

class _AddPelangganState extends State<AddPelanggan> {
  final _nmplg = TextEditingController();
  final _alamat = TextEditingController();
  final _notlp = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? Pelangganid;

//Function to get PelangganId by NamaPelanggan
  Future<void> getPelangganIdByName(String nama) async {
      final response = await Supabase.instance.client
        .from('pelanggan')
        .select('Pelangganid')
        .eq('NamaPelanggan', nama)
        .single();

        if (response != null) {
          setState(() {
            Pelangganid =response['PelangganID'];
          });
        } else {
          //Handle case when no matching name is found
          setState(() {
            Pelangganid =null;
          });
         }
        }

        // Function to insert the pelanggan
        Future<void> langgan () async {
          if (_formKey.currentState!.validate()) {
            final String NamaPelanggan =_nmplg.text;
            final String Alamat = _alamat.text;
            final String NomorTelepon = _notlp.text;

            if (Pelangganid == null) {
              // If the ID not found, show an error message
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Pelanggna dengan nama $NamaPelanggan tidak ditemukan!'),
              ));
              return;
            }

            final response =await Supabase.instance.client.from('pelanggan').insert(
              {
                'NamaPelanggan': NamaPelanggan,
                'Alamat': Alamat,
                'NomorTelepon': NomorTelepon,
              }
            );

            if (response.error == null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => uii()),
              );
            } else {
              print('Error inserting customer: ${response.error?.message}');
            }
          }
        }

        @override
        Widget build(BuildContext content) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Tambah Pelanggan'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nmplg,
                      decoration: const InputDecoration(
                        labelText: 'Nama Pelanggan',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        getPelangganIdByName(value); // update to id when the name changes
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _alamat,
                        decoration: const InputDecoration(
                          labelText: 'Alamat',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Alamat tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _notlp,
                        decoration:  const InputDecoration(
                          labelText: 'Nomer Telepon',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nomer tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: langgan,
                      child: const Text('Tambah'),
                    ),
                  ],
                 ),
                ),
               ),
              );
            }
           }


