import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/item_provider.dart';
import 'package:scentlaundry/controller/providers/cartprovider.dart';
import 'package:scentlaundry/screens/UserScreen/CategoryScreen/components/itemContainer.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';

class CustomItems extends StatefulWidget {
  final String id;
  const CustomItems({
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
Map<int,int> counter= {};
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
                if (!counter.containsKey(int.parse(value.listItem[index].id))) {
                  counter[int.parse(value.listItem[index].id)] = 0;
                }
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
                          onTap: () {
                            setState(() {
                              if (counter[int.parse(value.listItem[index].id)]! > 0) {
                                counter[int.parse(value.listItem[index].id)] = counter[int.parse(value.listItem[index].id)]! - 1;
                              }
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "-",
                              style: TextStyle(fontSize: 37),
                            ),
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        counter[int.parse(value.listItem[index].id)].toString(),
                        style: const TextStyle(fontSize: 23),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              counter[int.parse(value.listItem[index].id)] = counter[int.parse(value.listItem[index].id)]! + 1;
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "+",
                              style: TextStyle(fontSize: 35),
                            ),
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
              child: CustomButton(press: () {
                counter.forEach((key, value) {
                  if(value!=0){
                    Provider.of<CartProvider>(context,listen: false).addToCart(iditem: key, idcategories: widget.id, count: value);
                    setState(() {
                      counter[key]=0;
                    });
                  }
                });
              }, title: "Add To Cart"),
            ))
      ],
    );
  }
}
