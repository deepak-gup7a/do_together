import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_together/models/User.dart';
import 'package:do_together/models/task.dart';
import 'package:flutter/material.dart';

class DatabaseService{
  String uid;

  DatabaseService({this.uid});

  final CollectionReference _reference = FirebaseFirestore.instance.collection('user');

  Future updateUserTask(Task task)async{
    DocumentReference dr = _reference.doc(uid).collection("Task").doc(task.UID);
    return await dr.set({
        "taskName":task.taskName,
        "taskDes":task.taskDescription,
        "done":task.isDone
      }
    );
  }

List<Task>_getTaskFromSnapshot(QuerySnapshot snapshot){
    // print(snapshot.docs.length);
    return snapshot.docs.map((e) {
      return Task(e.id, e.data()["taskName"], e.data()["taskDes"], e.data()["done"]);
    }).toList();
}

  Stream<List<Task>>get task{
    return _reference.doc(uid).collection("Task").snapshots().map(_getTaskFromSnapshot);
  }

  Future toggleTask(Task task)async{
    Task task1 = Task(task.UID,task.taskName,task.taskDescription,!task.isDone);
    await updateUserTask(task1);
  }

  Future deleteTask(Task task)async{
    DocumentReference dr = _reference.doc(uid).collection("Task").doc(task.UID);
    await dr.delete();
  }

}