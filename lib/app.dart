import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poc/blocs/weather/weather_bloc.dart';
import '/presentation/widgets/app_screen_widget.dart';
import '/routes/page_routes.dart';
import '/routes/routemaster_log_observer.dart';
import 'package:routemaster/routemaster.dart';
import 'blocs/app_state_bloc.dart';
import 'blocs/appsettings/app_settings_bloc.dart';
import 'blocs/laf_bloc_observer.dart';
import 'core/consts/app_consts.dart';
import 'core/localization/app_localization.dart';
import 'core/theme/laf_theme.dart';
import 'core/utils/injector.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = LafBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await Injector.init(
    appRunner: () => runApp(
      const AppWrapper(),
    ),
  );
}

class AppWrapper extends StatelessWidget {

  const AppWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppStateBloc>(
          create: (context) => AppStateBloc()..add(const CheckAppStateEvent()),
        ),
        BlocProvider<AppSettingsBloc>(
          create: (context) => AppSettingsBloc()..add(const AppSettingsOnLoadEvent()),
        ),
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc()..add(GetWeatherEvent(cityName: 'London')),
        ),
      ],
      child: App(
        observerList: [
          RouteMasterLogObserver(),
        ],
      ),
    );
  }
}

class App extends StatefulWidget {
  /// A list of [NavigatorObserver] that will capture all navigation events.
  ///
  /// Separate observers should be defined for separate purposes, depending
  /// on where the captured data is being sent.
  final List<RoutemasterObserver> observerList;

  const App({
    Key? key,
    this.observerList = const [],
  }) : super(key: key);

  @override
  AppMainState createState() => AppMainState();
}

class AppMainState extends State<App> {
  late final RoutemasterDelegate routeMaster;

  @override
  void initState() {
    routeMaster = RoutemasterDelegate(
      observers: widget.observerList,
      routesBuilder: (context) {
        final state = BlocProvider.of<AppStateBloc>(context).state;
        if (state is AppLoginState) {
          return PageRoutes.login;
        } else if (state is AppRootState) {
          return PageRoutes.root;
        } else if (state is AppLoggedOutState) {
          return PageRoutes.loggedOut;
        } else {
          return PageRoutes.loading;
        }
      },
    );
   // getFcmToken(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppState>(
      builder: (context, appState) {
        return ScreenUtilInit(
            designSize: const Size(
              AppConsts.screenWidth,
              AppConsts.screenHeight,
            ),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return BlocBuilder<AppSettingsBloc, AppSettingsState>(
                builder: (context, state) {
                  if (state is AppSettingsOnLoadState) {
                    return MaterialApp.router(
                      key: ObjectKey(appState),
                      title: AppConsts.appName,
                      debugShowCheckedModeBanner: false,
                      theme: LAFAppTheme.lightTheme(),
                      darkTheme: LAFAppTheme.darkTheme(),
                      themeMode: state.themeMode,
                      routeInformationParser: const RoutemasterParser(),
                      routerDelegate: routeMaster,
                      locale: state.locale,
                      localizationsDelegates: const [
                        AppLocalization.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: const [
                        Locale('en', 'US'),
                        Locale('es', ''),
                      ],
                      builder: (context, child) => AppScreenWidget(
                        child: MediaQuery(
                          // override OS-level font scaling
                          data: MediaQuery.of(context)
                              .copyWith(textScaleFactor: 1.0),
                          child: child ?? const SizedBox.shrink(),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            });
      },
    );
  }
}
