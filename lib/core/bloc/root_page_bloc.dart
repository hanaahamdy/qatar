// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// abstract class RootPageState extends Equatable {}
//
// class PageIndexState extends RootPageState {
//   final int pageIndex;
//
//   PageIndexState(this.pageIndex);
//
//   @override
//   List<Object> get props => [pageIndex];
// }
//
// abstract class RootPageEvent extends Equatable {}
//
// class ChangePageEvent extends RootPageEvent {
//   final int pageIndex;
//
//   ChangePageEvent(this.pageIndex);
//
//   @override
//   List<Object> get props => [pageIndex];
// }
//
// class RootPageBloc extends Bloc<RootPageEvent, RootPageState> {
//   RootPageBloc() : super(PageIndexState(0));
//
//   @override
//   Stream<RootPageState> mapEventToState(RootPageEvent event) async* {
//     if (event is ChangePageEvent) {
//       yield PageIndexState(event.pageIndex);
//     }
//   }
// }
