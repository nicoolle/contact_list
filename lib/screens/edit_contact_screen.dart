import 'package:contacts/entities/contacts_list.dart';
import 'package:contacts/widgets/text_field.dart';
import 'package:flutter/material.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({
    required this.contact,
    required this.onEditContact,
  });

  final Contact contact;
  final Function(Contact) onEditContact;

  @override
  _EditContactScreenState createState() => _EditContactScreenState(contact: contact);
}

class _EditContactScreenState extends State<EditContactScreen> {
  final Contact contact;

  _EditContactScreenState({required this.contact});

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

  _changeName(String text) {
    setState(() => contact.name = text);
  }

  _changeSurname(String text) {
    setState(() => contact.surname = text);
  }

  _changeWork(String text) {
    setState(() => contact.work = text);
  }

  _changeBio(String text) {
    setState(() => contact.bio = text);
  }

  _changePhone(String text) {
    setState(() => contact.phone = text);
  }

  editContact(Contact contact) {
    var newName;
    var newSurname;
    var newWork;
    var newBio;
    var newPhone;
    setState(() {
      widget.contact.name = newName;
      widget.contact.surname = newSurname;
      widget.contact.work = newWork;
      widget.contact.bio = newBio;
      widget.contact.phone = newPhone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text('Edit ${contact.name}'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(contact.image),
                    radius: 60,
                  ),
                  SizedBox(height: 10,),
                  ContactTextField(
                      placeholder: 'Name',
                      controller: nameController,
                      onTextChanged: _changeName),
                  SizedBox(height: 10,),
                  ContactTextField(
                      placeholder: 'Surname',
                      controller: surnameController,
                      onTextChanged: _changeSurname),
                  SizedBox(height: 10,),
                  ContactTextField(
                      placeholder: 'Work',
                      controller: workController,
                      onTextChanged: _changeWork),
                  SizedBox(height: 10,),
                  ContactTextField(
                      placeholder: 'Bio',
                      controller: bioController,
                      onTextChanged: _changeBio),
                  SizedBox(height: 10,),
                  ContactTextField(
                      placeholder: 'Phone',
                      controller: phoneController,
                      onTextChanged: _changePhone),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    child: Text('Done'),
                    onPressed: () => {
                      widget.onEditContact(widget.contact),
                      Navigator.of(context).pop(editContact)
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
