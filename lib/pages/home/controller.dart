part of 'page.dart';

class HomeController {
  ValueNotifier<dynamic> result = ValueNotifier(null);
  final local = UserSharedUtils();

  void logOut(BuildContext context) {
    local.remove().then((val) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }

  void goPrinterPage(BuildContext context) {
    Navigator.pushNamed(context, "/printer");
  }
}
