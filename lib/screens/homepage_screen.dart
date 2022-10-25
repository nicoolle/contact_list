import 'package:contacts/entities/contacts_list.dart';
import 'package:contacts/entities/contacts_mocked_data.dart';
import 'package:contacts/widgets/contact_field.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

import 'liked_contacts_screen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  _HomepageState() {
    groupedLists = {};
    contacts.sort((a, b) => a.surname.compareTo(b.surname));
    groupMyList();
  }

  late final Map<String, List<Contact>> groupedLists;

  void groupMyList() {
    for (var person in contacts) {
      if (groupedLists[person.surname[0]] == null) {
        groupedLists[person.surname[0]] = <Contact>[];
      }
      groupedLists[person.surname[0]]!.add(person);
    }
  }

  _contact(IndexPath index) {
    var _contact = groupedLists.values.toList()[index.section][index.index];
    return ContactField(
        id: _contact.id,
        name: _contact.name,
        surname: _contact.surname,
        work: _contact.work,
        image: _contact.image,
        bio: _contact.bio,
        phone: _contact.phone,
        isLiked: _contact.isLiked,
        onEditContact: (Contact contact) {
          setState(() {
            var index =
                contacts.indexWhere((element) => element.id == contact.id);
            contacts[index].name = contact.name;
            contacts[index].surname = contact.surname;
            contacts[index].work = contact.work;
            contacts[index].bio = contact.bio;
            contacts[index].isLiked = contact.isLiked;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("My contacts"),
          backgroundColor: Colors.blueGrey,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LikedContactsScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
            color: const Color(0xFFF6F6F6),
            child: GroupListView(
              sectionsCount: groupedLists.keys.toList().length,
              countOfItemInSection: (int section) {
                return groupedLists.values.toList()[section].length;
              },
              itemBuilder: (BuildContext context, IndexPath index) {
                return _contact(index);
              },
              groupHeaderBuilder: (BuildContext context, int section) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    groupedLists.keys.toList()[section],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10),
              sectionSeparatorBuilder: (context, section) =>
                  SizedBox(height: 10),
            ),
          ),
        ));
  }
}
