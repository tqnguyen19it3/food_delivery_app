import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nh_food_delivery/controllers/location_controller.dart';
import 'package:nh_food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/src/places.dart';

class LocaTionDialogue extends StatelessWidget {
  final GoogleMapController mapController;
  const LocaTionDialogue({Key? key, required this.mapController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(Dimensions.width20),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20/2),
        ),
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                hintText: "Search location",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    style: BorderStyle.none, width: 0
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 16
                )
              )
            ),
            onSuggestionSelected: (Prediction suggestion) {
              Get.find<LocationController>().setLocation(suggestion.placeId!, suggestion.description!, mapController);
              Get.back();
              },
            suggestionsCallback: (pattern) async {
              return await Get.find<LocationController>().searchLocation(context, pattern);
            },
            itemBuilder: (context, Prediction suggestion) {
              return Padding(
                padding: EdgeInsets.all(Dimensions.width20),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    Expanded(child: Text(
                      suggestion.description!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        fontSize: 16
                      ),
                    ))
                  ],
                ),
              );
            },
          ),
        )
      ),
    );
  }
}
