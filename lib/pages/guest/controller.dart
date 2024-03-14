part of 'page.dart';

class GuestController {
  final local = UserSharedUtils.instance;

  void logOut(BuildContext context) {
    local.remove().then((val) {
      Navigator.pushReplacementNamed(context, "/");
    });
  }
}
