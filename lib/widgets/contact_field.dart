import 'package:contacts/widgets/liked_contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../entities/contacts_list.dart';
import '../screens/edit_contact_screen.dart';

class ContactField extends StatefulWidget {
  final String id;
  final String name;
  final String surname;
  final String work;
  final String image;
  final String bio;
  final String phone;
  bool isLiked;
  final Function(Contact) onEditContact;

  ContactField(
      {required this.id,
        required this.name,
        required this.surname,
        required this.work,
        required this.image,
        required this.bio,
        required this.phone,
        required this.isLiked,
        required this.onEditContact});

  @override
  State<ContactField> createState() => _ContactFieldState();
}

class _ContactFieldState extends State<ContactField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToEditScreen(context);
      },
      child: Slidable(
        key: const ValueKey(1),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: navigateToEditScreen,
              backgroundColor: Colors.blueGrey,
              foregroundColor: Colors.white,
              icon: Icons.edit_outlined,
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 22.0,
            horizontal: 5.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LikedContacts(
                contact: Contact(widget.id, widget.name, widget.surname,
                    widget.work, widget.image, widget.bio, widget.phone, false),
                onEditContact: (Contact _contact) {
                  widget.onEditContact(_contact);
                },
                isLiked: widget.isLiked,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(widget.image),
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
                              '${widget.name} ${widget.surname}',
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
                        widget.work,
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
      ),
    );
  }

  void navigateToEditScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditContactScreen(
          contact: Contact(widget.id, widget.name, widget.surname, widget.work,
              widget.image, widget.bio, widget.phone, false),
          onEditContact: (Contact _contact) {
            widget.onEditContact(_contact);
          },
        ),
      ),
    );
  }
}
