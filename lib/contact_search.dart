import 'package:baitap9/contact_detail.dart';
import 'package:baitap9/contact_object.dart';
import 'package:baitap9/contact_provider.dart';
import 'package:flutter/material.dart';

class ContactSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactSearchState();
  }
}

class ContactSearchState extends State<ContactSearch> {
  List<ContactObject> lsContact = [];
  TextEditingController txtSearch = TextEditingController();
  void _searchContact() async {
    if (txtSearch.text.isNotEmpty) {
      setState(() {});
      lsContact = await ContactProvider.searchContact(txtSearch.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: TextField(
            controller: txtSearch,
            autofocus: true,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
            onChanged: (text) {
              _searchContact();
            },
          ),
        ),
      ),
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
