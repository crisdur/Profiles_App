import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profiles/services/remote_service.dart';
import 'package:profiles/widgets/contact_card.dart';
import '../models/user.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  // Api manamegent
  late List<User>? users;
  bool loaded = false;
  List<String> items = [];
  int status = 0;
  bool web = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await RemoteService().getUsers();
    status = await RemoteService().getStus();

    if (status == 200) {
      if (users != null) {
        setState(() {
          loaded = true;
          web = true;
        });
      }
    } else {
      web = false;
    }
  }

  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profiles",
            style: TextStyle(),
          ),
        ),
        body: Center(
            child: web
                ? loaded
                    ? ListView.builder(
                        itemCount: users?.length,
                        itemBuilder: (context, index) {
                          return Container(
                              margin:
                                  const EdgeInsets.only(top: 20.0, left: 20.0),
                              child: ContactCard(
                                  users![index].name,
                                  users![index].phone.toString(),
                                  users![index].company.name,
                                  users![index].email));
                        })
                    : const CircularProgressIndicator()
                : /* Here local Json reading*/ CircularProgressIndicator()));
  }
}
