import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisma_boe/model/customer_model/customer_model.dart';

class CustomerSharedUtils {
  final _key = "customer-key-broo";

  late final SharedPreferences _preferences;

  CustomerSharedUtils._();

  static final instance = CustomerSharedUtils._();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setCustomer(CustomerModel value) async {
    await _preferences.setString(_key, value.toJson());
  }

  bool check() => _preferences.containsKey(_key);

  CustomerModel? getCustomer() {
    return check() ? CustomerModel.fromJson(_preferences.getString(_key)!) : null;
  }

  Future<void> remove() async {
    await _preferences.remove(_key);
  }
}
