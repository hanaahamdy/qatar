import 'package:latlong2/latlong.dart';

////////////////////////////////////////////////////////////////////////////////
const ACCESS_TOKEN = 'sk.eyJ1IjoibWFyYWZhdGNpcyIsImEiOiJjbDk4bDU1cjAwMWV1M3ZxdHBoOHZlMnl6In0.h8ZW1f-y1nkGBjmlHi89zw';
const MAP_STYLE= 'cl98l6cal003f14pahz6it10u';
const PAYMENT_API_KEY = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8xTWpJNU1UUjkuUVhqWGd4clBmTzM4OHF4a09nVmM4clNpaERxWlh1NDAxNkI5eTVmaER0T3NyTFVyaUgyQWU0MTQ1cDhCUFFzMmhyMEtmMEVBY1lIcXVNNHhyMTNUSlE=";
const IFRAME_CARD= "https://accept.paymobsolutions.com/api/acceptance/iframes/679278?payment_token=";


// Languages
const LANG_AR = 'ar';
const LANG_EN = 'en';
const APP_NAME = "CONFORUM";
const TOKEN = 'TOKEN_KEY';

// Headers
const HEADER_LANGUAGE = 'Language';
const HEADER_AUTH = 'Authorization';
const HEADER_CONTENT_TYPE = 'Content-Type';
const HEADER_ACCEPT = 'Accept';

// ====================  APP_NAME API URL ====================
const API_BASE = 'https://qatarproduct.online/api';
//==========================
//   User Management API
//==========================

const GMS = '+966';

///const API_AUTH = '$API_BASE/auth';

const API_AUTH_REGISTER = '$API_BASE/register';
const API_AUTH_LOGIN = '$API_BASE/login';
const API_AUTH_LOGOUT = '$API_BASE/logout';
const API_AUTH_DELETE_ACCOUNT = '$API_BASE/delete_account';
const API_PHONE_CODEVERIFY ='$API_BASE/phone_code_verify';
const API_AUTH_USER ='$API_BASE/user';
const API_BASE_ADD='$API_BASE/ads';
const API_BASE_PROFILE='$API_BASE/profile';
const API_UPDATE_PROFILE='$API_BASE/update_profile';
const API_UPDATE_PASSWORD = '$API_BASE/change_password';
const API_TERMS = '$API_BASE/pages/terms';
const API_SETTINGS = '$API_BASE/setting';
const API_ABOUT_US = '$API_BASE/pages/about_us';
const API_CONTACT_US = '$API_BASE/contact_us';
const API_NOTIFICATIONS = '$API_BASE/notifications';
const API_BASE_COMMENTS = '$API_BASE/comments';
const API_GALLERY = "$API_BASE/galleries";

//service
const API_SERVICES= '$API_BASE/services';
//social
const API_SOCIAL_REGISTER = '$API_BASE/social_registration';
const API_SOCIAL_LOGIN = '$API_BASE/social_login';

 ApiCategories(id){
  var API_CATEGORIES= '$API_BASE/categories?service_id=$id';
  return API_CATEGORIES;
 }

ApiAddsCategorie(id, categoryId){
 var API_CATEGORIES= '$API_BASE/ads?service_id=$id&category_id=$categoryId';
 return API_CATEGORIES;
}


ApiFilterAdds(id, List<int> categories, cityId, startDate, endDate){
 var API_CATEGORIES= '$API_BASE/ads?service_id=$id&categories=$categories&start_date=$startDate&end_date=$endDate';
 return API_CATEGORIES;
}

ApiAllAdds(id){
  return '$API_BASE/ads?service_id=$id';
}
ApiServiceDetails(id){
 var API_CATEGORIES= '$API_BASE/ads/$id';
 return API_CATEGORIES;
}
ApiServiceComments(id){
 var API_CATEGORIES= '$API_BASE/comments?ad_id=$id';
 return API_CATEGORIES;
}

ApiAddFavorite(id){
 var API_CATEGORIES= '$API_BASE/favourite/$id';
 return API_CATEGORIES;
}

ApiSortServices(catId, serviceId, sort){
 var API_CATEGORIES= '$API_BASE/ads?category_id=$catId&sort=$sort&service_id=$serviceId';
 return API_CATEGORIES;
}

//Apis account
const String API_FAVORITES ='$API_BASE/my_favourites';
const String API_MY_ADDS ='$API_BASE/my_ads';

