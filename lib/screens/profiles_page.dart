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
  late List<User?> users;
  bool loaded = false;
  List<String> items = [];
  int status = 0;
  bool web = false;

  //Scroll Integration
  final controller = ScrollController();
  int page = 1;

  bool hasmore = true;

  @override
  void initState() {
    super.initState();
    getData();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getData() async {
    const limited = 15;

    status = await RemoteService().getStus();

    if (status == 200) {
      users = (await RemoteService().getUsers())!;

      if (users != null) {
        setState(() {
          page++;
          loaded = true;
          web = true;

          if (users.length < limited) {
            hasmore = false;
          }
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
                        controller: controller,
                        itemCount: users.length + 1,
                        itemBuilder: (context, index) {
                          if (index < users.length) {
                            return Container(
                                margin: const EdgeInsets.only(
                                    top: 20.0, left: 20.0),
                                child: ContactCard(
                                    users[index]!.name,
                                    users[index]!.phone.toString(),
                                    users[index]!.company.name,
                                    users[index]!.email));
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Center(
                                child: hasmore
                                    ? const CircularProgressIndicator()
                                    : const Text('No More Data To Load'),
                              ),
                            );
                          }
                        })
                    : const CircularProgressIndicator()
                : /* Here local Json reading*/ CircularProgressIndicator()));
  }
}
