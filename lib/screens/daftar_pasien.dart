import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_speechtotextfor_hospital/model/pasien_model.dart';
import 'package:record_speechtotextfor_hospital/screens/detail_periksa.dart';
import 'package:record_speechtotextfor_hospital/screens/profile_pasien.dart'; // Pastikan Anda memiliki halaman ini

class DaftarPasien extends StatefulWidget {
  const DaftarPasien({super.key, required this.id, required this.namadoc});

  final String id;
  final String namadoc;

  @override
  State<DaftarPasien> createState() => _DaftarPasienState();
}

class _DaftarPasienState extends State<DaftarPasien> {
  late PasienModel _model;

  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = PasienModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        body: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                      child: Container(
                        width: 300,
                        height: 300,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                          'https://pina.id/_next/image?url=https%3A%2F%2Fpina-classroom.s3.ap-southeast-1.amazonaws.com%2Fpublic%2F713b49bdfae57d0bc769b21905589449.webp&w=1200&q=90',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ID = ${widget.id}',
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Doctor = ${widget.namadoc}',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('History'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 8),
                                  child: Text(
                                    'Patient List',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFE0E3E7),
                                ),
                                ListView(
                                  padding: EdgeInsets.all(10),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: List.generate(
                                      4, (index) => buildPatientItem(index)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ]))
            ]));
  }

  Widget buildPatientItem(int index) {
    final List<String> image = [
      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=900&q=60',
      'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjF8fHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=900&q=60',
    ];
    // Dummy data for demonstration
    List<String> names = [
      'Maxwell Zuniga',
      'Jane Ruby',
      'Maria Smith',
      'Alice Johnson'
    ];
    List<String> lastChecked = ['8 Days', '10 Days', '5 Days', '12 Days'];

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileWidget(
              names: names[index],
              lastChecked: lastChecked[index],
              namadoc: widget.namadoc,
              id: widget.id,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _model.iuserHovered1! ? Color(0xFFF1F4F8) : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Color(0xFF686868),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(
                      image[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          names[index],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Last Check ${lastChecked[index]}',
                          ),
                        ),
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
