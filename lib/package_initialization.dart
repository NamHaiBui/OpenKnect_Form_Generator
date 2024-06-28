import 'package:country_state_city/country_state_city.dart';
import 'package:openknect_app/app_common/service/firebase_messaging_service_provider/firebase_messaging_service_provider.dart'
    as opk_app_msg;
import 'package:openknect_app/app_common/presentation/data_provider/button_state/hamburger_menu.dart'
    as bt;

class FormPackageInitialization {
  static final firebaseMessagingServiceProvider =
      opk_app_msg.firebaseMessagingServiceProvider;

  static final hamburgerMenuProvider = bt.hamburgerMenuProvider;

  static Future<List<State>> _getAllStates() async {
    return await getAllStates();
  }

  static Future<List<Country>> _getAllCountries() async {
    return await getAllCountries();
  }

  static Future<void> initialize() async {
    stateList = await _getAllStates();
    countryList = await _getAllCountries();
  }

  static List<State> stateList = [];
  static List<Country> countryList = [];
}
