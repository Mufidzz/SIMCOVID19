import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/components/normalList/normal_list.dart';
import 'package:simcovid19id/model/Education.dart';
import 'package:simcovid19id/providers/educationProvider.dart';
import 'package:simcovid19id/views/education/educationitemview.dart';

class Educations extends StatefulWidget {
  @override
  _education createState() => _education();
}

class _education extends State<Educations> {
  Future<Education> futureEducation;


  @override
  void initState() {
    futureEducation = Provider.of<EducationProvider>(context, listen: false).fetchEducation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  BgAtas(title: 'Edukasi COVID-19'),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 8),
                    child: Text(
                      'Edukasi Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(
                          0xFF484848,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: FutureBuilder(
                      future: futureEducation,
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.data.length == null ? 0 :snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              String _title = snapshot.data.data.elementAt(index).title;
                              return GestureDetector(
                                onTap: () {
                                  Datum datum = snapshot.data.data.elementAt(index);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EducationItemView(educationItem: datum),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: EdgeInsets.only(top: 16, bottom: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 220,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://covid19.go.id/storage/app/uploads/public/5ec/25e/8ec/5ec25e8ecd56a396371415.jpeg'),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: EdgeInsets.all(12),
                                              child: Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            _title,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                              color: Color(0xFF484848),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 50,
                                                    height: double.infinity,
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Colors.black,
                                                      size: 20,
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
                            },
                          );
                        }
                        else if(snapshot.hasError){
                          return Center(child: Text("${snapshot.error}"));
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 160),
                  width: MediaQuery.of(context).size.width - 44,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Cari Edukasi...'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}