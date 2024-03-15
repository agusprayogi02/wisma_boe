part of 'page.dart';

class LoginController {
  final _dio = NetworkUtils.instance.dio;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userLocal = UserSharedUtils.instance;

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      context.showLoading();
      _dio.post("login", data: {
        "email": emailController.text,
        "password": passwordController.text,
      }).then((value) {
        context.hideLoading();
        userLocal.setUser(value.data['data']);
        Navigator.pushReplacementNamed(context, SplashPage.route);
      }).catchError((e) {
        context.hideLoading();
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Error'),
            content: Text("Email or Password salah!"),
          ),
        );
      });
    }
  }
}
