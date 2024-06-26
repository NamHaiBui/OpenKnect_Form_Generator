import 'package:country_state_city/country_state_city.dart';
import 'package:openknect_app/app_common/service/firebase_messaging_service_provider/firebase_messaging_service_provider.dart'
    as opk_app_msg;
import 'package:openknect_app/app_common/presentation/data_provider/button_state/hamburger_menu.dart'
    as bt;

class PackageInitialization {
  static final firebaseMessagingServiceProvider =
      opk_app_msg.firebaseMessagingServiceProvider;

  static final hamburgerMenuProvider = bt.hamburgerMenuProvider;

  static Future<List<String>> _getAllStates() async {
    return (await getAllStates()).cast<String>();
  }

  static Future<List<String>> _getAllCountries() async {
    return (await getAllCountries()).cast<String>();
  }

  static Future<void> initialize() async {
    stateList = await _getAllStates();
    countryList = await _getAllCountries();
  }

  static List<String> stateList = [];
  static List<String> countryList = [];
}
