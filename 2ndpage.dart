
import 'package:flutter/material.dart';


class Todo extends StatefulWidget {
  @override
  TodoState createState() => TodoState();
}
class TodoState extends State<Todo>
{
  // ignore: unused_field
  int _Index=0;
  static int k=0;
  final List<Tasks> _todos = <Tasks>[];
  final TextEditingController _textFieldController = TextEditingController();
  void select(int index)
  {
    setState(() {
      _Index = index;
    });
  }
  
  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Tasks(name: name, completed: false));
    });
    _textFieldController.clear();
  }

  
  Future<void> _display() async {
    return showDialog<void>(
      context: context,
      
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Task',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.brown),
          ),
          content: TextField(
            controller: _textFieldController,
            decoration:  InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                   hintText: 'Task',
                   border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))
            ),
             
            autofocus: true,
          ),
          actions: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                k++;
                _addTodoItem(_textFieldController.text);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
void _handleTodoChange(Tasks todo) {
  setState(() {
    todo.completed = !todo.completed;
  });
}

void _deleteTodo(Tasks todo) {
  setState(() {
    _todos.removeWhere((element) => element.name == todo.name);
  });
}





  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225,225,225),
      
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 225,225,225),
      ),
      
      drawer: const Drawer(),
      

      body: SingleChildScrollView(
        child: Column(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255,216,171,98),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child:Container(
              height: 70,width: 300,
                  alignment: const Alignment(-1, 0),
                      child: const Text(
                        'Manage your Time Well',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
                
              
            ),
        Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Column(children: [
              Container(
                  child: const Text('Categories',
                      style: TextStyle(
                        fontSize: 20,
                      )))
            ])),
        Row(children: [
          Container(
              padding: const EdgeInsets.fromLTRB(35, 30, 10, 10),
              child: Column(children: [
                SizedBox(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Colors.orange[300],
                      onPressed: () {},
                      child: const Icon(Icons.work),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Text('Work'),
                )
              ])),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(children: [
                SizedBox(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Colors.orange[300],
                      onPressed: () {},
                      child: const Icon(Icons.person_2_rounded),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Text('Personal'),
                )
              ])),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(children: [
                SizedBox(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Colors.orange[300],
                      onPressed: () {},
                      child: const Icon(Icons.shopping_basket_rounded),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Text('Shopping'),
                )
              ])),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(children: [
                SizedBox(
                    height: 60,
                    width: 60,
                    child: FloatingActionButton(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: Colors.orange[300],
                      onPressed: () {},
                      child: const Icon(Icons.health_and_safety),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Text('Health'),
                )
              ])),
        ]),
        
        Container(
          padding: const EdgeInsets.fromLTRB(40, 5, 20, 10),
          alignment: Alignment.centerLeft,
          child: Text("You have $k Tasks for today",
              style: TextStyle(
                fontSize: 20,
              )),
        ),
        
        Container(
          
          child: ListView(
          
            shrinkWrap: true,
            
            
            children:_todos.map((Tasks todo) {

              return TodoItem(
                 todo: todo,
               onTodoChanged: _handleTodoChange,
              removeTodo: _deleteTodo
              );
            }).toList(),
        ),
        )
        
      ],
       
    ),),
      
       floatingActionButton: FloatingActionButton(
          onPressed: () => _display(),
          tooltip: "Add a task",
          backgroundColor: Colors.orange[300],
          child: Icon(Icons.add),
        ),

      bottomNavigationBar: NavigationBar(
        height: 65,
        backgroundColor: Colors.grey[700],
        selectedIndex: _Index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        indicatorColor: Colors.orange,
        onDestinationSelected: select,
      
        destinations:  const [
          
          NavigationDestination(
            icon: Icon(Icons.home_filled),
             label: "",)
          ,
          NavigationDestination(
          label: "calendar",
          icon: Icon(Icons.calendar_month_outlined)
        ),
        NavigationDestination(
          label: "task",
          icon: Icon(Icons.task)
        ),
        NavigationDestination(
          label: "settings",
          icon: Icon(Icons.settings)
        ),
        ],
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

}



class Tasks{
  Tasks({required this.name, required this.completed});
  String name;
  bool completed;
}


class TodoItem extends StatelessWidget {
  TodoItem({required this.todo,required this.onTodoChanged,required this.removeTodo}) : super(key: ObjectKey(todo));
  
  final Tasks todo;
  final void Function(Tasks todo) onTodoChanged;
  final void Function(Tasks todo) removeTodo;
  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,10,20,10),

      child: ListTile(
        tileColor: Colors.orange[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: () {
          onTodoChanged(todo);
        },
        leading: Checkbox(
          checkColor: Colors.greenAccent,
          activeColor: Colors.red,
          value: todo.completed,
          onChanged: (value) {},
        ),
        title: Row(children: <Widget>[
          Expanded(
            child: Text(todo.name, style: _getTextStyle(todo.completed)),
          ),
          IconButton(
            iconSize: 30,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            alignment: Alignment.centerRight,
            onPressed: () {
              removeTodo(todo);
              TodoState.k--;
            },
          ),
        ]),
      ),
    );
  }
}
