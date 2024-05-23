import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ProfileWidget extends StatefulWidget {
  final String names;
  final String lastChecked;
  const ProfileWidget({super.key, required this.names, required this.lastChecked});

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
        listenFor: Duration(
            hours: 100), // Mendengarkan untuk durasi yang sangat panjang
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 6,
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Patient Data',
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal)),
                        SizedBox(height: 40),
                        Text('Full Name: ${widget.names}',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Date of Birth: January 1, 1990',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Gender: Man', style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Address: Jl. Mawar No. 123, Jakarta',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Phone number: 08123456789',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        Text('Insurance Number: 000004',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Clinical Data',
                            style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.w900,
                                color: Colors.teal)),
                        SizedBox(height: 28),
                        Text('Last Check : ${widget.lastChecked} ',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        Text('- ', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 20),
                        Text('Disease History',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        Text('- Hipertensi, 2018',
                            style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 16,
                        ),
                        Text('- Diabetes, 2015',
                            style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(_isListening
                            ? Icons.record_voice_over
                            : Icons.record_voice_over_outlined),
                        Text(_text),
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