


class ApplicationState {
  // Current user language.
  final String? language;

  // // Current user profile.
 // final LoginEntity? profileEntity;

  ApplicationState({
    this.language,
    //this.profileEntity,
  });

  ApplicationState copyWith({
    String? language,
    //LoginEntity? loginEntity,
  }) =>
      ApplicationState(
        language: language ?? this.language,
        //profileEntity: loginEntity ?? this.profileEntity,
      );

  ApplicationState clearProfile() {
    return ApplicationState(
      language: language,
      //profileEntity: null,
    );
  }

  static ApplicationState get initialState => ApplicationState();

  // bool get isUserAuthenticated => this.profileEntity != null;
  //
  // bool get isUserVerified => this.profileEntity != null;
}
