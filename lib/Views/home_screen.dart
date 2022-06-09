// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_local_storage/Controller/controller.dart';
import 'package:notes_app_local_storage/Models/custom_container.dart';
import 'package:notes_app_local_storage/Views/edit_note_screen.dart';
import 'package:notes_app_local_storage/Views/notes_screen.dart';

import '../Models/notes_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes v1.0.0"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(()=> NotesScreen());
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: NotesController.getNotes(),
        builder: (context ,AsyncSnapshot<List<NotesOutput>> snapshot){
          if(!snapshot.hasData){
            return Center(child: Text("Click the \"+\" icon to add notes"),);
          }else{
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.to(()=>EditNoteScreen(title: snapshot.data![index].title, desc: snapshot.data![index].desc));
                  
                  },
                  child: CustomContainer(
                    title:snapshot.data![index].title, 
                    desc: snapshot.data![index].desc,
                    onpressed: () async{
                      await NotesController.deleteNotes(Notes(title: snapshot.data![index].title, desc: snapshot.data![index].desc));
                      setState(() {
                        
                      });
                    },
                    ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
