import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';

class App extends StatelessWidget {
  App({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dexcom Board',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatch,
      ),
      routerDelegate: AutoRouterDelegate(appRouter),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
