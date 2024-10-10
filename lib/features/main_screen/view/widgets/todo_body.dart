import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/main_screen/view_model/add_provider.dart';
import '../../../../core/themes/text_themes.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,

    required this.taskName,
    required this.checkedBoxValue,
    required this.onChanged,
    this.taskSubtitle, this.deleteTask,
  });


  final String taskName;
  final String? taskSubtitle;
  final bool checkedBoxValue;
  final Function(bool?)? onChanged;
  final Function(BuildContext?)? deleteTask;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AddProvider>(context);

    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteTask,
              icon: Icons.delete_outline,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.only(left: 10),
              borderRadius: BorderRadius.circular(25),
            )]),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ]),
        child: ListTile(
          title: Text(
            taskName,
            style: AppText.nunito40size700weight.copyWith(fontSize: 25).copyWith(
                decoration: checkedBoxValue ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(
            taskSubtitle ?? 'No Description',
            style: AppText.nunito40size700weight
                .copyWith(fontSize: 16, color: Colors.grey),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Checkbox(
              activeColor: Colors.black,
              value: checkedBoxValue,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
