import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Education.dart';
import 'package:simcovid19id/providers/educationProvider.dart';
import 'package:simcovid19id/components/buttonDownload/buttondownload.dart';
import 'package:simcovid19id/views/education/educationItemView.dart';

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  Future<Education> futureEducation;

  @override
  void initState() {
    futureEducation = Provider.of<EducationProvider>(context, listen: false)
        .fetchEducation(CONFIG.API_TOKEN);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
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
                    child: FutureBuilder<Education>(
                      future: futureEducation,
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.data.length,
                            reverse: true,
                            itemBuilder: (BuildContext context, int index){
                              var _data = snapshot.data.data.elementAt(index);
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => EducationItemView(
                                        EducationItem: _data,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: EdgeInsets.only(top: 16, bottom: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                _data.imageUrl,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          height: 150,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                              left: 8,
                                              right: 8,
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  _data.title,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Color(0xFF484848),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  _data.oldCreatedAt,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFF484848),
                                                  ),
                                                ),
                                              ],
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                            ),
                                          ),
                                        ),
                                        ButtonDownload(
                                          downloadUrl: _data.downloadUrl,
                                        )
                                      ],
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
                                hintText: 'Cari Edukasi...',
                              ),
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
