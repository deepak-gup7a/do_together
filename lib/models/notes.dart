class Note{
  String title="";
  DateTime uploadDate;
  String content="";
  String authorName="";

  Note({this.title,this.uploadDate,this.content,this.authorName});

  Map<String,dynamic>toMap(){
   return {
     "title":title,
     "date":uploadDate.toIso8601String(),
     "content":content,
     "authorname":authorName
   };
  }

}