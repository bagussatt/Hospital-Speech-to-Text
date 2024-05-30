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
  String _text = '';

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
        pauseFor: const Duration(minutes: 45),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.33),
                  offset: const Offset(
                    0,
                    2,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 10),
                        child: Text(
                          'Patience Data',
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFE0E3E7),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                        child: Text(
                          'Randy',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            'Full Name: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Text(
                                            '${widget.names}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            'Birth Date: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            '1 January 1990',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            'Gender: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            'Men',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            'Address: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 5, 0),
                                          child: Text(
                                            'Jl. Mawar No. 123, Jakarta',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            'Phone Number: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            '08123456789',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            'Insurance Number: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 50, 0, 0),
                                          child: Text(
                                            '1234567890',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontFamily: 'Outfit',
                                                  letterSpacing: 0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              VerticalDivider(
                                thickness: 1,
                                color: Color(0xFFE0E3E7),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Clinical Data',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 0),
                                    child: Text(
                                      'Disease History',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 0),
                                    child: Text(
                                      '- Diabetes, 2018',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 0),
                                    child: Text(
                                      '- Hypertension, 2015',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 15, 0, 0),
                                    child: Text(
                                      'Allergies',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 0),
                                    child: Text(
                                      '-',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 15, 0, 0),
                                    child: Text(
                                      'Test Results',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 0),
                                    child: Text(
                                      '- Blood sugar: 150 mg/dL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 5, 0, 0),
                                    child: Text(
                                      '- Blood Preasure: 140/90 mmHg',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontFamily: 'Outfit',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                        child: Text(
                          _isListening ? "Recording Start" : "Recording Stop",
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFE0E3E7),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 299,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color(0xFFE0E3E7),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Doctor:',
                                  ),
                                  TextSpan(text: _text)
                                ],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 10),
                          child: ElevatedButton(
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
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: Color(0xFF4D3AF7),
                                ),
                              ))),
                    ],
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
