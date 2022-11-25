import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          title: 'Dexcom Board',
          theme: ThemeData(
            primarySwatch: AppColors.primarySwatch,
          ),
          routerDelegate: AutoRouterDelegate(appRouter),
          routeInformationParser: appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
