import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nh_food_delivery/base/custom_button.dart';
import 'package:nh_food_delivery/pages/address/widgets/search_location_dialogue_page.dart';
import 'package:nh_food_delivery/routes/route_helper.dart';
import 'package:nh_food_delivery/utils/colors.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/location_controller.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromSignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;
  const PickAddressMap({Key? key, required this.fromSignup, required this.fromAddress, this.googleMapController}) : super(key: key);

  @override
  _PickAddressMapState createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initalPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Get.find<LocationController>().addressList.isEmpty){
      _initalPosition = LatLng(15.97527, 108.25216);
      _cameraPosition = CameraPosition(target: _initalPosition, zoom: 17);
    }else{
      if(Get.find<LocationController>().addressList.isNotEmpty){
        _initalPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(Get.find<LocationController>().getAddress["longitude"])
        );
        _cameraPosition = CameraPosition(target: _initalPosition, zoom: 17);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController){
      return Scaffold(
          body: SafeArea(
            child: Center(
              child: SizedBox(
                width: double.maxFinite,
                child: Stack(
                  children: [
                    GoogleMap(initialCameraPosition: CameraPosition(
                        target: _initalPosition, zoom:17

                    ),
                      zoomControlsEnabled: false,
                      onCameraMove: (CameraPosition cameraPosition){
                        _cameraPosition = cameraPosition;
                      },
                      onCameraIdle: (){
                        Get.find<LocationController>().updatePosition(_cameraPosition, false);
                      },
                      onMapCreated: (GoogleMapController mapcontroller){
                        _mapController = mapcontroller;
                        if(!widget.fromAddress){
                          print("pick from web");
                        }
                      },
                    ),
                    Center(
                      child: !locationController.loading ? Image.asset("assets/image/pick_marker.png",
                      height: 50, width: 50,) : CircularProgressIndicator(),
                    ),
                    Positioned(
                      top: Dimensions.height45,
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        child: InkWell(
                          // onTap: () => Get.dialog(LocaTionDialogue(mapController: _mapController)),
                          onTap: () => Get.back(),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(20/2)
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, size: 25, color: AppColors.yellowColor),
                                Expanded(child: Text(
                                  locationController.pickPlacemark.name != null &&  locationController.pickPlacemark.name != "Unknow Location Found" ?
                                  '${locationController.pickPlacemark.name??''}' : "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                SizedBox(width: Dimensions.width10,),
                                Icon(Icons.search, size: 25, color: AppColors.yellowColor)
                              ],
                            ),
                          ),
                        ),
                    ),
                    Positioned(
                      bottom: 80,
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                        child: locationController.isLading ? Center(child: CircularProgressIndicator(),) : CustomButton(
                          buttonText: "Pick Address",
                          onPressed: (locationController.loading) ? null : (){
                            if(locationController.pickPosition.latitude != 0 && locationController.pickPlacemark.name != null){
                              if(widget.fromAddress){
                                if(widget.googleMapController != null){
                                  print("Now you can clicked on this");
                                  widget.googleMapController!.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(
                                      locationController.pickPosition.latitude,
                                      locationController.pickPosition.longitude
                                  ))));
                                  locationController.setAddAddressData();
                                }
                                Get.toNamed(RouteHelper.getAddressPage());
                              }
                            }
                          },
                        )
                    )
                    // Positioned(
                    //     bottom: 80,
                    //     left: Dimensions.width20,
                    //     right: Dimensions.width20,
                    //     child: locationController.isLading ? Center(child: CircularProgressIndicator(),) : CustomButton(
                    //       buttonText: locationController.inZone ? (widget.fromAddress ? "Pick Address" : "Pick Location") : "Service is not available in your area",
                    //       onPressed: (locationController.buttonDisable || locationController.loading) ? null : (){
                    //         if(locationController.pickPosition.latitude != 0 && locationController.pickPlacemark.name != null){
                    //           if(widget.fromAddress){
                    //             if(widget.googleMapController != null){
                    //               print("Now you can clicked on this");
                    //               widget.googleMapController!.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(
                    //                   locationController.pickPosition.latitude,
                    //                   locationController.pickPosition.longitude
                    //               ))));
                    //               locationController.setAddAddressData();
                    //             }
                    //             Get.toNamed(RouteHelper.getAddressPage());
                    //           }
                    //         }
                    //       },
                    //     )
                    // )
                  ],
                ),
              ),
            ),
          )
      );
    });
  }
}
