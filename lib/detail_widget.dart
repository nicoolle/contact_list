import 'package:flutter/material.dart';
import 'contacts_list.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.contact,
    required this.onEditContact,
  }); // : super(key: key);
  final Contact contact;
  final Function(Contact) onEditContact;

  @override
  _DetailScreenState createState() => _DetailScreenState(contact: contact);
}

class _DetailScreenState extends State<DetailScreen> {
  final Contact contact;
  _DetailScreenState({required this.contact});

  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController workController;
  late TextEditingController bioController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.contact.name);
    surnameController = TextEditingController(text: widget.contact.surname);
    workController = TextEditingController(text: widget.contact.work);
    bioController = TextEditingController(text: widget.contact.bio);
    phoneController = TextEditingController(text: widget.contact.phone);
  }

  _changeName(String text){
    setState(() => contact.name = text);
  }

  _changeSurname(String text){
    setState(() => contact.surname = text);
  }

  _changeWork(String text){
    setState(() => contact.work = text);
  }

  _changeBio(String text){
    setState(() => contact.bio = text);
  }

  _changePhone(String text){
    setState(() => contact.phone = text);
  }


  editContact(Contact contact){
    var newName;
    var newSurname;
    var newWork;
    var newBio;
    var newPhone;
    //Contact updatedContact = openExistingContact(widget.contact);
    setState(() {
      widget.contact.name = newName;
      widget.contact.surname = newSurname;
      widget.contact.surname = newWork;
      widget.contact.surname = newBio;
      widget.contact.surname = newPhone;
    });
  }
/*
  void editName() {
    setState(() {

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hey'),
      ),
      body: Column(
        children: [
          TextField(
              controller: nameController,
              //initialValue: contact.name + contact.surname,
              style: TextStyle(fontSize: 17),
              onChanged: _changeName,
              decoration: const InputDecoration(labelText: 'Name:'),
          ),
          TextField(
            controller: surnameController,
            //initialValue: contact.name + contact.surname,
            style: TextStyle(fontSize: 17),
            onChanged: _changeSurname,
            decoration: const InputDecoration(labelText: 'Surname:'),
          ),
          TextField(
            controller: workController,
            //initialValue: contact.name + contact.surname,
            style: TextStyle(fontSize: 17),
            onChanged: _changeWork,
            decoration: const InputDecoration(labelText: 'Work:'),
          ),
          TextField(
            controller: bioController,
            //initialValue: contact.name + contact.surname,
            style: TextStyle(fontSize: 17),
            onChanged: _changeBio,
            decoration: const InputDecoration(labelText: 'Bio:'),
          ),
          TextField(
            controller: phoneController,
            //initialValue: contact.name + contact.surname,
            style: TextStyle(fontSize: 17),
            onChanged: _changePhone,
            decoration: const InputDecoration(labelText: 'Phone:'),
          ),

          ElevatedButton(
            child: Text('Done'),
            onPressed: () => {
              widget.onEditContact(widget.contact),
              Navigator.of(context).pop(editContact)
            },
          )
        ],
      ),
    );
  }
}
