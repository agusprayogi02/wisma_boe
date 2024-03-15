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
  final genderController = TextEditingController();
  final userLocal = UserSharedUtils.instance;

  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Gagal'),
            content: Text("Password dan konfirmasi password tidak sesuai"),
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
            "gender": genderController.text,
          },
        );
        context.hideLoading();
        userLocal.setUser(response.data['data']);
        Navigator.pushReplacementNamed(context, SplashPage.route);
      } on DioException catch (e) {
        context.hideLoading();
        if (e.response?.statusCode == 422 ||
            e.response?.statusCode == 500 ||
            e.response?.statusCode == 404) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.response != null
                  ? e.response!.data['message']
                  : e.message ?? e.toString()),
              backgroundColor: Colors.red,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message ?? e.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
