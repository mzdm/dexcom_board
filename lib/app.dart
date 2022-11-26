import 'package:dexcom_board/common.dart';
import 'package:dexcom_board/navigation/app_router.gr.dart';
import 'package:dexcom_board/providers/glucose_range_provider.dart';
import 'package:dexcom_board/utils/app_setup.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  AppRouter get appRouter => locator.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GlucoseRangeProvider>(create: (_) => GlucoseRangeProvider()),
      ],
      child: MaterialApp.router(
        title: 'Dexcom Board',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: AppColors.primarySwatch,
        ),
        routerDelegate: AutoRouterDelegate(appRouter),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
