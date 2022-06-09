// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final VoidCallback onpressed;
  final String title;
  final String desc;
  const CustomContainer({Key? key,
  required this.onpressed,
  required this.title,
  required this.desc,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(20)
          ),
        //height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,overflow: TextOverflow.fade,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  MaterialButton(
                    color: Colors.red,
                    onPressed: widget.onpressed,
                    child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5),
              child: Text(widget.desc,overflow: TextOverflow.fade,style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}