import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:next_starter/application/auth/auth_cubit.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/pages/auth/auth.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../common/utils/config.dart';
import '../components/app_error_view.dart';
import '../router/app_router.dart';
import '../theme/theme.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    super.key,
    required this.navigatorKey,
  });

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late final GoRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter.router(widget.navigatorKey);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthCubit>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => OverlaySupport(
          child: FlavorBanner(
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccessLogout) {
                  _appRouter.go(LoginPage.path);
                }
              },
              child: MaterialApp.router(
                title: Configs.titleApp,
                theme: AppCoreTheme.theme,
                darkTheme: AppCoreTheme.theme,
                locale: const Locale('id'),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                routeInformationProvider: _appRouter.routeInformationProvider,
                routeInformationParser: _appRouter.routeInformationParser,
                routerDelegate: _appRouter.routerDelegate,
                builder: (BuildContext context, Widget? child) {
                  ErrorWidget.builder =
                      (FlutterErrorDetails details) => AppErrorView(details: details);
                  return child!;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
