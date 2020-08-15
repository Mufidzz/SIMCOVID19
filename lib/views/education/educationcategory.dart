import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/EducationCategory.dart';
import 'package:simcovid19id/providers/educationCategoryProvider.dart';
import 'package:simcovid19id/views/education/education.dart';

class EducationsCategory extends StatefulWidget {
  @override
  _educationcategory createState() => _educationcategory();
}

class _educationcategory extends State<EducationsCategory> {
  Future<EducationCategory> futureEducationCategory;

  @override
  void initState() {
    futureEducationCategory =
        Provider.of<EducationCategoryProvider>(context, listen: false)
            .fetchEducationCategory();
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
                      'Kategori Materi Edukasi',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(
                          0xFF484848,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: FutureBuilder<EducationCategory>(
                      future: futureEducationCategory,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              String _title =
                                  snapshot.data.data.elementAt(index).title;
                              int _countEducation = snapshot.data.data
                                  .elementAt(index)
                                  .education
                                  .length;
                              return GestureDetector(
                                onTap: () {
                                  Datum datum =
                                      snapshot.data.data.elementAt(index);

                                  if (datum.education.length != 0) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Educations(
                                          datum: datum,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Card(
                                  margin: EdgeInsets.only(top: 6, bottom: 6),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            _countEducation != 0
                                                ? _title +
                                                    " (" +
                                                    _countEducation.toString() +
                                                    ")"
                                                : _title,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(0xFF484848),
                                                height: 1.5),
                                          ),
                                          flex: 8,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(),
                                        ),
                                        Expanded(
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
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
