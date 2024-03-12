part of 'page.dart';

class LoginController {
  final _dio = NetworkUtils.instance.dio;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userLocal = UserSharedUtils();

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: PopScope(
            canPop: false,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      );
      _dio.post("login", data: {
        "email": emailController.text,
        "password": passwordController.text,
      }).then((value) {
        Navigator.pop(context);
        userLocal.setUser(value.data['data']);
        Navigator.pushReplacementNamed(context, HomePage.route);
      }).catchError((e) {
        Navigator.pop(context);
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
