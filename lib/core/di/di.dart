
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/account/data/datasource/account_datasource.dart';
import '../../features/account/data/datasource/concrete_account_datasource.dart';
import '../../features/account/data/repository/concrete_account_repository.dart';
import '../../features/account/domain/repository/account_repository.dart';
import '../../features/booking/data/datasource/booking_remote_datasource.dart';
import '../../features/booking/data/datasource/concrete_booking_datasource.dart';
import '../../features/booking/data/repositort/concrete_book_repository.dart';
import '../../features/booking/domain/repository/booking_repository.dart';
import '../../features/services/data/datasource/concrete_services_remote_datasource.dart';
import '../../features/services/data/datasource/service_remote_datasource.dart';
import '../../features/services/data/repository/concrete_services_repository.dart';
import '../../features/services/domain/repository/services_repository.dart';
import '../../features/user_managment/data/datasource/concrete_user_remote_datasource.dart';
import '../../features/user_managment/data/datasource/user_remote_datasource.dart';
import '../../features/user_managment/data/repositories/concrete_user_managment_repositoty.dart';
import '../../features/user_managment/domain/repository/user_managment_repository.dart';
import '../services/firebase_sservices.dart';
import '../utils/app_prefs.dart';


final locator = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  locator.registerLazySingleton<AppPreferences>(() => AppPreferences(sharedPrefs));


  locator.registerLazySingleton<ImagePicker>(() => ImagePicker());
  //services
  locator.registerLazySingleton<FirebaseServices>(() => FirebaseServices());
  //app prefs instance

  ////////////////////////SERVICES//////////////////////////////////////////
  locator.registerLazySingleton<ServicesRemoteDataSource>(() => ConcreteServicesRemoteDataSource());
  locator.registerLazySingleton<ServicesRepository>(() => ConcreteServicesRepository(locator()));

  ////////////////////////ABOUT//////////////////////////////////////////
  locator.registerLazySingleton<AccountRemoteDataSource>(() => ConcreteAccountDataSource());
  locator.registerLazySingleton<AccountRepository>(() => ConcreteAccountRepository(locator()));


  ////////////////////////USER//////////////////////////////////////////
  locator.registerLazySingleton<UserRemoteDatasource>(() => ConcreteUserRemoteDataSource());
  locator.registerLazySingleton<UserManagementRepository>(() => ConcreteUserManagementRepository(locator()));

  ////////////////////////BOOKING//////////////////////////////////////////
  locator.registerLazySingleton<BookingRemoteDataSource>(() => ConcreteBookingRemoteDataSource());
  locator.registerLazySingleton<BookingRepository>(() => ConcreteBookRepository(locator()));
}
