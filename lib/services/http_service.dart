import 'dart:convert';
import 'package:http/http.dart';
import 'package:pattern_bloc_mockapi/model/contact_model.dart';


class Network {
  static String BASE = "60bb860442e1d00017620c6d.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json'};

  /* Http Apis */

  static String API_LIST = "/api/contacts";
  static String API_CREATE = "/api/contacts";
  static String API_UPDATE = "/api/contacts/"; //{id}
  static String API_DELETE = "/api/contacts/"; //{id}
  static String API_SEARCH = "/api/contacts"; //{String text}

  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }


  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Contact contact) {
    Map<String, String> params = new Map();
    params.addAll({
      'phone_number': contact.mobile,
      'fullname': contact.fullname,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Contact contact) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': contact.id,
      'phone_number': contact.mobile,
      'fullname': contact.fullname,
    });
    return params;
  }

  /* Http Parsing */

  static List<Contact> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Contact>.from(json.map((x) => Contact.fromJson(x)));
    return data;
  }
}