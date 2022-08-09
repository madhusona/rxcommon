import 'package:http/http.dart' as http;
import 'package:rxcommon/src/data/datasource/comp_api.dart';
import 'package:rxcommon/src/data/models/models.dart';
import 'package:xml/xml.dart';

class RxComp implements CompApi {
  final http.Client client;
  RxComp({required this.client});
  @override
  Future<List<Comp>> getItem() async {
    var xml =
        '<?xml version="1.0" encoding="utf-8"?><RXGateway xmlns="http://redeemx.net/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><H1>venuemetro</H1><H2>501</H2><H3>10000027376220401172330382</H3><H4>2022-04-01T17:23:30</H4><H5>aOHI+Jxyq35DLyONqJDzPyKAfwx5szT8uARH9S8PQMyVCeLdsvdOPunPpynnNSsr</H5><H6>10000027417</H6><H7>1</H7><D3>10000027417</D3><D8>RXMEMBER|PROMOTION||217309|SILVER|</D8><D10>1</D10><D13>231473</D13><F1>RXMEMBER|1.7|Version 1.7 C13.81 G7.2 B0.3</F1><F2>10000027376|RXMEMBER|12345678</F2><F3>2|1</F3></RXGateway>';
    final response = await client.post(
      Uri.parse("http://venuemetro.redeemx.net/redeemx.svc/"),
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
      },
      body: xml,
    );

    if (response.statusCode == 200) {
      return readXML(response.body)
          .split("~")
          .map(
            (item) => Comp.fromXml(item.split("|")),
          )
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  Future<Map<String, List<Comp>>> getInterest() async {
    var xml =
        '<?xml version="1.0" encoding="utf-8"?><RXGateway xmlns="http://redeemx.net/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><H1>venuemetro</H1><H2>501</H2><H4>2022-04-01T17:23:30</H4><H6>11</H6><F1>RXMEMBER|1.7|Version 1.7 C13.81 G7.2 B0.3</F1><F2>11||</F2><F3>2|64</F3></RXGateway>';
    final response = await client.post(
      Uri.parse("http://venuemetro.redeemx.net/redeemx.svc/"),
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
      },
      body: xml,
    );

    if (response.statusCode == 200) {
      final items = readXML(response.body)
          .split("~")
          .map(
            (item) => Comp.fromXml(item.split("|")),
          )
          .toList();
      final Map<String, List<Comp>> interests = {};
      for (var item in items) {
        for (var interest in item.interest) {
          List<Comp> itemInterests = [];
          itemInterests.add(item);
          if (interests.containsKey(interest)) {
            interests[interest]?.addAll(itemInterests);
          } else {
            interests[interest] = itemInterests;
          }
        }
      }
      return interests;
    } else {
      throw Exception();
    }
  }

  String readXML(String response) {
    final xmlItems = XmlDocument.parse(response);
    final itemsList = xmlItems.findAllElements('F2').first.text;
    return itemsList;
  }

  @override
  Future<List<QuickView>> getQuickView() async {
    var xml =
        '<?xml version="1.0" encoding="utf-8"?><RXGateway xmlns="http://redeemx.net/" xmlns:i="http://www.w3.org/2001/XMLSchema-instance"><H1>venuemetro</H1><H2>501</H2><H3>10000027417220401171831691</H3><H4>2022-04-01T17:18:31</H4><H5></H5><H6>10000027417</H6><H7>1</H7><D3>10000027417</D3><D8>RXMEMBER|||||</D8><D10>0</D10><D13></D13><F1>RXMEMBER|1.7|Version 1.7 C13.81 G7.2 B0.3</F1><F2>10000027417|RXMEMBER|12345678</F2><F3>2|524288</F3></RXGateway>';
    final response = await client.post(
      Uri.parse("http://venuemetro.redeemx.net/redeemx.svc/"),
      headers: {
        "Content-Type": "text/xml; charset=utf-8",
      },
      body: xml,
    );

    if (response.statusCode == 200) {
      return readXML(response.body).split("~").map((item) => QuickView.fromXml(item.split("|")),).toList();
    } else {
      throw Exception();
    }
  }
}
