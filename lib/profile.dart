import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:parsing_ujikom/sample_json.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _nama = "";
  late String _umur = "";
  late String _usergithub = "";
  late String _repogithub = "";
  List _hobi = [];
  List<Article> _articles = [];

  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);

    setState(() {
      _nama = sample.name.toString();
      _umur = sample.age.toString();
      _usergithub = sample.github!.username.toString();
      _repogithub = sample.github!.repository.toString();
      _hobi = sample.hobi!.toList();
      _articles = sample.articles!.toList();
    });
  }

  void initState() {
    _loadSampleJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Parsing Json')),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.blueAccent,
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlueAccent,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.yellowAccent]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Nama : \n" + _nama,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlueAccent,
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.black, Colors.redAccent]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Umur : \n" + _umur + " Tahun",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.lightBlueAccent,
              child: Container(
                decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.black, Colors.green]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1), // changes position of shadow
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Github : " +
                          _usergithub +
                          "\n Repository : " +
                          _repogithub,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _hobi.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.pink]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            )
                          ],
                        ),
                        child: Center(
                            child: Text(
                          _hobi[index].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.black, Colors.orangeAccent]),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            )
                          ],
                        ),
                        child: Center(
                            child: Text(
                          _articles[index].id.toString() +
                              "\n" +
                              _articles[index].title +
                              "\n" +
                              _articles[index].subtitle,
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
