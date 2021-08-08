import 'package:flutter/material.dart';
import 'package:what_todo_app/database_helper.dart';
import 'package:what_todo_app/models/task.dart';
import 'package:what_todo_app/models/todo.dart';
import 'package:what_todo_app/widgets.dart';
class Taskpage extends StatefulWidget {
final Task task;
Taskpage({ this.task});

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
String _tasktitle ="";
  @override
  void initState()
  {
   if(widget.task != null ){
     _tasktitle = widget.task.title;

   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 6.0,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                            vertical: 24.0,
                            horizontal: 20.0,
                          ),
                          child: Image(
                            image: AssetImage(
                              'assets/images/back_arrow_icon.png'
                            ),
                          ),
                        ),
                      ),
                     Expanded(
                         child: TextField(
                           onSubmitted: (value) async {
                            DatabaseHelper _dbHelper = DatabaseHelper();
                            if(value !="")
                              {
                                if(widget.task == null){
                                DatabaseHelper _dbHelper = DatabaseHelper();
                                Task _newTask = Task(
                                  title: value
                                );
                                await  _dbHelper.insertTask(_newTask);
                                }
                                else{
                                  print("update extisting task");
                                }

                              }
                           },
                           controller: TextEditingController()..text= _tasktitle,
                           decoration: InputDecoration(
                             hintText: "Name of Task",
                             border: InputBorder.none,
                             contentPadding: EdgeInsets.symmetric(
                                 horizontal: 15.0,
                               )

                           ),
                           style: TextStyle(
                             fontSize: 26.0,
                             fontWeight: FontWeight.bold,
                             color: Color(0xFF211551),

                           ),
                         ),
                     )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 12.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Description fot the task ...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding (
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0
                          ),
                          child: Container(
                            width: 20.0,
                            height: 20.0,
                            margin: EdgeInsets.only(right: 16.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(6.0),
                                border: Border.all(
                                  color: Color(0xFF868290),
                                  width: 1.5,
                                )
                            ),

                            child: Image(
                              image: AssetImage(
                                  'assets/images/check_icon.png'
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if(value !="")
                              {
                                if(widget.task != null){
                                  DatabaseHelper _dbHelper = DatabaseHelper();
                                  Todo _newTodo = Todo(
                                      title: value,
                                    isDone :0,
                                    taskId: widget.task.id,

                                  );
                                  await  _dbHelper.insertTodo(_newTodo);
                                }


                              }
                            },
                            decoration: InputDecoration(
                              hintText: "Enter item",
                              border: InputBorder.none,
                            ),

                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 24.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Taskpage()
                    ),
                  );
                },
                child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color:  Color(0xFFFE3577),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image(
                    image: AssetImage(
                      "assets/images/delete_icon.png",
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
