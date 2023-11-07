import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../entities/base_entity.dart';
import '../../../errors/base_error.dart';
import '../../../results/result.dart';
import 'network_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class NetworkGridWithoutRefresh<Entity extends BaseEntity> extends StatelessWidget {

  final bool enableRefresh;
  final bool enablePagination;
  final int pageSize;
  final int crossCount;
  final bool isScroll;
  final Axis scrollDirection;
  final Widget Function(BuildContext context,  Entity item) itemBuilder;
  final Future<Result<BaseError, List<Entity>>> Function(int pageSize, int pageIndex) loader;
  final WidgetBuilder placeHolder;
  final WidgetBuilder loadingWidgetBuilder;
  final SliverGridDelegate sliverGridDelegate;

  const NetworkGridWithoutRefresh(
      {Key? key,
      required this.loader,
      required this.itemBuilder,
      this.enableRefresh = false,
      this.enablePagination = false,
      this.pageSize = 0,
      this.crossCount = 3,
      this.isScroll = true,
      this.scrollDirection = Axis.vertical,
        required this.placeHolder,
        required this.loadingWidgetBuilder,
        required this.sliverGridDelegate})
      :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkWidget<List<Entity>>(
      builder: (context, networkItems) {
        if (networkItems.isEmpty) {
            return placeHolder(context);
        }
        return _NetworkGridContent<Entity>(
          items: networkItems,
          enableRefresh: enableRefresh,
          enablePagination: enablePagination,
          pageSize: pageSize,
          crossCount: crossCount,
          itemBuilder: itemBuilder,
          scrollDirection: scrollDirection,
          loader: loader,
          isScroll: isScroll,
          sliverGridDelegate: sliverGridDelegate,
        );
      },
      fetcher: () {
        return loader(pageSize, 0);
      },
      loadingWidgetBuilder: loadingWidgetBuilder,
    );
  }
}

class _NetworkGridContent<Entity extends BaseEntity> extends StatefulWidget {
  final List<Entity> items;
  final bool enableRefresh;
  final bool enablePagination;
  final bool isScroll;
  final int pageSize;
  final int crossCount;
  final dynamic itemBuilder;
  final Future<Result<BaseError, List<Entity>>> Function(int pageSize, int pageIndex)
      loader;
  final Axis scrollDirection;
  final SliverGridDelegate sliverGridDelegate;

  const _NetworkGridContent(
      {Key? key,
      required this.items,
      required this.enableRefresh,
      required this.enablePagination,
      required this.pageSize,
      required this.crossCount,
      required this.itemBuilder,
        required  this.scrollDirection,
      required this.loader,
      required this.isScroll,
      required this.sliverGridDelegate})
      :
        super(key: key);

  @override
  __NetworkGridContentState<Entity> createState() => __NetworkGridContentState<Entity>();
}

class __NetworkGridContentState<Entity extends BaseEntity> extends State<_NetworkGridContent> {

  // Pagination State.
   late List<BaseEntity> _items;

  @override
  void initState() {
    _items = widget.items;
    print('items ${_items[0]}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: widget.scrollDirection,
      gridDelegate: widget.sliverGridDelegate,
      itemBuilder: (context, index) =>
          widget.itemBuilder(context, widget.items[index]),
      itemCount: widget.items.length,
      shrinkWrap: true,
      padding:  EdgeInsets.only(left: 8.w, right: 8.w),
      physics: widget.isScroll
          ? const ClampingScrollPhysics()
          : NeverScrollableScrollPhysics(),
    );
  }
}