//Api accountant
const String API_ACCOUNT_PROJECTS= '$API_BASE/account_projects';

ApiActionAccountProjects(id){
  String API_ACTION_ACCOUNT ='$API_BASE/account_projects/$id';
 return API_ACTION_ACCOUNT;
}
ApiSearch(search){
  return '$API_BASE_ADD?search=$search';
}
const String API_PROJECT_SUPPLIER= '$API_BASE/project_suppliers';
const String API_SUPPLIER_TRANSACTION = '$API_BASE/supplier_transactions';
const String API_SUPPLIER_MOVEMENT = '$API_BASE/transaction_movements';
const String API_BASE_PACKAGES = '$API_BASE/packages';
const String API_BASE_SUBSCRIPTIONS = '$API_BASE/subscriptions';

ApiActionProjectSupplierProjects(id){
 String API_ACTION_ACCOUNT ='$API_BASE/account_projects/$id';
 return API_ACTION_ACCOUNT;
}

ApiGetProjectSuppliers(id){
 String API_ACTION_ACCOUNT ='$API_BASE/project_suppliers?account_project_id=$id';
 return API_ACTION_ACCOUNT;
}

ApiGetProjectSupplierDetails(id){
 String API_ACTION_ACCOUNT ='$API_BASE/project_suppliers/$id';
 return API_ACTION_ACCOUNT;
}



const String API_BASE_MATERIALS ='$API_BASE/materials';
const String API_BASE_PROJECTS = '$API_BASE/projects';
const API_PROJECT_MATERIALS= '$API_BASE/project_materials';
ApiGetProjectDetails(id){
 return '$API_PROJECT_MATERIALS?project_id=$id';
}

getCustomFieldsUrl(id){
 return '$API_BASE/custom_fields?service_id=$id';
}

ApiDeleteProject(id){
 return '$API_BASE_PROJECTS/$id';
}

ApiSupplierTransaction(id){
 return '$API_SUPPLIER_TRANSACTION/$id';
}

ApiSupplierMovement(id){
 return '$API_SUPPLIER_MOVEMENT/$id';
}
ApiMovement(id){
 return '$API_SUPPLIER_MOVEMENT/$id';
}

const String API_BASE_CITIES ='$API_BASE/cities?country_id= 1';
const API_FORGET_PASSWORD = '$API_BASE/forget_password';
const API_PHONE_CODE ="$API_BASE/password_phone_code";
const API_RESET_PASSWORD ="$API_BASE/password_reset";
const API_PROFILE_ID ='$API_BASE/profile_id';
const API_BOOKING = "$API_BASE/bookings";
// Keys
const KEY_LANG = 'lang';
const KEY_TOKEN = 'token';
const USER_DATA_LOGIN = 'user_data_login';
const KEY_FCM_TOKEN = 'fcm_token';
const KEY_SOCIAL_ACOOUNTS ='social_accounts';
const KEY_ON_BOARDING = 'on_boarding';
const MESSAGE_CODE_SUCCESS = 0;
const MESSAGE_CODE_ERROR = 1;
const MESSAGE_CODE_TOKEN_NOT_FOUND = 2;
const MESSAGE_CODE_LOGIN_REQUIRED = 3;
const MESSAGE_CODE_ACCOUNT_NOT_VERIFIED = 4;
const MESSAGE_CODE_OTHER = 5;
// Notifications Channels
const NOTIFICATIONS_CHANNEL_ID = 'global-channel';
const NOTIFICATIONS_CHANNEL_TITLE = 'Global';
const NOTIFICATIONS_CHANNEL_DESCRIPTION = 'Global Channel';
const KEY_REMEMBER = 'remember';
const USER_ID ="user_id";
const KEY_PICTURE ="key_picture";
// Notification Type
const int ADD_COMMENTS = 1;
const int ADD_SUBSCRIPTION = 2;
const int ADD_NWE_POST = 3;

const int NOTIFY_AUCTION_BEFORE_HOUR = 4;
const int NOTIFY_AUCTION_ON_TIME = 5;
const int NOTIFICATION_TO_USERS = 6;

//Hive Boxes

const BOX_LIST_NOTIFICATIONS = 'list_notifcations';

 const String empty = "";
 const String token = "SEND TOKEN HERE";
 const int zero = 0;
 const int apiTimeOut = 60000;