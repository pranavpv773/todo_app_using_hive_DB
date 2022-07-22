import 'package:flutter/material.dart';
import 'package:to_do_flutter_application/db/database_function.dart';
import 'package:to_do_flutter_application/db/modal/data_modal.dart';
import 'package:to_do_flutter_application/screens/list_all.dart';
import 'package:to_do_flutter_application/screens/new_task.dart';

ValueNotifier<List<Task>> temp = ValueNotifier([]);

class TODoHome extends StatefulWidget {
  const TODoHome({Key? key}) : super(key: key);

  @override
  State<TODoHome> createState() => _TODoHomeState();
}

class _TODoHomeState extends State<TODoHome> {
  String _value = 'list';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getallTasks();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 50, 90),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        leading: const Icon(
          Icons.check_circle,
          size: 30,
        ),
        title: DropdownButton<String>(
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.white,
          ),
          dropdownColor: const Color.fromARGB(255, 6, 76, 133),
          value: _value,
          onChanged: (value) {
            setState(() => _value = value!);
          },
          underline: const DropdownButtonHideUnderline(child: Center()),
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(
                    Icons.home_filled,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "All Lists",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'list',
            ),
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(
                    Icons.format_list_bulleted_rounded,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Default",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'default',
            ),
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(Icons.format_list_bulleted_rounded),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Personal",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'personal',
            ),
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(Icons.format_list_bulleted_rounded),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Shopping",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'shopping',
            ),
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(
                    Icons.format_list_bulleted_rounded,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Wishlist",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'wishlist',
            ),
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(Icons.format_list_bulleted_rounded),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Work",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'work',
            ),
            DropdownMenuItem(
              child: Row(
                children: const [
                  Icon(Icons.check_box),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Finished",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              value: 'finished',
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.search_outlined,
            ),
          ),
          IconButton(
            onPressed: (() {}),
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const NewTask(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 8, 72, 128),
          size: 40,
        ),
      ),
      body: const ListAll(),
    );
  }
}
