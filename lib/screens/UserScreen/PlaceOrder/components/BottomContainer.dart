import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/dragged_adress_provider.dart';
import 'package:scentlaundry/screens/UserScreen/PlaceOrder/components/maplocationpicker.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';
import '../../../../utils/Widget/Custom_Container.dart';
import 'CurrentLoc.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({
    super.key,
  });

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}
class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(200),
      child: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(10)),
                const CurrentLoc(),
                SizedBox(height: getProportionateScreenHeight(10),),
                Consumer<AddressProvider>(
                  builder: (context, addressModel, child) {
                    return Text(addressModel.address);
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      press: () async {
                        if (isPointInPolygon(latLng, irbidPolygon.points)) {
                          Get.toNamed(Approute.PickupDayScreen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("The service is not available in your area.COMING SOON")),
                          );
                        }
                      },
                      title: "Next",
                    )
                  ),
                ),
              ],
            ),
          )),
    );
  }
  bool isPointInPolygon(LatLng point, List<LatLng> vertices) {
    int intersectCount = 0;
    for (int j = 0, i = vertices.length - 1; j < vertices.length; i = j++) {
      if (((vertices[j].latitude > point.latitude) != (vertices[i].latitude > point.latitude)) &&
          (point.longitude < (vertices[i].longitude - vertices[j].longitude) *
              (point.latitude - vertices[j].latitude) /
              (vertices[i].latitude - vertices[j].latitude) + vertices[j].longitude)) {
        intersectCount++;
      }
    }
    return intersectCount % 2 == 1; // Odd count means the point is inside the polygon
  }
}
