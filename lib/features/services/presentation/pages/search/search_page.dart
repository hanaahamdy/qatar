
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/langauge_manager.dart';
import '../../../../../core/ui/items_shimmer/service_loading_widget.dart';
import '../../../../../core/ui/widgets/bids_item_widget.dart';
import '../../../../../core/ui/widgets/network/network_list_without_refresh.dart';
import '../../../../../core/ui/widgets/search_text_field.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/utils/texts.dart';
import '../../../domain/entity/add_service_entity.dart';
import '../../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  final dynamic hint;
  const SearchPage({Key? key, required this.hint}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController _searchContropller = TextEditingController();
  SearchBloc bloc = SearchBloc();
  //var args = Get.arguments as SearchArgs;

  @override
  void initState() {
    //bloc.add(SearchEvent(search: ''));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: SafeArea(
     child: SingleChildScrollView(
       child: Padding(
         padding: EdgeInsets.only(top: 16.h, ),
         child: Column(
           children: [
             Padding(
               padding: EdgeInsets.only(left: 16.w, right: 16.w),
               child: Row(
                 children: [
                   Container(
                     child:   Get.locale ==ARABIC_LOCAL ?
                     FaIcon(FontAwesomeIcons.chevronRight, color: ColorManager.black, size: 13.w,) :
                     FaIcon(FontAwesomeIcons.chevronLeft, color: ColorManager.black, size: 13.w,),
                   ).onTap((){
                     Get.back();
                   }),
                   widthSpace(20.w),
                   Expanded(
                     child: SearchTextField(
                       width: 316.w,
                       controller: _searchContropller,
                       bloc: bloc,
                       // serviceId: args.serviceId,
                       // catId: args.catId,
                       hint: '.. بحث في ${widget.hint}',
                       suffixWidget: SvgPicture.asset(ImageAssets.search,
                           height: 14.h, width: 24.w)
                     ),
                   ),
                 ],
               ),
             ),
             heightSpace(15.h),
             Container(height: 1.h, color: ColorManager.grey1),
             heightSpace(15.h),
             BlocBuilder<SearchBloc, SearchState>(
               bloc: bloc,
               builder: (_, state){
                 if(state is SearchSuccess){
                   if(state.data.isEmpty){
                     return Center(
                     child: font14Text("لا توجد نتائج")
                     );
                   }
                   return Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                           padding: EdgeInsets.only(left: 10.h,  right: 10.w),
                           child: font16Text('الكل (${state.data.length})', fontWeight: FontWeight.bold, textAlign: TextAlign.end)),
                       heightSpace(20.h),
                       ListView.builder(
                         shrinkWrap: true,
                         scrollDirection: Axis.vertical,
                         physics: const BouncingScrollPhysics(),
                         itemBuilder: (context, i) {
                           return Padding(
                               padding: EdgeInsets.only(bottom: 10.h,  right: 10.w),
                               child: BidsItemWidget(item: state.data[i])

                           );
                         },
                         itemCount: state.data.length)]);
                 }
                 else if(state is SearchLoading){
                   return ServiceLoadingWidget();
                 }
                 else if(state is SearchFailure){
                   return Center(
                       child: font14Text(state.error!.message?? "لا توجد نتائج"));
                 }
                 return Center(
                     child: font14Text("قم بكتابة بعض الكلمات المفتاحية")
                 );
               },
             ),
           ],
         ),
       ),
     ),
   ),
    );
  }
}
