import 'package:flutter/material.dart';
import './task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> w=[];
  List<TaskModel> tasks = [
    TaskModel(title: 'Flutter'),
    TaskModel(title: 'API'),
    TaskModel(title: 'PROVIDER'),
    TaskModel(title: 'HTTP', subTitle: "SUB http"),
  ];
  @override
  Widget build(BuildContext context) {
      final title = TextEditingController();
      final subTitle = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title:const Center(child: Text("ToDo List"))
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      width: 50,
                      height: 300,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                           TextField(
                          controller:title ,

                            ),
                             const SizedBox(
                              height: 20,
                            ),
                             TextField(
                                controller:subTitle ,
                             ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      if ((title.text ).isEmpty ){
                                     // Navigator.pop(context);
                                      showAlertDialog(BuildContext context) {

  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { },
  );

  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
                                     }else{
                                      tasks.add(TaskModel(title: title.text,subTitle:subTitle.text));
                                      Navigator.pop(context);
                                      }
                                    });
                                  },
                                  color: Colors.green,
                                  child: Row(
                                    children: const [
                                      Text(
                                        'ADD',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.add)
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  color: Colors.green,
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      body: ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                         
                            title: Text(tasks[index].title),
                            subtitle: Text(tasks[index].subTitle ?? ''),
                         
                          trailing:InkWell(child: const Icon(Icons.delete),
                          onTap: (){
                            setState(() {
                              tasks.remove(tasks[index]);
                            });
                          },),
                         leading: Checkbox(
                                value: tasks[index].isDone,
                                onChanged: (value) {
                                  setState(() {
                                    tasks[index].isDone = !tasks[index].isDone;
                                  });
                               }),
                            
                            );
                        })
    );
  }
}
