import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/ItemProvider.dart';
import 'package:scentlaundry/screens/UserScreen/CategoryScreen/components/itemContainer.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';

class CustomItems extends StatefulWidget {
  var id;
  CustomItems({
    super.key,
    required this.id
  });

  @override
  State<CustomItems> createState() => _CustomItemsState();
}

class _CustomItemsState extends State<CustomItems> {
  @override
  void initState() {
    Provider.of<ItemProvider>(context, listen: false).getItem(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
          child: Consumer<ItemProvider>(
            builder:
                (BuildContext context, ItemProvider value, Widget? child) =>
                    ListView.builder(
              itemCount: value.listItem.length,
              itemBuilder: (context, index) {
                return ItemContainer(
                  child: Row(
                    children: [
                      Image.network(
                        value.listItem[index].image,
                        height: getProportionateScreenHeight(65),
                        width: getProportionateScreenWidth(85),
                        fit: BoxFit.fill,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        value.listItem[index].name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Text(
                        '${value.listItem[index].price}${S.of(context).JOD}',
                        style:
                            const TextStyle(fontSize: 16, fontFamily: 'Inter'),
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
                      const Text(
                        "0",
                        style: TextStyle(fontSize: 20),
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
