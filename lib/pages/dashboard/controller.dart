part of 'page.dart';

class DashboardController {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  final local = UserSharedUtils.instance;

  void logOut(BuildContext context) {
    local.remove().then((val) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  void goPrinterPage(BuildContext context) {
    Navigator.pushNamed(context, "/printer");
  }
}
