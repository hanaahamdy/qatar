import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

@immutable
abstract class ApplicationEvent extends Equatable {}

class ApplicationStartedEvent extends ApplicationEvent {
  final BuildContext context;

  ApplicationStartedEvent(this.context);

  @override
  String toString() => 'ApplicationStartedEvent';

  @override
  List<Object> get props => [context];
}

abstract class SetApplicationLanguageEvent extends ApplicationEvent {
  final String language;

  SetApplicationLanguageEvent(this.language);

  @override
  String toString() => 'SetApplicationLanguageEvent { language: $language }';

  @override
  List<Object> get props => [language];
}

class SetArabicLanguageEvent extends SetApplicationLanguageEvent {

  SetArabicLanguageEvent() : super(LANG_AR);
}

class SetEnglishLanguageEvent extends SetApplicationLanguageEvent {

  SetEnglishLanguageEvent() : super(LANG_EN);
}

class UserLogoutEvent extends ApplicationEvent {
  BuildContext context;

  UserLogoutEvent(this.context);

  @override
  String toString() => 'UserLogoutEvent';

  @override
  List<Object> get props => [];
}

class SetUserDataLoginEvent extends ApplicationEvent {
  @override
  String toString() => 'SetUserProfileEvent';

  @override
  List<Object> get props => [];
}

class VerifyUserAccountEvent extends ApplicationEvent {
  @override
  String toString() => 'VerifyUserAccountEvent';

  @override
  List<Object> get props => [];
}

// class SetProfileSplashEvent extends ApplicationEvent {
//   final LoginEntity? profileEntity;
//   SetProfileSplashEvent({required this.profileEntity});
//   @override
//   String toString() => 'SetProfileSplashEvent';
//
//   @override
//   List<Object> get props => [profileEntity!];
// }

class GetFCMTokenAndUpdateItEvent extends ApplicationEvent {
  GetFCMTokenAndUpdateItEvent();

  @override
  String toString() => 'GetFCMTokenAndUpdateItEvent';

  @override
  List<Object> get props => [];
}
