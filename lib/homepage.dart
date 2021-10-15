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
    Contact('1', 'Nicole ', 'Kozmanko', 'Some work', 'assets/images/nicole.jpg', 'SOOme bio about nicole'),
    Contact('2', 'Marichka ', 'Hapatyn', 'Some work', 'assets/images/marichka.jpg', 'SOOme bio about marichka'),
    Contact('3', 'Alina ', 'Koziychuk', 'KeyToTech', 'assets/images/alja.jpg', 'SOOme bio about alina'),
    Contact('4', 'Lesya ', 'Smyrnova', 'GlobalLogic', 'assets/images/lesya.jpg', 'SOOme bio about lesja'),
    Contact('5', 'Yarema ','Vuyiv', 'N-ix', 'assets/images/yarema.jpg', 'SOOme bio about yarema'),
    Contact('6', 'Denys ', 'Nazarko', 'Epam', 'assets/images/den.jpg', 'SOOme bio about den'),
    Contact('7', 'Dmytro ', 'Tymkiv', 'SoftServe', 'assets/images/dima.jpg', 'SOOme bio about dima'),
    Contact('8','Sofija ', 'Matviishyn', 'N-ix', 'assets/images/sofija.jpg', 'SOOme bio about sofa'),
    Contact('9', 'Roma ', 'Tkach', 'Inoxoft', 'assets/images/roma.jpg', 'SOOme bio about roma'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            color: Color(0xFFF6F6F6),
            child: Stack(
              children: [
                Container(
                  child: Text(
                    'My contacts',
                    style: TextStyle(
                      color: Color(0xFF211551),
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  margin: EdgeInsets.only(
                    top: 32.0,
                    bottom: 32.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 80.0,
                    bottom: 32.0,
                  ),
                  child: GroupListView(
                    sectionsCount: groupedLists.keys.toList().length,
                    countOfItemInSection: (int section) {
                      return groupedLists.values.toList()[section].length;
                    },
                    itemBuilder: (BuildContext context, IndexPath index) {
                      return TaskCardWidget(
                          id: groupedLists.values.toList()[index.section][index.index].id,
                          name: groupedLists.values.toList()[index.section][index.index].name,
                          surname: groupedLists.values.toList()[index.section][index.index].surname,
                          work: groupedLists.values.toList()[index.section][index.index].work,
                          image: groupedLists.values.toList()[index.section][index.index].image,
                          bio: groupedLists.values.toList()[index.section][index.index].bio,
                      );
                    },
                    groupHeaderBuilder: (BuildContext context, int section) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Text(
                          groupedLists.keys.toList()[section],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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