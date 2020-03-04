import 'package:flutter/material.dart';

ValueNotifier valueNotifier = ValueNotifier("No Title");
TextEditingController msgController = TextEditingController();
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifire Demo'),
      ),
      body: Center(
          child: SizedBox(
        width: 600,
        height: 300,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Enter your msg to send to next'),
                  controller: msgController,
            ),
            RaisedButton(onPressed: (){
              valueNotifier.value = msgController.text;
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => DetailsPage()));
            },
            child:Text('Send to Details'),)
          ],
        ),
      )),
    );
  }
}

//----Page 2 ----------//
class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Page')),
      body: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return Center(child: Text(value),);
            },
          ),
    );
  }
}
