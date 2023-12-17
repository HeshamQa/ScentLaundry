
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';

class CustomItems extends StatefulWidget {
  final List<QueryDocumentSnapshot> data;
  const CustomItems({
    super.key, required this.data,
  });

  @override
  State<CustomItems> createState() => _CustomItemsState();
}

class _CustomItemsState extends State<CustomItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) => Container(
          height: getProportionateScreenHeight(85),
          width: getProportionateScreenWidth(375),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black54,blurRadius: 10,spreadRadius: 2)
            ]
          ),
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(15)),
          child: Row(
            children: [
              Image.network(
                widget.data[index]['Image'],
                height: getProportionateScreenHeight(65),
                width: getProportionateScreenWidth(85),
                fit: BoxFit.fill,
              ),
              const Spacer(flex: 1,),
              Text(widget.data[index]['Name'],style: const TextStyle(fontSize: 20),),
              const Spacer(flex: 2,),
              Text('${widget.data[index]['price']}JOD',style: const TextStyle(fontSize: 16,fontFamily: 'Inter'),),
              const Spacer(flex: 2,),
              InkWell(
                  onTap: (){},
                  child: const Text("-",style: TextStyle(fontSize: 25),)),
              const Spacer(flex: 1,),
              const Text('0',style: TextStyle(fontSize:20),),
              const Spacer(flex: 1,),
              const Text("+",style: TextStyle(fontSize: 25),),
              const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
