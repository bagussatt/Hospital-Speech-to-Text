import 'package:flutter/material.dart';

import 'package:record_speechtotextfor_hospital/screens/historypage.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ProfileWidget extends StatefulWidget {
  final String names;
  final String lastChecked;
  final String namadoc;
  final String id;
  const ProfileWidget(
      {super.key,
      required this.names,
      required this.lastChecked,
      required this.namadoc,
      required this.id});

  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  String _text = 'recording starts';

  @override
  void initState() {
    super.initState();
    _startListening(); // Memulai mendengarkan saat widget diinisialisasi
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (val) => setState(() {
        if (val == 'done') {
          _isListening = false;
        }
      }),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          _text = val.recognizedWords;
        }),
        listenFor: const Duration(
            hours: 100), // Mendengarkan untuk durasi yang sangat panjang
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Patient Data',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text('Full Name: ${widget.names}',
                            style: const TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Date of Birth: January 1, 1990',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Gender: Man',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Address: Jl. Mawar No. 123, Jakarta',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Phone number: 08123456789',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('Insurance Number: 000004',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Clinical Data',
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w900,
                                color: Colors.teal)),
                        const SizedBox(height: 28),
                        Text('Last Check : ${widget.lastChecked} ',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('- ', style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 20),
                        const Text('Disease History',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('- Hipertensi, 2018',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text('- Diabetes, 2015',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(_isListening
                            ? Icons.record_voice_over
                            : Icons.record_voice_over_outlined),
                        Text(_text),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HistoryPage(
                                  namadoc: widget.namadoc,
                                  names: widget.names,
                                  voiceText: _text,
                                  id: widget.id,
                                ),
                              ),
                            );
                          },
                          child: const Text('Save'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
