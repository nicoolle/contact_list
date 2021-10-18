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
  TaskCardWidget({
    required this.id,
    required this.name,
    required this.surname,
    required this.work,
    required this.image,
    required this.bio,
    required this.phone,
    required this.onEditContact
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 22.0,
        horizontal: 5.0,
      ),
      margin: EdgeInsets.only(
        bottom: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LikedContacts(),
          GestureDetector (
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(
                          contact: Contact(
                              id,
                              name,
                              surname,
                              work,
                              image,
                              bio,
                              phone,
                          ),
                        onEditContact: (Contact _contact){
                            onEditContact(_contact);
                        },
                      ),
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Color(0xFF211551),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      surname,
                      style: TextStyle(
                        color: Color(0xFF211551),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
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
        ],
      ),
    );
  }
}

class LikedContacts extends StatefulWidget {
  const LikedContacts({Key? key}) : super(key: key);

  @override
  _LikedContactsState createState() => _LikedContactsState();
}

class _LikedContactsState extends State<LikedContacts> {
  bool _isLiked = false;
  void _toggleFavorite() {
    setState(() {
      if (_isLiked) {
        _isLiked = false;
      }
      else {
        _isLiked = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 15.0,
            left: 0.0,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isLiked
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}

