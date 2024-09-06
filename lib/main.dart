import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('Permitted');
      var contacts = await ContactsService.getContacts();
      setState(() {
        name = contacts;
      });

    } else if (status.isDenied) {
      print('Denied');
      Permission.contacts.request();
    }
  }

  var name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text('+'),
          onPressed: (){
            showDialog(context: context, builder: (context) {
              return DialogUI(name: name, addName: (inputName) async {
                var newPerson = Contact();
                newPerson.givenName = inputName;
                await ContactsService.addContact(newPerson);
                setState(() {
                  name = [...name, newPerson];
                });
              },);
            });
          },
        ),
        appBar: AppBar(
          leading: Icon(Icons.menu), title: Text('ConGPT'),
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
          actions: [
            IconButton(onPressed: (){
              getPermission();
            }, icon: Icon(Icons.contacts))
          ],
        ),
        body: ListView.builder(
          itemCount: name.length,
            itemBuilder: (c, i) {
              return ListTile(
                leading: Image.asset('assets/dog.png'),
                title: Text(name[i].givenName ?? '이름없음'),
              );
            }
        ),
      );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.name, this.addName});
  var inputData = TextEditingController();
  final name;
  final addName;

  @override
  Widget build(BuildContext context) {
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
          TextField(controller: inputData,),
          Container(
            margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){ Navigator.pop(context); }, child: Text('Cancel')),
                TextButton(onPressed: (){
                    addName(inputData.text);
                    Navigator.pop(context);
                  }, child: Text('OK')),
              ],
            ),
          )
        ],
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
