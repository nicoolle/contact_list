import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contacts_list.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.contact}); // : super(key: key);
  final Contact contact;
  @override
  _DetailScreenState createState() => _DetailScreenState(contact: contact);
}

class _DetailScreenState extends State<DetailScreen> {
  final Contact contact;
  _DetailScreenState({required this.contact});
  @override
  //final contact = ModalRoute.of(context)!.settings.arguments as Contact;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hey'),//contact.id),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(contact.name),
      ),
    );
  }
}
