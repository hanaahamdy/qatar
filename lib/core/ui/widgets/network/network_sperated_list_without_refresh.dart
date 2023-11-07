import 'package:flutter/material.dart';

import '../../../entities/base_entity.dart';
import '../../../errors/base_error.dart';
import '../../../resources/color_manager.dart';
import '../../../results/result.dart';
import 'network_widget.dart';

class NetworkSperatedListWithoutRefresh<Entity extends BaseEntity>
    extends StatelessWidget {
  final bool enableRefresh;
  final bool enablePagination;
  final int pageSize;
  final bool isScroll;
  final Widget Function(BuildContext context, Entity item, int index)
      itemBuilder;
  final Future<Result<BaseError, List<Entity>>> Function(
      int pageSize, int pageIndex) loader;
  final WidgetBuilder placeHolder;
  final WidgetBuilder loadingWidgetBuilder;
  final void Function(List<Entity>) getItems;

//  final ScrollController scrollController;

  const NetworkSperatedListWithoutRefresh(
      {Key? key,
      required this.loader,
      required this.itemBuilder,
      this.enableRefresh = false,
      //  this.scrollController,
      this.enablePagination = false,
      this.pageSize = 10,
      this.isScroll = true,
      required this.placeHolder,
      required this.loadingWidgetBuilder,
      required this.getItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkWidget<List<Entity>>(
      builder: (context, networkItems) {
        return _NetworkListContent<Entity>(
          items: networkItems,
          enableRefresh: enableRefresh,
          enablePagination: enablePagination,
          pageSize: pageSize,
          itemBuilder: itemBuilder,
          loader: loader,
          isScroll: isScroll,
          placeHolder: placeHolder,
          // scrollController: this.scrollController,
          getItems: this.getItems,
        );
      },
      fetcher: () {
        return loader(pageSize, 0);
      },
      loadingWidgetBuilder: loadingWidgetBuilder,
    );
  }
}

class _NetworkListContent<T extends BaseEntity> extends StatefulWidget {
  final List<T> items;
  final bool enableRefresh;
  final bool enablePagination;
  final bool isScroll;
  final int pageSize;
  final dynamic itemBuilder;
  final Future<Result<BaseError, List<T>>> Function(int pageSize, int pageIndex)
      loader;
  final WidgetBuilder placeHolder;
  final getItems;

//  final ScrollController scrollController;
  const _NetworkListContent(
      {Key? key,
      required this.items,
      required this.enableRefresh,
      required this.enablePagination,
      required this.pageSize,
      required this.itemBuilder,
      required this.loader,
      //     this.scrollController,
      required this.placeHolder,
      required this.isScroll,
      this.getItems})
      : super(key: key);

  @override
  __NetworkListContentState<T> createState() => __NetworkListContentState<T>();
}

class __NetworkListContentState<T extends BaseEntity>
    extends State<_NetworkListContent> {
  // Pagination State.
  List<T> _items = [];

  @override
  void initState() {
    super.initState();
    // _items = [...widget.items];
    // print(_items);
  }

  @override
  Widget build(BuildContext context) {
    checkGetItemsFunc();
    return _items.isEmpty
        ? widget.placeHolder(context)
        : ListView.separated(
            //   controller: widget.scrollController,
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1.5,
              color: ColorManager.grey.withOpacity(0.3),
              thickness: .8,
            ),
            itemBuilder: (context, index) =>
                widget.itemBuilder(context, _items[index], index),
            itemCount: _items.length,
            shrinkWrap: true,
            physics: widget.isScroll
                ? BouncingScrollPhysics()
                : NeverScrollableScrollPhysics(),
          );
  }

  void checkGetItemsFunc() {
    if (widget.getItems != null) {
      widget.getItems(_items);
    }
  }
}
