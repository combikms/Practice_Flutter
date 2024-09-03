import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['김길산', '박등주', '차일두', '피자집'];
  var like = [13, 7, 2, 54];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState(() {
              a += 1;
            });
          },
        ),
        appBar: AppBar(
          leading: Icon(Icons.menu), title: Text('ConGPT'),
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),
        body: ListView.builder(
          itemCount: name.length,
            itemBuilder: (c, i) {
              return ListTile(
                leading: Text(like[i].toString(), style: TextStyle(fontSize: 15),),
                title: Text(name[i]),
                trailing: TextButton(onPressed: () {
                  setState(() {
                    like[i] += 1;
                  });
                }, child: Text('좋아요'))
              );
            }
        ),
        bottomNavigationBar: BottomAppBar(
          child: NavBar(),
        ),
      )
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.phone),
        Icon(Icons.message),
        Icon(Icons.contact_page),
      ],
    );
  }
}
