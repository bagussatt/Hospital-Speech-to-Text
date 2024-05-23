import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_speechtotextfor_hospital/screens/daftar_pasien.dart'; // Pastikan path ini benar

class HistoryPage extends StatelessWidget {
  final String names;
  final String voiceText;
  final String namadoc;
  final String id;

  HistoryPage({
    required this.names,
    required this.voiceText,
    required this.namadoc,
    required this.id
  });

  String getCurrentTime() {
    var now = DateTime.now();
    var timeFormat = DateFormat('HH:mm:ss'); // Format jam, menit, dan detik
    return timeFormat.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History Page', style: TextStyle(color: Colors.white)), // Judul AppBar
        centerTitle: true, // Membuat judul di tengah
        backgroundColor: Colors.teal, // Warna AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Icon tombol kembali
          onPressed: () {
            // Navigasi kembali ke DaftarPasien
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DaftarPasien(id: id, namadoc: namadoc)),
            );
          },
        ),
      ),
      body: Card(
        margin: EdgeInsets.all(16), // Margin untuk Card
        elevation: 4, // Elevation untuk memberikan efek shadow
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding dalam Card
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                    SizedBox(height: 8), // Spacing antar teks
                    Text(getCurrentTime(), style: TextStyle(fontSize: 14)), // Menampilkan waktu saat ini
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Doctor", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
                    SizedBox(height: 8),
                    Text(namadoc, style: TextStyle(fontSize: 14)), // Menampilkan nama dokter
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Patient Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
                    SizedBox(height: 8),
                    Text(names, style: TextStyle(fontSize: 14)), // Menampilkan nama pasien
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Record History", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
                    SizedBox(height: 8),
                    Text(voiceText, style: TextStyle(fontSize: 14)), // Menampilkan rekaman history
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}