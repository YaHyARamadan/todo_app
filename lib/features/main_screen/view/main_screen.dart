import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/main_screen/view/widgets/todo_body.dart';
import '../../../core/themes/text_themes.dart';
import '../view_model/add_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.black,

          title: Text(
            'Todo App',
            style:
                AppText.openSans30size700weight.copyWith(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => provider.taskAdd(context),
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: ListView.builder(
          itemCount: provider.todoList.length,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: ToDoList(
                  taskName: provider.todoList[index][0],
                  taskSubtitle:provider.todoList[index][1],
                  checkedBoxValue: provider.todoList[index][2],
                  onChanged: (value) => provider.checkBoxOnChange(index),
                  deleteTask: (context) => provider.deleteTask(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
