import 'dart:async';

import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:maps_launcher/maps_launcher.dart';

import '../../constants.dart';
import '../../resources/color_manager.dart';
import '../../utils/texts.dart';

//LatLng? myLocation = LatLng(30.033333, 31.233334);
String currentLocation = '';

class LocationWidget extends StatefulWidget {
  final LatLng myLocation;
   LocationWidget({Key? key, required this.myLocation}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {

  @override
  void initState() {
   // _getLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey2, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(6.w))
        ),
        child: Column(
          children: [
            SizedBox(
                height: 103.h,
                child: map.FlutterMap(
                  options: map.MapOptions(
                      minZoom: 5,
                      maxZoom: 18,
                      zoom: 13,
                      center: widget.myLocation,
                      onTap: (_, __) {
                        MapsLauncher.launchCoordinates(widget.myLocation.latitude, widget.myLocation.longitude);
                      }
                      ),
                  layers: [
                    map.TileLayerOptions(
                      urlTemplate:
                      "https://api.mapbox.com/styles/v1/marafatcis/cl98l6cal003f14pahz6it10u/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFyYWZhdGNpcyIsImEiOiJjbDkyZ20yeDExZml2M3BwMnIyajZqMTZvIn0.Qng4TG0sZp08wr_1ENEFTg",
                      additionalOptions: {
                        'mapStyleId': MAP_STYLE,
                        'accessToken': ACCESS_TOKEN,
                      },
                    ),
                    map.MarkerLayerOptions(markers: [
                      map.Marker(
                          height: 40.h,
                          width: 40.w,
                          point: widget.myLocation ?? LatLng(0.0, 0.0),
                          builder: (_) {
                            return SvgPicture.asset(
                              'assets/icons/location1.svg',
                              color: ColorManager.primary,
                            );
                          })
                    ])
                  ],
                )
            ),
            // SizedBox(
            //   child: Padding(
            //     padding: EdgeInsets.all(17.h),
            //     child:  font14Text(currentLocation, fontWeight: FontWeight.w900),
            //   ),
            // )

          ],
        )
    );
  }

  _getLocation() async{
    List<Placemark> placemarks = await placemarkFromCoordinates(widget.myLocation.longitude, widget.myLocation.longitude);
    setState(() {
       currentLocation = '${placemarks.first.street} - ${placemarks.first.subLocality} -  ${placemarks.first.administrativeArea}';
    });
  }

}

