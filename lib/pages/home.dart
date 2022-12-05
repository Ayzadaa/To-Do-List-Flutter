import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String userTodo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(
      [
        'Купить молоко',
        'приготовить ужин',
        'прочитать книгу',
        'сделать домашку',
        'сходить в театр',
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Список дел'),
        centerTitle: true,
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
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Text(
          'Нажми',
          style: TextStyle(color: Colors.white, fontSize: 10.0),
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Добавить в список'),
                  content: TextField(
                    onChanged: (String value) {
                      userTodo = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          todoList.add(userTodo);
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text('Добавить'),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
