import 'package:ehsan_1/core/utils/texts.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../core/resources/color_manager.dart';
import '../../domain/entity/gallery_entity.dart';


class GalleryPage extends StatefulWidget {
  List<GalleryEntity> galleryItems;
  int? index;

   GalleryPage({Key? key, required this.galleryItems, required this.index}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  int _currentIndex =0;

@override
  void initState() {
   _currentIndex = widget.index ?? 0;
  super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: font14Text('Gallery'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(widget.galleryItems[_currentIndex].image ?? ""),
              initialScale: PhotoViewComputedScale.contained * 0.8,
              heroAttributes:
                  PhotoViewHeroAttributes(tag: widget.galleryItems[_currentIndex].id ?? ""),
            );
          },
          itemCount: widget.galleryItems.length,
          loadingBuilder: (context, event) => Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: 20
              ),
            ),
          ),
        //  backgroundDecoration: ColorManager.black,
         // pageController: widget.pageController,
          onPageChanged: (_){
             _currentIndex = _;
          },
        ))));
  }
}
