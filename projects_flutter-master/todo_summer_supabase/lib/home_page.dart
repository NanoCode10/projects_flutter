import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabasehandler.dart';
import 'todo_tile.dart';
import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? _user;
  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();

  @override
  void intState() {
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void CheckboxChanged(bool? value, int index, AsyncSnapshot snapshot) {
    setState(() {
      snapshot.data[index]['status'] = !snapshot.data[index]['status'];
    });
    future:
    supaBaseHandler.updateData(
        snapshot.data[index]['id'], snapshot.data[index]['status']);
  }

  //Save New task
  void saveNewTask() {
    setState(() {
      supaBaseHandler.addData(_controller.text, false, context);
      _controller.clear();
      supaBaseHandler.readData(context);
    });
    Navigator.of(context).pop();
    //future:
    //supaBaseHandler.updateData(
    //  snapshot.data[index]['id'], snapshot.data[index]['status']);
  }

  ///create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index, AsyncSnapshot snapshot) {
    setState(() {
      supaBaseHandler.deleteData(snapshot.data[index]['id']);
    });
    supaBaseHandler.readData(context);
    //supaBaseHandler.updateData(
    // snapshot.data[index]['id'], snapshot.data[index]['status']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(title: Text('SUMMER LIST'), elevation: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: supaBaseHandler.readData(context),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == null &&
              snapshot.connectionState == ConnectionState.none) {}

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Todotile(
                taskName: snapshot.data[index]['task'],
                taskCompleted: snapshot.data[index]['status'],
                onChanged: (value) => CheckboxChanged(value, index, snapshot),
                deleteFunction: (context) => deleteTask(index, snapshot),
              );
            },
          );
        }),
      ),
    );
  }
}
