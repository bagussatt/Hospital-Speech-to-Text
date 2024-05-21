import 'package:flutter/material.dart';
import 'package:record_speechtotextfor_hospital/screens/recordpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  final _nameController = TextEditingController(); // To manage text input

  void _showConfirmationDialog(String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: Text(
              'Apakah Anda ingin melanjutkan ke halaman rekam medis untuk $name?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false), // Cancel
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // Confirm
              child: const Text('Ya'),
            ),
          ],
        );
      },
    ).then((confirmed) {
      if (confirmed ?? false) {
        // User confirmed, navigate to RecordPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecordPage(name: name)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Center(
          child: Form(
            key: _formKey, // Link form to validation key
            child: Column(
              children: [
                Text(
                  "Masukan Nama Pasien",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextFormField(
                    controller: _nameController, // Assign controller
                    decoration: InputDecoration(
                      labelText: 'Nama Pasien',
                      border: OutlineInputBorder(), // Add border
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Pasien Tidak Boleh Kosong.';
                      }
                      return null; // No error
                    },
                  ),
                ),
                const SizedBox(height: 20), // Add spacing
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid
                      String name = _nameController.text;
                      _showConfirmationDialog(name); // Show confirmation dialog
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
