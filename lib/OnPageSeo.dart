import 'package:xml/xml.dart' as xml;
import 'package:xml/xml_events.dart' as xml_events;

class OnPageSEO {
  final String h1;
  final String h2;
  final String title;

  OnPageSEO({this.h1, this.h2, this.title});

  factory OnPageSEO.fromHttpResponse(String response) {
    // debugPrint(response);
    final document = xml.parse(response);
    final _h1 = document.findAllElements('h1').first.text;
    final _h2 = document.findAllElements('h2').first.text;
    final _title = document.findAllElements('title').first.text;

    return OnPageSEO(h1: _h1, h2: _h2, title: _title);
  }
}
