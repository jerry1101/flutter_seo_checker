import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'OnPageSeo.dart';

void main() {
  // runApp(MyApp());
  runApp(MaterialApp(
    title: 'Simple calculator',
    home: SIForm(),
    theme: ThemeData(primaryColor: Colors.deepPurple),
  ));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _currencies = ['Mobile', 'Desktop'];
  var _domainTxtController = TextEditingController();
  // var _htmlResponse;
  var _onPageSeo;
  Future<OnPageSEO> _futureOnPageSeo;

  var _tmp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30.0),
          child: Text('SEO Checker'),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _buildUserAgentInput(),
            _buildDomainInput(),
            _buildLinkInput(),
            _buildAnalyzeBtn(),
            _buildResultDisplay()
          ],
        ),
      ),
    );
  }

  Column _buildResultDisplay() {
    return new Column(
      children: <Widget>[Text('$_tmp')],
    );
  }

  Container _buildAnalyzeBtn() {
    return Container(
      width: 300,
      height: 80,
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.amberAccent)),
        color: Colors.deepPurple,
        child: Text(
          'Analyze',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        onPressed: () {
          _tmp = DateTime.now().toString();
//          _getOnPageSEO();

          // _htmlResponse = 'new new value';
        },
      ),
    );
  }

  Expanded _buildUserAgentInput() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 60),
        child: DropdownButton<String>(
          items: _currencies
              .map((String e) => DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                  ))
              .toList(),
          value: 'Mobile',
          onChanged: (String selected) {},
        ),
      ),
    );
  }

  Widget _buildDomainInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _domainTxtController,
        keyboardType: TextInputType.url,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Domain',
          hintText: 'Enter Domain e.g. https://www.totalwine.com',
        ),
      ),
    );
  }

  Widget _buildLinkInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // obscureText: true,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Link',
          hintText: 'Enter Link e.g. /stores',
        ),
      ),
    );
  }

  // Container _buildTopImage() {
  //   return Container(
  //     height: 200,
  //     alignment: Alignment.topCenter,
  //     margin: EdgeInsets.all(10),
  //     child: Image(image: AssetImage('images/seo.jpeg')),
  //   );
  // }

  void _getOnPageSEO() async {
    final response = await http.get('https://www.gap.com/stores');
    print('response.statusCode is ' + response.statusCode.toString());
    if (response.statusCode < 400) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print('response.body is ' + response.body);
      _onPageSeo = OnPageSEO.fromHttpResponse(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  // void getHtml() async {
  //   // produces a request object
  //   var request = await HttpClient()
  //       .getUrl(Uri.parse('https://www.totalwine.com/wine/brand/hom'));
  //   // sends the request
  //   var response = await request.close();

  //   // transforms and prints the response
  //   await for (var contents in response.transform(Utf8Decoder())) {
  //     var document = parse(response);

  //     setState(() {
  //       _htmlResponse = document.getElementsByTagName('img').length;
  //       // _htmlResponse = 'new';
  //     });
  //   }
  // }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.rectangle,
      ),
    );
  }
}
