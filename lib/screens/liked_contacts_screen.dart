import 'package:contacts/entities/contacts_list.dart';
import 'package:contacts/entities/contacts_mocked_data.dart';
import 'package:contacts/widgets/contact_field.dart';
import 'package:contacts/screens/homepage_screen.dart';
import 'package:flutter/material.dart';


class LikedContactsScreen extends StatefulWidget {
  const LikedContactsScreen({Key? key}) : super(key: key);

  @override
  State<LikedContactsScreen> createState() => _LikedContactsScreenState();
}

class _LikedContactsScreenState extends State<LikedContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
                (Route<dynamic> route) => false);
          },
        ),
        title: const Text("Liked contacts"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
          color: const Color(0xFFF6F6F6),
          child: ListView.separated(
            itemCount: contacts.length,
            itemBuilder: (BuildContext context, int index) {
              if (contacts[index].isLiked == true) {
                return ContactField(
                    id: contacts[index].id,
                    surname: contacts[index].surname,
                    phone: contacts[index].phone,
                    image: contacts[index].image,
                    work: contacts[index].work,
                    name: contacts[index].name,
                    bio: contacts[index].bio,
                    isLiked: contacts[index].isLiked,
                    onEditContact: (Contact contact) {
                      setState(() {
                        var index = contacts
                            .indexWhere((element) => element.id == contact.id);
                        contacts[index].name = contact.name;
                        contacts[index].surname = contact.surname;
                        contacts[index].work = contact.work;
                        contacts[index].bio = contact.bio;
                        contacts[index].isLiked = contact.isLiked;
                      });
                    });
              } else {
                return Container();
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10),
              );
            },
          ),
        ),
      ),
    );
  }
}
