import 'package:flutter/material.dart';
import 'package:todo_app/pages/initialpage.dart';

import '../model/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,


      body:Container(
        child : Stack(
        children: [
          const SizedBox(height: 150,),
          Row(
            children: [
              const SizedBox(width: 20,),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'TASKMASTER',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                      );
                      await loginAction();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InitialPage()),
                      );
                    },
                    child: Icon(Icons.exit_to_app_outlined,),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
            ],
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'Tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                        hintText: 'Enter a new task',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    ),

    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(

          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black38,
            size:20 ,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: 10,
            minWidth: 25,
          ),

          border: InputBorder.none,
          hintText: 'Search for Tasks',
          hintStyle: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }

  }
Future<bool> loginAction() async {
  //replace the below line of code with your login request
  await new Future.delayed(const Duration(seconds: 2));
  return true;
}
