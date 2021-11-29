import 'package:baitap9/contact_object.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactDetail extends StatefulWidget {
  final ContactObject contact;

  ContactDetail({Key? key, required this.contact}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ContactDetailState(contact: contact);
  }
}

class ContactDetailState extends State<ContactDetail> {
  final ContactObject contact;
  ContactDetailState({required this.contact});
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  List<ContactObject> lsContact = [];
  void _BindingContact() async {
    setState(() {});
    txtName.text = contact.name;
    txtName.text = contact.phone;
    txtEmail.text = contact.email;
  }

  @override
  void initState() {
    super.initState();
    _BindingContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông Tin Chi Tiết'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 80,
                width: 80,
                child: CachedNetworkImage(
                  imageUrl: contact.picture,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: txtName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Nhập Tên Liên Hệ',
                    labelText: 'Tên Liên hệ',
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Nhập Email',
                    labelText: 'Email',
                  )),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  controller: txtPhone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Nhập Số Điện Thoại',
                      labelText: 'Số Điện Thoại'),
                )),
          ],
        ),
      ),
    );
  }
}
