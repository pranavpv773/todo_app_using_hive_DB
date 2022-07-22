import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_flutter_application/db/modal/data_modal.dart';
import 'package:to_do_flutter_application/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Ensure plugin services are initialized
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskAdapter().typeId)) {
    Hive.registerAdapter(TaskAdapter());
  }
  runApp(const ToDO());
}

class ToDO extends StatelessWidget {
  const ToDO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TODoHome(),
    );
  }
}
