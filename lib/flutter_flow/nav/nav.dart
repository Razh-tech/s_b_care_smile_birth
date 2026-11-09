import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/auth/custom_auth/custom_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  SBCareSmileBirthAuthUser? initialUser;
  SBCareSmileBirthAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SBCareSmileBirthAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : HomePublicPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : HomePublicPageWidget(),
          routes: [
            FFRoute(
              name: RegistrationScreenWidget.routeName,
              path: RegistrationScreenWidget.routePath,
              builder: (context, params) => RegistrationScreenWidget(),
            ),
            FFRoute(
              name: SigninScreenWidget.routeName,
              path: SigninScreenWidget.routePath,
              builder: (context, params) => SigninScreenWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
                uuidProgramClass: params.getParam(
                  'uuidProgramClass',
                  ParamType.String,
                ),
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ForgotPasswordScreenWidget.routeName,
              path: ForgotPasswordScreenWidget.routePath,
              builder: (context, params) => ForgotPasswordScreenWidget(),
            ),
            FFRoute(
              name: CreateNewPasswordScreenWidget.routeName,
              path: CreateNewPasswordScreenWidget.routePath,
              builder: (context, params) => CreateNewPasswordScreenWidget(
                token: params.getParam(
                  'token',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: VerifyEmailScreenWidget.routeName,
              path: VerifyEmailScreenWidget.routePath,
              builder: (context, params) => VerifyEmailScreenWidget(
                destinationEmail: params.getParam(
                  'destinationEmail',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WalletNavbarWidget.routeName,
              path: WalletNavbarWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'WalletNavbar')
                  : WalletNavbarWidget(),
            ),
            FFRoute(
              name: ProfileNavbarWidget.routeName,
              path: ProfileNavbarWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ProfileNavbar')
                  : ProfileNavbarWidget(
                      userId: params.getParam(
                        'userId',
                        ParamType.String,
                      ),
                    ),
            ),
            FFRoute(
              name: MitraNavbarWidget.routeName,
              path: MitraNavbarWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MitraNavbar')
                  : MitraNavbarWidget(
                      isProvider: params.getParam(
                        'isProvider',
                        ParamType.bool,
                      ),
                    ),
            ),
            FFRoute(
              name: AppointmentMitraSchedulePageWidget.routeName,
              path: AppointmentMitraSchedulePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  AppointmentMitraSchedulePageWidget(),
            ),
            FFRoute(
              name: AppointmentMitraDetailPageWidget.routeName,
              path: AppointmentMitraDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentMitraDetailPageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AppointmentVerificationPageWidget.routeName,
              path: AppointmentVerificationPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentVerificationPageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
                appointmentTitle: params.getParam(
                  'appointmentTitle',
                  ParamType.String,
                ),
                appointmentPrice: params.getParam(
                  'appointmentPrice',
                  ParamType.int,
                ),
                formattedPrice: params.getParam(
                  'formattedPrice',
                  ParamType.String,
                ),
                feeService: params.getParam(
                  'feeService',
                  ParamType.int,
                ),
                formattedFee: params.getParam(
                  'formattedFee',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ServiceListPageWidget.routeName,
              path: ServiceListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ServiceListPageWidget(),
            ),
            FFRoute(
              name: LicenceListPageWidget.routeName,
              path: LicenceListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => LicenceListPageWidget(),
            ),
            FFRoute(
              name: RegularModuleListPageWidget.routeName,
              path: RegularModuleListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegularModuleListPageWidget(),
            ),
            FFRoute(
              name: PracticeModuleListPageWidget.routeName,
              path: PracticeModuleListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PracticeModuleListPageWidget(),
            ),
            FFRoute(
              name: TopupPageWidget.routeName,
              path: TopupPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TopupPageWidget(),
            ),
            FFRoute(
              name: TransferPageWidget.routeName,
              path: TransferPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TransferPageWidget(),
            ),
            FFRoute(
              name: TransactionHistoryListPageWidget.routeName,
              path: TransactionHistoryListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TransactionHistoryListPageWidget(),
            ),
            FFRoute(
              name: AppointmentDetailPageWidget.routeName,
              path: AppointmentDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentDetailPageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AppointmentCodePageWidget.routeName,
              path: AppointmentCodePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentCodePageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProviderSuccessBookScreenWidget.routeName,
              path: ProviderSuccessBookScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProviderSuccessBookScreenWidget(),
            ),
            FFRoute(
              name: ProviderServicePageWidget.routeName,
              path: ProviderServicePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProviderServicePageWidget(
                uuidUser: params.getParam(
                  'uuidUser',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProfileSettingPageWidget.routeName,
              path: ProfileSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProfileSettingPageWidget(
                userId: params.getParam(
                  'userId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AccountSettingPageWidget.routeName,
              path: AccountSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AccountSettingPageWidget(
                userId: params.getParam(
                  'userId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AddressSettingPageWidget.routeName,
              path: AddressSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AddressSettingPageWidget(
                userId: params.getParam(
                  'userId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: HomeNavbarWidget.routeName,
              path: HomeNavbarWidget.routePath,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomeNavbar')
                  : HomeNavbarWidget(),
            ),
            FFRoute(
              name: ELearningCheckoutPageWidget.routeName,
              path: ELearningCheckoutPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ELearningCheckoutPageWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SBCareLicenceListPageWidget.routeName,
              path: SBCareLicenceListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBCareLicenceListPageWidget(),
            ),
            FFRoute(
              name: SBCareLicencePurchasePageWidget.routeName,
              path: SBCareLicencePurchasePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBCareLicencePurchasePageWidget(
                uuidProgramWorkshop: params.getParam(
                  'uuidProgramWorkshop',
                  ParamType.String,
                ),
                uuidProgramClass: params.getParam(
                  'uuidProgramClass',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassListPageWidget.routeName,
              path: OnlineClassListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassListPageWidget(),
            ),
            FFRoute(
              name: ContractionTimerPageWidget.routeName,
              path: ContractionTimerPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ContractionTimerPageWidget(),
            ),
            FFRoute(
              name: TopupSuccessScreenWidget.routeName,
              path: TopupSuccessScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TopupSuccessScreenWidget(),
            ),
            FFRoute(
              name: RestrictedRoleScreenWidget.routeName,
              path: RestrictedRoleScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RestrictedRoleScreenWidget(),
            ),
            FFRoute(
              name: RegularModuleContentPageWidget.routeName,
              path: RegularModuleContentPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => RegularModuleContentPageWidget(
                uuidModul: params.getParam(
                  'uuidModul',
                  ParamType.String,
                ),
                modulTitle: params.getParam(
                  'modulTitle',
                  ParamType.String,
                ),
                modulDesc: params.getParam(
                  'modulDesc',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WithdrawPageWidget.routeName,
              path: WithdrawPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WithdrawPageWidget(),
            ),
            FFRoute(
              name: ProviderListPageWidget.routeName,
              path: ProviderListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProviderListPageWidget(),
            ),
            FFRoute(
              name: SendAppointmentModulePageWidget.routeName,
              path: SendAppointmentModulePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SendAppointmentModulePageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
                uuidUser: params.getParam(
                  'uuidUser',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyELearningListPageWidget.routeName,
              path: MyELearningListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyELearningListPageWidget(),
            ),
            FFRoute(
              name: ServiceSettingPageWidget.routeName,
              path: ServiceSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ServiceSettingPageWidget(
                uuidCampaign: params.getParam(
                  'uuidCampaign',
                  ParamType.String,
                ),
                nameProgramClass: params.getParam(
                  'nameProgramClass',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EditPracticeAddressPageWidget.routeName,
              path: EditPracticeAddressPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EditPracticeAddressPageWidget(
                uuidUserAddress: params.getParam(
                  'uuidUserAddress',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProviderProfileSettingPageWidget.routeName,
              path: ProviderProfileSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProviderProfileSettingPageWidget(),
            ),
            FFRoute(
              name: AddPracticeAddressPageWidget.routeName,
              path: AddPracticeAddressPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AddPracticeAddressPageWidget(),
            ),
            FFRoute(
              name: ContentViewerPageWidget.routeName,
              path: ContentViewerPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ContentViewerPageWidget(
                contentUrl: params.getParam(
                  'contentUrl',
                  ParamType.String,
                ),
                contentTitle: params.getParam(
                  'contentTitle',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SBCareLicenceDetailPageWidget.routeName,
              path: SBCareLicenceDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBCareLicenceDetailPageWidget(
                uuidProgramWorkshop: params.getParam(
                  'uuidProgramWorkshop',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: PracticeModuleContentPageWidget.routeName,
              path: PracticeModuleContentPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PracticeModuleContentPageWidget(
                uuidModul: params.getParam(
                  'uuidModul',
                  ParamType.String,
                ),
                modulTitle: params.getParam(
                  'modulTitle',
                  ParamType.String,
                ),
                modulDesc: params.getParam(
                  'modulDesc',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProviderServiceDetailPageWidget.routeName,
              path: ProviderServiceDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProviderServiceDetailPageWidget(
                uuidCampaign: params.getParam(
                  'uuidCampaign',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SBCareLicenceSuccessPurchaseScreenWidget.routeName,
              path: SBCareLicenceSuccessPurchaseScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  SBCareLicenceSuccessPurchaseScreenWidget(
                uuidProgramWorkshop: params.getParam(
                  'uuidProgramWorkshop',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: TransferSuccessScreenWidget.routeName,
              path: TransferSuccessScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TransferSuccessScreenWidget(),
            ),
            FFRoute(
              name: MyElearningContentPageWidget.routeName,
              path: MyElearningContentPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyElearningContentPageWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AppointmentSchedulePageWidget.routeName,
              path: AppointmentSchedulePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentSchedulePageWidget(),
            ),
            FFRoute(
              name: ELearningSuccessPurchaseScreenWidget.routeName,
              path: ELearningSuccessPurchaseScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ELearningSuccessPurchaseScreenWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ScheduleSettingPageWidget.routeName,
              path: ScheduleSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ScheduleSettingPageWidget(
                uidCampaign: params.getParam(
                  'uidCampaign',
                  ParamType.String,
                ),
                nameProgramClass: params.getParam(
                  'nameProgramClass',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ScheduleSettingUpdatePageWidget.routeName,
              path: ScheduleSettingUpdatePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ScheduleSettingUpdatePageWidget(
                subscheduleTime: params.getParam(
                  'subscheduleTime',
                  ParamType.String,
                ),
                subscheduleStart: params.getParam(
                  'subscheduleStart',
                  ParamType.String,
                ),
                subscheduleEnd: params.getParam(
                  'subscheduleEnd',
                  ParamType.String,
                ),
                subscheduleStatus: params.getParam(
                  'subscheduleStatus',
                  ParamType.bool,
                ),
                scheduleDays: params.getParam(
                  'scheduleDays',
                  ParamType.String,
                ),
                uidCampaign: params.getParam(
                  'uidCampaign',
                  ParamType.String,
                ),
                uidSchedule: params.getParam(
                  'uidSchedule',
                  ParamType.String,
                ),
                idSubschedule: params.getParam(
                  'idSubschedule',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: AppointmentCheckoutPageWidget.routeName,
              path: AppointmentCheckoutPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentCheckoutPageWidget(
                classTitle: params.getParam(
                  'classTitle',
                  ParamType.String,
                ),
                classPrice: params.getParam(
                  'classPrice',
                  ParamType.String,
                ),
                priceInt: params.getParam(
                  'priceInt',
                  ParamType.int,
                ),
                appointmentDate: params.getParam(
                  'appointmentDate',
                  ParamType.String,
                ),
                idSubschedule: params.getParam(
                  'idSubschedule',
                  ParamType.int,
                ),
                campaignImage: params.getParam(
                  'campaignImage',
                  ParamType.String,
                ),
                uidCampaign: params.getParam(
                  'uidCampaign',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AppointmentInvoicePageWidget.routeName,
              path: AppointmentInvoicePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentInvoicePageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ELearningListPageWidget.routeName,
              path: ELearningListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ELearningListPageWidget(),
            ),
            FFRoute(
              name: ELearningDetailPageWidget.routeName,
              path: ELearningDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ELearningDetailPageWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WithdrawSuccessScreenWidget.routeName,
              path: WithdrawSuccessScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WithdrawSuccessScreenWidget(),
            ),
            FFRoute(
              name: TopupDetailPageWidget.routeName,
              path: TopupDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TopupDetailPageWidget(
                uuidTopup: params.getParam(
                  'uuidTopup',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassDetailPageWidget.routeName,
              path: OnlineClassDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassDetailPageWidget(
                uuidProgramClass: params.getParam(
                  'uuidProgramClass',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassCheckoutPageWidget.routeName,
              path: OnlineClassCheckoutPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassCheckoutPageWidget(
                appointmentDate: params.getParam(
                  'appointmentDate',
                  ParamType.String,
                ),
                uuidOnlineClassSchedule: params.getParam(
                  'uuidOnlineClassSchedule',
                  ParamType.String,
                ),
                appointmentTime: params.getParam(
                  'appointmentTime',
                  ParamType.String,
                ),
                uuidProgramClass: params.getParam(
                  'uuidProgramClass',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassSchedulePageWidget.routeName,
              path: OnlineClassSchedulePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassSchedulePageWidget(),
            ),
            FFRoute(
              name: OnlineClassSuccessBookScreenWidget.routeName,
              path: OnlineClassSuccessBookScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassSuccessBookScreenWidget(
                uuidProgramClass: params.getParam(
                  'uuidProgramClass',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassScheduleDetailPageWidget.routeName,
              path: OnlineClassScheduleDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassScheduleDetailPageWidget(
                uuidOnlineAppointment: params.getParam(
                  'uuidOnlineAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: AppointmentMitraInvoicePageWidget.routeName,
              path: AppointmentMitraInvoicePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => AppointmentMitraInvoicePageWidget(
                uuidAppointment: params.getParam(
                  'uuidAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassInvoicePageWidget.routeName,
              path: OnlineClassInvoicePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassInvoicePageWidget(
                uuidOnlineAppointment: params.getParam(
                  'uuidOnlineAppointment',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: PracticeModuleContentAltPageWidget.routeName,
              path: PracticeModuleContentAltPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PracticeModuleContentAltPageWidget(
                uuidProgramClass: params.getParam(
                  'uuidProgramClass',
                  ParamType.String,
                ),
                modulTitle: params.getParam(
                  'modulTitle',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SBCareLicenceInvoicePageWidget.routeName,
              path: SBCareLicenceInvoicePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBCareLicenceInvoicePageWidget(
                uuidProgramWorkshop: params.getParam(
                  'uuidProgramWorkshop',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LicenceVerificationCodePageWidget.routeName,
              path: LicenceVerificationCodePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => LicenceVerificationCodePageWidget(
                uuidUserClass: params.getParam(
                  'uuidUserClass',
                  ParamType.String,
                ),
                campaignImage: params.getParam(
                  'campaignImage',
                  ParamType.String,
                ),
                campaignTitle: params.getParam(
                  'campaignTitle',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyELearningRenewalPageWidget.routeName,
              path: MyELearningRenewalPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyELearningRenewalPageWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
                uuidUserModule: params.getParam(
                  'uuidUserModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyELearningSuccessRenewalScreenWidget.routeName,
              path: MyELearningSuccessRenewalScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  MyELearningSuccessRenewalScreenWidget(),
            ),
            FFRoute(
              name: LanguageSelectorPageWidget.routeName,
              path: LanguageSelectorPageWidget.routePath,
              builder: (context, params) => LanguageSelectorPageWidget(),
            ),
            FFRoute(
              name: IncomeHistoryPageWidget.routeName,
              path: IncomeHistoryPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => IncomeHistoryPageWidget(),
            ),
            FFRoute(
              name: ELearningSuccessRedeemScreenWidget.routeName,
              path: ELearningSuccessRedeemScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ELearningSuccessRedeemScreenWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ELearningVoucherGeneratePageWidget.routeName,
              path: ELearningVoucherGeneratePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ELearningVoucherGeneratePageWidget(),
            ),
            FFRoute(
              name: VoucherHistoryPageWidget.routeName,
              path: VoucherHistoryPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => VoucherHistoryPageWidget(),
            ),
            FFRoute(
              name: OnlineClassSubmenuScreenWidget.routeName,
              path: OnlineClassSubmenuScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => OnlineClassSubmenuScreenWidget(),
            ),
            FFRoute(
              name: ModuleNavbarWidget.routeName,
              path: ModuleNavbarWidget.routePath,
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'ModuleNavbar')
                  : ModuleNavbarWidget(),
            ),
            FFRoute(
              name: EbookListPageWidget.routeName,
              path: EbookListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EbookListPageWidget(),
            ),
            FFRoute(
              name: PregnancyBMICalculatorPageWidget.routeName,
              path: PregnancyBMICalculatorPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => PregnancyBMICalculatorPageWidget(),
            ),
            FFRoute(
              name: EbookDetailPageWidget.routeName,
              path: EbookDetailPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EbookDetailPageWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EbookCheckoutPageWidget.routeName,
              path: EbookCheckoutPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EbookCheckoutPageWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EbookSuccessPurchaseScreenWidget.routeName,
              path: EbookSuccessPurchaseScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EbookSuccessPurchaseScreenWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ThemeSelectorPageWidget.routeName,
              path: ThemeSelectorPageWidget.routePath,
              builder: (context, params) => ThemeSelectorPageWidget(),
            ),
            FFRoute(
              name: ViewAllPageWidget.routeName,
              path: ViewAllPageWidget.routePath,
              builder: (context, params) => ViewAllPageWidget(),
            ),
            FFRoute(
              name: MyEbookContentPageWidget.routeName,
              path: MyEbookContentPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyEbookContentPageWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
                ebookTitle: params.getParam(
                  'ebookTitle',
                  ParamType.String,
                ),
                ebookDesc: params.getParam(
                  'ebookDesc',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyEbookRenewalPageWidget.routeName,
              path: MyEbookRenewalPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyEbookRenewalPageWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
                uuidUserEbook: params.getParam(
                  'uuidUserEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyEbookSuccessRenewalScreenWidget.routeName,
              path: MyEbookSuccessRenewalScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyEbookSuccessRenewalScreenWidget(),
            ),
            FFRoute(
              name: MyEbookListPageWidget.routeName,
              path: MyEbookListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MyEbookListPageWidget(),
            ),
            FFRoute(
              name: SBPaySuccessRedeemScreenWidget.routeName,
              path: SBPaySuccessRedeemScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBPaySuccessRedeemScreenWidget(),
            ),
            FFRoute(
              name: SBPayVoucherGeneratePageWidget.routeName,
              path: SBPayVoucherGeneratePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBPayVoucherGeneratePageWidget(),
            ),
            FFRoute(
              name: SBPayRedeemCodePageWidget.routeName,
              path: SBPayRedeemCodePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => SBPayRedeemCodePageWidget(),
            ),
            FFRoute(
              name: ELearningRedeemCodePageWidget.routeName,
              path: ELearningRedeemCodePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ELearningRedeemCodePageWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EBookVoucherGeneratePageWidget.routeName,
              path: EBookVoucherGeneratePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EBookVoucherGeneratePageWidget(),
            ),
            FFRoute(
              name: EbookRedeemCodePageWidget.routeName,
              path: EbookRedeemCodePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EbookRedeemCodePageWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EbookSuccessRedeemScreenWidget.routeName,
              path: EbookSuccessRedeemScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => EbookSuccessRedeemScreenWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NotificationDraftPageWidget.routeName,
              path: NotificationDraftPageWidget.routePath,
              builder: (context, params) => NotificationDraftPageWidget(),
            ),
            FFRoute(
              name: PdfDraftPageWidget.routeName,
              path: PdfDraftPageWidget.routePath,
              builder: (context, params) => PdfDraftPageWidget(),
            ),
            FFRoute(
              name: MyContractionTimerProDetailsPageWidget.routeName,
              path: MyContractionTimerProDetailsPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  MyContractionTimerProDetailsPageWidget(
                uidUserProFeature: params.getParam(
                  'uidUserProFeature',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ContractionTimerProListPageWidget.routeName,
              path: ContractionTimerProListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ContractionTimerProListPageWidget(),
            ),
            FFRoute(
              name: ContractionTimerProCheckoutPageWidget.routeName,
              path: ContractionTimerProCheckoutPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ContractionTimerProCheckoutPageWidget(
                uuidProFeature: params.getParam(
                  'uuidProFeature',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MyContractionTimerProListPageWidget.routeName,
              path: MyContractionTimerProListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  MyContractionTimerProListPageWidget(),
            ),
            FFRoute(
              name: ContractionTimerProSuccessPurchaseScreenWidget.routeName,
              path: ContractionTimerProSuccessPurchaseScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ContractionTimerProSuccessPurchaseScreenWidget(),
            ),
            FFRoute(
              name: ContractionVoucherGeneratePageWidget.routeName,
              path: ContractionVoucherGeneratePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ContractionVoucherGeneratePageWidget(),
            ),
            FFRoute(
              name: ContractionTimerProRedeemCodePageWidget.routeName,
              path: ContractionTimerProRedeemCodePageWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ContractionTimerProRedeemCodePageWidget(
                uuidProFeature: params.getParam(
                  'uuidProFeature',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ContractionTimerProSuccessRedeemScreenWidget.routeName,
              path: ContractionTimerProSuccessRedeemScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) =>
                  ContractionTimerProSuccessRedeemScreenWidget(),
            ),
            FFRoute(
              name: NotificationSettingPageWidget.routeName,
              path: NotificationSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => NotificationSettingPageWidget(),
            ),
            FFRoute(
              name: HomecareServicesListPageWidget.routeName,
              path: HomecareServicesListPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => HomecareServicesListPageWidget(),
            ),
            FFRoute(
              name: VerificationCodeNotificationScreenWidget.routeName,
              path: VerificationCodeNotificationScreenWidget.routePath,
              builder: (context, params) =>
                  VerificationCodeNotificationScreenWidget(
                destinationEmail: params.getParam(
                  'destinationEmail',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: HomePublicPageWidget.routeName,
              path: HomePublicPageWidget.routePath,
              builder: (context, params) => HomePublicPageWidget(),
            ),
            FFRoute(
              name: ProviderListPublicPageWidget.routeName,
              path: ProviderListPublicPageWidget.routePath,
              builder: (context, params) => ProviderListPublicPageWidget(),
            ),
            FFRoute(
              name: ProviderDetailPublicPageWidget.routeName,
              path: ProviderDetailPublicPageWidget.routePath,
              builder: (context, params) => ProviderDetailPublicPageWidget(
                ref: params.getParam(
                  'ref',
                  ParamType.String,
                ),
                slug: params.getParam(
                  'slug',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ArticleListPublicPageWidget.routeName,
              path: ArticleListPublicPageWidget.routePath,
              builder: (context, params) => ArticleListPublicPageWidget(),
            ),
            FFRoute(
              name: ArticleDetailPublicPageWidget.routeName,
              path: ArticleDetailPublicPageWidget.routePath,
              builder: (context, params) => ArticleDetailPublicPageWidget(
                slug: params.getParam(
                  'slug',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ELearningListPublicPageWidget.routeName,
              path: ELearningListPublicPageWidget.routePath,
              builder: (context, params) => ELearningListPublicPageWidget(),
            ),
            FFRoute(
              name: ELearningDetailPublicPageWidget.routeName,
              path: ELearningDetailPublicPageWidget.routePath,
              builder: (context, params) => ELearningDetailPublicPageWidget(
                uuidModule: params.getParam(
                  'uuidModule',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: OnlineClassListPublicPageWidget.routeName,
              path: OnlineClassListPublicPageWidget.routePath,
              builder: (context, params) => OnlineClassListPublicPageWidget(),
            ),
            FFRoute(
              name: ChangePasswordPageWidget.routeName,
              path: ChangePasswordPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ChangePasswordPageWidget(),
            ),
            FFRoute(
              name: EbookListPublicPageWidget.routeName,
              path: EbookListPublicPageWidget.routePath,
              builder: (context, params) => EbookListPublicPageWidget(),
            ),
            FFRoute(
              name: EbookDetailPublicPageWidget.routeName,
              path: EbookDetailPublicPageWidget.routePath,
              builder: (context, params) => EbookDetailPublicPageWidget(
                uuidEbook: params.getParam(
                  'uuidEbook',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProductDetailPublicPageWidget.routeName,
              path: ProductDetailPublicPageWidget.routePath,
              builder: (context, params) => ProductDetailPublicPageWidget(
                slug: params.getParam(
                  'slug',
                  ParamType.String,
                ),
                productSlug: params.getParam(
                  'productSlug',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProductCheckoutPublicPageWidget.routeName,
              path: ProductCheckoutPublicPageWidget.routePath,
              builder: (context, params) => ProductCheckoutPublicPageWidget(
                slug: params.getParam(
                  'slug',
                  ParamType.String,
                ),
                productSlug: params.getParam(
                  'productSlug',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ProductSuccessPurchasePublicPageWidget.routeName,
              path: ProductSuccessPurchasePublicPageWidget.routePath,
              builder: (context, params) =>
                  ProductSuccessPurchasePublicPageWidget(
                slug: params.getParam(
                  'slug',
                  ParamType.String,
                ),
                productSlug: params.getParam(
                  'productSlug',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: MySBLinkPageWidget.routeName,
              path: MySBLinkPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => MySBLinkPageWidget(),
            ),
            FFRoute(
              name: ManageProductPageWidget.routeName,
              path: ManageProductPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ManageProductPageWidget(),
            ),
            FFRoute(
              name: ProductSettingPageWidget.routeName,
              path: ProductSettingPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => ProductSettingPageWidget(
                productId: params.getParam(
                  'productId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: WithdrawSBLinkPageWidget.routeName,
              path: WithdrawSBLinkPageWidget.routePath,
              requireAuth: true,
              builder: (context, params) => WithdrawSBLinkPageWidget(),
            ),
            FFRoute(
              name: TopupErrorScreenWidget.routeName,
              path: TopupErrorScreenWidget.routePath,
              requireAuth: true,
              builder: (context, params) => TopupErrorScreenWidget(),
            ),
            FFRoute(
              name: CreatorPublicPageWidget.routeName,
              path: CreatorPublicPageWidget.routePath,
              builder: (context, params) => CreatorPublicPageWidget(
                slug: params.getParam(
                  'slug',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CurriculumVitaePageWidget.routeName,
              path: CurriculumVitaePageWidget.routePath,
              builder: (context, params) => CurriculumVitaePageWidget(),
            ),
            FFRoute(
              name: SBLinkPublicPageWidget.routeName,
              path: SBLinkPublicPageWidget.routePath,
              builder: (context, params) => SBLinkPublicPageWidget(),
            ),
            FFRoute(
              name: PortfolioPageWidget.routeName,
              path: PortfolioPageWidget.routePath,
              builder: (context, params) => PortfolioPageWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: ffNavigatorObservers,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/home';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: FlutterFlowTheme.of(context).sbCareLightColor,
                      child: Image.asset(
                        'assets/images/GIF_LOADING_V2.gif',
                        fit: BoxFit.scaleDown,
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    curve: transitionInfo.transitionType ==
                            PageTransitionType.scale
                        ? const Interval(0.0, 0.5)
                        : Curves.linear,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
