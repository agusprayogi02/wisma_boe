import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/presentation/pages/pages.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../application/auth/auth_cubit.dart';
import '../../../../injection.dart';
import '../../../common/extensions/extensions.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.isAddAccount = false});

  final bool isAddAccount;

  static const path = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final form = fb.group({
    'email': [
      kDebugMode ? 'admin@mail.com' : '',
      Validators.required,
      Validators.email,
    ],
    'password': [kDebugMode ? '12345678' : '', Validators.required],
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthCubit>(),
      child: ReactiveFormBuilder(
        form: () => form,
        builder: (context, form, child) => BaseScaffold(
          appBar: const BaseAppBar(),
          bottomNavigationBar: Container(
            height: kBottomNavigationBarHeight * 2.5,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  context.showLoadingIndicator();
                } else if (state is AuthError) {
                  context.showSnackbar(message: state.message, error: true, isPop: true);
                } else if (state is AuthSuccess) {
                  context.showSnackbar(message: state.message);
                  context.route.pushReplacement(HomeKeeperPage.path);
                }
              },
              builder: (context, state) {
                return ReactiveFormConsumer(
                  builder: (context, formG, child) {
                    return Column(
                      children: [
                        PrimaryButton(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (widget.isAddAccount) {
                              context.route.pop();
                            } else {
                              context.read<AuthCubit>().login(formG.value);
                              // context.route.go(HomeKeeperPage.path);
                            }
                          },
                          title: "Masuk",
                          isEnable: formG.valid,
                        ),
                        18.verticalSpace,
                        Text.rich(
                          TextSpan(
                            text: "Belum memiliki akun? ",
                            style: AppStyles.text14Px.copyWith(
                              color: ColorTheme.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Daftar",
                                style: AppStyles.text14PxBold.copyWith(
                                  color: ColorTheme.primary,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.route.goNamed(RegisterPage.path),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextTheme.heading4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Wisma BOE',
                  style: AppStyles.text36PxBold.copyWith(
                    color: ColorTheme.primary,
                  ),
                ),
                50.verticalSpace,
                const TextInput(
                  title: "Email",
                  formControlName: "email",
                  hint: 'Masukkan Email anda',
                  textInputType: TextInputType.emailAddress,
                  prefix: Icon(Icons.person),
                  isRequiredText: true,
                ),
                6.verticalSpace,
                const PasswordInput(
                  formControlName: "password",
                  title: "Password",
                  hint: "Masukkan Password anda",
                  isRequiredText: true,
                  prefix: Icon(Icons.key),
                ),
                8.verticalSpace,
                Text.rich(
                  TextSpan(
                    text: "Lupa kata sandi ? ",
                    style: AppStyles.text14Px.copyWith(
                      color: ColorTheme.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Klik di sini",
                        style: AppStyles.text14PxBold.copyWith(
                          color: ColorTheme.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.route.goNamed(ForgotPasswordPage.path),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
