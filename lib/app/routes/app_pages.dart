import 'package:get/get.dart';
import 'package:whole/app/modules/MAAP/controllers/maap_introduction_controller.dart';
import 'package:whole/app/modules/MAAP/views/maap_introduction_view.dart';
import 'package:whole/app/modules/MAAP/views/maap_result_view.dart';

import '../modules/MAAP/bindings/maap_binding.dart';
import '../modules/MAAP/views/maap_view.dart';

import '../modules/chronic_medication/bindings/add_medication_binding.dart';
import '../modules/chronic_medication/views/add_medication_view.dart';
import '../modules/allergies/bindings/add_edit_allergies_binding.dart';
import '../modules/allergies/bindings/allergies_binding.dart';
import '../modules/allergies/views/add_edit_allergies_view.dart';
import '../modules/allergies/views/allergies_view.dart';
import '../modules/articles/bindings/articles_binding.dart';
import '../modules/articles/views/articles_view.dart';
import '../modules/bmi/bindings/bmi_binding.dart';
import '../modules/bmi/views/bmi_view.dart';
import '../modules/body/bindings/body_binding.dart';
import '../modules/body/views/body_view.dart';
import '../modules/chronic_medication/bindings/chronic_medication_binding.dart';
import '../modules/chronic_medication/views/chronic_medication_view.dart';
import '../modules/health_record/bindings/health_record_binding.dart';
import '../modules/health_record/views/health_record_view.dart';

import '../modules/chronic/bindings/chronic_binding.dart';
import '../modules/chronic/views/chronic_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manage_subscriptions/bindings/manage_subscriptions_binding.dart';
import '../modules/manage_subscriptions/views/manage_subscriptions_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/passwordReset/bindings/password_reset_binding.dart';
import '../modules/passwordReset/views/password_reset_view.dart';
import '../modules/passwordResetConfirm/bindings/password_reset_confirm_binding.dart';
import '../modules/passwordResetConfirm/views/password_reset_confirm_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/settingspage/bindings/settingspage_binding.dart';
import '../modules/settingspage/views/settingspage_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/vaccine/bindings/vaccine_binding.dart';
import '../modules/vaccine/views/vaccine_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    // GetPage(
    //   name: _Paths.PASSWORD_RESET_CONFIRM,
    //   page: () => PasswordResetConfirmView(),
    //   binding: PasswordResetConfirmBinding(),
    // ),
    GetPage(
      name: _Paths.PASSWORD_RESET,
      page: () => PasswordResetView(),
      binding: PasswordResetBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BMI,
      page: () => BmiView(),
      binding: BmiBinding(),
    ),
    GetPage(
      name: _Paths.BODY,
      page: () => BodyView(),
      binding: BodyBinding(),
    ),
    // GetPage(
    //   name: _Paths.ARTICLES,
    //   page: () => ArticlesView(),
    //   binding: ArticlesBinding(),
    // ),
    GetPage(
      name: _Paths.HEALTH_RECORD,
      page: () => HealthRecordView(),
      binding: HealthRecordBinding(),
    ),
    GetPage(
      name: _Paths.ALLERGIES,
      page: () => AllergiesView(),
      binding: AllergiesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_ALLERGIES,
      page: () => AddEditAllergiesView(),
      binding: AddEditAllergiesBinding(),
    ),
    GetPage(
      name: _Paths.CHRONIC_MEDICATION,
      page: () => ChronicMedicationView(),
      binding: ChronicMedicationBinding(),
    ),
    GetPage(
      name: _Paths.VACCINE,
      page: () => VaccineView(),
      binding: VaccineBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MEDICATION,
      page: () => AddMedicationView(),
      binding: AddMedicationBinding(),
    ),
    GetPage(
      name: _Paths.MAAP,
      page: () => MaapIntroductionView(),
      binding: MaapBinding(),
    ),
    GetPage(
      name: _Paths.CHRONIC,
      page: () => ChronicView(),
      binding: ChronicBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_SUBSCRIPTIONS,
      page: () => ManageSubscriptionsView(),
      binding: ManageSubscriptionsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGSPAGE,
      page: () => SettingspageView(),
      binding: SettingspageBinding(),
    ),
  ];
}
