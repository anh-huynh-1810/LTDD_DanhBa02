import 'package:baitap9/contact_detail.dart';
import 'package:baitap9/contact_object.dart';
import 'package:baitap9/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsTabState();
  }
}

class ContactsTabState extends State<ContactsTab> {
  List<ContactObject> lsContact = [];

  void _LoadDanhSachContact() async {
    final data = await ContactProvider.getAllContacts();
    setState(() {});
    lsContact = data;
  }

  @override
  void initState() {
    super.initState();
    _LoadDanhSachContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: lsContact.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(lsContact[index].name),
              subtitle: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(lsContact[index].phone),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(lsContact[index].email),
                  ),
                ],
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(lsContact[index].picture),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ContactDetail(contact: lsContact[index])));
              },
            ),
          ),
        ),
      ),
    );
  }
}
