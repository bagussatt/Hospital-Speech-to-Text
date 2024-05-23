import 'package:flutter/material.dart';

class DetailPeriksaPage extends StatelessWidget {
  final String names;
  final String lastChecked;
  final String id;

  const DetailPeriksaPage(
      {Key? key, required this.names, required this.lastChecked, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examination Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $names', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Last Checked: $lastChecked', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
