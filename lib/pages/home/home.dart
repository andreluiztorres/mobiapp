// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobi/pages/login/login.dart';
import '../../components/global.dart' as global;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 34, 44),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.comment, color: Colors.white),
            onPressed: () {},
          ),
        ],
        title: Center(
          child: Text(
            'MOBI',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 34, 34, 44),
        child: Container(
          color: Color.fromARGB(255, 34, 34, 44),
          child: ListView(children: [
            SizedBox(
              height: 210,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 34, 44),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/avatar.png'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 70,
                          left: 70,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.yellow,
                            child: IconButton(
                              icon: Icon(Icons.edit,
                                  color: Colors.black, size: 15),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      global.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      global.email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 196, 196, 199),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: global.lista.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        global.lista[index]['item'],
                        style: TextStyle(
                          color: Color.fromARGB(255, 96, 95, 95),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Icon(
                        global.icones[index],
                        color: Color.fromARGB(255, 96, 95, 95),
                      ),
                      onTap: () {
                        setState(() {
                          global.lista[index]['views'] =
                              global.lista[index]['views'] + 1;
                        });
                        Navigator.of(context).pop();
                      },
                    );
                  }),
            ),
            Divider(
              color: const Color.fromARGB(255, 155, 154, 154),
            ),
            ListTile(
              title: Text(
                'Sair',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ]),
        ),
      ),
      onDrawerChanged: (bool isClosed) {},
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.3,
                crossAxisCount: 2,
              ),
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color.fromARGB(255, 34, 34, 44),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Icon(global.icones[index],
                          color: Colors.yellow, size: 32),
                      SizedBox(height: 10),
                      Text('views: ${global.lista[index]["views"]}',
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                      SizedBox(height: 10),
                      Text(global.lista[index]["item"],
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  )),
                );
              }),
        ),
      ),
    );
  }
}
