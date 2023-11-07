import 'package:ehsan_1/core/ui/items_shimmer/service_shimmer_grid.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/ui/items_shimmer/service_item_shimmer.dart';
import '../../../../core/ui/widgets/bids_item_widget.dart';
import '../../../../core/utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart' as map;

import '../../domain/entity/add_service_entity.dart';
import '../bloc/get_service_adds_usecase.dart';
import 'details/bids_details_page.dart';



LatLng? _myLocation = LatLng(30.033333, 31.233334);

class AddressPage extends StatefulWidget {
  final bool? add;
  List<AddServiceEntity> markers;

  AddressPage({Key? key, required this.add, required this.markers})
      : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {


  //List<AddServiceEntity>? markers;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init(){
    if(widget.markers.isNotEmpty){
      setState(() {
        _myLocation = LatLng(double.parse(widget.markers[0].lat!), double.parse(widget.markers[0].lng!));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: font16Text('العنوان', fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: ColorManager.white,
          leading: Padding(
              padding: EdgeInsets.all(10.w),
              child: Get.locale == ARABIC_LOCAL
                  ? FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: ColorManager.black,
                size: 13.w,
              )
                  : FaIcon(
                FontAwesomeIcons.chevronRight,
                color: ColorManager.black,
                size: 13.w,
              ))
              .onTap(() {
            Get.back(result: _myLocation);
          })),
      body: SafeArea(
        child: Stack(
          children: [
            _buildMapWidget(),
            Positioned(
                bottom: 10.h,
                left: 0.w,
                right: 0.w,
                child:  widget.markers.isEmpty || widget.add==true ? Container() :SizedBox(
                  height: 230.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics:  BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: 10.h,  right: 10.w),
                          child: BidsItemWidget(item: widget.markers[i])
                      );
                    },
                    itemCount: widget.markers.length,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  _buildMapWidget() {
    return map.FlutterMap(
      options: map.MapOptions(
          minZoom: 13,
          maxZoom: 17,
          zoom: 13,
          center: _myLocation,
          onTap: (_, __) {
            setState(() {
              _myLocation = __;
            });
          }),
      layers: [
        map.TileLayerOptions(
          urlTemplate:
          "https://api.mapbox.com/styles/v1/marafatcis/cl98l6cal003f14pahz6it10u/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFyYWZhdGNpcyIsImEiOiJjbDkyZ20yeDExZml2M3BwMnIyajZqMTZvIn0.Qng4TG0sZp08wr_1ENEFTg",
          additionalOptions: {
            'mapStyleId': MAP_STYLE,
            'accessToken': ACCESS_TOKEN,
          },
        ),
        map.MarkerLayerOptions(
            markers:  widget.add == true ? [
              map.Marker(
                  height: 40.h,
                  width: 40.w,
                  point: LatLng(_myLocation!.latitude, _myLocation!.longitude),
                  builder: (_) {
                    return SvgPicture.asset(
                      'assets/icons/location1.svg',
                      color: ColorManager.primary,
                    );
                  })
            ] :  widget.markers.isEmpty ? [] : [
              for (int i = 0; i < widget.markers.length; i++)
                map.Marker(
                    height: 40.h,
                    width: 40.w,
                    point: LatLng(double.parse(widget.markers[i].lat!),
                        double.parse(widget.markers[i].lng!)),
                    builder: (_) {
                      return SvgPicture.asset(
                        'assets/icons/location1.svg',
                        color: ColorManager.primary,
                      ).onTap((){
                        Get.to(BidsDetailsPage(id: widget.markers[i].id));
                      });
                    })
            ])

      ],
    );
  }
}

