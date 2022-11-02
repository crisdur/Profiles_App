import 'package:flutter/material.dart';
import 'package:profiles/screens/profiles_page.dart';
import 'package:profiles/widgets/antpack_gradient.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            antpackGradient("Profiles Database"),
            Align(
              alignment: AlignmentDirectional(0, 0.8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.purple),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfilesPage()));
                  },
                  child: const Text("Ingresar")),
            ),
            Align(
              alignment: AlignmentDirectional(0, -0.4),
              child: Container(
                  height: 320.0,
                  width: 220,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("lib/assets/wp.jpg")),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.5),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.yellow,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('  Your app for profesionals.',
                          style: TextStyle(fontSize: 24.0)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
