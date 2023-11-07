import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:dio/dio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/params/no_params.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/langauge_manager.dart';
import '../../../../../core/ui/add_file_widget.dart';
import '../../../../../core/ui/add_image_widget.dart';
import '../../../../../core/ui/widgets/date_widget.dart';
import '../../../../../core/ui/widgets/dropdown_widget.dart';
import '../../../../../core/ui/widgets/styled_button.dart';
import '../../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/request/add_product_request.dart';
import '../../../data/request/custom_field_request.dart';
import '../../../domain/entity/categories_service_entity.dart';
import '../../../domain/entity/city_entity.dart';
import '../../../domain/entity/custom_field_entity.dart';
import '../../../domain/repository/services_repository.dart';
import '../../../domain/usecase/add_product_use_case.dart';
import '../../../domain/usecase/categories_service.dart';
import '../../../domain/usecase/cities_usecase.dart';
import '../../../domain/usecase/custom_fields_usecase.dart';
import '../../bloc/add_service_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/custom_fields_bloc.dart';
import '../../widgets/category_content_widget.dart';
import '../../widgets/city_content_widget.dart';
import '../../widgets/selecct_address_widget.dart';
DateTime now = DateTime.now();

class AddEngineerPage extends StatefulWidget {
  final int? id;
  final int? catId;

  AddEngineerPage({Key? key, required this.id, required this.catId}) : super(key: key);

  @override
  State<AddEngineerPage> createState() => _AddEngineerPageState();
}

class _AddEngineerPageState extends State<AddEngineerPage> {
  TextEditingController _emailValue = TextEditingController();
  TextEditingController _notesValue = TextEditingController();
  TextEditingController _nameValue = TextEditingController();

  TextEditingController _phoneValue = TextEditingController();
  TextEditingController _whatsValue = TextEditingController();
  TextEditingController _experienceValue = TextEditingController();
  LatLng _address = LatLng(0.0, 0.0);
  final _formKey = GlobalKey<FormState>();

  String logo = '';
  List<String> filePath = [];
  List<String>? anotherImageFile;
  List<CustomFieldEntity> result = [];

  Map<String, dynamic> customs = {};

  AddServiceBloc _addServiceBloc = AddServiceBloc();

  _uploadCustomFields() async {

  }

  CityEntity? selectedCountry;

  CategoriesServiceEntity? selectedCategory;
  String customDate =  DateFormat('yyyy-MM-dd').format(now);
  List<CityEntity> cities = [];
  List<CategoriesServiceEntity> categories = [];
  final CustomFieldsBloc _bloc= CustomFieldsBloc();

  Map<String, TextEditingController>  customControllers = {};
  Map<String, dynamic> dates ={};

  getCities() async {
    final result = await CitiesUseCase(locator<ServicesRepository>())(NoParams(
      cancelToken: CancelToken(),
    ));
    if (result.hasDataOnly) {
      cities = result.data!;
      selectedCountry = result.data![0];
    }
  }

  getCategories() async {
    final result = await GetCategouriesServicesUseCase(
        locator<ServicesRepository>())(GetCategouriesServicesParams(
      cancelToken: CancelToken(),
      serviceId: widget.id!,
    ));
    if (result.hasDataOnly) {
      categories = result.data!;
      selectedCategory = result.data![0];
    }
  }

