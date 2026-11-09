import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/custom_auth/custom_auth_user_provider.dart';

import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
  }
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  final environmentValues = FFDevEnvironmentValues();
  await environmentValues.initialize();

  // Start initial custom actions code
  await actions.getVersionNumber();
  await actions.initializeOneSignal();
  // End initial custom actions code

  await SupaFlow.initialize();

  await FlutterFlowTheme.initialize();

  await FFLocalizations.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  // Start final custom actions code
  await actions.initBranch();
  // End final custom actions code

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class _MyAppState extends State<MyApp> {
  Locale? _locale = FFLocalizations.getStoredLocale();

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.path;
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<SBCareSmileBirthAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = sBCareSmileBirthAuthUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });

    Future.delayed(
      Duration(milliseconds: isWeb ? 0 : 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
    FFLocalizations.storeLocale(language);
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SBCare - SmileBirth',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('id'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(false),
          trackVisibility: WidgetStateProperty.all(false),
          interactive: true,
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(4294954449);
            }
            if (states.contains(WidgetState.hovered)) {
              return Color(4294954449);
            }
            return Color(4294954449);
          }),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(false),
          trackVisibility: WidgetStateProperty.all(false),
          interactive: true,
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return Color(4294954449);
            }
            if (states.contains(WidgetState.hovered)) {
              return Color(4294954449);
            }
            return Color(4294954449);
          }),
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomeNavbar';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomeNavbar': HomeNavbarWidget(),
      'ModuleNavbar': ModuleNavbarWidget(),
      'MitraNavbar': MitraNavbarWidget(),
      'WalletNavbar': WalletNavbarWidget(),
      'ProfileNavbar': ProfileNavbarWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => safeSetState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).sbCareLightColor,
        selectedItemColor: FlutterFlowTheme.of(context).sbcarePrimaryColor,
        unselectedItemColor: Color(0xFF575B6C),
        selectedBackgroundColor: FlutterFlowTheme.of(context).sbCareLightColor,
        borderRadius: 8.0,
        itemBorderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        width: MediaQuery.sizeOf(context).width * 0.95,
        elevation: 4.0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  const IconData(/* home */ 0xf015,
                      fontFamily: 'FontAwesomeRegular',
                      fontPackage: 'font_awesome_flutter'),
                  color: currentIndex == 0
                      ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                      : Color(0xFF575B6C),
                  size: 24.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    's0n9kk2q' /* Home */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                        : Color(0xFF575B6C),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  const IconData(/* bookReader */ 0xf5da,
                      fontFamily: 'FontAwesomeSolid',
                      fontPackage: 'font_awesome_flutter'),
                  color: currentIndex == 1
                      ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                      : Color(0xFF575B6C),
                  size: 24.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'iqtnkuo3' /* Module */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                        : Color(0xFF575B6C),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.workspace_premium_outlined,
                  color: currentIndex == 2
                      ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                      : Color(0xFF575B6C),
                  size: 24.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'mb48ig05' /* Provider */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                        : Color(0xFF575B6C),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  const IconData(/* wallet */ 0xf555,
                      fontFamily: 'FontAwesomeSolid',
                      fontPackage: 'font_awesome_flutter'),
                  color: currentIndex == 3
                      ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                      : Color(0xFF575B6C),
                  size: 24.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'darpbzuf' /* SBPay */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                        : Color(0xFF575B6C),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  const IconData(/* solidUserCircle */ 0xf2bd,
                      fontFamily: 'FontAwesomeSolid',
                      fontPackage: 'font_awesome_flutter'),
                  color: currentIndex == 4
                      ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                      : Color(0xFF575B6C),
                  size: 24.0,
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'tzsk6ky7' /* Profile */,
                  ),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 4
                        ? FlutterFlowTheme.of(context).sbcarePrimaryColor
                        : Color(0xFF575B6C),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
