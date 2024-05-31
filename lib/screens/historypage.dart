import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_speechtotextfor_hospital/screens/daftar_pasien.dart'; // Pastikan path ini benar

class HistoryPage extends StatelessWidget {
  final String names;
  final String voiceText;
  final String namadoc;
  final String id;

  const HistoryPage(
      {required this.names,
      required this.voiceText,
      required this.namadoc,
      required this.id});

  String getCurrentTime() {
    var now = DateTime.now();
    var timeFormat =
        DateFormat('dd/MM HH:mm:ss'); // Format jam, menit, dan detik
    return timeFormat.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History Page',
            style: TextStyle(color: Colors.white)), // Judul AppBar
        centerTitle: true, // Membuat judul di tengah
        backgroundColor: Color.fromRGBO(135, 76, 204, 0.8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Icon tombol kembali
          onPressed: () {
            // Navigasi kembali ke DaftarPasien
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DaftarPasien(id: id, namadoc: namadoc)),
            );
          },
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(16), // Margin untuk Card
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
                    const Text(
                      "Date",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(135, 76, 204, 1)),
                    ),
                    const SizedBox(height: 8), // Spacing antar teks
                    Text(getCurrentTime(),
                        style: const TextStyle(
                            fontSize: 14)), // Menampilkan waktu saat ini
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Doctor",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(135, 76, 204, 1))),
                    const SizedBox(height: 8),
                    Text(namadoc,
                        style: const TextStyle(
                            fontSize: 14)), // Menampilkan nama dokter
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Patient Name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(135, 76, 204, 1))),
                    const SizedBox(height: 8),
                    Text(names,
                        style: const TextStyle(
                            fontSize: 14)), // Menampilkan nama pasien
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Record History",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(135, 76, 204, 1))),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Doctor: '),
                        Text(voiceText, style: const TextStyle(fontSize: 14)),
                      ],
                    ), // Menampilkan rekaman history
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
