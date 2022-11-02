import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  String nombre;
  String number;
  String company;
  String email;

  ContactCard(this.nombre, this.number, this.company, this.email, {super.key});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    final Number = Container(
      margin: EdgeInsets.only(left: 20.0, bottom: 6),
      child: Text(
        widget.number,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 11.0,
        ),
      ),
    );

    final Email = Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Text(
        widget.email,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 11.0),
      ),
    );

    final Company = Container(
      margin: const EdgeInsets.only(left: 3, top: 3, bottom: 8),
      child: Text(
        widget.company,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 13.0, color: Colors.grey),
      ),
    );

    final Name = Container(
      margin: const EdgeInsets.only(left: 20.0, bottom: 6),
      child: Text(
        widget.nombre,
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 15.0),
      ),
    );

    final userInfo = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [Name, Company],
        ),
        Number,
        Email
      ],
    );

    final avatar = Container(
      margin: const EdgeInsets.only(top: 20.0, left: 10.0),
      width: 80.0,
      height: 80.0,
    );

    return Row(
      children: <Widget>[
        const CircleAvatar(
          child: Icon(Icons.account_circle),
        ),
        userInfo,
      ],
    );
  }
}
