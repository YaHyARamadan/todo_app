import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // For encoding and decoding the task list

import '../../../core/themes/text_themes.dart';
import '../view/widgets/CustomtextFormField.dart';

class AddProvider extends ChangeNotifier {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List todoList = [];

  AddProvider() {
    loadTasks();
  }

  void checkBoxOnChange(int index) {
    todoList[index][2] = !todoList[index][2];
    saveTasks();
    notifyListeners();
  }

 taskAdd(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Task Setting'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextForm(
                  title: "Enter Your Task",
                  textEditingController: taskController,
                  textInputType: TextInputType.text,
                ),
                CustomTextForm(
                  title: "Enter Description of Task",
                  textEditingController: descriptionController,
                  textInputType: TextInputType.text,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Add',
                style: AppText.openSans22size700weight
                    .copyWith(color: Colors.black, fontSize: 18),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  addNewTask();
                  Navigator.of(context).pop();
                  taskController.clear();
                  descriptionController.clear();
                }
              },
            ),
            const SizedBox(
              width: 100,
            ),
            TextButton(
              child: Text(
                'Cancel',
                style: AppText.openSans22size700weight
                    .copyWith(color: Colors.red, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addNewTask() {
    todoList.add([taskController.text,descriptionController.text ,false]);
    saveTasks();
    notifyListeners();
  }

  void deleteTask(int index) {
    todoList.removeAt(index);
    saveTasks();
    notifyListeners();
  }

 saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(todoList);
    prefs.setString('todoList', encodedData);
  }

  loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('todoList');

    if (tasksString != null) {
      todoList = List<List<dynamic>>.from(
        jsonDecode(tasksString).map((item) => List<dynamic>.from(item)),
      );
    }
    notifyListeners();
  }
}
