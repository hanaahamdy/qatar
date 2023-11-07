import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../entities/base_entity.dart';
import '../../../errors/base_error.dart';
import '../../../results/result.dart';
import 'network_widget.dart';

class NetworkList<Entity extends BaseEntity> extends StatelessWidget {
  final bool enableRefresh;
  final bool enablePagination;
  final int pageSize;
  final bool isScroll;
  final Axis listScrollDirection;
  final Widget Function(BuildContext context, Entity item, int index)
      itemBuilder;
  final Future<Result<BaseError, List<Entity>>> Function(
      int pageSize, int pageIndex) loader;
  final WidgetBuilder placeHolder;
  final WidgetBuilder loadingWidgetBuilder;
  final void Function(List<Entity>) getItems;
  final ScrollController? scrollController;
  final bool showTextWhenPagination;

  const NetworkList({
    Key? key,
    required this.loader,
    required this.itemBuilder,
    required this.getItems,
    this.scrollController,
    required this.placeHolder,
    this.pageSize = 10,
    this.isScroll = true,
    this.listScrollDirection = Axis.vertical,
    required this.loadingWidgetBuilder,
    this.enableRefresh = false,
    this.enablePagination = false,
    this.showTextWhenPagination = true,
  }) : super(key: key);

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
          getItems: this.getItems,
          scrollController: this.scrollController,
          listScrollDirection: this.listScrollDirection,
          showTextWhenPagination: showTextWhenPagination,
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
  final ScrollController? scrollController;
  final getItems;
  final Axis? listScrollDirection;
  final bool showTextWhenPagination;

  const _NetworkListContent({
    Key? key,
    required this.items,
    required this.enableRefresh,
    required this.enablePagination,
    required this.pageSize,
    required this.itemBuilder,
    required this.loader,
    required this.placeHolder,
    required this.isScroll,
    required this.listScrollDirection,
    this.getItems,
    this.scrollController,
    this.showTextWhenPagination = true,
  }) : super(key: key);

  @override
  __NetworkListContentState<T> createState() => __NetworkListContentState<T>();
}

class __NetworkListContentState<T extends BaseEntity>
    extends State<_NetworkListContent> {
  // Smart Refresher Controller.
  final _controller = RefreshController();

  // Pagination State.
  late List<T> _items = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    //_items = [...widget.items];
    print(_items);
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    checkGetItemsFunc();
    return SmartRefresher(
      enablePullDown: widget.enableRefresh,
      enablePullUp: widget.enablePagination,
      header: MaterialClassicHeader(
        color: Theme.of(context).accentColor,
      ),
      footer: ClassicFooter(
        loadingIcon: CircularProgressIndicator(),
        // canLoadingText: Translations.of(context).translate('canLoadingText'),
        // failedText: Translations.of(context).translate('loadFailedText'),
        // idleText: Translations.of(context).translate('idleRefreshText'),
        // loadingText: Translations.of(context).translate('loadingText'),
        // noDataText: '',
        // textStyle:
        //     textStyle.smallTSBasic.copyWith(color: globalColor.accentColor),
      ),
      controller: _controller,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: _items.isEmpty
          ? widget.placeHolder(context)
          : ListView.builder(
              // separatorBuilder: (required BuildContext context,  int index) =>
              //     Divider(height: 0.5,color: globalColor.transparent,thickness: .1,),
              controller: widget.scrollController,
              itemBuilder: (context, index) =>
                  widget.itemBuilder(context, _items[index], index),
              itemCount: _items.length,
              shrinkWrap: true,
              scrollDirection: widget.listScrollDirection ?? Axis.vertical,
              physics: widget.isScroll
                  ? BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
            ),
    );
  }

  void _onRefresh() async {
    final result = await widget.loader(widget.pageSize, 0);
    if (result.hasDataOnly) {
      _currentPage = 0;
      setState(() {
        _items.clear();
        result.data?.forEach((entry) => _items.add(entry as T));
      });
    }
    _controller.refreshCompleted(resetFooterState: true);
  }

  void _onLoading() async {
    final result = await widget.loader(widget.pageSize, _currentPage + 1);
    if (result.hasDataOnly) {
      if (result.data?.isNotEmpty ?? false) {
        _currentPage++;
        setState(() {
          result.data?.forEach((entry) => _items.add(entry as T));
        });
        _controller.loadComplete();
      } else
        _controller.loadNoData();
    } else if (result.hasErrorOnly || result.hasDataAndError) {
      _controller.loadFailed();
    }
  }

  void checkGetItemsFunc() {
    print('items is ====================${_items.length}');
    if (widget.getItems != null) {
      widget.getItems(_items);
    }
  }
}