  @override
  void initState() {
    super.initState();
    _bloc.add(CustomServiceEvent(id: widget.id));
    getCities();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          title: font16Text('اضافة', fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: ColorManager.white,
            leading: Padding(
                padding: EdgeInsets.all(16.w),
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
            }),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child:  BlocListener<CustomFieldsBloc, CustomServicesState>(
                  bloc: _bloc,
                  listener: (_, state){
                     if(state is CustomServicesSuccess){
                         customControllers = state.controllers;
                         dates = state.dates;
                         print('controllers: ${customControllers[state.data[0].name]!.text}');
                     }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //add gallery widgets.....
                      // AddImageWidget(
                      //   callback: setImageFile,
                      //   text: 'أضف صورة رئيسية',
                      //   color: ColorManager.primary,
                      //   textcolor: ColorManager.white,
                      //   mult: false,
                      // ),
                      Row(
                        children: [
                          AddImageWidget(
                            callback: setImageFile,
                            text: 'أضف صورة رئيسية',
                            color: ColorManager.primary,
                            textcolor: ColorManager.white,
                            mult: false,
                          ),
                          widthSpace(15.w),
                          AddImageWidget(
                              mult: true,
                              callback: setAnotherImageFile,
                              text: 'أضف صور أخرى',
                              color: ColorManager.grey3,
                              textcolor: ColorManager.primary)
                        ],
                      ),
                      heightSpace(40.h),
                      /////////////SELECT JOB//////////////////
                    widget.id==4?  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         font14Text('اختر الوظيفة',
                             fontWeight: FontWeightManager.medium,
                             color: ColorManager.grey2),
                         heightSpace(15.h),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             StyledButton(
                               width: 164.w,
                               function: () {},
                               child: font14Text('مهندس',
                                   color: ColorManager.white,
                                   fontWeight: FontWeightManager.bold),
                               fillColor: ColorManager.primary,
                             ),
                             widthSpace(15.w),
                             StyledButton(
                               width: 164.w,
                               function: () {},
                               border: ColorManager.grey1,
                               child: font14Text('فني',
                                   color: ColorManager.grey2,
                                   fontWeight: FontWeightManager.semiBold),
                               fillColor: ColorManager.grey3,
                               radius: true,
                             ),
                           ],
                         ),
                       ],
                     ): Container(),
                      heightSpace(24.h),
                      //////////////////////////
                      font14Text('الاسم',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      StyledTextField(
                        hint: 'الاسم',
                        controller: _nameValue,
                      ),
                      heightSpace(15.h),
                      font14Text('نبذة مختصرة',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      StyledTextField(
                        hint: 'نبذة مختصرة',
                        height: 90.h,
                        controller: _notesValue,
                      ),
                      ///////////////////////////////////
                      heightSpace(15.h),
                      font14Text('المحافظة',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      DropDownWidget(
                        text:
                            selectedCountry == null ? '' : selectedCountry?.name!,
                      ).onTap(() {
                        showModalBottomSheetWidget(
                            context,
                            CityContentWidget(
                                cities: cities, function: function));
                      }),
                      ///////////////////////////////////////
                      heightSpace(15.h),
                      font14Text('التخصص',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      DropDownWidget(
                              text: selectedCategory == null
                                  ? ''
                                  : selectedCategory?.name!)
                          .onTap(() {
                        showModalBottomSheetWidget(
                            context,
                            CategoryContentWidget(
                                categories: categories,
                                selectCategory: selectCategory));
                      }),
                      ///////////////////////////////////
                      heightSpace(15.h),
                      font14Text('العنوان',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      SelectAddressWidget(
                        function: _selectAddress,
                        id: widget.id,
                          catId: widget.catId
                      ),
                      ////////////////////////////////////////
                      heightSpace(15.h),
                      font14Text('رقم الموبايل',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      StyledTextField(
                        hint: 'رقم الموبايل',
                        controller: _phoneValue,
                      ),
                      //////////////////////////////////////
                      heightSpace(15.h),
                      font14Text('البريد الالكتروني',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      StyledTextField(
                        hint: 'البريد الالكتروني',
                        controller: _emailValue,
                      ),
                      /////////////////////////////////////////
                      heightSpace(15.h),
                      font14Text('رقم الواتساب',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      StyledTextField(
                        hint: 'رقم الواتساب',
                        controller: _whatsValue,
                      ),
                      //////////////////////////////////////////
                      heightSpace(15.h),
                      font14Text('الملفات',
                          fontWeight: FontWeightManager.medium,
                          color: ColorManager.grey2),
                      heightSpace(15.h),
                      AddFileWidget(callback: setFileValue, multi: true),
                      heightSpace(15.h),
                      ////////////////=========CUSTOM FIELDS======/////////////////
                      BlocBuilder<CustomFieldsBloc, CustomServicesState>(
                        bloc: _bloc,
                        builder: (_, state){
                          if(state is CustomServicesSuccess){
                            return ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, i) {
                                return _buildFieldType(fieldEntity: state.data[i], controllers: customControllers);
                              },
                              itemCount: state.data.length,
                            );
                          }
                          else if(state is CustomServicesLoading){
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Container();
                        },
                      ),

                      //////////////////////////////////
                      heightSpace(30.h),
                      BlocBuilder<AddServiceBloc, AddServiceState>(
                        bloc: _addServiceBloc,
                        builder: (_, state) {
                          if (state is AddServicesSuccess) {
                            Get.back();
                          } else if (state is AddServicesLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              ),
                            );
                          }
                          return _buildButton();
                        },
                      ),

                      heightSpace(27.h)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  _buildButton() {
    return StyledButton(
        radius: true,
        function: () {
          if (_formKey.currentState!.validate()) {
            _addServiceBloc.add(AddServiceEvent(
                function: AddProductUseCase(locator<ServicesRepository>())(
                    AddProductParams(
                        cancelToken: CancelToken(),
                        data: AddProductRequest(
                            customs: _buildCustoms(),
                            images: filePath,
                            file: filePath,
                            logo: logo,
                            serviceId: widget.id,
                            categoryId: selectedCategory?.id,
                            description: _notesValue.text,
                            title: _nameValue.text,
                            address: selectedCountry?.name,
                            cityId: selectedCountry?.id,
                            lat: _address.latitude.toString(),
                            lng: _address.longitude.toString(),
                            phone: _phoneValue.text,
                            email: _emailValue.text,
                            whatsapp: _whatsValue.text
                        )))));
          }
        },
        child: font16Text('اضافة',
            fontWeight: FontWeightManager.bold, color: ColorManager.white));
  }

  function(_) {
    setState(() {
      selectedCountry = _;
    });
  }

  selectCategory(_) {
    setState(() {
      selectedCategory = _;
    });
  }

  setImageFile(filePath) {
    setState(() {
      logo = filePath;
    });
  }

  setFileValue(file) {
    setState(() {
      filePath = file;
    });
  }

  _selectAddress(latlng) {
    setState(() {
      _address = latlng;
    });
  }
  setEndSelectedDate(selectedDate){
    setState(() {
      customDate = selectedDate;
    });
  }

  setAnotherImageFile(file) {
    setState(() {
      anotherImageFile = file;
    });
  }
  _buildFieldType({required CustomFieldEntity fieldEntity, required Map<String, dynamic> controllers}){
    print('con ${customControllers[fieldEntity.name]?.text}');
    if(fieldEntity.type =='number'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          font14Text(fieldEntity.labelTitle?? '',
              fontWeight: FontWeightManager.medium,
              color: ColorManager.grey2),
          heightSpace(15.h),
          StyledTextField(
            controller:customControllers[fieldEntity.name],
            hint: fieldEntity.labelTitle?? '',
            keyboardType: TextInputType.number,
          ),
        ],
      );
    }
    else if(fieldEntity.type=='text'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          font14Text(fieldEntity.labelTitle?? '',
              fontWeight: FontWeightManager.medium,
              color: ColorManager.grey2),
          heightSpace(15.h),
          StyledTextField(
            controller:customControllers[fieldEntity.name],
            hint: fieldEntity.labelTitle?? '',
            keyboardType: TextInputType.text,
          ),
        ],
      );
    }
    else if(fieldEntity.type =='date'){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          font14Text(fieldEntity.labelTitle?? '', fontWeight: FontWeightManager.semiBold, color: ColorManager.grey2),
          heightSpace(16.h),
          DateWidget(setDtae: setEndSelectedDate)
        ],
      );
    }
    else {
      return Container();
    }
  }

  Map<String, dynamic>? _buildCustoms() {
    Map<String, dynamic> field ={};
    //////////TEXTS////////////////////
    customControllers.forEach((key, value) {
       field.addAll({key: value.text});
    });
    //////////DATES///////////////////
    dates.forEach((key, value) {
      field.addAll({key: customDate});
    });

    return field;
  }
}



