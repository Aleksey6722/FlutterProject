import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: UserPanel(),
  ));
}

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

  int _count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text('itProger User'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30),),
                Text('John Doe', style: TextStyle(
                  fontSize: 25,
                  color: Colors.lime
                ),),
                Padding(padding: EdgeInsets.only(top: 30),),
                CircleAvatar(
                  backgroundImage: NetworkImage('https://proprikol.ru/wp-content/uploads/2020/09/kartinki-milyh-zhivotnyh-52.jpg'),
                  radius: 50,
                ),
                Padding(padding: EdgeInsets.only(top: 20),),
                Row(
                  children: [
                    Icon(Icons.mail_outline, size: 25),
                    Padding(padding: EdgeInsets.only(left: 10),),
                    Text('JohnDoe@mail.ru', style: TextStyle(color: Colors.lime),),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10),),
                Text('Count: $_count')
              ],
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add_box_outlined),
        backgroundColor: Colors.amberAccent,
      ),
    );
  }
}


