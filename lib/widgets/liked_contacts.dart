import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          margin: const EdgeInsets.only(
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
