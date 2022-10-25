import 'package:contacts/entities/contacts_list.dart';
import 'package:flutter/material.dart';

class LikedContacts extends StatefulWidget {
  final Contact contact;
  final Function(Contact) onEditContact;
  bool isLiked;
  LikedContacts({Key? key, required this.contact,
    required this.onEditContact, required this.isLiked}) : super(key: key);

  @override
  _LikedContactsState createState() => _LikedContactsState();
}

class _LikedContactsState extends State<LikedContacts> {
  bool isLiked = false;

  void _toggleFavorite() async {
    setState(() {
      if (widget.isLiked) {
        widget.isLiked = false;
        isLiked = false;
      }
      else {
        widget.isLiked = true;
        isLiked = true;
      }
    });
    setState(() {
      widget.contact.isLiked = isLiked;
    });
    widget.onEditContact(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 15.0,
            left: 0.0,
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (widget.isLiked
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
