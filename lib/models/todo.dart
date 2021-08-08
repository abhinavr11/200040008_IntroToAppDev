
class Todo {
  final int id;
  final String title;
  final int isDone;
  final int taskId;

  Todo({this.id=0,this.title='New',this.isDone= 0 ,this.taskId=0});
  Map<String, dynamic> toMap()
  {
    return{
      'id' :id,
      'taskId' :taskId,
      'title': title,
      'isDone' : isDone,
    };
  }
}