import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/di/di.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/ui/widgets/date_widget.dart';
import '../../../../core/ui/widgets/dropdown_widget.dart';
import '../../../../core/ui/widgets/styled_button.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/request/filter_request.dart';
import '../../domain/entity/add_service_entity.dart';
import '../../domain/entity/categories_service_entity.dart';
import '../../domain/entity/city_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/cities_usecase.dart';
import '../../domain/usecase/filter_use_case.dart';
import '../args/filter_args.dart';
import '../bloc/category_service_bloc.dart';
import '../bloc/filter_bloc.dart';
import '../widgets/choice_chip_label.dart';
import '../widgets/city_content_widget.dart';

class FilterPage extends StatefulWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

DateTime now = DateTime.now();

String startDate = DateFormat('yyyy-MM-dd').format(now);
String endDate = DateFormat('yyyy-MM-dd').format(now);

CityEntity selectedCountry = CityEntity(
  name: ""
);

List<CityEntity> cities = [];
List<int> selected = [];
CategoriesServiceBloc _bloc = CategoriesServiceBloc();

FilterBloc _filterBloc = FilterBloc();

class _FilterPageState extends State<FilterPage> {
  var filterArgs = Get.arguments as FilterArgs;
  bool _clear = false;

  getCities() async {
    final result = await CitiesUseCase(locator<ServicesRepository>())(NoParams(
      cancelToken: CancelToken(),
    ));
    if (result.hasDataOnly) {
      cities = result.data!;
      selectedCountry = result.data![0];
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(CategoriesServiceEvent(serviceId: filterArgs.serviceId));
    getCities();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _clear = false;
        });
      },
      child: Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
            title: font16Text('فلترة', fontWeight: FontWeight.bold),
            centerTitle: true,
            elevation: 0,
            backgroundColor: ColorManager.white,
            leading: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Get.locale == ARABIC_LOCAL
                        ? FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: ColorManager.black,
                            size: 13.w,
                          )
                        : FaIcon(
                            FontAwesomeIcons.chevronLeft,
                            color: ColorManager.black,
                            size: 13.w,
                          ))
                .onTap(() {
              Get.back();
            })),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, right: 16.w, left: 16.w),
            child: IntrinsicWidth(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ////////////SELECT DATE WIDGET/////////////////////////////////////
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            font14Text('من',
                                color: ColorManager.grey2,
                                fontWeight: FontWeightManager.bold),
                            heightSpace(15.h),
                            DateWidget(setDtae: setStartSelectedDate)
                          ],
                        ),
                        widthSpace(11.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            font14Text('الى',
                                color: ColorManager.grey2,
                                fontWeight: FontWeightManager.bold),
                            heightSpace(15.h),
                            DateWidget(setDtae: setEndSelectedDate)
                          ],
                        )
                      ],
                    ),
                    heightSpace(25.h),
                    //////////////////DIVIDER
                    Divider(
                      thickness: 1.h,
                      color: ColorManager.lightGrey,
                    ),
                    heightSpace(25.h),
                    ////////////////DROPBDOWN//////////////////////
                    font14Text(
                      'المنطقة',
                      color: ColorManager.grey,
                    ),
                    heightSpace(15.h),
                    DropDownWidget(
                      text: selectedCountry.name ?? '',
                    ).onTap(() {
                      showModalBottomSheetWidget(context,
                          CityContentWidget(cities: cities, function: function));
                    }),
                    heightSpace(25.h),
                    Divider(
                      thickness: 1.h,
                      color: ColorManager.lightGrey,
                    ),
                    heightSpace(16.h),
                    ///////////DEPARTMENTS////////////////
                    font16Text('الأقسام', fontWeight: FontWeightManager.bold),
                    heightSpace(32.h),
                    /////////////////////CHECKBOXES GROUP////////////////////////
                  BlocBuilder<CategoriesServiceBloc, CategoriesServiceState>(
                      bloc: _bloc,
                      builder: (_, state){
                        if(state is CategoriesServiceSuccess){
                         return  Wrap(
                              children: _clear==true ? _buildClearChoices(state.data) :_buildChoices(state.data)
                          );
                        }
                        return Container();
                      },
                    ),
                   // Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyledButton(
                          function: (){
                             setState(() {
                               _clear = true;
                               selectedCountry = CityEntity(
                                   name: ""
                               );
                             });
                          },
                          width: 142.w,
                          height: 50.h,
                          child: font14Text('مسح الكل', color: ColorManager.primary,
                              fontWeight: FontWeightManager.bold), fillColor: ColorManager.white, radius: true, border: ColorManager.grey1,),
                        widthSpace(10.w),
                        BlocListener<FilterBloc, FilterState>(
                          bloc: _filterBloc,
                          listener: (_, state){
                            if(state is FilterLoading){
                              showMyDialog(context);
                            }
                             if(state is FilterSuccess){
                                Get.back();
                                Get.back();
                                Get.back(result: state.data);
                            }
                             if(state is FilterFailure){
                              Get.back();
                              showFailureDialoge(context, state.error!.message);
                            }
                          },
                          child: StyledButton(function: () async{
                            setState(() {
                              _clear = false;
                            });
                            _filterBloc.add(FilterEvent(data: FilterRequest(
                                id: filterArgs.serviceId,
                                categories: selected,
                                startDate: startDate,
                                endDate: endDate,
                                cityId: selectedCountry.id
                            )));
                          },
                            width: 142.w,
                            height: 50.h,
                            child:
                            font14Text(' فلترة النتائج ',
                                color: ColorManager.white,fontWeight: FontWeightManager.bold),
                            fillColor: ColorManager.primary, radius: true,),
                        ),
                      ],
                    ),
                    heightSpace(25.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

 List<Widget> _buildChoices(List<CategoriesServiceEntity> categories){
   List<Widget> widgets =[];
    for(int i =0 ;i < categories.length ;i++){
       widgets.add(ChoiceChipLabel(text: categories[i].name!, index: i, clickedCategories: _clickedCategories));
   }
    return widgets;
  }

  List<Widget> _buildClearChoices(List<CategoriesServiceEntity> categories){
    List<Widget> widgets =[];
    for(int i =0 ;i < categories.length ;i++){
      widgets.add(Padding(
        padding: EdgeInsets.only(left: 18.w, bottom: 25.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
                 ImageAssets.outlined,
                color: ColorManager.primary),
            widthSpace(8.w),
            font14Text(categories[i].name ?? "")
          ],
        ),
      ));
    }
    return widgets;
  }

  function(_) {
    setState(() {
      selectedCountry = _;
    });
  }

  setStartSelectedDate(selectedDate) {
    setState(() {
      startDate = selectedDate;
    });
  }

  setEndSelectedDate(selectedDate) {
    setState(() {
      endDate = selectedDate;
    });
  }
  _clickedCategories(_){
    //setState(() {
    selected = _;
    print('categories are : ${selected.toString()}');
    //});
  }
}
