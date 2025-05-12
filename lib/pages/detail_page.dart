import 'package:flutter/material.dart';
import '../models/ekskul.dart';
import 'daftar_page.dart';

class DetailPage extends StatelessWidget {
  final Ekskul ekskul;

  const DetailPage({super.key, required this.ekskul});  // Menambahkan const dan super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ekskul.nama)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ekskul.deskripsi, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Pembina: ${ekskul.pembina}', style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            ElevatedButton(
              child: Text('Daftar Ekskul'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => DaftarPage(ekskul: ekskul),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
