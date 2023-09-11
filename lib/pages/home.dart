import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userToDo = '';
  List todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.addAll(['Buy milk', 'Go for a walk', 'Wash dishes']);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Меню'),
            backgroundColor: Colors.deepOrange,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Text('Навигация'),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                      },
                      child: Text('На главную')),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(context, '/todo', (route) => false);
                      },
                      child: Text('К списку дел'))
                ],
              ),
            ],
          )

        );
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
              onPressed: _menuOpen,
              icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todoList[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todoList[index]),
                    trailing: IconButton(
                      onPressed: (){
                        setState(() {
                          todoList.removeAt(index);
                        });
                      },
                      icon: Icon(
                          Icons.delete_sweep,
                          color: Colors.deepOrange,
                      ),
                    ),),
                ),
                onDismissed:(direction) {
                  setState(() {
                    todoList.removeAt(index);
                  });
                },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: (){
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить элемент'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    todoList.add(_userToDo);
                  });
                  Navigator.of(context).pop();
                }, child: Text('Добавить'))
              ],
            );
          });
        },
        child: Icon(Icons.add_box, color: Colors.black,),
      ),
    );
  }
}
