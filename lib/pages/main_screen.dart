import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              Text('Главный экран', style: TextStyle(color: Colors.white),),
              Padding(padding: EdgeInsets.only(top: 30)),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, '/todo');
              }, child: Text('К списку дел'))
            ],
          ),
        ],
      ),
    );
  }
}
