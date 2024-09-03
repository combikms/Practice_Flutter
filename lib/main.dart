import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home : MyApp()
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ['김길산', '박등주', '차일두', '피자집'];
  var like = [13, 7, 2, 54];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: (){
            showDialog(context: context, builder: (context) {
              return Dialog(child:
              Container(
                padding: EdgeInsets.all(30),
                width: 400,
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Contact', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                    TextField(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Row(                      
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){}, child: Text('Cancel')),
                          TextButton(onPressed: (){}, child: Text('OK')),
                        ],
                      ),
                    )
                  ],
                ),

              )
              );
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
                leading: Image.asset('dog.png'),
                title: Text(name[i]),
              );
            }
        ),
        bottomNavigationBar: BottomAppBar(
          child: NavBar(),
        ),
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
