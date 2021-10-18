import 'package:flutter/material.dart';
import 'contacts_list.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.contact,
    required this.onEditContact,
  });
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
    setState(() {
      widget.contact.name = newName;
      widget.contact.surname = newSurname;
      widget.contact.surname = newWork;
      widget.contact.surname = newBio;
      widget.contact.surname = newPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Edit ${contact.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(contact.image),
              radius: 60,
            ),
            TextField(
                controller: nameController,
                style: TextStyle(fontSize: 17),
                onChanged: _changeName,
                decoration: const InputDecoration(labelText: 'Name:'),
            ),
            TextField(
              controller: surnameController,
              style: TextStyle(fontSize: 17),
              onChanged: _changeSurname,
              decoration: const InputDecoration(labelText: 'Surname:'),
            ),
            TextField(
              controller: workController,
              style: TextStyle(fontSize: 17),
              onChanged: _changeWork,
              decoration: const InputDecoration(labelText: 'Work:'),
            ),
            TextField(
              controller: bioController,
              style: TextStyle(fontSize: 17),
              onChanged: _changeBio,
              decoration: const InputDecoration(labelText: 'Bio:'),
            ),
            TextField(
              controller: phoneController,
              style: TextStyle(fontSize: 17),
              onChanged: _changePhone,
              decoration: const InputDecoration(labelText: 'Phone:'),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey
              ),
              child: Text('Done'),
              onPressed: () => {
                widget.onEditContact(widget.contact),
                Navigator.of(context).pop(editContact)
              },
            )
          ],
        ),
      ),
    );
  }
}
