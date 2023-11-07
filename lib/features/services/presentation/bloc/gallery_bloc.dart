import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:ehsan_1/features/services/domain/repository/services_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../../../../core/errors/base_error.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/utils/app_prefs.dart';
import '../../domain/entity/gallery_entity.dart';
import '../../domain/usecase/gallery_usecase.dart';


abstract class GalleryState extends Equatable {}

class GalleryUninitialized extends GalleryState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GalleryUninitialized';
}

class GalleryLoading extends GalleryState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'GalleryLoading';
}

class GallerySuccess extends GalleryState {
  final List<GalleryEntity> data;

  GallerySuccess({required this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'GallerySuccess { data: $data }';
}


class GalleryFailure extends GalleryState {
  final BaseError? error;
  final VoidCallback? callback;

  GalleryFailure({
    required this.error,
    this.callback,
  }) : assert(error != null);

  @override
  List<Object> get props => [error!, callback!];

  @override
  String toString() => 'GalleryFailure { error: $error }';
}

class GalleryEvent extends Equatable {

  GalleryEvent();

  @override
  List<Object> get props => [

  ];

  @override
  String toString() => 'GalleryEvent';
}

class  GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryUninitialized());

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    yield GalleryLoading();
    final result = await GalleryUseCase(locator<ServicesRepository>())(
        NoParams(cancelToken: CancelToken())
    );

    if (result.hasDataOnly) {
      yield GallerySuccess(data: result.data!);

    }
    if (result.hasErrorOnly) {
      yield GalleryFailure(
        error: result.error!,
        callback: () {
          this.add(event);
        },
      );
    }
  }
}