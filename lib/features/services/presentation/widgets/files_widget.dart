import 'dart:async';
import 'dart:io';
import 'package:get/get.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../data/model/service_details_model.dart';

class FilesWidget extends StatelessWidget {
  final List<Files> files;
   FilesWidget({Key? key,required this.files}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
            padding: EdgeInsets.only(bottom: 10.h,  right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //SvgPicture.asset(ImageAssets.),
                FaIcon(FontAwesomeIcons.file),
                widthSpace(13.w),
                font14Text(files[i].name!, fontWeight: FontWeight.bold, textDecoration: TextDecoration.underline),
              ],
            )
        ).onTap(() async {
          final Uri _url = Uri.parse(files[i].file ?? "");
          _launchInWebViewOrVC(_url);
          //File file = await  createFileOfPdfUrl(files[i].file, context);
      //  OpenFile.open(file.path);
        });
      },
      itemCount: files.length,
    );
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
  Future<File> createFileOfPdfUrl(url, context) async {
    showMyDialog(context);
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
    //  final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(file.path);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    Get.back();
    return completer.future;
  }
}

