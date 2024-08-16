import 'package:flutter/material.dart';
import './ReactiveProgrammingLab.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final _formKey = GlobalKey<FormState>();

  late TodoLab newTodo = TodoLab();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text("New Todo Form")),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Enter todo name',
                          helperText: 'Name should not be empty',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.label),
                          filled: true),
                      validator: (value) {
                        // TODO do validation here
                        if (value == null || value.length == 0)
                          return "Please enter some text";
                      },
                      onChanged: (value) {
                        newTodo.name = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter todo description',
                          helperText: 'Description should be less than 20',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.textsms),
                          filled: true),
                      validator: (value) {
                        // TODO do validation here
                        if (value == null || value.length == 0)
                          return "Please enter some text";
                        return null;
                      },
                      onChanged: (value) {
                        // TODO get values from here
                        newTodo.description = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Enter todo hours to complete',
                          helperText: 'Hours should not be 0',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.warning),
                          filled: true),
                      validator: (value) {
                        // TODO do validation here
                        if (value == null || value.length == 0)
                          return "Please enter number here";
                        if (!RegExp(r'^[0-9]+$').hasMatch(value))
                          return "Please enter a number";
                        return null;
                      },
                      onChanged: (value) {
                        // TODO get values from here
                          newTodo.description = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Enter todo Priority',
                          helperText: 'Priority must be one of: high, mid, low',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.tag),
                          filled: true),
                      validator: (value) {
                        // TODO do validation here
                        if (value == null || value.length == 0)
                          return "Please enter priority";
                        if (['high', 'mid', 'low'].indexOf(value) == -1)
                          return "Please enter correct priority";
                        return null;
                      },
                      onChanged: (value) {
                        newTodo.priority = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // TODO do Form validation here
                        if (_formKey.currentState!.validate()){
                          Navigator.pop(context, newTodo);
                        }
                      },
                      child: const Text('Add todo'),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}