import 'dart:convert';
import 'dart:html';

import 'package:baitap9/contact_object.dart';
import 'package:flutter/services.dart';

//full
class ContactProvider {
  static Future<List<dynamic>> readJsonData() async {
    var jsonText = await rootBundle.loadString('data/contactdata.json');
    var data = json.decode(jsonText);
    return data["contacts"];
  }

  static Future<List<ContactObject>> getAllContacts() async {
    List<ContactObject> lsResual = [];
    List<dynamic> data = await readJsonData();
    lsResual = data.map((e) => ContactObject.fromJson(e)).toList();
    return lsResual;
  }

  static Future<List<ContactObject>> searchContact(String strSearch) async {
    List<ContactObject> lsResual = [];
    List<dynamic> data = await readJsonData();
    data.forEach((e) {
      ContactObject c = ContactObject.fromJson(e);
      if (c.name.toLowerCase().contains((strSearch.toLowerCase())) ||
          c.phone.contains(strSearch)) {
        lsResual.add(c);
      }
    });
    return lsResual;
  }
}
