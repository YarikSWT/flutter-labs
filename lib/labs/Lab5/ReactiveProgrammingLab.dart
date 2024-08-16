import 'package:flutter/material.dart';

import './AddTodo.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);Ч

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// list of todos
  List<TodoLab> todos = initialTodos;
  List<TodoLab> todosOriginal = initialTodos;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('App Title'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // TODO go to the AddTodo() and get the new todo object from it
          var response = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return AddTodo();
          }));
          TodoLab newTodo = new TodoLab(
              name: response.name,
              priority: response.priority,
              hours: response.hours,
              description: response.description);
          setState((){
            todosOriginal = [...todosOriginal, newTodo];
            todos = [...todosOriginal];
          });
        },
        child: const Icon(Icons.add),
      ),
      body: myWidget(),
    );
  }

  Widget myWidget() {
    return Column(
      children: [
        Text(
            // TODO add the total hours here
            'Total hours to finish ' +
                todos
                    .map((el) => el.hours)
                    .reduce((value, element) => value + element)
                    .toString(),
            style: TextStyle(fontSize: 24, fontFamily: 'Eczar')),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: [
            InkWell(
                onTap: () {
                  // TODO do duplicate todos here
                  todos = [...todos, ...todos];
                  setState(() {});
                },
                child: Chip(
                    label: Icon(Icons.copy_sharp),
                    backgroundColor: Colors.purpleAccent)),
            InkWell(
                onTap: () {
                  // TODO do sort ascending todos here
                  todos.sort((a, b) => b.hours.compareTo(a.hours));
                  setState(() {});
                },
                child: Chip(
                    label: Icon(Icons.sort),
                    backgroundColor: Colors.amberAccent)),
            InkWell(
                onTap: () {
                  // TODO do sort descending todos here
                  todos.sort((a, b) => a.hours.compareTo(b.hours));
                  setState(() {});
                },
                child: Chip(
                    label: Icon(Icons.sort_by_alpha_rounded),
                    backgroundColor: Colors.deepOrangeAccent)),
            InkWell(
                onTap: () {
                  // TODO do obfuscate ascending todos here
                  todos = todos
                      .map((el) => TodoLab(
                          name: el.name.replaceAll(RegExp(r'.'), '￭'),
                          hours: el.hours,
                          priority: el.priority))
                      .toList();
                  setState(() {});
                },
                child: Chip(
                    label: Icon(Icons.remove_red_eye_rounded),
                    backgroundColor: Colors.tealAccent)),
            InkWell(
                onTap: () {
                  //TODO Mute: make all hours to complete 0, all properties to low and uppercase the title
                  todos = todos
                      .map((el) => TodoLab(
                          name: el.name.toUpperCase(),
                          hours: 0,
                          priority: "low"))
                      .toList();
                  setState(() {});
                },
                child: Chip(
                    label: Icon(Icons.music_off),
                    backgroundColor: Colors.lightBlueAccent)),
            InkWell(
                onTap: () {
                  // TODO display first 3  todos here
                  todos = todos.sublist(0, 3);
                  setState(() {});
                },
                child: Chip(
                    label: Text('First 3'),
                    backgroundColor: Colors.limeAccent)),
            InkWell(
                onTap: () {
                  // TODO display last 3  todos here
                  todos = todos.sublist(todos.length - 3, todos.length);
                  setState(() {});
                },
                child: Chip(
                    label: Text('Last 3'),
                    backgroundColor: Colors.deepPurpleAccent)),
            InkWell(
                onTap: () {
                  // TODO filter todos by high here
                  // todos.sort((a, b) => prioritiesSortComparison(a, b) * -1);
                  setState(() {
                    todos = todos.where((el) => el.priority == 'high').toList();
                  });
                },
                child: Chip(
                  label: Text('High'),
                  backgroundColor: Colors.redAccent,
                )),
            InkWell(
                onTap: () {
                  // TODO filter todos by low here
                  // todos.sort((a, b) => prioritiesSortComparison(a, b));
                  setState(() {
                    todos = todos.where((el) => el.priority == 'low').toList();
                  });
                },
                child: Chip(
                    label: Text("Low"), backgroundColor: Colors.greenAccent)),
            InkWell(
                onTap: () {
                  // TODO clear filter
                  setState(() {
                    todos = [...todosOriginal];
                  });
                },
                child: Chip(
                    label: Text("Clear Filter"),
                    backgroundColor: Colors.indigoAccent)),
          ],
        ),
        Divider(),
        buildList(),
      ],
    );
  }

  Expanded buildList() {
    // TODO build the list of todos here using map
    return Expanded(
        child: ListView(
      children: todos
          .map((el) => ListTile(
              title: Text(el.name, style: TextStyle(fontSize: 23)),
              subtitle: Text('-Hours ${el.hours}'),
              leading: Icon(Icons.list),
              trailing: Text(
                el.priority.toUpperCase(),
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Eczar', color: Colors.purple),
              )))
          .toList(),
    ));
  }
}

class TodoLab {
  String name;
  String description;
  String priority;
  int hours;

  TodoLab(
      {this.name = '',
      this.description = "",
      this.priority = "low",
      this.hours = 1});
}

List<TodoLab> initialTodos = [
  TodoLab(name: "Flutter Lecture", priority: "high", hours: 3),
  TodoLab(name: "Flutter Lab", priority: "high", hours: 3),
  TodoLab(
      name: "DevOps Assignments",
      description: "Labs 7 & 8",
      priority: "low",
      hours: 2),
  TodoLab(name: "Gym", hours: 2),
  TodoLab(name: "Basketball", description: "Basketball outdoor area, 4pm"),
  TodoLab(
      name: "Game Night",
      description: "Play Valorant with friends",
      priority: "mid",
      hours: 1),
];

int prioritiesSortComparison(TodoLab a, TodoLab b) {
  final priorityA = a.priority;
  final priorityB = b.priority;
  if (priorityA == 'low' && priorityB != ' low') {
    return -1;
  } else if ((priorityA == 'high' && priorityB != 'high') ||
      (priorityA == 'mid' && priorityB != 'mid' && priorityB != 'high')) {
    return 1;
  } else {
    return 0;
  }
}
