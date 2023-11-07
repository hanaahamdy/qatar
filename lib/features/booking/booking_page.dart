
import 'package:ehsan_1/features/booking/presentation/bloc/booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../core/di/di.dart';
import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import '../../core/ui/widgets/date_widget.dart';
import '../../core/ui/widgets/styled_button.dart';
import '../../core/ui/widgets/styled_text_field.dart';
import '../../core/utils/app_prefs.dart';
import '../../core/utils/functions.dart';
import '../../core/utils/texts.dart';
import 'package:intl/intl.dart';


class BookingPage extends StatefulWidget {
  final int? adId;
  const BookingPage({Key? key, required this.adId}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

TextEditingController _commentController = TextEditingController();
TextEditingController _personsController = TextEditingController();

class _BookingPageState extends State<BookingPage> {

  final _formKey = GlobalKey<FormState>();
  BookingBloc _bloc= BookingBloc();
  String _selectedDate = DateFormat('yyyy-MM-dd').format(now);

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        title: Text('حجز'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateWidget(setDtae: _setDate),
                  heightSpace(24.h),
                  font14Text('عدد الأفراد',
                      fontWeight: FontWeight.w500,
                      color: ColorManager.grey),
                  heightSpace(14.h),
                  StyledTextField(
                    keyboardType: TextInputType.number,
                    controller: _personsController, validator: (text){
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                  }
                    ,),
                  heightSpace(24.h),
                  ////////////////////////////////////////////
                  font14Text('تعليق',
                      fontWeight: FontWeight.w500,
                      color: ColorManager.grey),
                  heightSpace(14.h),
                  StyledTextField(
                      maxLines: 10,
                     // height: 100.h,
                      controller: _commentController, validator: (text){
                    if (text == null || text.isEmpty) {
                      return 'Can\'t be empty';
                    }
                  }),
                  heightSpace(27.h),
                  BlocListener<BookingBloc,BookingState>(
                    bloc: _bloc,
                    listener: (_, state){
                      if(state is BookingLoading){
                        showMyDialog(context);
                      }
                      else if(state is BookingSuccess){
                        Get.back();
                        showSnackBar("تم اضافة الحجز بنجاح", context);
                        Get.back();
                      }
                      else if(state is BookingFailure){
                        Get.back();
                        showFailureDialoge(context, state.error!.message);
                      }
                    },
                    child: StyledButton(
                        radius: true,
                        function: () async{
                          if(_formKey.currentState!.validate()){
                            if(await locator<AppPreferences>().hasToken==true){
                           _bloc.add(BookingEvent(adId: widget.adId, comment: _commentController.text, persons: _personsController.text, bookingDate: _selectedDate));
                            }else{
                              showFailureDialoge(context, "يجب تسجيل الدخول اولا");
                            }
                          }
                        },
                        child: font16Text('حجز',
                            color: ColorManager.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  _setDate(_){
   setState(() {
     _selectedDate= _;
   });
  }
}
