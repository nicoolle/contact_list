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
    Contact('Nicole ', 'Kozmanko', 'Some work', 'assets/images/nicole.jpg'),
    Contact('Marichka ', 'Natalchuk', 'Some work', 'assets/images/marichka.jpg'),
    Contact('Alina ', 'Koziychuk', 'KeyToTech', 'assets/images/alja.jpg'),
    Contact('Lesya ', 'Smyrnova', 'GlobalLogic', 'assets/images/lesya.jpg'),
    Contact('Yarema ','Vuyiv', 'N-ix', 'assets/images/yarema.jpg'),
    Contact('Denys ', 'Nazarko', 'Epam', 'assets/images/den.jpg'),
    Contact('Dmytro ', 'Tymkiv', 'SoftServe', 'assets/images/dima.jpg'),
    Contact('Sofija ', 'Matviishyn', 'N-ix', 'assets/images/sofija.jpg'),
    Contact('Roma ', 'Tkach', 'Inoxoft', 'assets/images/roma.jpg'),
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

    //groupMyList();
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
                  /*child: ListView.separated(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskCardWidget(
                          name: contacts[index].name,
                          surname: contacts[index].surname,
                          work: contacts[index].work,
                          image: contacts[index].image
                      );
                    },
                    separatorBuilder: (context, index) {
                      if(contacts[index].surname[0].toLowerCase() != contacts[index + 1].surname[0].toLowerCase()){
                        //Text(contacts[index + 1].surname[0]);
                        return Divider(color: Color(0x00000000), height: 20,);
                      }
                      return Divider(color: Color(0x00000000), height: 0,);
                    },
                  ),*/
                  child: GroupListView(
                    sectionsCount: groupedLists.keys.toList().length,
                    countOfItemInSection: (int section) {
                      return groupedLists.values.toList()[section].length;
                    },
                    itemBuilder: (BuildContext context, IndexPath index) {
                      return TaskCardWidget(
                          name: groupedLists.values.toList()[index.section][index.index].name,
                          surname: groupedLists.values.toList()[index.section][index.index].surname,
                          work: groupedLists.values.toList()[index.section][index.index].work,
                          image: groupedLists.values.toList()[index.section][index.index].image
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