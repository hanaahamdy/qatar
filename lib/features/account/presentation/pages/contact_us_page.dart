import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/ui/items_shimmer/service_shimmer_grid.dart';
import '../../../../core/ui/widgets/styled_button.dart';
import '../../../../core/ui/widgets/styled_text_field.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../data/requests/contact_request.dart';
import '../../domain/usecase/contact_us_usecase.dart';
import '../bloc/about_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/di/di.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/repository/account_repository.dart';
import '../args/contact_us_args.dart';
import '../bloc/conatct_bloc.dart';
import '../bloc/settings_bloc.dart';


class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

TextEditingController _messageController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _phoneController = TextEditingController();
TextEditingController _nameController = TextEditingController();

ContactBloc _contactBloc = ContactBloc();
SettingsBloc _settingsBloc = SettingsBloc();

class _ContactUsPageState extends State<ContactUsPage> {

  var args = Get.arguments as ContactUsArgs;
  String subject ='شكوي';

  @override
  void initState() {
    _settingsBloc.add(SettingsEvent(cancelToken: CancelToken()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          title: font16Text('تواصل معنا', fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: ColorManager.white,
          leading: Padding(
              padding: EdgeInsets.all(10.w),
              child: Get.locale ==ARABIC_LOCAL ? FaIcon(FontAwesomeIcons.chevronRight, color: ColorManager.black, size: 13.w,) :  FaIcon(FontAwesomeIcons.chevronLeft, color: ColorManager.black, size: 13.w,)

          ).onTap((){
            Get.back();
          })
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // heightSpace(23.h),
                  Center(
                      child: Image.asset(
                        ImageAssets.logo,
                        width: 150.w,
                        height: 150.h,
                      )),
                  heightSpace(20.h),
                  font14Text('نوع التواصل',
                      color: ColorManager.grey2, fontWeight: FontWeight.w500),
                  heightSpace(15.h),
                  _buildDropDownWidget(context),
                  heightSpace(15.h),
                  ////////////////////////////////////////////////////
                  font14Text('الأسم الكامل',
                      color: ColorManager.grey2, fontWeight: FontWeight.w500),
                  heightSpace(15.h),
                  StyledTextField(
                    hint: 'الأسم الكامل',
                    controller: _nameController,
                  ),
                  heightSpace(15.h),
                  ///////////////////////////PHONE//////////////////////////////
                  font14Text('رقم الهاتف',
                      color: ColorManager.grey2, fontWeight: FontWeight.w500),
                  heightSpace(15.h),
                  StyledTextField(
                    hint: 'رقم الهاتف',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  heightSpace(15.h),
                  ///////////////////////////EMAIL//////////////////////////////
                  font14Text('البريد الالكتروني',
                      color: ColorManager.grey2, fontWeight: FontWeight.w500),
                  heightSpace(15.h),
                  StyledTextField(
                    hint: 'البريد الالكتروني',
                    controller: _emailController,
                  ),
                  heightSpace(15.h),
                  ///////////////////////////MESSAGE//////////////////////////////
                  font14Text('الرسالة',
                      color: ColorManager.grey2, fontWeight: FontWeight.w500),
                  heightSpace(15.h),
                  StyledTextField(
                    hint: 'الرسالة',
                    controller: _messageController,
                  ),

                  heightSpace(30.h),
                  BlocListener<ContactBloc, ContactState>(
                    bloc: _contactBloc,
                    listener: (_, state){
                      if(state is ContactLoading){
                        showMyDialog(context);
                      }
                      else if(state is ContactSuccess){
                        Get.back();
                        //Get.back();
                      }
                      else if(state is ContactFailure){
                        Get.back();
                        showFailureDialoge(context, state.error!.message);
                      }
                    },
                    child: StyledButton(
                      function: () {
                        _contactBloc.add(ContactEvent(cancelToken: CancelToken(),
                          phone: _phoneController.text,
                          name: _nameController.text,
                          message: _messageController.text,
                          subject: subject,
                          email: _emailController.text,));
                      },
                      child: font16Text('اضافة',
                          fontWeight: FontWeight.bold, color: ColorManager.white),
                      fillColor: ColorManager.primary,
                      radius: true,
                    ),
                  ),
                  heightSpace(30.h),

                  BlocBuilder<SettingsBloc, SettingsState>(
                    bloc: _settingsBloc,
                    builder: (_, state){
                      if(state is SettingsSuccess){
                        return SizedBox(
                          height:100.h,
                          child: ListView.builder(
                            itemCount: state.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index){
                              return state.data![index].name!="currency" && state.data![index].name!="_token"?
                              _buildContainer(state.data![index].name, state.data![index].value): Container();
                            },
                          ),
                        );
                        // return  Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     _buildContainer('خدمة العملاء', ImageAssets.whatsapp),
                        //     _buildContainer('البريد الالكتروني', ImageAssets.mail),
                        //     _buildContainer('الواتساب', ImageAssets.call1),
                        //   ],
                        // );
                      }
                      else if(state is SettingsLoading){
                        return ServiceShimmerGrid(count: 3,);
                      }
                      return Container();
                    },
                  ),
                  heightSpace(32.h)
                ],
              ),
            )),
      ),
    );
  }
  _buildContainer(title, url) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Container(
        //width: 108.w,
        decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
        ),
        child: Padding(
          padding:
          EdgeInsets.only(left: 19.w, right: 19.w, top: 16.h, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(_buildIcon(title), width: 30.w, height: 30.h,),
              heightSpace(7.h),
              font12Text(title,
                  color: ColorManager.primary, fontWeight: FontWeight.w900)
            ],
          ),
        ),
      ).onTap(() async{
        if(title=="phone"){
          makePhoneCall(url);
        }
        else if(title == "email"){
          sendEmail(url);
        }
        else if(title == "linkedin"){
          openLinkdin(context,url);
        }
        else if(title == "whatsapp"){
          openWhatsapp(context, url);
        }
        else{
          if (await canLaunchUrl(Uri.parse(url))) {
            return launchUrl(Uri.parse(url));
          } else {
            showSnackBar("لا يمكن فتح الرابط", context);
          }
        }
      }),
    );
  }
  String _buildIcon(title) {
    switch(title){
      case "email":
        return "https://cdn-icons-png.flaticon.com/512/732/732200.png";

      case "whatsapp":
        return "https://cdn-icons-png.flaticon.com/512/1384/1384055.png";

      case "phone":
        return "https://cdn-icons-png.flaticon.com/512/724/724664.png";

      case "linkedin":
        return "https://cdn-icons-png.flaticon.com/512/145/145807.png";

      case "instgram":
        return "https://cdn-icons-png.flaticon.com/512/3955/3955024.png";

      default:
        return "https://cdn-icons-png.flaticon.com/512/6356/6356630.png";
    }
  }

  _buildDropDownWidget(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          color: ColorManager.lightGrey
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 17.h, top: 17.h),
        child: Row(
          children: [
            font14Text(subject, fontWeight: FontWeight.w900),
            Spacer(),
            SvgPicture.asset(ImageAssets.arrow_simple_chock),
          ],
        ),
      ),
    ).onTap((){
      showModalBottomSheetWidget(context, _buildContactWidget());
    //Get.to(AddAnyWidget(content: _buildContactWidget()));

    });
  }

  _buildContactWidget(){
    return Container(
      //height: 300.h,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace(15.h),
            Center(
              child: Container(
                width: 39.w,
                height: 5.h,
                decoration: BoxDecoration(color: ColorManager.lightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(158.r))
                ),
              ),
            ),
            heightSpace(13.h),
            Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: font16Text('نوع التواصل', fontWeight: FontWeight.bold)),
            heightSpace(13.h),
            Divider(thickness: 1.h,),
            heightSpace(27.h),
            Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 30.h),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: font14Text('شكوى', fontWeight: FontWeight.w500).onTap((){
                              setState(() {
                                 subject = 'شكوى';
                              });
                              Get.back();
                      }),
                    ),
                    heightSpace(25.h),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: font14Text('اقتراح', fontWeight: FontWeight.w500).onTap((){
                        setState(() {
                            subject = 'اقتراح';
                        });
                        Get.back();
                      }),
                    ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}



