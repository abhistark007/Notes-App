// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_local_storage/Controller/controller.dart';
import 'package:notes_app_local_storage/Models/notes_model.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();


  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TextField(
                controller: titleController,
              ),
              TextField(
                controller: descController,
              ),
              MaterialButton(onPressed: (){
                NotesController.insert(Notes(title: titleController.text, desc: descController.text));
                Get.back();
                setState(() {
                  
                });
              },
              child: Text("Add Note"),),
            ],
          ),
        ),
      ),
    );
  }
}