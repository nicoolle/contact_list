import 'package:contacts/contacts_list.dart';
import 'package:contacts/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Contact> contacts = [
    Contact('1', 'Nicole', 'Kozmanko', 'Some work', 'assets/images/nicole.jpg', 'SOOme bio about nicole', '05094834'),
    Contact('2', 'Marichka', 'Hapatyn', 'Some work', 'assets/images/marichka.jpg', 'SOOme bio about marichka', '598490294'),
    Contact('3', 'Alina', 'Koziychuk', 'KeyToTech', 'assets/images/alja.jpg', 'SOOme bio about alina', '040349489'),
    Contact('4', 'Lesya', 'Smyrnova', 'GlobalLogic', 'assets/images/lesya.jpg', 'SOOme bio about lesja', '048590300'),
    Contact('5', 'Yarema','Vuyiv', 'N-ix', 'assets/images/yarema.jpg', 'SOOme bio about yarema', '94380444'),
    Contact('6', 'Denys', 'Nazarko', 'Epam', 'assets/images/den.jpg', 'SOOme bio about den', '9843974930'),
    Contact('7', 'Dmytro', 'Tymkiv', 'SoftServe', 'assets/images/dima.jpg', 'SOOme bio about dima', '04384589'),
    Contact('8','Sofija', 'Matviishyn', 'N-ix', 'assets/images/sofija.jpg', 'SOOme bio about sofa', '3954985'),
    Contact('9', 'Roma', 'Tkach', 'Inoxoft', 'assets/images/roma.jpg', 'SOOme bio about roma', '3805050'),
  ];

  _HomepageState() {
    this.groupedLists = {};
    contacts.sort((a, b) => a.surname.compareTo(b.surname));
    groupMyList();
  }

  late final Map<String, List<Contact>> groupedLists;

  void groupMyList() {
    contacts.forEach((person) {
      if (groupedLists['${person.surname[0]}'] == null) {
        groupedLists['${person.surname[0]}'] = <Contact>[];
      }
      groupedLists['${person.surname[0]}']!.add(person);
    });
  }

  _contact(IndexPath index) {
    var _contact = groupedLists.values.toList()[index.section][index.index];
    return TaskCardWidget(
      id: _contact.id,
      name: _contact.name,
      surname: _contact.surname,
      work: _contact.work,
      image: _contact.image,
      bio: _contact.bio,
      phone: _contact.phone,
        onEditContact: (Contact contact) {
          setState(() {
            var index = contacts.indexWhere((element) =>
            element.id == contact.id);
            contacts[index].name = contact.name;
            contacts[index].surname = contact.surname;
            contacts[index].work = contact.work;
            contacts[index].bio = contact.bio;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            color: Color(0xFFF6F6F6),
            child: Stack(
              children: [
                Container(
                  child: const Text(
                    'My contacts',
                    style: TextStyle(
                      color: Color(0xFF211551),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: const EdgeInsets.only(
                    top: 32.0,
                    bottom: 32.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 80.0,
                    bottom: 32.0,
                  ),
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
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Text(
                          groupedLists.keys.toList()[section],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}