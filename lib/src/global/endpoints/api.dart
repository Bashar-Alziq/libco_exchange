import '../utils/config.dart';

class ApiendPoints {
  static String root = '${AppConfig.baseUrl}/';
  static String baseApi = '${root}api/';
  static String getUser = '${baseApi}profile-info';
  static String updateUser = '${baseApi}update-account-setting';
  static String logout = '${baseApi}logout';
  static String login = '${baseApi}login';
  static String signup = '${baseApi}register';
  static String companies = '${baseApi}companies';
  static String sendtransfer = '${baseApi}send-transfer';
  static String recivetransfer = '${baseApi}receive-transfer';
  static String exchangePrices = '${baseApi}exchange-prices';
  static String transfers = '${baseApi}transfers';
  static String lydPrices = '${baseApi}get-lyd-prices';
  static String freezeStatus = '${baseApi}freez-check';
  static String appInfo = '${baseApi}about-us';
}
