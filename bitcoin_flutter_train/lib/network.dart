import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url, required this.headers});
  final Uri url;
  Map<String, String> headers;

  Future getData() async {
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
