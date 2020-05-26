import 'package:flutter/material.dart';

class SeoCheckerPage extends StatefulWidget {
  const SeoCheckerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEO Checker'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 200,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(30),
              child: DropdownButton(
                  isExpanded: true, //Adding this property, does the magic
                  items: ['Mobile', 'Desktop']
                      .map((String value) => DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setSta
                    //print(val);
                  }),
            ),
            Container(
              child: Text(
                'show box',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              height: 50,
              alignment: Alignment.center,
              // color: Colors.green,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Colors.amber, Colors.purple],
                    stops: [0.6, 1]),
                boxShadow: [
                  BoxShadow(color: Colors.grey, offset: Offset(4, 4)),
                  BoxShadow(color: Colors.blueGrey, offset: Offset(4, 4))
                ],
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.greenAccent,
                border: Border.all(
                    color: Colors.redAccent, width: 5, style: BorderStyle.none),
              ),
            ),
            const Text(
              'row 1',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  decoration: TextDecoration.lineThrough),
            ),
            const Text('row 2'),
            const Text('row 3'),
            Image.network(
              'https://www.totalwine.com/media/sys_master/cmsmedia/h18/hd0/12563850559518.png',
              height: 400,
            )
          ],
        ),
      ),
    );
  }
}
