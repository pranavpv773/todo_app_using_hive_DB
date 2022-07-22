import 'package:flutter/material.dart';
import 'package:to_do_flutter_application/db/database_function.dart';
import 'package:to_do_flutter_application/db/modal/data_modal.dart';
import 'package:to_do_flutter_application/screens/edit_task_screen.dart';

class ListAll extends StatelessWidget {
  const ListAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 19, 40, 85),
      child: ValueListenableBuilder(
        valueListenable: tasklistNotifier,
        builder: (BuildContext ctx, List<Task> taskList, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = taskList[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: const Color.fromARGB(150, 8, 72, 128),
                  child: ListTile(
                    title: Text(
                      data.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      data.type,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    leading: const Icon(
                      Icons.square_outlined,
                      color: Colors.white,
                    ),
                    trailing: IconButton(
                      color: Colors.red[100],
                      onPressed: () {
                        if (data.id != null) {
                          deleteTask(data.id!);
                        }
                      },
                      icon: const Icon(Icons.delete),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => EditTask(
                            Task: taskList[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const Divider(
                height: 0,
              );
            },
            itemCount: taskList.length,
          );
        },
      ),
    );
  }
}
