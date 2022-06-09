// ignore_for_file: prefer_typing_uninitialized_variables



class Notes{
  final String title;
  final String desc;
  Notes({
    required this.title,
    required this.desc,
  });

  Map<String,dynamic> toMap(){
    return {
      "title":title,
      "desc":desc
    };
  }

}
// using this to display query data
class NotesOutput{
  final int id;
  final String title;
  final String desc;
  NotesOutput({
    required this.id,
    required this.title,
    required this.desc,
  });

  // NotesOutput jsonToObject(Map<String,dynamic> map){
  //   return NotesOutput(id: map["id"], title: map["title"], desc: map["desc"]);
  // }

}