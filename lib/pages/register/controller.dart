part of 'page.dart';

class RegisterController {
  final _dio = NetworkUtils.instance.dio;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nikController = TextEditingController();
  final namaController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final userLocal = UserSharedUtils.instance;

  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Error'),
            content: Text("Password and confirm password doesn't match."),
          ),
        );
        return;
      }

      context.showLoading();
      try {
        final response = await _dio.post(
          "register-customer",
          data: {
            "email": emailController.text,
            "password": passwordController.text,
            "password_confirm": confirmPasswordController.text,
            "nik": nikController.text,
            "name": namaController.text,
            "address": addressController.text,
            "phone": phoneController.text,
            "gender": "wanita",
          },
        );
        context.hideLoading();
        userLocal.setUser(response.data['data']);
        Navigator.pushReplacementNamed(context, SplashPage.route);
      } catch (e) {
        context.hideLoading();
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Error'),
            content: Text("Registration failed. Please try again."),
          ),
        );
      }
    }
  }
}
