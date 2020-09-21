import 'package:dbloods_app/screen_dummy/data_source.dart';
import 'package:dbloods_app/shared/shareds.dart';
import 'package:flutter/material.dart';

class TentangDbloods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: mainColor,
        title: Text('Tentang Aplikasi'),
      ),
      body: ListView.builder(
        itemCount: DataSource.faq.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  DataSource.faq[i]['pertanyaan'],
                  style: blackTextFont,
                ),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(DataSource.faq[i]['jawaban']),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
