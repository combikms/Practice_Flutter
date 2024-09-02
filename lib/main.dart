import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu), title: Text('CalGPT'),
          titleTextStyle: TextStyle(
            fontSize: 20,
          ),
        ),


        body: Container(
          width: double.infinity, height: 200,
            padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 150,
                child: Image.asset('assets/dog.png'),
              ),
              Container(
                width: 380,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'iPhone 15 Pro Max 1TB',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    ),
                    Text(
                      '구미시 양호동 | 끌올 10분전',
                      style: TextStyle(
                        color: Colors.black38
                      )
                    ),
                    Text(
                      '1,500,000원',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(' ♡ ', style: TextStyle(fontSize: 25)),
                        Text('4', style: TextStyle(fontSize: 20)),
                      ],
                    )
                  ],
                )
              )
            ],
          )


        ),

        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.phone),
              Icon(Icons.message),
              Icon(Icons.contact_page),
            ],
          )
        ),
      )
    );
  }
}
