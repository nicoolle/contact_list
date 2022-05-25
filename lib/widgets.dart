import 'package:contacts/widgets/liked_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contacts_list.dart';
import 'detail_widget.dart';

class TaskCardWidget extends StatelessWidget {
  final String id;
  final String name;
  final String surname;
  final String work;
  final String image;
  final String bio;
  final String phone;
  final Function(Contact) onEditContact;

  TaskCardWidget(
      {required this.id,
      required this.name,
      required this.surname,
      required this.work,
      required this.image,
      required this.bio,
      required this.phone,
      required this.onEditContact});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              contact: Contact(
                id,
                name,
                surname,
                work,
                image,
                bio,
                phone,
              ),
              onEditContact: (Contact _contact) {
                onEditContact(_contact);
              },
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 22.0,
          horizontal: 5.0,
        ),
        margin: const EdgeInsets.only(
          bottom: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LikedContacts(),
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$name $surname',
                            style: const TextStyle(
                              color: Color(0xFF211551),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      work,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
