import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';

class CustomItems extends StatefulWidget {
  const CustomItems({super.key,});

  @override
  State<CustomItems> createState() => _CustomItemsState();
}
class _CustomItemsState extends State<CustomItems> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                height: getProportionateScreenHeight(85),
                width: getProportionateScreenWidth(375),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          spreadRadius: 2)
                    ]),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenHeight(15)),
                child: Row(
                  children: [
                    Image.network(
                      "widget.data[index]['Image']",
                      height: getProportionateScreenHeight(65),
                      width: getProportionateScreenWidth(85),
                      fit: BoxFit.fill,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "widget.data[index]['Name']",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      'widget.data[index]["price"]${S.of(context).JOD}',
                      style: const TextStyle(fontSize: 16, fontFamily: 'Inter'),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    InkWell(
                        onTap: () {},
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 25),
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "list[index].toString()",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                        onTap: () {},
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 25),
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20),
                  horizontal: getProportionateScreenWidth(30)),
              child: CustomButton(press: () {}, title: "Add To Cart"),
            ))
      ],
    );
  }
}
