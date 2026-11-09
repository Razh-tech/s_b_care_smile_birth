import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
  }) =>
      [enText, idText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // RegistrationScreen
  {
    '6jf8zn5n': {
      'en': 'Registration',
      'id': 'Registrasi',
    },
    'h90ffciy': {
      'en': 'Register for begin a new appointment with our specialists.',
      'id': 'Daftar untuk memulai janji temu baru dengan spesialis kami.',
    },
    'm1x8yl2t': {
      'en': 'Fullname',
      'id': 'Nama Lengkap',
    },
    '7xnk06vm': {
      'en': 'Enter your full name',
      'id': 'Masukkan nama lengkap Anda',
    },
    'w9nx4dv8': {
      'en': 'Username',
      'id': 'Username',
    },
    '6iis72l8': {
      'en': 'Enter your username',
      'id': 'Masukkan Nama pengguna Anda',
    },
    'nbkq5iox': {
      'en': 'WhatsApp',
      'id': 'WhatsApp',
    },
    'ev0xmgg5': {
      'en': 'Enter your WhatsApp number',
      'id': 'Masukkan nomor WhatsApp Anda',
    },
    'ezpu0v5a': {
      'en': 'Email',
      'id': 'Email',
    },
    'v0kdv5wn': {
      'en': 'example@gmail.com',
      'id': 'contoh@gmail.com',
    },
    '46wyg7gh': {
      'en': 'Password',
      'id': 'Kata Sandi',
    },
    'cvrnqg1l': {
      'en': 'Minimum 6 digits',
      'id': '',
    },
    '7wqh04mt': {
      'en': 'Retype Password',
      'id': 'Ketik Ulang Kata Sandi',
    },
    'oaikaluu': {
      'en': 'Email Notification Consent',
      'id': 'Persetujuan Pemberitahuan Email',
    },
    'ujrcz8pr': {
      'en':
          'I agree to receive promotional emails, newsletters, and product updates. You can unsubscribe at any time.',
      'id':
          'Saya setuju untuk menerima email promosi, buletin, dan pembaruan produk. Anda dapat berhenti berlangganan kapan saja.',
    },
    'te92zxur': {
      'en': 'I agree to the ',
      'id': 'Saya setuju dengan ',
    },
    'ee85k0if': {
      'en': 'Terms of Service',
      'id': 'Persyaratan Layanan',
    },
    '6s4c6s9v': {
      'en': ' and ',
      'id': ' dan ',
    },
    'c9f7xqnm': {
      'en': 'Privacy Policy',
      'id': 'Kebijakan Privasi',
    },
    '5b1okweq': {
      'en': 'Sign up',
      'id': 'Daftar',
    },
    '7y3u36lv': {
      'en': 'Already have an account?',
      'id': 'Sudah memiliki akun?',
    },
    'evw8h9qe': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    'trob15nx': {
      'en': 'EN',
      'id': 'EN',
    },
    'y1spmpux': {
      'en': 'ID',
      'id': 'ID',
    },
    'q4bkdebl': {
      'en': 'Light Mode',
      'id': 'Mode Terang',
    },
    'sbej9r4t': {
      'en': 'Dark Mode',
      'id': 'Mode Gelap',
    },
    'w2x6wmx1': {
      'en': '2024 - 2026 SBCare - SmileBirth. ',
      'id': '2024 - 2026 SBCare - SmileBirth. ',
    },
    'kddh3cod': {
      'en': 'All rights reserved.',
      'id': 'All rights reserved.',
    },
    'n0e1a8dh': {
      'en': 'Fullname is required',
      'id': 'Nama lengkap diperlukan',
    },
    'a3w7baa6': {
      'en': 'Full name must be at least 4 characters.',
      'id': 'Nama lengkap minimal harus 4 karakter.',
    },
    'lxp383qd': {
      'en': '',
      'id': '',
    },
    'knipvbjc': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'owjguu9e': {
      'en': 'Username is required',
      'id': 'Nama pengguna diperlukan',
    },
    'rm3x72jt': {
      'en': 'Username must be at least 4 characters.',
      'id': 'Nama pengguna minimal harus 4 karakter.',
    },
    'sgcf5tbg': {
      'en': 'Username must be under 20 characters.',
      'id': 'Nama pengguna harus kurang dari 20 karakter.',
    },
    'po7kefgm': {
      'en': 'Only letters, without whitespace or symbols.',
      'id': 'Hanya huruf, tanpa spasi atau simbol.',
    },
    'si7jydhu': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    '1onvin41': {
      'en': 'WhatsApp is required',
      'id': 'WhatsApp diperlukan',
    },
    'kpkbe2ht': {
      'en': 'Phone number must be at least 6 digits.',
      'id': 'Nomor telepon minimal harus 6 digit.',
    },
    'd7kmufqt': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'kcbs36tg': {
      'en': 'Email is required.',
      'id': 'Email diperlukan.',
    },
    'tgmxzctr': {
      'en': 'Please enter a valid email address.',
      'id': 'Silakan masukkan alamat email yang valid.',
    },
    'g6sbzyc8': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'ye710bwu': {
      'en': 'Password is required',
      'id': 'Kata sandi diperlukan',
    },
    '09u4hdfs': {
      'en':
          'Password must be at least 6 characters long with uppercase, lowercase, and digit.',
      'id':
          'Kata sandi harus minimal 6 karakter dengan huruf besar, huruf kecil, dan angka.',
    },
    '3llyjp1m': {
      'en': 'Password must be under 64 characters.',
      'id': 'Kata sandi harus kurang dari 64 karakter.',
    },
    '6i5dush2': {
      'en':
          'Password must be at least 6 characters long with uppercase, lowercase, and digit.',
      'id':
          'Kata sandi harus minimal 6 karakter dengan huruf besar, huruf kecil, dan angka.',
    },
    'h4ide9gx': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    '99poo5zg': {
      'en': 'Retype Password is required',
      'id': '',
    },
    '21s29stg': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'k996340o': {
      'en': 'Help Center',
      'id': 'Pusat Bantuan',
    },
    '760crk7v': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SigninScreen
  {
    'yb5ml4ot': {
      'en': 'Help Center',
      'id': 'Pusat Bantuan',
    },
    'hyjbx59o': {
      'en': 'Sign in to your account to continue',
      'id': 'Masuk ke akun Anda untuk melanjutkan',
    },
    'galqlk79': {
      'en': 'Email',
      'id': 'Email',
    },
    '73etvn45': {
      'en': '',
      'id': '',
    },
    'i5evc4bt': {
      'en': 'Password',
      'id': 'Kata Sandi',
    },
    'ftu8yf6o': {
      'en': '',
      'id': '',
    },
    '9he4biy4': {
      'en': 'Forgot password?',
      'id': 'Lupa kata sandi?',
    },
    'aw2o3r7t': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    'vmmr41vd': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    'qzkqqwi6': {
      'en': 'Don\'t have an account?',
      'id': 'Belum memiliki akun?',
    },
    'w68lxtc6': {
      'en': 'Sign up',
      'id': 'Daftar',
    },
    '7wbjq4q4': {
      'en': 'EN',
      'id': 'EN',
    },
    'xj58vxts': {
      'en': 'ID',
      'id': 'ID',
    },
    'ghphsdit': {
      'en': 'Light Mode',
      'id': 'Mode Terang',
    },
    'vljoygi8': {
      'en': 'Dark Mode',
      'id': 'Mode Gelap',
    },
    '0xlgjyut': {
      'en': '2024 - 2026 SBCare - SmileBirth. ',
      'id': '2024 - 2026 SBCare - SmileBirth. ',
    },
    'p7gvnkac': {
      'en': 'All rights reserved.',
      'id': 'All rights reserved.',
    },
    '4vcr5806': {
      'en': 'Email is required.',
      'id': 'Email diperlukan.',
    },
    'kdvymmhq': {
      'en': 'Please enter a valid email address.',
      'id': 'Silakan masukkan alamat email yang valid.',
    },
    'qu7wi1mk': {
      'en': '',
      'id': '',
    },
    'jj66ktaq': {
      'en': 'Password is required.',
      'id': 'Kata sandi diperlukan.',
    },
    'taeoqdam': {
      'en':
          'Password must be at least 6 characters long with uppercase, lowercase, and digit.',
      'id':
          'Kata sandi harus minimal 6 karakter dengan huruf besar, huruf kecil, dan angka.',
    },
    '7872eap8': {
      'en': 'Password must be under 64 characters.',
      'id': 'Kata sandi harus kurang dari 64 karakter.',
    },
    '22gaftt4': {
      'en': '',
      'id': '',
    },
    'tyv1x0by': {
      'en': 'SmileBirth Care',
      'id': 'SmileBirth Care',
    },
    'zleal46g': {
      'en':
          'Your journey to parenthood, supported every step of the way with professional care and a community that smiles with you.',
      'id':
          'Perjalanan Anda menuju menjadi orang tua, didukung di setiap langkahnya dengan perawatan profesional dan komunitas yang selalu tersenyum bersama Anda.',
    },
    'kztbqwzd': {
      'en': 'Sign in to your account to continue',
      'id': 'Masuk ke akun Anda untuk melanjutkan',
    },
    'qqurq532': {
      'en': 'Email',
      'id': 'Email',
    },
    '69iun28s': {
      'en': '',
      'id': '',
    },
    'bl4ja3t8': {
      'en': 'Password',
      'id': 'Kata Sandi',
    },
    '0xskb31v': {
      'en': '',
      'id': '',
    },
    'jo9nedbo': {
      'en': 'Forgot password?',
      'id': 'Lupa kata sandi?',
    },
    '10usxmr3': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    '6ird288u': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    'hfgjj9nh': {
      'en': 'Don\'t have an account?',
      'id': 'Belum memiliki akun?',
    },
    'ixkkmq4b': {
      'en': 'Sign up',
      'id': 'Daftar',
    },
    'ibid9961': {
      'en': 'English (US)',
      'id': 'English (US)',
    },
    'iv5pfr8j': {
      'en': 'Indonesian (ID)',
      'id': 'Indonesian (ID)',
    },
    'jsize9xe': {
      'en': 'Light Mode',
      'id': 'Mode Terang',
    },
    'jltpmqrb': {
      'en': 'Dark Mode',
      'id': 'Mode Gelap',
    },
    'dg80pk5i': {
      'en': '2024 - 2026 SBCare - SmileBirth. All rights reserved.',
      'id': '2024 - 2026 SBCare - SmileBirth. All rights reserved.',
    },
    'yv3mktbf': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ForgotPasswordScreen
  {
    'lqd7r8q9': {
      'en': 'Forgot Password?',
      'id': 'Lupa Kata Sandi?',
    },
    'w6au94mg': {
      'en': 'Please enter your email for reset password process',
      'id': 'Silakan masukkan email Anda untuk proses reset kata sandi',
    },
    'o2h4umg4': {
      'en': 'Email',
      'id': 'Email',
    },
    'j75bfb72': {
      'en': 'Email is required.',
      'id': 'Email diperlukan.',
    },
    'm98yekp4': {
      'en': 'Please enter a valid email address.',
      'id': 'Silakan masukkan alamat email yang valid.',
    },
    'hhwdiqv0': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'unwir3tm': {
      'en': 'Confirm',
      'id': 'Konfirmasi',
    },
    '3so9xuyj': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // CreateNewPasswordScreen
  {
    'azmcvigk': {
      'en': 'Create New Password',
      'id': 'Buat Kata Sandi Baru',
    },
    '8xdi8a9o': {
      'en': 'Enter your new password',
      'id': 'Masukkan kata sandi baru Anda',
    },
    'xlj7vrqb': {
      'en': 'New Password',
      'id': 'Kata Sandi Baru',
    },
    '6gul1lvf': {
      'en': 'Retype Password',
      'id': 'Ketik Ulang Kata Sandi',
    },
    '2duhoz26': {
      'en': 'Your new password',
      'id': 'Kata sandi baru Anda',
    },
    'ps1vwjfl': {
      'en':
          'Password must be at least 6 characters long with uppercase, lowercase, and digit.',
      'id':
          'Kata sandi harus minimal 6 karakter dengan huruf besar, huruf kecil, dan angka.',
    },
    '71jlp3oe': {
      'en': 'Password must be under 64 characters.',
      'id': 'Kata sandi harus kurang dari 64 karakter.',
    },
    'l7807vgh': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'e2nsl3kv': {
      'en': 'Retype Password is required',
      'id': '',
    },
    'q1r4mwqp': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    '3w2fyohu': {
      'en': 'Confirm',
      'id': 'Konfirmasi',
    },
    'zdykvhe5': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // VerifyEmailScreen
  {
    '53wdfh8o': {
      'en': 'Verify your email',
      'id': 'Verifikasi email Anda',
    },
    'vx9hcej1': {
      'en': 'Please enter 6 digits code that we already sent to your email',
      'id': 'Silakan masukkan kode 6 digit yang sudah kami kirim ke email Anda',
    },
    'vfoe8cqo': {
      'en': 'Email',
      'id': 'Email',
    },
    'tcc09g2t': {
      'en': 'Verification Code',
      'id': 'Kode Verifikasi',
    },
    'oln1pbwr': {
      'en': 'Email is required.',
      'id': 'Email diperlukan.',
    },
    'lr3wlhcf': {
      'en': 'Please enter a valid email address.',
      'id': 'Silakan masukkan alamat email yang valid.',
    },
    'zbpqo52g': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'u47uxl8n': {
      'en': 'Verification Code is required',
      'id': '',
    },
    'uk4z6248': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'yzf7y5y4': {
      'en': 'Resend verification code',
      'id': 'Kirim ulang kode verifikasi',
    },
    'f5y7wuvh': {
      'en': 'Verify',
      'id': 'Verifikasi',
    },
    '2yurnymk': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // WalletNavbar
  {
    '81kzk8u1': {
      'en': 'SBPay Balance',
      'id': 'Saldo SBPay',
    },
    'bw2sgqsx': {
      'en': 'SBPay Number',
      'id': 'Nomor SBPay',
    },
    '975dc6nm': {
      'en': 'Wallet History',
      'id': 'Riwayat Transaksi',
    },
    'darpbzuf': {
      'en': 'SBPay',
      'id': 'SBPay',
    },
  },
  // ProfileNavbar
  {
    'wheiurds': {
      'en': 'Setting',
      'id': 'Pengaturan',
    },
    'ret4b3pr': {
      'en': 'Profile',
      'id': 'Profil',
    },
    'pet1tsrh': {
      'en': 'Account ',
      'id': 'Akun',
    },
    'c5v4p6lp': {
      'en': 'Address',
      'id': 'Alamat',
    },
    '2f4uwmzu': {
      'en': 'Language',
      'id': 'Bahasa',
    },
    'ta8bzaag': {
      'en': 'Theme',
      'id': 'Tema',
    },
    '233e6myg': {
      'en': 'Notification',
      'id': 'Notifikasi',
    },
    'zgzha7ya': {
      'en': 'Security',
      'id': 'Keamanan',
    },
    '7hv7glc4': {
      'en': 'Change Password',
      'id': 'Ubah Password',
    },
    'a41n0n55': {
      'en': 'Sign in Fingerprint',
      'id': 'Masuk Sidik Jari',
    },
    'qi989nvs': {
      'en': 'Chat Admin on WhatsApp',
      'id': 'Hubungi Admin di WhatsApp?',
    },
    't1zasbyo': {
      'en': '2024 - 2026 SBCare - SmileBirth. ',
      'id': '2024 - 2026 SBCare - SmileBirth. ',
    },
    '97gjs9u2': {
      'en': 'All rights reserved.',
      'id': 'All rights reserved.',
    },
    'le8yer64': {
      'en': 'Logout',
      'id': 'Keluar',
    },
    'tzsk6ky7': {
      'en': 'Profile',
      'id': 'Profil',
    },
  },
  // MitraNavbar
  {
    '43jbc6wm': {
      'en': 'Appointment\nSchedule',
      'id': 'Janji Temu\n',
    },
    'n05w831k': {
      'en': 'Service &\nSchedule',
      'id': 'Layanan &\nJadwal',
    },
    'fo7axps7': {
      'en': 'Regular\nModule',
      'id': 'Modul\nReguler',
    },
    '4jtd6se8': {
      'en': 'Practice\nModule',
      'id': 'Modul\nPraktek',
    },
    '7nj0yw5z': {
      'en': 'Appointment Schedule',
      'id': 'Janji Temu',
    },
    'nvsmr668': {
      'en': 'Service & Schedule',
      'id': 'Layanan & Jadwal',
    },
    'oj0rvk3v': {
      'en': 'Regular Module',
      'id': 'Modul Reguler',
    },
    'ky5qd7un': {
      'en': 'Practice Module',
      'id': 'Modul Praktek',
    },
    'jftvsv4k': {
      'en': 'My Licence\n',
      'id': 'Lisensi \nSaya',
    },
    'r2qd79ox': {
      'en': 'SBCare\nLicence',
      'id': 'Lisensi\nSBCare',
    },
    'kpnxp8dd': {
      'en': 'Withdraw\nBalance',
      'id': 'Tarik Saldo\n',
    },
    'dc4o2dzf': {
      'en': 'Provider\nProfile',
      'id': 'Profil\nMitra',
    },
    'rb5q8mr4': {
      'en': 'My Licence',
      'id': 'Lisensi Saya',
    },
    'yhyzn30o': {
      'en': 'SBCare Licence',
      'id': 'Lisensi SBCare',
    },
    '0654s2gd': {
      'en': 'Withdraw Balance',
      'id': 'Tarik Saldo',
    },
    'yry2ju0t': {
      'en': 'Provider Profile',
      'id': 'Profil Mitra',
    },
    'c5aho2f7': {
      'en': 'Program\nVoucher',
      'id': 'Program\nVoucher',
    },
    'zq11txmt': {
      'en': 'E-Learning\nVoucher',
      'id': 'Voucher\nE-Learning',
    },
    '1r0lapep': {
      'en': 'SBPay\nVoucher',
      'id': 'Voucher\nSBPay',
    },
    '7y7pee5h': {
      'en': 'Contraction\nVoucher',
      'id': 'Kontraksi\nVoucher',
    },
    'lmcwvfwp': {
      'en': 'Program Voucher',
      'id': 'Program Voucher',
    },
    'hq1zvssu': {
      'en': 'E-Learning Voucher',
      'id': 'Voucher E-Learning',
    },
    'lpwkdq7l': {
      'en': 'SBPay Voucher',
      'id': 'Voucher SBPay',
    },
    'n4g5yjiq': {
      'en': 'Contraction Voucher',
      'id': 'Kontraksi Voucher',
    },
    'lqhdv9c1': {
      'en': 'Voucher\nHistory',
      'id': 'Riwayat\nVoucher',
    },
    'liktzooh': {
      'en': 'Income\nHistory',
      'id': 'Riwayat\nPemasukan',
    },
    'uiaxygzu': {
      'en': 'Voucher History',
      'id': 'Riwayat Voucher',
    },
    '0bgsm8i1': {
      'en': 'Income History',
      'id': 'Riwayat Pemasukan',
    },
    'mb48ig05': {
      'en': 'Provider',
      'id': 'Mitra',
    },
  },
  // AppointmentMitraSchedulePage
  {
    'wki3brke': {
      'en': 'Appointment Schedule',
      'id': 'Jadwal Janji Temu',
    },
    'sjmp31yb': {
      'en': 'Pending',
      'id': 'Menunggu',
    },
    '7onv5pkr': {
      'en': 'Verification',
      'id': 'Verifikasi',
    },
    'nbrjqypt': {
      'en': 'On Progress',
      'id': 'Dalam Proses',
    },
    '1n0ju0zo': {
      'en': 'Done',
      'id': 'Selesai',
    },
    'xzamku6r': {
      'en': 'Expired',
      'id': 'Kedaluwarsa',
    },
    '57q4g4l7': {
      'en': 'All',
      'id': 'Semua',
    },
    'gyj0lmam': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentMitraDetailPage
  {
    'iyfn9066': {
      'en': 'Client Information',
      'id': 'Informasi Klien',
    },
    'f1dl6qih': {
      'en': 'Appointment Date',
      'id': 'Tanggal Janji Temu',
    },
    'tipn9ia7': {
      'en': 'Appointment Class',
      'id': 'Kelas Janji Temu',
    },
    'uzvhzxde': {
      'en': 'Appointment Price',
      'id': 'Harga Janji Temu',
    },
    'asn6pftt': {
      'en': 'Appointment Status',
      'id': 'Status Janji Temu',
    },
    'zcgrh3xt': {
      'en': 'UNVERIFIED',
      'id': 'BELUM DI VERIFIKASI',
    },
    's4hb1ngk': {
      'en': 'WAITING FOR VERIFICATION',
      'id': 'MENUNGGU VERIFIKASI',
    },
    'b2oc0tlk': {
      'en': 'ON PROGRESS',
      'id': 'DALAM PROSES',
    },
    '6kztbthh': {
      'en': 'PURCHASED',
      'id': 'PROSES PEMBAYARAN',
    },
    'trgxalc3': {
      'en': 'DONE',
      'id': 'SELESAI',
    },
    'yx3gk1kb': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    '2vuqhqph': {
      'en': 'Sent Class Module',
      'id': 'Modul Kelas yang Diberikan',
    },
    'od4gbco7': {
      'en': 'Accept',
      'id': 'Terima',
    },
    'qtgvy49s': {
      'en': 'Input Code Verification',
      'id': 'Masukkan Verifikasi Kode',
    },
    '2oyyisji': {
      'en': 'View Practice Module',
      'id': 'Lihat Modul Praktik',
    },
    'jaaovnfk': {
      'en': 'Send Module for Client',
      'id': 'Kirim Modul untuk Klien',
    },
    '92z0ruhf': {
      'en': 'End Appointment',
      'id': 'Akhiri Janji Temu',
    },
    '8yg9n2zs': {
      'en': 'View Invoice',
      'id': 'Lihat Faktur',
    },
    '54l2ypkj': {
      'en': 'Appointment Details',
      'id': 'Rincian Janji Temu',
    },
    'wsjjligs': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentVerificationPage
  {
    'nc0zzldl': {
      'en': 'Enter Client\'s appointment code',
      'id': 'Masukkan kode janji temu Klien',
    },
    'n06dftdk': {
      'en': 'Appointment Invoice',
      'id': 'Faktur Janji Temui',
    },
    'sy1rn712': {
      'en': '( 1x Module Package )',
      'id': '( 1x Paket Modul )',
    },
    'hj4d8xez': {
      'en': 'Class Service Fee',
      'id': 'Biaya Layanan Kelas',
    },
    'qr2fueq8': {
      'en': 'Total Income',
      'id': 'Jumlah Pendapatan',
    },
    'kb0o0oji': {
      'en': '',
      'id': '',
    },
    'auxroq6n': {
      'en': 'Verify',
      'id': 'Verifikasi',
    },
    '2liwirw8': {
      'en': 'Appointment Verification',
      'id': 'Verifikasi Janji Temu',
    },
    'tb8khqm0': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ServiceListPage
  {
    'wrlqg172': {
      'en': 'My Services',
      'id': '',
    },
    'mcpmasov': {
      'en': 'Open',
      'id': 'Buka',
    },
    'qdjf9s8l': {
      'en': 'Closed',
      'id': 'Tutup',
    },
    '6hnerrdb': {
      'en': 'Expired',
      'id': 'Kedaluwarsa',
    },
    'tb6ayu68': {
      'en': 'All',
      'id': 'Semua',
    },
    'yokq40k3': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    '2a61hxzk': {
      'en': 'OPEN',
      'id': 'BUKA',
    },
    'jz9ppp20': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'dqi3pcra': {
      'en': 'OPEN',
      'id': 'BUKA',
    },
    'zbofn5ik': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    '7x087xqx': {
      'en': 'OPEN',
      'id': 'BUKA',
    },
    'fwd6ayxk': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // LicenceListPage
  {
    'i6uf57e7': {
      'en': 'My Licences',
      'id': 'Lisensi Saya',
    },
    'i50qhugr': {
      'en': 'Active',
      'id': 'Aktif',
    },
    'eusvk2su': {
      'en': 'Inactive',
      'id': 'Tidak Aktif',
    },
    'i0l2vsny': {
      'en': 'Verify',
      'id': 'Verifikasi',
    },
    'zsxlyy37': {
      'en': 'Expired',
      'id': 'Kedaluwarsa',
    },
    'fqwdzuue': {
      'en': 'Please contact SBCare Admin to renew your Licence!',
      'id': 'Silakan hubungi Admin SBCare untuk memperpanjang Lisensi Anda!',
    },
    'qmqgfc8e': {
      'en': 'Chat Admin on WhatsApp',
      'id': 'Hubungi Admin di WhatsApp?',
    },
    'm44yr0v4': {
      'en': '',
      'id': '',
    },
    'j9x72qqu': {
      'en': 'All',
      'id': 'Semua',
    },
    '00nsw8q1': {
      'en': 'STATUS : ',
      'id': '',
    },
    '2pkpdfo8': {
      'en': 'STATUS : ',
      'id': '',
    },
    'pubudhxh': {
      'en': 'STATUS : ',
      'id': '',
    },
    't0ntof1i': {
      'en': 'Verify',
      'id': 'Verifikasi',
    },
    'o1zdj2tk': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // RegularModuleListPage
  {
    'gmjtfyll': {
      'en': '',
      'id': '',
    },
    '3s32ntq3': {
      'en': 'Input Module title',
      'id': 'Masukkan judul Modul',
    },
    '1o6meht2': {
      'en': 'EXP        : ',
      'id': 'EXP        : ',
    },
    'fp5mwiry': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'qzdszwjy': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'o22mlufz': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'f9xva67l': {
      'en': '',
      'id': '',
    },
    '40t7ql6h': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    '3y3ufeb1': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'lfxgbfsh': {
      'en': '',
      'id': '',
    },
    'iqesp7yw': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    'kw5mppd0': {
      'en': 'EXP        : ',
      'id': 'EXP        : ',
    },
    '3xabonf2': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'k45buol6': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'nb89b3ba': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'mz771ml7': {
      'en': '',
      'id': '',
    },
    'apmhqedx': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'k4klxvqm': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'e1ifviiv': {
      'en': '',
      'id': '',
    },
    '7y68o36n': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    'cmpqnuwc': {
      'en': 'Regular Modules',
      'id': 'Modul Reguler',
    },
    '864wp9rx': {
      'en': 'Modules',
      'id': 'Modul',
    },
  },
  // PracticeModuleListPage
  {
    '8p3yif6v': {
      'en': '',
      'id': '',
    },
    '4qyz7iba': {
      'en': 'Input Module title',
      'id': 'Masukkan judul Modul',
    },
    'vqm4j11t': {
      'en': 'EXP        : ',
      'id': 'EXP        : ',
    },
    'kxvihjrz': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'v8i7u0i9': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    '3l8vyl8p': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'fm1xsuq9': {
      'en': '',
      'id': '',
    },
    'ligmk30s': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    '4ys5y195': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    '7s8bp2k2': {
      'en': '',
      'id': '',
    },
    'evi79iha': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    'atc179qc': {
      'en': 'EXP        : ',
      'id': 'EXP        : ',
    },
    'a7caasxl': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'f6q0m1n6': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'es4q5qz6': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    '6mdag5c6': {
      'en': '',
      'id': '',
    },
    'y9fjchjp': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'on2scvlf': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'ua8n0ahr': {
      'en': '',
      'id': '',
    },
    't5srkoqp': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    '6x2nij84': {
      'en': 'Practice Modules',
      'id': 'Modul Praktik',
    },
    'kri7znti': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // TopupPage
  {
    'd2ap3fe6': {
      'en': 'Payment Method',
      'id': 'Metode Pembayaran',
    },
    'ur3m1qxo': {
      'en': 'Choose payment method',
      'id': 'Pilih metode pembayaran',
    },
    'yspsowge': {
      'en': 'Search bank',
      'id': 'Cari bank',
    },
    'mntef9xp': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    '8aswdsni': {
      'en': 'Nominal',
      'id': 'Nominal',
    },
    'ozgh6t4c': {
      'en': 'Rp',
      'id': 'Rp',
    },
    '4refb0e7': {
      'en': '',
      'id': '',
    },
    'n18dtyvh': {
      'en': 'Top up',
      'id': 'Top up',
    },
    'h5s209cm': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'yac7tlz3': {
      'en': 'Top up History',
      'id': 'Riwayat Top up',
    },
    '2z7kfxo1': {
      'en': 'Top up SBPay',
      'id': 'Top up SBPay',
    },
    'kkobxgoj': {
      'en': 'Wallet',
      'id': 'Dompet',
    },
  },
  // TransferPage
  {
    'o76f984g': {
      'en': 'Nominal',
      'id': 'Nominal',
    },
    'ui7zp2vh': {
      'en': 'Rp',
      'id': 'Rp',
    },
    '756cb1lq': {
      'en': '*minimum Rp 10.000',
      'id': '*Minimal Rp 50.000',
    },
    'o6fnt3jm': {
      'en': 'SBPay Number',
      'id': 'Nomor SBPay',
    },
    'o596wfqi': {
      'en': '',
      'id': '',
    },
    '6sldp09o': {
      'en': '',
      'id': '',
    },
    'jb4a5y3s': {
      'en': 'Transfer to :',
      'id': 'Transfer kepada :',
    },
    '00sdjsbt': {
      'en': '',
      'id': '',
    },
    'vv3bn8ff': {
      'en': '-',
      'id': '-',
    },
    'pntbnf0x': {
      'en': 'Transfer',
      'id': 'Transfer',
    },
    'v8awsrl4': {
      'en': 'Transfer History',
      'id': 'Riwayat Transfer',
    },
    '4m2pwd1u': {
      'en': 'Transfer SBPay',
      'id': '',
    },
    'iix67v0t': {
      'en': 'Wallet',
      'id': 'Dompet',
    },
  },
  // TransactionHistoryListPage
  {
    'elqcrpue': {
      'en': 'Transaction History',
      'id': 'Riwayat Transaksi',
    },
    'j0zk2vaz': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentDetailPage
  {
    'gpnjgksm': {
      'en': 'Provider Information',
      'id': 'Informasi Mitra',
    },
    '37cjlwdw': {
      'en': 'Appointment Date & Time',
      'id': 'Tanggal & Waktu Janji Temu',
    },
    'egz51u3l': {
      'en': 'Appointment Class',
      'id': 'Kelas Janji Temu',
    },
    'ventlu5n': {
      'en': 'Appointment Price',
      'id': 'Harga Janji Temu',
    },
    'l3pq4ur8': {
      'en': 'Appointment Status',
      'id': 'Status Janji Temu',
    },
    '48151sfu': {
      'en': 'UNVERIFIED',
      'id': 'BELUM DI VERIFIKASI',
    },
    'yqc1kyyv': {
      'en': 'BOOKING CODE VERIFICATION',
      'id': 'VERIFIKASI KODE PEMESANAN',
    },
    'q4obbsfs': {
      'en': 'ON PROGRESS',
      'id': 'DALAM PROSES',
    },
    'jqrzrvhs': {
      'en': 'DONE',
      'id': 'SELESAI',
    },
    '3piox4rz': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'qsw4s8z9': {
      'en': 'Received Class Module',
      'id': 'Modul Kelas yang Diterima',
    },
    'zpstzuob': {
      'en': 'View Invoice',
      'id': 'Lihat Faktur',
    },
    '6x0iqiwq': {
      'en': 'View Booking Code',
      'id': 'Lihat Kode Pemesanan',
    },
    'ehaoqfmi': {
      'en': 'View Invoice',
      'id': 'Lihat Faktur',
    },
    'lw3v86ip': {
      'en': 'Appointment Details',
      'id': 'Rincian Janji Temu',
    },
    '22m3a5vq': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentCodePage
  {
    'iqems0qe': {
      'en': '( 1x Module Package )',
      'id': '( 1x Paket Modul )',
    },
    'gbfza2wf': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'jdqlne6k': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    '6kay0okt': {
      'en': 'Total Payment',
      'id': 'Jumlah Pembayaran',
    },
    'u25h22ru': {
      'en': '',
      'id': '',
    },
    'ohjuf00g': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'sr2o4ye7': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    '72psykvo': {
      'en': 'Appointment Booking Code',
      'id': 'Kode Pemesanan',
    },
    'zo893khx': {
      'en': 'Give this booking code to your Provider',
      'id': 'Berikan kode pemesanan ini ke Mitra Anda',
    },
    'a4fkyox7': {
      'en': 'View Appointment Schedule',
      'id': 'Lihat Jadwal Janji Temu',
    },
    'we8ilk2a': {
      'en': 'Appointment Code',
      'id': 'Kode Janji Temu',
    },
    'cz230wkz': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ProviderSuccessBookScreen
  {
    'e1r6l0f8': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    's9ffj874': {
      'en': 'Thank you for booking an appointment',
      'id': 'Terima kasih telah membuat janji temu',
    },
    'oredz3rh': {
      'en': 'View Appointment',
      'id': 'Lihat Faktur',
    },
    '2stl3fg5': {
      'en': 'Back',
      'id': 'Kembali',
    },
    '68qyypa9': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ProviderServicePage
  {
    'wrzbtayf': {
      'en': 'Details',
      'id': 'Rincian',
    },
    '02mi1r2o': {
      'en': 'Provider Services',
      'id': 'Layanan Mitra',
    },
    'zad13vsg': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ProfileSettingPage
  {
    '22938qy9': {
      'en': 'SBPay Number : ',
      'id': 'Nomor SBPay :',
    },
    'h8f4u91d': {
      'en': 'Username',
      'id': 'Username',
    },
    '7muihliu': {
      'en': '',
      'id': '',
    },
    'bn47jd5j': {
      'en': '',
      'id': '',
    },
    'le5idwp0': {
      'en': 'Fullname',
      'id': 'Nama lengkap',
    },
    'as3j9g14': {
      'en': '',
      'id': '',
    },
    'pfpezx8d': {
      'en': '',
      'id': '',
    },
    'rxjg1sxv': {
      'en': 'Whatsapp',
      'id': 'Whatsapp',
    },
    'cjyoptro': {
      'en': '',
      'id': '',
    },
    'tz1q2c4e': {
      'en': '',
      'id': '',
    },
    '4yae9tk7': {
      'en': 'Date of Birth',
      'id': 'Tanggal Lahir',
    },
    'eyymc2kq': {
      'en': '',
      'id': '',
    },
    'uc5sf7b9': {
      'en': 'Update',
      'id': 'Perbarui',
    },
    'ojvdpc1n': {
      'en': 'Field is required',
      'id': '',
    },
    'wyg03koc': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'ax0verr1': {
      'en': 'Field is required',
      'id': '',
    },
    '8ob7g7bt': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'qw5r0t28': {
      'en': 'Field is required',
      'id': '',
    },
    'edm76h32': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'm3z9d0su': {
      'en': 'Field is required',
      'id': '',
    },
    'hdz8tnzd': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '5yu1bzal': {
      'en': 'Profile Setting',
      'id': 'Pengaturan Profil',
    },
    'shwgtcfh': {
      'en': 'Profile',
      'id': 'Profil',
    },
  },
  // AccountSettingPage
  {
    'lyruzcyp': {
      'en': 'Email',
      'id': 'Email',
    },
    'hle2epka': {
      'en': '',
      'id': '',
    },
    'b2eksux4': {
      'en': '',
      'id': '',
    },
    'eek43yvm': {
      'en': 'New Password',
      'id': 'Kata Sandi Baru',
    },
    'mhhxvbgm': {
      'en': '',
      'id': '',
    },
    'dikae1u1': {
      'en': '',
      'id': '',
    },
    'gc3u3x5l': {
      'en': 'Re-type Password',
      'id': 'Ketik Ulang Kata Sandi',
    },
    '65f3oguv': {
      'en': '',
      'id': '',
    },
    'yrxmbsuv': {
      'en': '',
      'id': '',
    },
    'n1h3ji77': {
      'en': '',
      'id': '',
    },
    'ajs7ggny': {
      'en': '',
      'id': '',
    },
    '9crmlaa9': {
      'en': '',
      'id': '',
    },
    'iol8e5ar': {
      'en': '',
      'id': '',
    },
    '9cbti4w4': {
      'en': '',
      'id': '',
    },
    '6rcqxmab': {
      'en': '',
      'id': '',
    },
    'wumyenfw': {
      'en': 'Change Password',
      'id': 'Ubah Kata Sandi',
    },
    '9g9tb0sw': {
      'en': 'WARNING!!!',
      'id': 'PERINGATAN!!!',
    },
    'v6ex7gq5': {
      'en':
          '\nDeleting your account will permanently remove all your data, including your profile, settings, and any content you have created. ',
      'id':
          '\nMenghapus akun Anda akan menghapus semua data Anda secara permanen, termasuk profil, pengaturan, dan konten apa pun yang telah Anda buat. ',
    },
    'vxczb0k8': {
      'en': 'This action cannot be undone.',
      'id': 'Tindakan ini tidak dapat dibatalkan.',
    },
    'ujhf1aqn': {
      'en': 'DELETE ACCOUNT',
      'id': 'HAPUS AKUN',
    },
    '3u6qum5y': {
      'en': 'Account Setting',
      'id': 'Pengaturan Akun',
    },
    'vv840100': {
      'en': 'Profile',
      'id': 'Profil',
    },
  },
  // AddressSettingPage
  {
    'cxatfe0m': {
      'en': 'SBPay Number : ',
      'id': 'Nomor SBPay :',
    },
    'fqykd7zi': {
      'en': 'Home Address',
      'id': 'Alamat Rumah',
    },
    'vygry00e': {
      'en': 'Street Name',
      'id': 'Nama Jalan',
    },
    'tl5uowm1': {
      'en': '',
      'id': '',
    },
    'frl5lzy6': {
      'en': 'Subdistrict',
      'id': 'Kelurahan/Desa',
    },
    'ddzc2jrv': {
      'en': 'District',
      'id': 'Kecamatan',
    },
    'zxyn71f2': {
      'en': 'Search city',
      'id': 'Cari kota',
    },
    '2c79vrkl': {
      'en': 'Search province',
      'id': 'Cari provinsi',
    },
    'lu1els54': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'p5gxbkpe': {
      'en': 'Zip Code',
      'id': 'Kode Pos',
    },
    '1zev8k96': {
      'en': '',
      'id': '',
    },
    'xpvsaah0': {
      'en': 'Update',
      'id': 'Perbarui',
    },
    'dwklbq0f': {
      'en': 'Field is required',
      'id': '',
    },
    'xkdpr8ls': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '9orhblvd': {
      'en': 'Field is required',
      'id': '',
    },
    'i8hdro4b': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '7t3js6zc': {
      'en': 'Field is required',
      'id': '',
    },
    'gu6siuxg': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '2xzf9e2u': {
      'en': 'Field is required',
      'id': '',
    },
    '7m3ds8h8': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '3nxvznuh': {
      'en': 'Address Setting',
      'id': 'Pengaturan Alamat',
    },
    'b6vuotzm': {
      'en': 'Profile',
      'id': 'Profil',
    },
  },
  // HomeNavbar
  {
    'f7ujk1m3': {
      'en': 'SBPay Balance',
      'id': 'Saldo SBPay',
    },
    '180s4lwe': {
      'en': 'Top up',
      'id': 'Top up',
    },
    '4cv6pin3': {
      'en': 'Transfer',
      'id': 'Transfer',
    },
    'z03fxnz7': {
      'en': '(Default Provider)',
      'id': '(Mitra Default)',
    },
    '89yj6rnv': {
      'en': 'Main Features',
      'id': 'Fitur Utama',
    },
    'o1paj2md': {
      'en': 'View All',
      'id': 'Lihat Semua',
    },
    '4cl8g6jc': {
      'en': 'Appointment\nSchedule',
      'id': 'Jadwal\nJanji Temu',
    },
    'fsbeuwe1': {
      'en': 'Default\nProvider',
      'id': 'Mitra\nDefault',
    },
    '095ryz5z': {
      'en': 'Provider\nService',
      'id': 'Layanan \nMitra',
    },
    'f698xnul': {
      'en': 'E-Learning\nStore',
      'id': 'E-Learning\nStore',
    },
    'wovvyalu': {
      'en': 'Online\nClass',
      'id': 'Kelas\nOnline',
    },
    'ash9daxx': {
      'en': 'Appointment Schedule',
      'id': 'Jadwal Janji Temu',
    },
    'zg70f53k': {
      'en': 'Default Provider',
      'id': 'Mitra Default',
    },
    'vcdst7xn': {
      'en': 'Provider Service',
      'id': 'Layanan Mitra',
    },
    'ma9zpibm': {
      'en': 'E-Learning Store',
      'id': 'E-Learning Store',
    },
    'y1u7799u': {
      'en': 'Online Class',
      'id': 'Kelas Online',
    },
    'lb4rp1qk': {
      'en': 'Provider\nList',
      'id': 'List\nMitra\n',
    },
    'xxhcks6j': {
      'en': 'Program\nStore',
      'id': 'Program\nStore\n',
    },
    'kyqrsbo5': {
      'en': 'Contraction\nTimer Pro',
      'id': 'Waktu\nKontraksi\nPro',
    },
    's3w9bmda': {
      'en': 'My SBLink\n',
      'id': 'SBLink\nSaya\n',
    },
    '0ctfcrf8': {
      'en': 'Provider List',
      'id': 'List Mitra',
    },
    'i6w03hmx': {
      'en': 'Program Store',
      'id': 'Program Store',
    },
    'qrrb5rgc': {
      'en': 'Contraction Timer Pro',
      'id': 'Waktu Kontraksi Pro',
    },
    'ddxvccko': {
      'en': 'My SBLink',
      'id': 'SBLink Saya',
    },
    '5mak15lv': {
      'en': 'Recent Articles',
      'id': 'Artikel Terkini',
    },
    '5gl5vddp': {
      'en': 'View Article',
      'id': 'Lihat Artikel',
    },
    'iuknejmk': {
      'en': 'SBCare Home Treatment',
      'id': 'SBCare Home Treatment',
    },
    'amtdcc3u': {
      'en': 'Coming soon!',
      'id': 'Coming soon!',
    },
    's0n9kk2q': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ELearningCheckoutPage
  {
    '8trwy9u8': {
      'en': 'Checkout Information',
      'id': 'Informasi Pembayaran',
    },
    'z7jjakma': {
      'en': '( 30 days active period )',
      'id': '( 30 hari masa aktif )',
    },
    'seap489x': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'lujx9isi': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'v4mot8j9': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    'j5pz02jx': {
      'en': '',
      'id': '',
    },
    'yve9dyig': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'v28tsb61': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'sxbpylnm': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    'i35613zz': {
      'en': 'E-Learning Checkout',
      'id': 'Pembayaran E-Learning',
    },
    'tkcagvly': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBCareLicenceListPage
  {
    'gc4covea': {
      'en': 'Details',
      'id': 'Rincian',
    },
    'e2t0spjq': {
      'en': 'SBCare Licences',
      'id': 'Lisensi SBCare',
    },
    '985ar6qj': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBCareLicencePurchasePage
  {
    'oh9byljv': {
      'en': 'Fullname',
      'id': 'Nama lengkap',
    },
    'w8m96912': {
      'en': '',
      'id': '',
    },
    'oqjjfp5u': {
      'en': '',
      'id': '',
    },
    'iw8z5cwd': {
      'en': 'Username',
      'id': 'Username',
    },
    'p6vtejqg': {
      'en': '',
      'id': '',
    },
    'fvhwt2kp': {
      'en': '',
      'id': '',
    },
    'ehk7clff': {
      'en': 'Whatsapp',
      'id': 'Whatsapp',
    },
    'mbz50yy4': {
      'en': '',
      'id': '',
    },
    'kcp1a2di': {
      'en': '',
      'id': '',
    },
    'yox9kxnz': {
      'en': 'Email',
      'id': 'Email',
    },
    '6qsgb8l9': {
      'en': '',
      'id': '',
    },
    'mf73z2ig': {
      'en': '',
      'id': '',
    },
    '939rex1n': {
      'en': 'SBCare Licence ',
      'id': 'Lisensi SBCare',
    },
    'hmrl91wo': {
      'en': '( 1 year Licence )',
      'id': '( Lisensi 1 Tahun )',
    },
    '17pe80v9': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    'jma4qrad': {
      'en': '',
      'id': '',
    },
    'lkso157g': {
      'en': 'Purchase Licence',
      'id': 'Bayar Lisensi',
    },
    'op04b6dj': {
      'en': 'SBCare Licence - Purchase',
      'id': 'Lisensi SBCare - Pembelian',
    },
    'iitlmc4n': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassListPage
  {
    'jcoxizkt': {
      'en': 'Details',
      'id': 'Rincian',
    },
    'e6qnu6n2': {
      'en': 'Online Class',
      'id': 'Kelas Online',
    },
    '12j39y70': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ContractionTimerPage
  {
    '0nkzf7d1': {
      'en': 'Start',
      'id': 'Mulai',
    },
    'zmzjen5a': {
      'en': 'Stop',
      'id': 'Berhenti',
    },
    'oi35m50g': {
      'en': 'Reset',
      'id': 'Ulang',
    },
    '6jaj5prk': {
      'en': 'Total Contraction',
      'id': 'Jumlah Kontraksi',
    },
    'dak9tckl': {
      'en': 'Average Duration',
      'id': 'Rata-Rata Durasi',
    },
    'rm8p4rm1': {
      'en': 'Average Interval',
      'id': 'Interval Rata-Rata',
    },
    'zg7f8buc': {
      'en': 'Contraction Per Hour',
      'id': 'Kontraksi Tiap Jam',
    },
    'qyngo1nj': {
      'en': 'Duration',
      'id': 'Durasi',
    },
    '36ys9gnc': {
      'en': 'Start',
      'id': 'Mulai',
    },
    '24ed3j6r': {
      'en': 'End',
      'id': 'Berakhir',
    },
    'yykfqxdy': {
      'en': 'Contraction Timer',
      'id': 'Penghitung Kontraksi',
    },
    'h564voto': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // TopupSuccessScreen
  {
    'zabltjzh': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    'px9jtl5v': {
      'en': 'Thank you for Top up-ing your SBPay',
      'id': 'Terima kasih atas Top up SBPay Anda',
    },
    'pneuzptd': {
      'en': 'Continue Payment',
      'id': 'Lanjutkan Pembayaran',
    },
    'e8g4d5bw': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'dr53z56g': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // RestrictedRoleScreen
  {
    'flew2kje': {
      'en': 'Access Forbidden!',
      'id': 'Tidak ada akses!',
    },
    '8sa7x36f': {
      'en': 'This page is only for provider.',
      'id': 'Halaman ini hanya untuk mitra.',
    },
    'g7e3f5ln': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'w0rwfsj5': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // RegularModuleContentPage
  {
    '8ifnqygy': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    'l78cvrdr': {
      'en': 'Regular Module Content',
      'id': 'Konten Modul Reguler',
    },
    '8aipg6op': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // WithdrawPage
  {
    '0brhqs78': {
      'en': 'Available Balance',
      'id': 'Saldo Tersedia',
    },
    'rd8mafez': {
      'en': 'Withdraw Amount',
      'id': 'Jumlah Penarikan',
    },
    'eft1ufk2': {
      'en': 'Rp',
      'id': 'Rp',
    },
    '8v5dxog7': {
      'en': 'Withdraw Funds',
      'id': 'Tarik Dana',
    },
    'h9j38g73': {
      'en': 'Withdraw History',
      'id': 'Riwayat Penarikan',
    },
    'qa89zm0i': {
      'en': 'Withdraw SBPay',
      'id': 'Tarik SBPay',
    },
    '0b98rv0r': {
      'en': 'Wallet',
      'id': 'Dompet',
    },
  },
  // ProviderListPage
  {
    's8m8z9l9': {
      'en': '',
      'id': '',
    },
    'jkepp31b': {
      'en': 'Input provider name or location',
      'id': 'Masukkan nama atau lokasi mitra',
    },
    'jrdmef38': {
      'en': 'Set as Default',
      'id': 'Tetapkan sebagai Default',
    },
    'd6xnejw5': {
      'en': 'Set as Default',
      'id': 'Tetapkan sebagai Default',
    },
    'pv2e1nyj': {
      'en': 'Reset to Default',
      'id': '',
    },
    '7hx2ms69': {
      'en': 'Available Provider',
      'id': 'Mitra Aktif',
    },
    'f4vlsgwm': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SendAppointmentModulePage
  {
    'lt95d270': {
      'en': 'Send a module for Client',
      'id': 'Kirim modul untuk Klien',
    },
    'lrd2975m': {
      'en': 'Select a module',
      'id': 'Pilih modul',
    },
    'b74c296j': {
      'en': 'Search module',
      'id': 'Cari modul',
    },
    'wpoghdfi': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'zdksu9yr': {
      'en': 'Send',
      'id': 'Kirim',
    },
    'uykjgeds': {
      'en': 'Send Module',
      'id': 'Kirim Modul',
    },
    'kfhd30rf': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyELearningListPage
  {
    '5glkebvf': {
      'en': '',
      'id': '',
    },
    'hakf5qpv': {
      'en': 'Input E-Learning title',
      'id': 'Masukkan judul E-Learning',
    },
    'wrso61dh': {
      'en': 'PRICE     : ',
      'id': 'HARGA   : ',
    },
    'fc90cko0': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'opzvgntc': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    '2t8obtae': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    '145dwmfg': {
      'en': 'STATUS  : ',
      'id': 'STATUS  : ',
    },
    '43x07ykb': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    '9hnx6w0k': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'nx4orup2': {
      'en': 'STATUS : ',
      'id': 'STATUS  : ',
    },
    'nb8enb8e': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'kthmdoot': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'kpsv73ny': {
      'en': 'View E-Learning',
      'id': 'Lihat E-Learning',
    },
    '8w4mfv6f': {
      'en': 'Renew E-Learning',
      'id': 'Perpanjang E-Learning',
    },
    '9lfpk143': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    '9il2ucpf': {
      'en': 'PRICE     : ',
      'id': 'HARGA   : ',
    },
    'ivg3pmq8': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'genp67ck': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    '8ploinz5': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'dzf8dh2m': {
      'en': 'STATUS  : ',
      'id': 'STATUS  : ',
    },
    '02v26ra2': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'e6gcdvt1': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'g2pejg1i': {
      'en': 'STATUS : ',
      'id': 'STATUS  : ',
    },
    '7pu6lzow': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    '8ezvdyhu': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'jz56d3lr': {
      'en': 'View E-Learning',
      'id': 'Lihat E-Learning',
    },
    'e5pxfhtr': {
      'en': 'Renew E-Learning',
      'id': 'Perpanjang E-Learning',
    },
    'qftjdppw': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'wmigsxqn': {
      'en': 'My E-Learning',
      'id': 'E-Learning Saya',
    },
    'l6n8p428': {
      'en': 'Modules',
      'id': 'Modul',
    },
  },
  // ServiceSettingPage
  {
    'hdafnqh3': {
      'en': 'Information',
      'id': 'Informasi',
    },
    'zn5l9btm': {
      'en': 'Open Service',
      'id': 'Buka Layanan',
    },
    'p8u1a5in': {
      'en': 'Class Name',
      'id': 'Nama Kelas',
    },
    '8p3xlhid': {
      'en': '',
      'id': '',
    },
    'kp7u73zt': {
      'en': 'Participants Limit',
      'id': 'Batasan Peserta',
    },
    '43drwewe': {
      'en': '',
      'id': '',
    },
    'j2ez5cuz': {
      'en': 'Class Price',
      'id': 'Harga Kelas',
    },
    '7c4tcqxc': {
      'en': 'Rp',
      'id': 'Rp',
    },
    'xv47ltu4': {
      'en': 'Timezone',
      'id': 'Zona waktu',
    },
    '84fteah1': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    '9bpxhn5u': {
      'en': 'Current Practice Address',
      'id': 'Alamat Praktik Sekarang',
    },
    'pm4ajw57': {
      'en': '',
      'id': '',
    },
    'tp061bkz': {
      'en': 'Set Practice Address',
      'id': 'Alamat Praktik Baru',
    },
    '2aiz96x6': {
      'en': 'Select address',
      'id': 'Pilih alamat',
    },
    'kowmf60k': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'u4fw7v51': {
      'en': 'Field is required',
      'id': '',
    },
    '92gxs2rp': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'jczlpq2c': {
      'en': 'Field is required',
      'id': '',
    },
    '6y2og60x': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'tcd5v5gz': {
      'en': 'Field is required',
      'id': '',
    },
    'n5cgx4i5': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '0k23ujrk': {
      'en': 'Field is required',
      'id': 'Kolom wajib diisi',
    },
    'h4jhw547': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'cm24ie9n': {
      'en': 'Description',
      'id': 'Deskripsi',
    },
    '3r0lvq8j': {
      'en': '',
      'id': '',
    },
    'a40uot0g': {
      'en': 'Save Changes',
      'id': 'Simpan Perubahan',
    },
    'mdro3nma': {
      'en': 'Service Setting',
      'id': 'Pengaturan Layanan',
    },
    'r7fbisd1': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // EditPracticeAddressPage
  {
    'gyx3rs9h': {
      'en': 'Set as Default Address',
      'id': 'Tetapkan sebagai Alamat Default',
    },
    'p6ah6gcm': {
      'en': 'Practice Address',
      'id': 'Alamat Praktik',
    },
    'yhykz1i1': {
      'en': 'Street Name',
      'id': 'Nama Jalan',
    },
    'w2fpinvr': {
      'en': 'Subdistrict',
      'id': 'Kelurahan/Desa',
    },
    'lr6lyh3l': {
      'en': 'District',
      'id': 'Kecamatan',
    },
    'agsrmchy': {
      'en': 'Search City',
      'id': 'Cari Kab/Kota',
    },
    'b2u4jxj9': {
      'en': 'Search Province',
      'id': 'Cari Provinsi',
    },
    'nfhtwgt6': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'amku3in9': {
      'en': 'Zip Code',
      'id': 'Kode Pos',
    },
    'atbslvc4': {
      'en': 'Street Name is required',
      'id': 'Nama Jalan diperlukan',
    },
    'qqnqg4ls': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '2jteerxt': {
      'en': 'Subdistrict is required',
      'id': 'Kelurahan/Desa diperlukan',
    },
    '3agasf4h': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '2co4zbxd': {
      'en': 'District is required',
      'id': 'Kecamatan diperlukan',
    },
    '5dsylerh': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'b3o6zln2': {
      'en': 'Zip Code is required',
      'id': 'Kode Pos diperlukan',
    },
    'yv24emtb': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'b3pzevqv': {
      'en': 'Update Address',
      'id': 'Perbarui Alamat',
    },
    'ar7nuptd': {
      'en': 'Delete Address',
      'id': 'Hapus Alamat',
    },
    'b5snz5jj': {
      'en': 'Edit Practice Address',
      'id': 'Edit Alamat Praktik',
    },
    'i9qx9mj5': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ProviderProfileSettingPage
  {
    'gfupys10': {
      'en': 'SBPay Number : ',
      'id': 'Nomor SBPay :',
    },
    '4us95myr': {
      'en': 'My Address',
      'id': 'Alamat Saya',
    },
    'fbnko5vs': {
      'en': 'Practice Address',
      'id': 'Alamat Praktik',
    },
    '4g39npib': {
      'en': 'Add New Address',
      'id': 'Tambah Alamat Baru',
    },
    'sv9lt87h': {
      'en': 'My Bank',
      'id': 'Bank Saya',
    },
    'jhxkhhaz': {
      'en': 'Destination Bank',
      'id': 'Bank Tujuan',
    },
    'knty0qie': {
      'en': 'Search Bank',
      'id': 'Cari Bank',
    },
    '91x5ixig': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'a27cmdam': {
      'en': 'Account Name',
      'id': 'Nama Akun',
    },
    'aav0lhgm': {
      'en': '',
      'id': '',
    },
    'rooetfrq': {
      'en': 'Account Number',
      'id': 'Nomor Rekening',
    },
    'oaqjyims': {
      'en': '',
      'id': '',
    },
    'emt49295': {
      'en': 'Update',
      'id': 'Perbarui',
    },
    'jph2s7j6': {
      'en': 'Add Bank',
      'id': 'Tambahkan Bank',
    },
    '8wvuvsjc': {
      'en': 'Field is required',
      'id': '',
    },
    'ahzv0gky': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'eze279ge': {
      'en': 'Field is required',
      'id': '',
    },
    'jdiki1x8': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'uaegrncn': {
      'en': 'Provider Profile',
      'id': 'Profil Mitra',
    },
    '9lscnu4u': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AddPracticeAddressPage
  {
    '1s6yvckg': {
      'en': 'Set as Default Address',
      'id': 'Tetapkan sebagai Alamat Default',
    },
    'mv8vuygy': {
      'en': 'Practice Address',
      'id': 'Alamat Praktik',
    },
    'k3mc6tdy': {
      'en': 'Street Name',
      'id': 'Nama Jalan',
    },
    'hto9xefk': {
      'en': 'Subdistrict',
      'id': 'Kelurahan/Desa',
    },
    'nm579bft': {
      'en': 'District',
      'id': 'Kecamatan',
    },
    '7zf0bxza': {
      'en': 'City',
      'id': 'Kab/Kota',
    },
    'kpsd7dyz': {
      'en': 'Search City',
      'id': 'Cari Kota',
    },
    'hhyeamkg': {
      'en': 'Province',
      'id': 'Provinsi',
    },
    'xsbe2szs': {
      'en': 'Search Province',
      'id': 'Cari Provinsi',
    },
    'jkp6159j': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    't1ujz9r3': {
      'en': 'Zip Code',
      'id': 'Kode Pos',
    },
    'grgd189e': {
      'en': 'Street name is required',
      'id': 'Nama jalan diperlukan',
    },
    'bm1ugc43': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '8nwdfmaq': {
      'en': 'Subdistrict is required',
      'id': 'Kelurahan/Desa diperlukan',
    },
    'kojjx1ql': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    'hdw42j27': {
      'en': 'District is required',
      'id': 'Kecamatan diperlukan',
    },
    'eqb817vp': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '16wjxj0h': {
      'en': 'Zip Code is required',
      'id': 'Kode Pos diperlukan',
    },
    'u9ayzszk': {
      'en': 'Please choose an option from the dropdown',
      'id': '',
    },
    '9kca5ero': {
      'en': 'Add New Address',
      'id': 'Tambah Alamat Baru',
    },
    '1wwis0et': {
      'en': 'New Practice Address',
      'id': 'Alamat Baru',
    },
    '2irgoczs': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ContentViewerPage
  {
    'ms15qoga': {
      'en': 'Content Viewer',
      'id': 'Penampil Konten',
    },
    'sbna99wb': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBCareLicenceDetailPage
  {
    'o73iciq6': {
      'en': 'Description',
      'id': 'Deskripsi',
    },
    '7tlxes59': {
      'en': 'Licence Price',
      'id': 'Harga Lisensi',
    },
    'milc6uo8': {
      'en': 'Purchase Licence',
      'id': 'Beli Lisensi',
    },
    'ea9jxv2l': {
      'en': 'SBCare Licence Details',
      'id': 'Rincian Lisensi SBCare',
    },
    'voiqa9su': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // PracticeModuleContentPage
  {
    '35ufog01': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    'jhefrg97': {
      'en': 'Practice Module Content',
      'id': 'Konten Modul Praktik',
    },
    'di1wucxh': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ProviderServiceDetailPage
  {
    'qv2agqxd': {
      'en': 'Description',
      'id': 'Deskripsi',
    },
    'v57e3axm': {
      'en': 'Class Price',
      'id': 'Harga Kelas',
    },
    '06oc9p72': {
      'en': 'Pick Appointment Date',
      'id': 'Pilih Tanggal Janji Temu',
    },
    '4c7xndyd': {
      'en': '',
      'id': '',
    },
    'jqb3wnn3': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    '3jm4y1pf': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'hdwbwjld': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'zhq6iu1r': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    '5iwfycsd': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    '3kobmeg6': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    '7o8odxjd': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'hzhwgujk': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'aoh5916r': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'ewgfo8tr': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'ekodni4a': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'sqlzu431': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'sit18eef': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'usc2m5vm': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    '8rrcyzfc': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'eek52o15': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'hnj4ym8z': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'sn94vc66': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'w1p7dh6c': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'isjkpid6': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'blqnhanu': {
      'en':
          '* Schedule unavailable! Please pick date first and then pick other dates if still unavailable',
      'id':
          '* Jadwal tidak tersedia! Silakan pilih tanggal terlebih dahulu, lalu pilih tanggal lain jika masih tidak tersedia',
    },
    '9acovvs4': {
      'en': 'Book an Appointment',
      'id': 'Pesan Janji Temu',
    },
    '4k6b6ue4': {
      'en': 'Service Details',
      'id': 'Rincian Layanan',
    },
    'kzphfcca': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBCareLicenceSuccessPurchaseScreen
  {
    'o64pzcji': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    '4lwjtlz6': {
      'en': 'Thank you for purchasing SBCare Licence',
      'id': 'Terima kasih telah melakukan pembelian Lisensi SBCare',
    },
    'wxlhmqrt': {
      'en': 'View Invoice',
      'id': 'Lihat Faktur',
    },
    'bu7cb04i': {
      'en': 'View Licence',
      'id': 'Lihat Lisensi',
    },
    'qog6tngg': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'xuzgbdac': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // TransferSuccessScreen
  {
    'y0ricm2o': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    '4z3q8d0o': {
      'en': 'Transfer successfully sent',
      'id': 'Transfer berhasil dikirim',
    },
    'qepg8gzd': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'k98ta1tw': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyElearningContentPage
  {
    'owz710f4': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    '8o1ndofa': {
      'en': 'My E-Learning Content',
      'id': 'Konten E-Learning Saya',
    },
    '4xudyk8p': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentSchedulePage
  {
    'tl57o9nl': {
      'en': 'Appointment Schedule',
      'id': 'Jadwal Janji Temu',
    },
    'imb3metd': {
      'en': 'Unverified',
      'id': 'Belum di verifikasi',
    },
    'pzg9gi60': {
      'en': 'On Progress',
      'id': 'Dalam proses',
    },
    'a5qdd9xb': {
      'en': 'Done',
      'id': 'Selesai',
    },
    '3w4rwcnw': {
      'en': 'Expired',
      'id': 'Kedaluwarsa',
    },
    'b39y3k9n': {
      'en': 'All',
      'id': 'Semua',
    },
    'v9mu60vg': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ELearningSuccessPurchaseScreen
  {
    '7eaok31d': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    'miwnbalh': {
      'en': 'Thank you for purchasing an E-Learning',
      'id': 'Terima kasih telah membeli E-Learning',
    },
    'ir2bzf6u': {
      'en': 'View E-Learning',
      'id': 'Lihat E-Learning',
    },
    '0onrrzui': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'vq9lw0se': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ScheduleSettingPage
  {
    'd91nvl8c': {
      'en': 'Sunday',
      'id': 'Minggu',
    },
    'snjil4l0': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    'pn7u7dgj': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    '0yt5ec8d': {
      'en': 'Monday',
      'id': 'Senin',
    },
    '64ibw51q': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    '7yt72xid': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    'ij3fi7cy': {
      'en': 'Tuesday',
      'id': 'Selasa',
    },
    'gpftxuq6': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    'enr3w523': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    '43huqqpt': {
      'en': 'Wednesday',
      'id': 'Rabu',
    },
    'klr72ivl': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    'pbb5w16g': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    '650scotm': {
      'en': 'Thursday',
      'id': 'Kamis',
    },
    '6nknj1u3': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    'cvg40lq5': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    'rpibvago': {
      'en': 'Friday',
      'id': 'Jum\'at',
    },
    'y28wt09m': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    '5mtq26s3': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    'f5tqswm8': {
      'en': 'Saturday',
      'id': 'Sabtu',
    },
    '1jy0jc14': {
      'en': 'Open Schedule',
      'id': 'Buka Jadwal',
    },
    'k6ywzr9z': {
      'en': 'Current Schedule',
      'id': 'Jadwal Saat Ini',
    },
    'f3qmjxt4': {
      'en': 'Schedule Setting',
      'id': 'Pengaturan Jadwal',
    },
    '89rnixxw': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ScheduleSettingUpdatePage
  {
    'v4rau4lx': {
      'en': 'Open Session',
      'id': 'Buka Sesi',
    },
    'zqar78yy': {
      'en': 'Schedule',
      'id': 'Jadwal',
    },
    '9itx2tmf': {
      'en': 'Start',
      'id': 'Mulai',
    },
    'dskgbmg3': {
      'en': 'End',
      'id': 'Berakhir',
    },
    '27umxa27': {
      'en': '',
      'id': '',
    },
    'h1jsiq2z': {
      'en': '',
      'id': '',
    },
    'cwwjsdj7': {
      'en': 'Update Schedule',
      'id': 'Perbarui Jadwal',
    },
    'o1agcku9': {
      'en': 'Update Schedule Session',
      'id': 'Perbarui Jadwal Sesi',
    },
    'us6xxzym': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentCheckoutPage
  {
    '34evasad': {
      'en': 'Checkout Information',
      'id': 'Informasi Pembayaran',
    },
    '82a7dtfv': {
      'en': '( 1x Module Package )',
      'id': '( 1x Paket Modul )',
    },
    'mmj3rrpw': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'o67ur9x4': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'dz80rb2c': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    'snhtoy0p': {
      'en': '',
      'id': '',
    },
    'aex5sxhy': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'xaknhd1w': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    '3xg3yzr3': {
      'en': 'Book an Appointment',
      'id': 'Pesan Janji Temu',
    },
    'llwl7k4x': {
      'en': 'Appointment Checkout',
      'id': 'Pembayaran Janji Temu',
    },
    '6xhu0r1t': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentInvoicePage
  {
    'dr5u0ub0': {
      'en': '( 1x Module Package )',
      'id': '( 1x Paket Modul )',
    },
    'o6aofvc7': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'bw6xvull': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'q7fq187g': {
      'en': 'Total Payment',
      'id': 'Jumlah Pembayaran',
    },
    '5n48tw5n': {
      'en': '',
      'id': '',
    },
    'w5txdt06': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'so9h4pun': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'n80aseiy': {
      'en': 'View Appointment Schedule',
      'id': 'Lihat Jadwal Janji Temu',
    },
    'kzze5bhz': {
      'en': 'Appointment Invoice',
      'id': 'Faktur Janji Temu',
    },
    'yz5o4n1b': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ELearningListPage
  {
    'ezjffxx3': {
      'en': '',
      'id': '',
    },
    'segmi2be': {
      'en': 'Input E-Learning title',
      'id': 'Masukkan judul E-Learning',
    },
    'yuwheygp': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'aihhkfbo': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'mqkvqy5s': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    'xg9vvdfo': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    'ciflg2f3': {
      'en': '',
      'id': '',
    },
    'kee7hkoc': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    '9h5vtpqx': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    '7b3j6olq': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'tzj200ir': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'pa1mykzy': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    'cixaqccu': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    'lzdz6lv8': {
      'en': '',
      'id': '',
    },
    'l5g66b7m': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    'h7il2myd': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'cl3rf1gu': {
      'en': 'E-Learning Store',
      'id': 'E-Learning Store',
    },
    'p6jjulye': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ELearningDetailPage
  {
    '1o8yu56i': {
      'en': 'E-Learning Details',
      'id': 'Rincian E-Learning',
    },
    '9crsil0a': {
      'en': 'E-Learning Content',
      'id': 'Konten E-Learning',
    },
    'nnnjqfjn': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    'vbf5m9ht': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // WithdrawSuccessScreen
  {
    'yvsgmox9': {
      'en': 'Withdraw Request Success!',
      'id': 'Permintaan Penarikan Saldo Sukses!',
    },
    '0hjsn2p7': {
      'en':
          'Withdraw process requires 1x24 hours to complete. Please check it frequently.',
      'id':
          'Proses penarikan membutuhkan waktu 1x24 jam untuk diselesaikan. Harap periksa secara berkala.',
    },
    'z5cfv0im': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'sgjnx5ju': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // TopupDetailPage
  {
    '8pdxrxum': {
      'en':
          'Please make sure that you pay before due date with the correct amount',
      'id':
          'Pastikan Anda membayar sebelum tanggal jatuh tempo dengan jumlah yang benar',
    },
    'sfli72dv': {
      'en': 'Bank',
      'id': 'Bank',
    },
    'umd4bpw5': {
      'en': 'Invoice Number',
      'id': 'Nomor Faktur',
    },
    '3smzjy3o': {
      'en': 'Full Name',
      'id': 'Nama Lengkap',
    },
    '4ohzk4oi': {
      'en': 'Transaction Name',
      'id': 'Nama Transaksi',
    },
    '08oyixdt': {
      'en': 'Transaction Status',
      'id': 'Status Transaksi',
    },
    'sdu6hi9s': {
      'en': 'Reference Number',
      'id': 'Nomor Referensi',
    },
    'uibgod06': {
      'en': 'Payment Code / VA Number',
      'id': 'Kode Pembayaran / Nomor VA',
    },
    'ivzi8ua8': {
      'en': 'Top up Amount + Fee',
      'id': 'Jumlah Top up + Biaya Layanan',
    },
    'un399aao': {
      'en': 'Payment Due Date',
      'id': 'Tanggal Jatuh Tempo Pembayaran',
    },
    '7ob7723f': {
      'en': 'View More',
      'id': 'Lihat Lebih Detail',
    },
    'qqakxirq': {
      'en': 'Top up Details',
      'id': 'Detail Top up',
    },
    '0slnke4w': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassDetailPage
  {
    'zmp9e2b7': {
      'en': 'Description',
      'id': 'Deskripsi',
    },
    'zdwqgn0n': {
      'en': 'Class Price',
      'id': 'Harga Kelas',
    },
    'ualyeare': {
      'en': 'Pick Online Class Date',
      'id': 'Pilih Tanggal Kelas Online',
    },
    'n6sbkl4r': {
      'en': '',
      'id': '',
    },
    'pkd58zux': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    '3f6m5i1d': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'lcddu0is': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'm563f0jt': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'w5t2ake6': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'jscy8wtp': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'g487tu6o': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    '0t1cecgs': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'wwvsisqt': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'onj4010d': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'sv71mbwo': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'wbv2j704': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    '5fnjmib5': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'wcafb7u9': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    '7ow08mqm': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'uvad352p': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    'b3t11te3': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'j1cgmbv0': {
      'en': 'Pick schedule',
      'id': 'Pilih jadwal',
    },
    'v7ffcmjk': {
      'en': 'Search for an item...',
      'id': 'Cari item...',
    },
    '5s6143nt': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'rx9w6ac7': {
      'en':
          '* Schedule unavailable! Please pick date first and then pick other dates if still unavailable',
      'id':
          '* Jadwal tidak tersedia! Silakan pilih tanggal terlebih dahulu, lalu pilih tanggal lain jika masih tidak tersedia',
    },
    'r0w7c5oz': {
      'en': 'Book Online Class',
      'id': 'Pesan Kelas Online',
    },
    'mcody1yr': {
      'en': 'Online Class Details',
      'id': 'Detail Kelas Online',
    },
    'ks2wyz1l': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassCheckoutPage
  {
    '74bjw6sj': {
      'en': 'Checkout Information',
      'id': 'Informasi Pembayaran',
    },
    '5xktmuqq': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    '6klsw03h': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    '735c0ct2': {
      'en': 'Book Online Class',
      'id': 'Pesan Kelas Online',
    },
    'fsygeawr': {
      'en': 'Online Class Checkout',
      'id': 'Pembayaran Kelas Online',
    },
    '32ukk9cc': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassSchedulePage
  {
    '61wjdzit': {
      'en': 'Online Class Schedule',
      'id': 'Jadwal Kelas Online',
    },
    '1wbo2x8v': {
      'en': 'Unverified',
      'id': 'Belum di verifikasi',
    },
    '9ujywni2': {
      'en': 'with Bidan Jaga SBCare',
      'id': 'dengan Bidan Jaga SBCare',
    },
    '3wxe83wl': {
      'en': 'Verified',
      'id': 'Terverifikasi',
    },
    'hseu54nx': {
      'en': 'with Bidan Jaga SBCare',
      'id': 'dengan Bidan Jaga SBCare',
    },
    '6s68ag4g': {
      'en': 'On Progress',
      'id': 'Dalam Proses',
    },
    'r87cbsum': {
      'en': 'with Bidan Jaga SBCare',
      'id': 'dengan Bidan Jaga SBCare',
    },
    '5em26b5z': {
      'en': 'Done',
      'id': 'Selesai',
    },
    'j8g4y4fc': {
      'en': 'with Bidan Jaga SBCare',
      'id': 'dengan Bidan Jaga SBCare',
    },
    'ep8nvwdg': {
      'en': 'All',
      'id': 'Semua',
    },
    'ehjuuvb2': {
      'en': 'with Bidan Jaga SBCare',
      'id': 'dengan Bidan Jaga SBCare',
    },
    'pppkdef9': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassSuccessBookScreen
  {
    'nhaz0oki': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    '316ioc4o': {
      'en': 'Thank you for booking SBCare Online Class',
      'id': 'Terima kasih telah memesan Kelas Online SBCare',
    },
    '033bicca': {
      'en': 'View Online Class Schedule',
      'id': 'Lihat Jadwal Kelas Online',
    },
    'sqxh2sfp': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'xdjy5ed5': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassScheduleDetailPage
  {
    '5ryohzjs': {
      'en': 'Mitra Information',
      'id': 'Informasi Mitra',
    },
    'wnegkzub': {
      'en': 'SBCare standby Midwife',
      'id': 'Bidan Jaga SBCare',
    },
    'v18zhyv2': {
      'en': 'sbcare.bidanjaga@gmail.com',
      'id': 'sbcare.bidanjaga@gmail.com',
    },
    'brsz0sh4': {
      'en': 'Class Date & Time',
      'id': 'Tanggal & Waktu Kelas',
    },
    'wrkk9nh0': {
      'en': 'Class Title',
      'id': 'Judul Kelas',
    },
    'uuqc1a4c': {
      'en': 'Class Info',
      'id': 'Info Kelas',
    },
    '8i10sx4b': {
      'en': 'Class Price',
      'id': 'Harga Kelas',
    },
    'hra10vyx': {
      'en': 'Class Status',
      'id': 'Status Kelas',
    },
    '4mfplq3n': {
      'en': 'UNVERIFIED',
      'id': 'BELUM DI VERIFIKASI',
    },
    'ij0uo4or': {
      'en': 'VERIFIED',
      'id': 'TERVERIFIKASI',
    },
    'ssged5sf': {
      'en': 'ON PROGRESS',
      'id': 'DALAM PROSES',
    },
    'hbsoxdob': {
      'en': 'DONE',
      'id': 'SELESAI',
    },
    'zsedezbv': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'q2x0rxyt': {
      'en': 'Class Link',
      'id': 'Tautan Kelas',
    },
    'r5888t5m': {
      'en': 'View Invoice',
      'id': 'Lihat Faktur',
    },
    '4f7n7mo5': {
      'en': 'Online Class Schedule Details',
      'id': 'Rincian Jadwal Kelas Online',
    },
    '12522uz4': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // AppointmentMitraInvoicePage
  {
    '5kopxptu': {
      'en': '( 1x Module Package )',
      'id': '( 1x Paket Modul )',
    },
    'rdg8zrg4': {
      'en': 'Class Service Fee',
      'id': 'Biaya Layanan Kelas',
    },
    'q1bhv9ok': {
      'en': 'Total Income',
      'id': 'Jumlah Pembayaran',
    },
    'hemncxxg': {
      'en': '',
      'id': '',
    },
    'fpet6mt2': {
      'en': 'View Appointment Schedule',
      'id': 'Lihat Jadwal Janji Temu',
    },
    'rrkkntm8': {
      'en': 'Appointment Invoice',
      'id': 'Faktur Janji Temu',
    },
    'i05gfts8': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassInvoicePage
  {
    'pyqpt3bp': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'kxaqx7uy': {
      'en': 'Total Payment',
      'id': 'Jumlah Pembayaran',
    },
    'j2t688nv': {
      'en': 'View Online Class Schedule',
      'id': 'Lihat Jadwal Kelas Online',
    },
    'q92qp7kk': {
      'en': 'Online Class Invoice',
      'id': 'Faktur Kelas Online',
    },
    'bwnvqr44': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // PracticeModuleContentAltPage
  {
    'awlp078r': {
      'en': 'View Module',
      'id': 'Lihat Modul',
    },
    'k3nudksz': {
      'en': 'Practice Module Content',
      'id': 'Konten Modul Praktik',
    },
    '4u56nsck': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBCareLicenceInvoicePage
  {
    'd7q1kzl8': {
      'en': '( 1 year Licence )',
      'id': '( Lisensi 1 tahun )',
    },
    't3fayv9o': {
      'en': 'Total Payment',
      'id': 'Jumlah Pembayaran',
    },
    'blv0ob5i': {
      'en': '',
      'id': '',
    },
    '1peiosbg': {
      'en': 'View My Licence',
      'id': 'Lihat Lisensi Saya',
    },
    'gi2678k6': {
      'en': 'SBCare Licence Invoice',
      'id': 'Faktur Lisensi SBCare',
    },
    't5s48css': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // LicenceVerificationCodePage
  {
    'r9ty8bta': {
      'en':
          'Give below verification code to Admin SBCare in order to verify your SBCare Licence.',
      'id':
          'Berikan kode verifikasi di bawah ini kepada Admin SBCare untuk memverifikasi Lisensi SBCare Anda.',
    },
    'p55nqoxs': {
      'en': 'Chat Admin on WhatsApp',
      'id': 'Hubungi Admin di WhatsApp?',
    },
    'lm11akgi': {
      'en': 'Licence Verification Code',
      'id': 'Kode Verifikasi Lisensi',
    },
    'juoi6wmz': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyELearningRenewalPage
  {
    'astpxphl': {
      'en': 'Renewal Information',
      'id': 'Informasi Perpanjangan',
    },
    '2mzownb5': {
      'en': '( 30 days active period )',
      'id': '( Periode aktif 30 hari )',
    },
    'fuk8hnaj': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'fycdkeu9': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'k3i30nyh': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    '4dt8j0k0': {
      'en': '',
      'id': '',
    },
    '5hti362t': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    '50x4y7sr': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'j51ayikf': {
      'en': 'Renew E-Learning',
      'id': 'Perpanjang E-Learning',
    },
    'j3za5i8n': {
      'en': 'My E-Learning Renewal',
      'id': 'Perpanjangan E-Learning Saya',
    },
    '17ehuaeg': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyELearningSuccessRenewalScreen
  {
    'fi7yid4x': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    '8u9hwt88': {
      'en': 'Thank you for renewing your E-Learning',
      'id': 'Terima kasih telah memperpanjang \nE-Learning Anda',
    },
    'hma5n626': {
      'en': 'View E-Learning',
      'id': 'Lihat E-Learning',
    },
    'hkpt4ggs': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'ii8jh6q8': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // LanguageSelectorPage
  {
    'o6u5yoob': {
      'en': 'Select Language',
      'id': 'Pilih Bahasa',
    },
    '6fmeiqwg': {
      'en': 'Choose your preferred language for the app interface',
      'id': 'Pilih bahasa pilihan Anda untuk antarmuka aplikasi',
    },
    '0r7oge7q': {
      'en': 'English',
      'id': 'English',
    },
    'q5qhyi8t': {
      'en': 'English (US)',
      'id': 'English (US)',
    },
    '2e4t9pt5': {
      'en': 'Bahasa Indonesia',
      'id': 'Bahasa Indonesia',
    },
    'e1obgykq': {
      'en': 'Indonesian (ID)',
      'id': 'Indonesian (ID)',
    },
    'u6tset8k': {
      'en': 'Language Setting',
      'id': 'Pengaturan Bahasa',
    },
    '0m44ucuu': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // IncomeHistoryPage
  {
    'g2srkyjh': {
      'en': 'Total Income',
      'id': 'Jumlah Pendapatan',
    },
    '2iz9i3vw': {
      'en': 'Total Transactions',
      'id': 'Jumlah Transaksi',
    },
    '7tnn9pw9': {
      'en': 'Recent Income',
      'id': 'Pendapatan Terkini',
    },
    'lgn2kpys': {
      'en': 'Income Breakdown',
      'id': 'Rincian Pendapatan',
    },
    'z5j2mb5y': {
      'en': 'Appointment',
      'id': 'Janji Temu',
    },
    'iafv78nm': {
      'en': 'E-Learning',
      'id': 'E-Learning',
    },
    'bg959oh9': {
      'en': 'Online Class',
      'id': 'Kelas Online',
    },
    'r7gp0cpk': {
      'en': 'Income History',
      'id': '',
    },
  },
  // ELearningSuccessRedeemScreen
  {
    'xypg3gfj': {
      'en': 'Code redeemed successfully!',
      'id': 'Penukaran kode berhasil!',
    },
    'o717u5jh': {
      'en': 'View E-Learning',
      'id': 'Lihat E-Learning',
    },
    'hf5tayzg': {
      'en': 'Back',
      'id': 'Kembali',
    },
    '0oom8ysu': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ELearningVoucherGeneratePage
  {
    '3lauj5it': {
      'en': 'Generate Voucher Code for Client',
      'id': 'Buat Kode Voucher E-Learning untuk Klien',
    },
    'v9olzdz6': {
      'en': 'Select E-learning module',
      'id': 'Pilih modul E-learning',
    },
    'v0qs2ui8': {
      'en': 'Search module',
      'id': 'Cari modul',
    },
    'tqff25er': {
      'en': '',
      'id': 'Opsi 1',
    },
    'it1g5gwz': {
      'en': 'Quantity',
      'id': 'Jumlah',
    },
    'qy3xy0s7': {
      'en': '1',
      'id': '',
    },
    '1jp1tn37': {
      'en': 'Notes',
      'id': 'Catatan',
    },
    'agumi6rw': {
      'en': 'Create Voucher',
      'id': 'Buat Voucher',
    },
    '20b4xfmb': {
      'en': 'E-Learning Voucher',
      'id': 'Voucher E-Learning',
    },
    'dx4jlxcy': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // VoucherHistoryPage
  {
    'wdlssgji': {
      'en': 'Elearning',
      'id': 'Elearning',
    },
    'pkt7rcap': {
      'en': 'ISSUED',
      'id': 'DIKELUARKAN',
    },
    'p9b7s748': {
      'en': 'REDEEMED',
      'id': 'TELAH DITUKAR',
    },
    '2nww7494': {
      'en': 'REVOKED',
      'id': 'DICABUT',
    },
    '9rzpskdz': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARS',
    },
    'y00hpk07': {
      'en': 'Notes :',
      'id': 'Catatan :',
    },
    '79vd8w0h': {
      'en': 'Redeemed by :',
      'id': 'Ditukar oleh :',
    },
    'ztnz9mop': {
      'en': 'Contraction',
      'id': 'Kontraksi',
    },
    'a384z1e8': {
      'en': 'ISSUED',
      'id': 'DIKELUARKAN',
    },
    'ked464dm': {
      'en': 'REDEEMED',
      'id': 'TELAH DITUKAR',
    },
    'kbvc34ew': {
      'en': 'REVOKED',
      'id': 'DICABUT',
    },
    'f49iq16z': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARS',
    },
    'yppcju7v': {
      'en': 'Notes :',
      'id': 'Catatan :',
    },
    '61wwnn4e': {
      'en': 'Redeemed by :',
      'id': 'Ditukar oleh :',
    },
    've7fs7y6': {
      'en': 'Program',
      'id': 'Program',
    },
    'a6fx12ub': {
      'en': 'ISSUED',
      'id': 'DIKELUARKAN',
    },
    'qpfija0u': {
      'en': 'REDEEMED',
      'id': 'TELAH DITUKAR',
    },
    'ybskx8et': {
      'en': 'REVOKED',
      'id': 'DICABUT',
    },
    'if1012kb': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARS',
    },
    'vihlfjmz': {
      'en': 'Notes :',
      'id': 'Catatan :',
    },
    'y44z4qqa': {
      'en': 'Redeemed by :',
      'id': 'Ditukar oleh :',
    },
    'qeky33ne': {
      'en': 'SBPay',
      'id': 'SBPay',
    },
    '6r8f5t8t': {
      'en': 'SBPay Voucher',
      'id': 'SBPay Voucher',
    },
    'wv8ulvzq': {
      'en': 'ISSUED',
      'id': 'DIKELUARKAN',
    },
    '6tvz5v4e': {
      'en': 'REDEEMED',
      'id': 'TELAH DITUKAR',
    },
    'slrqgeqe': {
      'en': 'REVOKED',
      'id': 'DICABUT',
    },
    'gscvvhr0': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARS',
    },
    'js9r9mos': {
      'en': 'Notes :',
      'id': 'Catatan :',
    },
    'ch97w6bg': {
      'en': 'Redeemed by :',
      'id': 'Ditukar oleh :',
    },
    'm4iczw32': {
      'en': 'All',
      'id': 'Semua',
    },
    'mfzi06iz': {
      'en': 'SBPay Voucher',
      'id': 'SBPay Voucher',
    },
    'h5qx4nvo': {
      'en': 'ISSUED',
      'id': 'DIKELUARKAN',
    },
    'dbh5a86y': {
      'en': 'REDEEMED',
      'id': 'TELAH DITUKAR',
    },
    'tq74k2ke': {
      'en': 'REVOKED',
      'id': 'DICABUT',
    },
    'h6ab4mbh': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARS',
    },
    'z4gnqmhh': {
      'en': 'Notes :',
      'id': 'Catatan :',
    },
    'ju75fq30': {
      'en': 'Redeemed by :',
      'id': 'Ditukar oleh :',
    },
    '629iltw5': {
      'en': 'Voucher History',
      'id': 'Riwayat Voucher',
    },
    'q3cqa44d': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassSubmenuScreen
  {
    'ygqzxfmx': {
      'en': 'Services',
      'id': 'Layanan',
    },
    '6pkxeuzu': {
      'en': 'Schedule',
      'id': 'Jadwal',
    },
    '6ep9ssjn': {
      'en': 'Online Class',
      'id': 'Kelas Online',
    },
    'uoiaqn6x': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ModuleNavbar
  {
    'm537n1hm': {
      'en': 'E-Learning',
      'id': 'E-Learning',
    },
    'xeon691k': {
      'en': '',
      'id': '',
    },
    'w6ef39v4': {
      'en': 'Input E-Learning title',
      'id': '',
    },
    'zjne3f7q': {
      'en': 'PRICE     : ',
      'id': '',
    },
    'spj4nll7': {
      'en': 'Rp ',
      'id': '',
    },
    'jo4ujsxm': {
      'en': 'EXP         : ',
      'id': '',
    },
    'au32ao91': {
      'en': 'Rp ',
      'id': '',
    },
    'mirpi1md': {
      'en': 'STATUS  : ',
      'id': '',
    },
    'wolyv7r6': {
      'en': 'ACTIVE',
      'id': '',
    },
    '5qfyukzs': {
      'en': 'ACTIVE',
      'id': '',
    },
    '3z9a64hm': {
      'en': 'STATUS : ',
      'id': '',
    },
    'o3z09346': {
      'en': 'EXPIRED',
      'id': '',
    },
    'suvjn7aa': {
      'en': 'ACTIVE',
      'id': '',
    },
    'ctecmbqa': {
      'en': 'View E-Learning',
      'id': '',
    },
    'tjzk13lh': {
      'en': 'Renew E-Learning',
      'id': '',
    },
    '0fv8ytyq': {
      'en': 'Redeem Code',
      'id': '',
    },
    '0nypo0yy': {
      'en': 'PRICE     : ',
      'id': '',
    },
    '4mvb7v06': {
      'en': 'Rp ',
      'id': '',
    },
    'bhmubvex': {
      'en': 'EXP         : ',
      'id': '',
    },
    'yq1egj8x': {
      'en': 'Rp ',
      'id': '',
    },
    'k0qgycnv': {
      'en': 'STATUS  : ',
      'id': '',
    },
    'wgm0tmpe': {
      'en': 'ACTIVE',
      'id': '',
    },
    'k95jtuw0': {
      'en': 'ACTIVE',
      'id': '',
    },
    '3u80jsfi': {
      'en': 'STATUS : ',
      'id': '',
    },
    'avqvxw1h': {
      'en': 'EXPIRED',
      'id': '',
    },
    '5a74eegz': {
      'en': 'ACTIVE',
      'id': '',
    },
    '2h4q4zyr': {
      'en': 'View E-Learning',
      'id': '',
    },
    'xm3r0fw6': {
      'en': 'Renew E-Learning',
      'id': '',
    },
    'orwdojrq': {
      'en': 'Redeem Code',
      'id': '',
    },
    '9ds3y469': {
      'en': 'Program',
      'id': 'Program',
    },
    'dtcyjyjw': {
      'en': '',
      'id': '',
    },
    'rjm4n36t': {
      'en': 'Input Program title',
      'id': 'Masukkan judul Program',
    },
    'h6aedgcp': {
      'en': 'PRICE     : ',
      'id': 'HARGA   : ',
    },
    'ys9jyexv': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'bblvmdow': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    '99lwp2yo': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'lcon0bq4': {
      'en': 'STATUS  : ',
      'id': 'STATUS  : ',
    },
    'ppiilj5q': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'abges2mg': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'ruygqxzy': {
      'en': 'STATUS : ',
      'id': 'STATUS  : ',
    },
    '9sy8s93f': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    '7p3c89lo': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'o7thqgju': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'nexkmrcl': {
      'en': 'Renew Program',
      'id': 'Perpanjang Program',
    },
    'm14wq2os': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    '61ub8h4p': {
      'en': 'PRICE     : ',
      'id': 'HARGA   : ',
    },
    'zibuyhei': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'knvkgrpc': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    'bjk5tsbq': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    '6a93fa12': {
      'en': 'STATUS  : ',
      'id': 'STATUS  : ',
    },
    'o5s7rlwd': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'icxd910a': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    '3l59roy0': {
      'en': 'STATUS : ',
      'id': 'STATUS  : ',
    },
    '1dn0yqmz': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'dasbs7c8': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'gda47ux3': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'ntyp4wpg': {
      'en': 'Renew Program',
      'id': 'Perpanjang Program',
    },
    'yehz4b5b': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'gshh06m1': {
      'en': 'Contraction',
      'id': 'Kontraksi',
    },
    'n8qmc2ie': {
      'en': 'View Full Description',
      'id': 'Lihat Deskripsi Lengkap',
    },
    'e29ktvla': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    'm5us79de': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'ml8rd3cw': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    'dvuwisjr': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'l6xsy8el': {
      'en': '',
      'id': '',
    },
    'gjuix6wv': {
      'en': 'STATUS   : ',
      'id': 'STATUS  : ',
    },
    'ks827q7g': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'iuf1i1ej': {
      'en': '',
      'id': '',
    },
    'hpi8w254': {
      'en': 'View Contraction Pro',
      'id': 'Lihat Kontraksi Pro',
    },
    'uhum28ps': {
      'en': 'Renew Contraction Pro',
      'id': 'Perpanjang Contraction Pro',
    },
    'd4u8leki': {
      'en': 'My Module',
      'id': 'Modul Saya',
    },
    'iqtnkuo3': {
      'en': 'Module',
      'id': 'Modul',
    },
  },
  // EbookListPage
  {
    'q1ysvsag': {
      'en': '',
      'id': '',
    },
    'dbzi352d': {
      'en': 'Input Program title',
      'id': 'Masukkan judul Program',
    },
    'po6lr8c3': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'dvihbaz1': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'nl0apng5': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    'xdp2sgpq': {
      'en': '',
      'id': '',
    },
    'ffmlniuf': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    'ew2e9jrk': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'nk21c1sm': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'mgk5yp04': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'doho7f2z': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '0bv2q53o': {
      'en': '',
      'id': '',
    },
    'r331474h': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    'twlyp5u1': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'qk9n5tbn': {
      'en': 'Program Store',
      'id': 'Program Store',
    },
    '076lejhi': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // PregnancyBMICalculatorPage
  {
    'qrdvq9xy': {
      'en': 'Track your Pregnancy Progress',
      'id': 'Lihat proses kehamilan Anda',
    },
    '38kbcszu': {
      'en': 'Pregnancy age',
      'id': 'Usia kehamilan',
    },
    'ozx2ult8': {
      'en': 'Search...',
      'id': 'Mencari...',
    },
    '7si5kim3': {
      'en': '08 - 09',
      'id': '08 - 09',
    },
    'ad7lf7xo': {
      'en': '09 - 10',
      'id': '09 - 10',
    },
    'phpiigda': {
      'en': '10 - 11',
      'id': '10 - 11',
    },
    'mrp5mz38': {
      'en': '11 - 12',
      'id': '11 - 12',
    },
    'um58k4x2': {
      'en': '12 - 13',
      'id': '12 - 13',
    },
    'lhkzyet6': {
      'en': '13 - 14',
      'id': '13 - 14',
    },
    'tji405lw': {
      'en': '14 - 15',
      'id': '14 - 15',
    },
    'p916ml70': {
      'en': '15 - 16',
      'id': '15 - 16',
    },
    'uxm93s0h': {
      'en': '16 - 17',
      'id': '16 - 17',
    },
    'm12j18a2': {
      'en': '17 - 18',
      'id': '17 - 18',
    },
    '2b4ik9as': {
      'en': '18 - 19',
      'id': '18 - 19',
    },
    '9iyo2rok': {
      'en': '19 - 20',
      'id': '19 - 20',
    },
    'pj641mbv': {
      'en': '20 - 21',
      'id': '20 - 21',
    },
    'axgas0je': {
      'en': '22 - 23',
      'id': '22 - 23',
    },
    'slj14tr2': {
      'en': '23 - 24',
      'id': '23 - 24',
    },
    '3orvsaoy': {
      'en': '24 - 25',
      'id': '24 - 25',
    },
    'bkyxvmdp': {
      'en': '25 - 26',
      'id': '25 - 26',
    },
    'uudj8xhj': {
      'en': '26 - 27',
      'id': '26 - 27',
    },
    'ulxvw1so': {
      'en': '27 - 28',
      'id': '27 - 28',
    },
    'k7yakx43': {
      'en': '28 - 29',
      'id': '28 - 29',
    },
    'jdqmte9f': {
      'en': '29 - 30',
      'id': '29 - 30',
    },
    '39kgfisx': {
      'en': '30 - 31',
      'id': '30 - 31',
    },
    '1n2qjrm9': {
      'en': '31 - 32',
      'id': '31 - 32',
    },
    'w5yjt29q': {
      'en': '32 - 33',
      'id': '32 - 33',
    },
    '534lqhao': {
      'en': '33 - 34',
      'id': '33 - 34',
    },
    '6fingfhq': {
      'en': '34 - 35',
      'id': '34 - 35',
    },
    'jomo17by': {
      'en': '35 - 36',
      'id': '35 - 36',
    },
    'ycjxyw4h': {
      'en': '36 - 37',
      'id': '36 - 37',
    },
    '1cxooobx': {
      'en': '37 - 38',
      'id': '37 - 38',
    },
    'vgnk6eap': {
      'en': '38 - 39',
      'id': '38 - 39',
    },
    'vcj75dya': {
      'en': '39 - 40',
      'id': '39 - 40',
    },
    'by38mt98': {
      'en': '40 - 41',
      'id': '40 - 41',
    },
    'x9u7ff0a': {
      'en': '41 - 42',
      'id': '41 - 42',
    },
    'mvuurhei': {
      'en': 'Weight Before Pregnancy (Kg)',
      'id': 'Berat Badan Sebelum Hamil (Kg)',
    },
    'dybnud9j': {
      'en': 'Weight Before Pregnancy (Kg)',
      'id': 'Berat Badan Sebelum Hamil (Kg)',
    },
    'tkmtgekr': {
      'en': 'Current Weight (Kg)',
      'id': 'Berat Badan Saat Ini (Kg)',
    },
    'wg42e96p': {
      'en': 'Current Weight (Kg)',
      'id': 'Berat Badan Saat Ini (Kg)',
    },
    '2fcjrqru': {
      'en': 'Calculate Ideal Weight',
      'id': 'Hitung Berat Badan Ideal',
    },
    '23v88542': {
      'en': 'Result',
      'id': 'Hasil',
    },
    '6qvhw3l1': {
      'en': 'Weight Status',
      'id': 'Status Berat Badan',
    },
    't2kqfzpx': {
      'en': 'Average Fetal Weight (gr)',
      'id': 'Berat Janin Rata-rata (gr)',
    },
    'n4l032y6': {
      'en': 'Average Fetal Height (cm)',
      'id': 'Tinggi Janin Rata-rata (cm)',
    },
    '4u2x8gua': {
      'en': 'Average Weight Gain for Pregnant Mom (kg)',
      'id': 'Rata-rata Kenaikan Berat Badan Bumil (kg)',
    },
    '4i3smky6': {
      'en': 'Ideal Weight for Pregnant Mom (kg)',
      'id': 'Berat Badan Ideal Bumil (kg)',
    },
    '57336i4n': {
      'en': 'Pregnancy BMI Calculator',
      'id': 'Kalkulator BMI Kehamilan',
    },
  },
  // EbookDetailPage
  {
    '9ealf4gn': {
      'en': 'Program Details',
      'id': 'Rincian Program',
    },
    '0u6gowj3': {
      'en': 'Program Content',
      'id': 'Konten Program',
    },
    'lifku2dl': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    'opcnmvlm': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // EbookCheckoutPage
  {
    'tsdoj6a4': {
      'en': 'Checkout Information',
      'id': 'Informasi Pembayaran',
    },
    'itkpzrwf': {
      'en': '( 30 days active period )',
      'id': '( 30 hari masa aktif )',
    },
    '9bn81oh0': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    't0px6rxt': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'bqdt4kwn': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    '4pqe9jl8': {
      'en': '',
      'id': '',
    },
    'ocxj0vnh': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    '49dk44xt': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'iknibi7z': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    'uxgbml67': {
      'en': 'Program Checkout',
      'id': 'Pembayaran Program',
    },
    'ximnbb25': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // EbookSuccessPurchaseScreen
  {
    '6hk4skm2': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    'x1u2f7q4': {
      'en': 'Thank you for purchasing a Program',
      'id': 'Terima kasih telah membeli Program',
    },
    'b6qq0iar': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'nxoyqe8m': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'hob8prck': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ThemeSelectorPage
  {
    'oouihjuj': {
      'en': 'Select Theme',
      'id': 'Pilih Tema',
    },
    '0uk9ie5s': {
      'en': 'Choose your preferred theme for the app interface',
      'id': 'Pilih tema pilihan Anda untuk antarmuka aplikasi',
    },
    '3olg78gz': {
      'en': 'Light',
      'id': 'Terang',
    },
    '8xj5nmo8': {
      'en': 'Light Theme',
      'id': 'Tema Terang',
    },
    '5nszy5vd': {
      'en': 'Dark',
      'id': 'Gelap',
    },
    'ui4x21er': {
      'en': 'Dark Theme',
      'id': 'Tema Gelap',
    },
    '1z8or28f': {
      'en': 'Theme Setting',
      'id': 'Pengaturan Tema',
    },
    'e8hbsegs': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ViewAllPage
  {
    'kc670sx1': {
      'en': 'Appointment\nSchedule',
      'id': 'Jadwal\nJanji Temu',
    },
    '3fw8p3e6': {
      'en': 'Provider\nServices',
      'id': 'Layanan\nMitra',
    },
    '5ac5dgpz': {
      'en': 'E-Learning\nStore',
      'id': 'E-Learning\nStore',
    },
    's43tl2m7': {
      'en': 'Program\nStore',
      'id': 'Program\nStore',
    },
    'eup47wvv': {
      'en': 'Online Class\nService',
      'id': 'Layanan\nKelas Online',
    },
    'myc8ypik': {
      'en': 'Online Class\nSchedule',
      'id': 'Jadwal \nKelas Online',
    },
    'i1o9nmzp': {
      'en': 'SBCare\nLicence',
      'id': 'Lisensi\nSBCare',
    },
    'ovr5g9rv': {
      'en': 'Transaction\nHistory',
      'id': 'Riwayat\nTransaksi',
    },
    '15lxn6uk': {
      'en': 'My \nE-Learning\n',
      'id': 'E-Learning \nSaya\n',
    },
    '3psie427': {
      'en': 'My \nProgram\n',
      'id': 'Program \nSaya\n',
    },
    '1vb9xfku': {
      'en': 'Contraction\nTimer\n',
      'id': 'Waktu\nKontraksi\n',
    },
    'dxwwa6d2': {
      'en': 'Pregnancy \nBMI \nCalculator',
      'id': 'Kalkulator\nBMI\nKehamilan',
    },
    '6a4hw19k': {
      'en': 'Contraction\nTimer Pro',
      'id': 'Waktu\nKontraksi\nPro',
    },
    'c6y520ww': {
      'en': 'Provider\nList',
      'id': 'List\nMitra',
    },
    '4s9nfbjw': {
      'en': 'Explore SBCare',
      'id': 'Jelajah SBCare',
    },
    '79d1bbfz': {
      'en': 'Provider',
      'id': 'Mitra',
    },
  },
  // MyEbookContentPage
  {
    '1mg4u08v': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'ipd5ai0m': {
      'en': 'My Program Content',
      'id': 'Konten Program Saya',
    },
    'on67i0ye': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyEbookRenewalPage
  {
    'w1balxpv': {
      'en': 'Renewal Information',
      'id': 'Informasi Perpanjangan',
    },
    'q4ql37di': {
      'en': '( 30 days active period )',
      'id': '( Periode aktif 30 hari )',
    },
    'x8y3amjy': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'xtmm7pbd': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'jafqc1ct': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    '77huna8w': {
      'en': '',
      'id': '',
    },
    'ncbg84c0': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'vkjkawbh': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'nlq61zy0': {
      'en': 'Renew Program',
      'id': 'Perpanjang Program',
    },
    '6sy5m1qb': {
      'en': 'Program Renewal',
      'id': 'Perpanjangan Program',
    },
    'nvrg9bxh': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyEbookSuccessRenewalScreen
  {
    'p5jewm6r': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    '1y2z3vt0': {
      'en': 'Thank you for renewing your Program',
      'id': 'Terima kasih telah memperpanjang \nProgram Anda',
    },
    'j3ciowjn': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    '0vnpdtou': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'x6splcsl': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyEbookListPage
  {
    'odpjxhql': {
      'en': '',
      'id': '',
    },
    'xxxfosmb': {
      'en': 'Input Program title',
      'id': 'Masukkan judul Program',
    },
    '1a17j5lx': {
      'en': 'PRICE     : ',
      'id': 'HARGA   : ',
    },
    'zts5dekt': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    '46tibv7e': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    '8hdncd64': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'wkjzol4x': {
      'en': 'STATUS  : ',
      'id': 'STATUS  : ',
    },
    '01mnq2d9': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    '7d6ivd4w': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'dadmswso': {
      'en': 'STATUS : ',
      'id': 'STATUS  : ',
    },
    '2g5s7r87': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'ilhu2cmf': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'um3rnbtw': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'vaf09y1b': {
      'en': 'Renew Ebook',
      'id': 'Perpanjang Ebook',
    },
    'b78g9sid': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'mz946phv': {
      'en': 'PRICE     : ',
      'id': 'HARGA   : ',
    },
    '4ibu5k2k': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'j4o1hf6l': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    'iru50lr3': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'jq8tayg4': {
      'en': 'STATUS  : ',
      'id': 'STATUS  : ',
    },
    'sco24kik': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'ahpg7stu': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    'wwgaauwb': {
      'en': 'STATUS : ',
      'id': 'STATUS  : ',
    },
    'vidcfx4a': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'imzdo79t': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    '1s3f3ok5': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'os8hhdky': {
      'en': 'Renew Ebook',
      'id': 'Perpanjang Ebook',
    },
    'tiixom10': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'gll88i4r': {
      'en': 'My Program',
      'id': 'Program Saya',
    },
    'hzwfkt9g': {
      'en': 'Modules',
      'id': 'Modul',
    },
  },
  // SBPaySuccessRedeemScreen
  {
    'zlp4zzqo': {
      'en': 'Code redeemed successfully!',
      'id': 'Penukaran kode berhasil!',
    },
    'rhi7dzbs': {
      'en': 'View Top-up',
      'id': 'Lihat Top-up',
    },
    'vk6ecw4m': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'b2y1r3s2': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBPayVoucherGeneratePage
  {
    'y3ngi83i': {
      'en': 'Generate Voucher Code for Client',
      'id': 'Buat Kode Voucher E-Learning untuk Klien',
    },
    'yvn5c8ne': {
      'en': 'SBPay Amount',
      'id': 'Jumlah SBPay',
    },
    'n7rz5n5k': {
      'en': 'Rp',
      'id': '',
    },
    's1heu50u': {
      'en': 'Quantity',
      'id': 'Jumlah',
    },
    'l4epq3mv': {
      'en': '1',
      'id': '',
    },
    '795otnaz': {
      'en': 'Notes',
      'id': 'Catatan',
    },
    '6g7ajqd7': {
      'en': 'Create Voucher',
      'id': 'Buat Voucher',
    },
    '9ypq36g6': {
      'en': 'SBPay Voucher',
      'id': 'Voucher SBPay',
    },
    'ipobti6z': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // SBPayRedeemCodePage
  {
    '9evz95xj': {
      'en': 'Enter your code below to redeem your reward',
      'id': 'Masukkan kode Anda di bawah ini untuk menukar hadiah Anda',
    },
    'vqp1h9ow': {
      'en': 'Enter redemption code',
      'id': 'Masukkan kode penukaran',
    },
    'o9btwd4v': {
      'en': 'Redeem',
      'id': 'Tukar',
    },
    'flkwvv7l': {
      'en': 'Need help? ',
      'id': 'Butuh bantuan?',
    },
    'n1fry2h4': {
      'en': 'Contact SBCare Admin',
      'id': 'Hubungi Admin SBCare',
    },
    'hzd6o3kt': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
  },
  // ELearningRedeemCodePage
  {
    'nzuw1jrg': {
      'en': 'Enter your code below to redeem your \ne-learning',
      'id': 'Masukkan kode Anda di bawah ini untuk menukar e-learning Anda',
    },
    'h7q59r6x': {
      'en': 'Enter redemption code',
      'id': 'Masukkan kode penukaran',
    },
    'qmwa8m3n': {
      'en': 'Redeem',
      'id': 'Tukar',
    },
    'wxc4lda0': {
      'en': 'Need help? ',
      'id': 'Butuh bantuan?',
    },
    '06fkpctp': {
      'en': 'Contact SBCare Admin',
      'id': 'Hubungi Admin SBCare',
    },
    'c0z8jcxq': {
      'en': 'E-Learning Redeem Code',
      'id': 'Tukar Kode E-Learning',
    },
  },
  // EBookVoucherGeneratePage
  {
    'cg8tcunp': {
      'en': 'Generate Voucher Code for Client',
      'id': 'Buat Kode Voucher E-Learning untuk Klien',
    },
    'x3okgosm': {
      'en': 'Select Program',
      'id': 'Pilih Program',
    },
    'kodcss3a': {
      'en': 'Search program',
      'id': 'Cari program',
    },
    'f9ked8ku': {
      'en': '',
      'id': 'Opsi 1',
    },
    'zcqry5zh': {
      'en': 'Quantity',
      'id': 'Jumlah',
    },
    '292wqdie': {
      'en': '1',
      'id': '',
    },
    'cun2khv9': {
      'en': 'Notes',
      'id': 'Catatan',
    },
    'c86rgk9a': {
      'en': 'Create Voucher',
      'id': 'Buat Voucher',
    },
    'iu9mzzpb': {
      'en': 'Program Voucher',
      'id': 'Voucher Program',
    },
    '20zwao91': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // EbookRedeemCodePage
  {
    'uwvzlqf4': {
      'en': 'Enter your code below to redeem your Program',
      'id': 'Masukkan kode Anda di bawah ini untuk menukar Program Anda',
    },
    'n8wb6l6r': {
      'en': 'Enter redemption code',
      'id': 'Masukkan kode penukaran',
    },
    'gebowe87': {
      'en': 'Redeem',
      'id': 'Tukar',
    },
    '33qrw45j': {
      'en': 'Need help? ',
      'id': 'Butuh bantuan?',
    },
    'sf9qzjsu': {
      'en': 'Contact SBCare Admin',
      'id': 'Hubungi Admin SBCare',
    },
    'lon1pm67': {
      'en': 'Program Redeem Code',
      'id': 'Tukar Kode Program',
    },
  },
  // EbookSuccessRedeemScreen
  {
    '38vrsr4z': {
      'en': 'Code redeemed successfully!',
      'id': 'Penukaran kode berhasil!',
    },
    '4hlrg9dn': {
      'en': 'View Program',
      'id': 'Lihat Program',
    },
    'f1fggyqd': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'tn60ozxw': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // NotificationDraftPage
  {
    '2pezyu8d': {
      'en': 'Notification',
      'id': 'Notifikasi',
    },
    'jy3f3h6x': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // PdfDraftPage
  {
    '5f631vu8': {
      'en': 'PDF Draft',
      'id': 'Tukar Kode',
    },
    'k5kk6r4e': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // MyContractionTimerProDetailsPage
  {
    'yixxpduf': {
      'en': 'Start',
      'id': 'Mulai',
    },
    '06xytuud': {
      'en': 'Stop',
      'id': 'Berhenti',
    },
    't2gscrqh': {
      'en': 'Reset',
      'id': 'Ulang',
    },
    '4v1xln4e': {
      'en': 'Total Contraction',
      'id': 'Jumlah Kontraksi',
    },
    'gfh0a3ak': {
      'en': 'Average Duration',
      'id': 'Rata-Rata Durasi',
    },
    'gtrh97cd': {
      'en': 'Average Interval',
      'id': 'Interval Rata-Rata',
    },
    'cqm06xoh': {
      'en': 'Contraction Per Hour',
      'id': 'Kontraksi Tiap Jam',
    },
    't4z85szo': {
      'en': 'Duration',
      'id': 'Durasi',
    },
    'femv1t17': {
      'en': 'Start',
      'id': 'Mulai',
    },
    'q3omr4va': {
      'en': 'End',
      'id': 'Berakhir',
    },
    '3bl3pv5x': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ContractionTimerProListPage
  {
    'cjyrgo49': {
      'en': 'View Full Description',
      'id': 'Lihat Deskripsi Lengkap',
    },
    'vrm56bi9': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'pf36sneu': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'nb0qveni': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '98qhtgte': {
      'en': '',
      'id': '',
    },
    '93gtmqe1': {
      'en': 'Purchase Contraction Pro',
      'id': 'Beli Kontraksi Pro',
    },
    'voqw1lor': {
      'en': 'Redeem Code',
      'id': 'Tukar Kode',
    },
    'em4d6ijz': {
      'en': 'Contraction Timer Pro',
      'id': 'Waktu Kontraksi Pro',
    },
    'tj1pvxwl': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ContractionTimerProCheckoutPage
  {
    'h4m21k72': {
      'en': 'Checkout Information',
      'id': 'Informasi Pembayaran',
    },
    's2o7kchi': {
      'en': ' active period',
      'id': '',
    },
    't12rsull': {
      'en': '( 30 days active period )',
      'id': '( 30 hari masa aktif )',
    },
    'tfpn4iz0': {
      'en': 'SBCare Fee',
      'id': 'Biaya SBCare',
    },
    'gyjvmd7h': {
      'en': 'App Fee',
      'id': 'Biaya Aplikasi',
    },
    'ee00ild7': {
      'en': 'Total Price',
      'id': 'Jumlah Harga',
    },
    'ss70ax1t': {
      'en': '',
      'id': '',
    },
    's0wkfavk': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    'r9guyi05': {
      'en': 'Rp 0',
      'id': 'Rp 0',
    },
    '1y8e0uoh': {
      'en': 'Purchase Contraction Pro',
      'id': 'Beli Kontraksi Pro',
    },
    'a640lgub': {
      'en': 'Contraction Pro Checkout',
      'id': 'Pembayaran Kontraksi Pro',
    },
    'e0qtvq4u': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MyContractionTimerProListPage
  {
    'w33qdipq': {
      'en': 'Purchase More',
      'id': 'Beli Kontraksi Pro Lainnya',
    },
    'udrb5shv': {
      'en': 'View Full Description',
      'id': 'Lihat Deskripsi Lengkap',
    },
    '5msffpne': {
      'en': 'EXP         : ',
      'id': 'EXP         : ',
    },
    'b3m2o59e': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'xh7dl97i': {
      'en': 'STATUS : ',
      'id': 'STATUS : ',
    },
    '75i9bo4b': {
      'en': 'ACTIVE',
      'id': 'AKTIF',
    },
    '37usfs02': {
      'en': '',
      'id': '',
    },
    'u95udbqm': {
      'en': 'STATUS   : ',
      'id': 'STATUS  : ',
    },
    'lvcars2w': {
      'en': 'EXPIRED',
      'id': 'KEDALUWARSA',
    },
    'klte0zdv': {
      'en': '',
      'id': '',
    },
    'retwdbct': {
      'en': 'View Contraction Pro',
      'id': 'Lihat Kontraksi Pro',
    },
    '38rf8tis': {
      'en': 'Renew Contraction Pro',
      'id': 'Perpanjang Contraction Pro',
    },
    'rrefyuwv': {
      'en': 'My Contraction Timer Pro',
      'id': 'Waktu Kontraksi Pro Saya',
    },
    'mn0gb6pw': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ContractionTimerProSuccessPurchaseScreen
  {
    'hn2g8ktv': {
      'en': 'Success!',
      'id': 'Sukses!',
    },
    'h0ylus3v': {
      'en': 'Thank you for purchasing a Contraction Pro',
      'id': 'Terima kasih telah membeli Kontraksi Pro',
    },
    's8lyeb65': {
      'en': 'View Contraction Pro',
      'id': 'Lihat Kontraksi Pro',
    },
    'ruy0tvzx': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'gja8uchm': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ContractionVoucherGeneratePage
  {
    'x5fzftb1': {
      'en': 'Generate Voucher Code for Client',
      'id': 'Buat Kode Voucher E-Learning untuk Klien',
    },
    '2ildwrh2': {
      'en': 'Select Contraction Pro',
      'id': 'Pilih Kontraksi Pro',
    },
    'vzxndn6u': {
      'en': 'Search ebook',
      'id': 'Cari ebook',
    },
    '8to7l4zq': {
      'en': '',
      'id': 'Opsi 1',
    },
    'hxnvlaci': {
      'en': 'Quantity',
      'id': 'Jumlah',
    },
    'iymfqcrp': {
      'en': '1',
      'id': '',
    },
    'ahdxu0me': {
      'en': 'Notes',
      'id': 'Catatan',
    },
    'mkbu20ed': {
      'en': 'Create Voucher',
      'id': 'Buat Voucher',
    },
    'edfgcum0': {
      'en': 'Contraction Voucher',
      'id': 'Voucher Kontraksi',
    },
    'daxnybox': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ContractionTimerProRedeemCodePage
  {
    '7w07vvub': {
      'en': 'Enter your code below to redeem your contraction pro',
      'id': 'Masukkan kode Anda di bawah ini untuk menukar kontraksi pro Anda',
    },
    '0l9sueus': {
      'en': 'Enter redemption code',
      'id': 'Masukkan kode penukaran',
    },
    'n6bkgunk': {
      'en': 'Redeem',
      'id': 'Tukar',
    },
    '2hvcvy4x': {
      'en': 'Need help? ',
      'id': 'Butuh bantuan?',
    },
    '8z69a05u': {
      'en': 'Contact SBCare Admin',
      'id': 'Hubungi Admin SBCare',
    },
    'rwnvbfro': {
      'en': 'Contraction Pro Redeem Code',
      'id': 'Tukar Kode Kontraksi Pro',
    },
  },
  // ContractionTimerProSuccessRedeemScreen
  {
    'nlvm8llh': {
      'en': 'Code redeemed successfully!',
      'id': 'Penukaran kode berhasil!',
    },
    'msqthgp7': {
      'en': 'View Contraction Pro',
      'id': 'Lihat Kontraksi Pro',
    },
    'ljtler01': {
      'en': 'Back',
      'id': 'Kembali',
    },
    'zcrmt1ae': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // NotificationSettingPage
  {
    'gbvnwvp2': {
      'en': 'Manage your notification preferences',
      'id': 'Kelola preferensi notifikasi Anda',
    },
    'yby2pogy': {
      'en': 'Email Notifications',
      'id': 'Email Notifikasi',
    },
    '1xko1ojq': {
      'en': 'Weekly Newsletter',
      'id': 'Buletin Mingguan',
    },
    'bqeb2hmn': {
      'en': 'Receive our weekly digest with trending content',
      'id': 'Terima ringkasan mingguan kami dengan konten yang sedang tren',
    },
    '446ptlq5': {
      'en': 'Account Security',
      'id': 'Keamanan Akun',
    },
    'hqq9g44k': {
      'en': 'Important security updates and login alerts',
      'id': 'Pembaruan keamanan penting dan peringatan login',
    },
    '7jjkzpgw': {
      'en': 'Product Updates',
      'id': 'Update Produk',
    },
    '382p91fp': {
      'en': 'New features and app improvements',
      'id': 'Fitur baru dan peningkatan aplikasi',
    },
    '2rybcbe5': {
      'en': 'Marketing & Promotions',
      'id': 'Pemasaran & Promosi',
    },
    'llx7p3bc': {
      'en': 'Special offers and promotional content',
      'id': 'Penawaran khusus dan konten promosi',
    },
    '6hjoon3n': {
      'en': 'Community Updates',
      'id': 'Update Komunitas',
    },
    'p8a79ig3': {
      'en': 'Updates from groups and communities you follow',
      'id': 'Pembaruan dari grup dan komunitas yang Anda ikuti',
    },
    'xsxweaw4': {
      'en': 'Save Changes',
      'id': 'Simpan Perubahan',
    },
    '8apvgeid': {
      'en': 'Notification (Draft)',
      'id': 'Notifikasi (Draf)',
    },
  },
  // HomecareServicesListPage
  {
    'tocm8uxa': {
      'en': 'For Mom',
      'id': 'Untuk Ibu',
    },
    '8p1nokhc': {
      'en': 'Pijat Laktasi Lengkap',
      'id': 'Pijat Laktasi Lengkap',
    },
    '7r6jq1nh': {
      'en': '60 minutes',
      'id': '60 menit',
    },
    'q72k8mdr': {
      'en': 'Rp 100.000',
      'id': 'Rp 100.000',
    },
    'tt89mrd5': {
      'en': 'Details',
      'id': 'Rincian',
    },
    'g0dswwcg': {
      'en': 'For Baby',
      'id': 'Untuk Bayi',
    },
    'rd1omrkz': {
      'en': 'For Family',
      'id': 'Untuk Keluarga',
    },
    'lh8kdbvi': {
      'en': 'Homecare Services',
      'id': 'Layanan Homecare',
    },
    '1dwv6n96': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // VerificationCodeNotificationScreen
  {
    'sfadjx42': {
      'en': 'Check your email',
      'id': 'Cek email Anda',
    },
    '5160b2lf': {
      'en':
          'We\'ve sent a verification code to your email address. Please check your inbox and enter the code to reset your password.',
      'id':
          'Kami telah mengirimkan kode verifikasi ke alamat email Anda. Silakan periksa kotak masuk Anda dan masukkan kode tersebut untuk mengatur ulang kata sandi Anda.',
    },
    'f07hyxe2': {
      'en': 'Didn\'t receive the email? Check your spam folder or',
      'id': 'Tidak menerima email? Periksa folder spam Anda atau',
    },
    '2sd2xoz4': {
      'en': 'Resend verification code',
      'id': 'Kirim ulang kode verifikasi',
    },
    '8z19bg4y': {
      'en': 'Enter Verification Code',
      'id': 'Masukkan Kode Verifikasi',
    },
  },
  // HomePublicPage
  {
    '3fg19t6j': {
      'en': 'Featured Content',
      'id': 'Konten Unggulan',
    },
    '2jv33vsh': {
      'en': 'Provider\nList',
      'id': 'List\nMitra',
    },
    'glt0zlnr': {
      'en': 'E-Learning\nStore',
      'id': 'E-Learning\nStore',
    },
    'jhjl5h61': {
      'en': 'Online\nClass',
      'id': 'Kelas\nOnline',
    },
    'qz1qqusl': {
      'en': 'Program\nStore',
      'id': 'Program\nStore',
    },
    'lr6pxv7r': {
      'en': 'Recent Articles',
      'id': 'Artikel Terkini',
    },
    '289ikrv0': {
      'en': 'View Article',
      'id': 'Lihat Artikel',
    },
    'ii587fej': {
      'en': 'SBCare Home Treatment',
      'id': 'SBCare Home Treatment',
    },
    'ix36s97f': {
      'en': 'Coming soon!',
      'id': 'Coming soon!',
    },
    't16t5vz0': {
      'en': 'Unlock Premium Features',
      'id': 'Buka Fitur Premium',
    },
    'olb3l3lh': {
      'en':
          'Sign in to access exclusive content, personalized recommendations, and SBCare tools.',
      'id':
          'Masuk untuk mengakses konten eksklusif, rekomendasi yang dipersonalisasi, dan alat SBCare.',
    },
    'emrlpd0y': {
      'en': 'SBPay',
      'id': 'SBPay',
    },
    'ysem1y78': {
      'en': 'Top up, transfer, and Withdraw Balance',
      'id': 'Top up, transfer, dan Tarik Saldo',
    },
    'pig1r4q9': {
      'en': 'Free',
      'id': 'Gratis',
    },
    '6d4wo9de': {
      'en': 'Partnership',
      'id': 'Kemitraan',
    },
    'kxcfqhpb': {
      'en': 'SBCare Licences and Premium modules for Provider',
      'id': 'Lisensi SBCare dan Modul Premium untuk Mitra',
    },
    'r1g3gbge': {
      'en': 'Premium',
      'id': 'Premium',
    },
    'hbv3j514': {
      'en': 'Affiliation',
      'id': 'Afiliasi',
    },
    '0vd7nkjf': {
      'en': 'Be a provider and earn money by selling modules or other products',
      'id':
          'Jadilah mitra dan dapatkan uang dari menjual modul atau produk lainnya',
    },
    '3p6lh0mf': {
      'en': 'Premium',
      'id': 'Premium',
    },
    'uk0mz3gw': {
      'en': '2024 - 2026 SBCare - SmileBirth. ',
      'id': '2024 - 2026 SBCare - SmileBirth. ',
    },
    'wx4oncau': {
      'en': 'All rights reserved.',
      'id': 'All rights reserved.',
    },
    'otg8boi0': {
      'en': 'EN',
      'id': 'EN',
    },
    'exgq5vvw': {
      'en': 'ID',
      'id': 'ID',
    },
    'y3bqp6lu': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    'qpn3jhbf': {
      'en': 'Sign up',
      'id': 'Sign up',
    },
  },
  // ProviderListPublicPage
  {
    'i9xwasha': {
      'en': '',
      'id': '',
    },
    '7vgvado3': {
      'en': 'Input Provider name or location',
      'id': 'Masukkan nama atau lokasi Mitra',
    },
    '705i2hce': {
      'en':
          'Showing the top 10 providers. Use search to view all available providers.',
      'id':
          'Menampilkan 10 mitra teratas. Gunakan pencarian untuk melihat semua mitra yang tersedia.',
    },
    '5bndt2xn': {
      'en': ' services',
      'id': ' layanan',
    },
    'bfuygcct': {
      'en': '13 services',
      'id': '13 layanan',
    },
    'kvajgtr7': {
      'en': 'Provider List',
      'id': 'List Mitra',
    },
    'ldqbq6d2': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ProviderDetailPublicPage
  {
    '6g4dlnt7': {
      'en': 'Digital Products',
      'id': 'Produk Digital',
    },
    't4f8xbox': {
      'en': 'Services',
      'id': 'Layanan',
    },
    '96h1ycz3': {
      'en': 'Articles',
      'id': 'Artikel',
    },
    'nwqzp58n': {
      'en': 'Digital Products',
      'id': 'Produk Digital',
    },
    'y7mntxgr': {
      'en': 'Panduan Napas Anti-Mual Trimester 1',
      'id': 'Panduan Napas Anti-Mual Trimester 1',
    },
    'daie6ara': {
      'en': 'Rp 50.000,00',
      'id': 'Rp 50.000,00',
    },
    'jw8ytllv': {
      'en': 'Purchase',
      'id': 'Beli',
    },
    'w8wpnttj': {
      'en': 'Ebook Posisi Nyaman Tidur Ibu Hamil',
      'id': 'Ebook Posisi Nyaman Tidur Ibu Hamil',
    },
    'r2j02eoj': {
      'en': 'Rp 30.000,00',
      'id': 'Rp 30.000,00',
    },
    '146nb1mr': {
      'en': 'Purchase',
      'id': 'Beli',
    },
    'sjwd6mu6': {
      'en': 'Template Jadwal Latihan Prenatal 7 Hari',
      'id': 'Template Jadwal Latihan Prenatal 7 Hari',
    },
    'bqepeqfm': {
      'en': 'Rp 70.000,00',
      'id': 'Rp 70.000,00',
    },
    '5afko6rq': {
      'en': 'Purchase',
      'id': 'Beli',
    },
    '4f1moli1': {
      'en': 'Provider Profile',
      'id': 'Profil Mitra',
    },
    'sr3lqouo': {
      'en': 'Home',
      'id': '',
    },
  },
  // ArticleListPublicPage
  {
    'hfj4car7': {
      'en': 'Stay up to date with the latest articles below.',
      'id': 'Ikuti terus artikel terkini di bawah ini.',
    },
    'kca413g6': {
      'en': '',
      'id': '',
    },
    'jqantq59': {
      'en': 'Input title or author',
      'id': 'Masukkan judul atau penulis',
    },
    'khrl72s9': {
      'en': 'By ',
      'id': 'Oleh ',
    },
    'bxb3nktp': {
      'en': 'Read more',
      'id': 'Baca selengkapnya',
    },
    'fwmlnyp5': {
      'en': 'By ',
      'id': 'Oleh ',
    },
    'pac9ig4d': {
      'en': 'Read more',
      'id': 'Baca selengkapnya',
    },
    '5bscykvi': {
      'en': 'SB Articles',
      'id': 'Artikel SB',
    },
    '8qeo1d25': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ArticleDetailPublicPage
  {
    'fomgahpw': {
      'en': 'Article Details',
      'id': 'Detail Artikel',
    },
    '08o4tlvn': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ELearningListPublicPage
  {
    'bvjekvvg': {
      'en': '',
      'id': '',
    },
    '2dmyeq1m': {
      'en': 'Input E-Learning title',
      'id': 'Masukkan judul E-Learning',
    },
    't5iwyodr': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'xipzv4p4': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'ejke1673': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '4fyep6gy': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    '5wrpg5bw': {
      'en': '',
      'id': '',
    },
    'uxj7c5i4': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    'a608mwft': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'iwhu3xlm': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    'witarlie': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    'presybvf': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    '7cuoaaq3': {
      'en': '',
      'id': '',
    },
    'g78ql3jb': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    'j9io7bs4': {
      'en': 'E-Learning Store',
      'id': 'E-Learning Store',
    },
    'wyyw158v': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ELearningDetailPublicPage
  {
    '70fj5t2a': {
      'en': 'E-Learning Details',
      'id': 'Rincian E-Learning',
    },
    'q3r5d3iz': {
      'en': 'E-Learning Content',
      'id': 'Konten E-Learning',
    },
    't1yzbg1e': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
    '0ixxhi6g': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // OnlineClassListPublicPage
  {
    'gnjlamrs': {
      'en': 'Details',
      'id': 'Rincian',
    },
    'ssyw0hqk': {
      'en': 'Online Class',
      'id': 'Kelas Online',
    },
    'blvke005': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ChangePasswordPage
  {
    'wewdyjf5': {
      'en': 'Current Password',
      'id': 'Kata Sandi Saat Ini',
    },
    'yivr5mqt': {
      'en': '',
      'id': '',
    },
    'b4gb0yew': {
      'en': '',
      'id': '',
    },
    'alqjqbm0': {
      'en': 'New Password',
      'id': 'Kata Sandi Baru',
    },
    'xumzq5cz': {
      'en': '',
      'id': '',
    },
    'c7wvu32f': {
      'en': '',
      'id': '',
    },
    'lbsj9zs2': {
      'en': 'Re-type Password',
      'id': 'Ketik Ulang Kata Sandi',
    },
    'kgi56shn': {
      'en': '',
      'id': '',
    },
    'oycpiljk': {
      'en': '',
      'id': '',
    },
    's4cbywwz': {
      'en': '',
      'id': '',
    },
    'hajm31e4': {
      'en': '',
      'id': '',
    },
    'rp5t1v1s': {
      'en': '',
      'id': '',
    },
    'orfmqdro': {
      'en': '',
      'id': '',
    },
    'hfxprsmh': {
      'en': '',
      'id': '',
    },
    'yzaqaovx': {
      'en': '',
      'id': '',
    },
    't2ibkeb8': {
      'en':
          'Password requirements: At least 6 characters and must contain one uppercase, one lowercase, one number',
      'id':
          'Persyaratan kata sandi: Minimal 6 karakter dan harus berisi satu huruf kapital, satu huruf kecil, satu angka',
    },
    '54lczer4': {
      'en': 'Change Password',
      'id': 'Ubah Kata Sandi',
    },
    'kq5sb8av': {
      'en': 'Change Password',
      'id': 'Ubah Kata Sandi',
    },
    'z84kg5tb': {
      'en': 'Profile',
      'id': 'Profil',
    },
  },
  // EbookListPublicPage
  {
    'eoq1x10t': {
      'en': '',
      'id': '',
    },
    'o9o74m9g': {
      'en': 'Input Program title',
      'id': 'Masukkan judul Program',
    },
    '7pd7qj6e': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    'w0fz9qur': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    '4gilc8sf': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '1693dn1f': {
      'en': '',
      'id': '',
    },
    '7i9dilhj': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    '408l5qzi': {
      'en': 'Price        : ',
      'id': 'Harga         : ',
    },
    '0f0j8pbu': {
      'en': 'Rp ',
      'id': 'Rp ',
    },
    '5ds5up4z': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '3z1tgnx3': {
      'en': '',
      'id': '',
    },
    'etyvd63j': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    'onjtr621': {
      'en': 'Program Store',
      'id': 'Program Store',
    },
    '7uz4n8r2': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // EbookDetailPublicPage
  {
    '8is3v9aw': {
      'en': 'Program Details',
      'id': 'Rincian Program',
    },
    'sn6xhyk1': {
      'en': 'Program Content',
      'id': 'Konten Program',
    },
    'khuhpgj4': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
    'idfj32bj': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // ProductDetailPublicPage
  {
    'bv9rxy9a': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '4440cvyv': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    'kcxet00a': {
      'en': '',
      'id': '',
    },
    'cionn8la': {
      'en': 'Format : ',
      'id': 'Format : ',
    },
    'usm2vdbu': {
      'en': '',
      'id': '',
    },
    'e6409gzf': {
      'en': 'Features & Benefits',
      'id': 'Fitur & Manfaat',
    },
    'eqj9rahu': {
      'en': 'Purchase Product',
      'id': 'Beli Produk',
    },
    'dwt4oph8': {
      'en': 'The product will be sent to your email after successful payment.',
      'id': 'Produk akan dikirim ke email Anda setelah pembayaran berhasil.',
    },
    'ilplfzc8': {
      'en': 'Product Detail',
      'id': 'Detail Produk',
    },
    'm8qn9dl8': {
      'en': 'Home',
      'id': 'Modul',
    },
  },
  // ProductCheckoutPublicPage
  {
    '4py3q548': {
      'en': 'Product Checkout',
      'id': 'Pembayaran Produk',
    },
    'y89esw4k': {
      'en': 'Pregnancy Product',
      'id': 'Produk Kehamilan',
    },
    'opom0txp': {
      'en': 'Rp 50.000,00',
      'id': 'Rp 50.000,00',
    },
    'ss8d52lb': {
      'en': 'The product will be sent via SBCare\'s official email.',
      'id': 'Produk akan dikirim via email resmi SBCare.',
    },
    '4uwsa2zg': {
      'en': 'Contact Information',
      'id': 'Informasi Kontak',
    },
    'urz54198': {
      'en': 'Full Name',
      'id': 'Nama Lengkap',
    },
    '1civ9980': {
      'en': 'Enter your full name',
      'id': 'Masukkan nama lengkap Anda',
    },
    'hai42hkq': {
      'en': 'Email Address',
      'id': 'Alamat Email',
    },
    'je4u55oq': {
      'en': 'example@gmail.com',
      'id': 'example@gmail.com',
    },
    'uq7bj1ux': {
      'en': 'An access link will be sent to this email. Check your Inbox/Spam.',
      'id': 'Link akses akan dikirim ke email ini. Cek Inbox/Spam',
    },
    'cn5cc9l4': {
      'en': 'WhatsApp',
      'id': 'WhatsApp',
    },
    'wguxfebe': {
      'en': 'Enter your WhatsApp number',
      'id': 'Masukkan nomor WhatsApp Anda',
    },
    '566djhmi': {
      'en': 'Full Name is required',
      'id': 'Nama lengkap diperlukan',
    },
    'rlt1mfgz': {
      'en': 'Full name must be at least 4 characters.',
      'id': 'Nama lengkap minimal harus 4 karakter.',
    },
    '9j8ic8iy': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'tjft20p2': {
      'en': 'Email Address is required',
      'id': 'Alamat email diperlukan',
    },
    'i7gjxcih': {
      'en': 'Please enter a valid email address.',
      'id': 'Silakan masukkan alamat email yang valid.',
    },
    'y6cw3jub': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    '8eygq1nf': {
      'en': 'WhatsApp is required',
      'id': 'WhatsApp diperlukan',
    },
    '0rbhx9h0': {
      'en': 'Phone number must be at least 6 digits.',
      'id': 'Nomor telepon minimal harus 6 digit.',
    },
    '10e29ax9': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    '0siry3oh': {
      'en': 'Payment Method',
      'id': 'Metode Pembayaran',
    },
    'xnu7s5i5': {
      'en': 'Choose payment method',
      'id': 'Pilih metode pembayaran',
    },
    '6dnhlddb': {
      'en': 'Search bank',
      'id': 'Cari bank',
    },
    'utb4ahgn': {
      'en': 'Option 1',
      'id': 'Opsi 1',
    },
    'mhdkp1mw': {
      'en': 'Voucher Code (Optional)',
      'id': 'Kode Voucher (Opsional)',
    },
    'rmih4amr': {
      'en': 'Enter voucher code',
      'id': 'Masukkan kode voucher',
    },
    '7s0hni7f': {
      'en': 'Check',
      'id': 'Cek',
    },
    'e2ye6bk0': {
      'en': 'Already have an account?',
      'id': 'Sudah punya akun?',
    },
    'pp9pkyoc': {
      'en':
          'Sign in to access SBPay payments without providing contact information.',
      'id':
          'Masuk untuk mengakses pembayaran SBPay tanpa memberikan informasi kontak.',
    },
    'u2p79fct': {
      'en': 'Sign in',
      'id': 'Masuk',
    },
    'jyj7g8bl': {
      'en': 'I agree to the Terms of Service and Privacy Policy',
      'id':
          'Saya setuju dengan Syarat dan Ketentuan Layanan serta Kebijakan Privasi.',
    },
    '3v5l9brk': {
      'en': 'Total:',
      'id': 'Jumlah:',
    },
    'k7szdz70': {
      'en': 'Rp 50.000,00',
      'id': 'Rp 50.000,00',
    },
    '03m2592s': {
      'en': 'Complete Purchase',
      'id': 'Lanjutkan Pembayaran',
    },
    'ehhws0bj': {
      'en': 'SBCare will send an access email after successful payment.',
      'id': 'SBCare akan mengirim email akses setelah pembayaran berhasil.',
    },
  },
  // ProductSuccessPurchasePublicPage
  {
    'txwkvyl0': {
      'en': 'Payment Successful!',
      'id': 'Pembayaran Berhasil!',
    },
    'si7q1y6e': {
      'en': 'Product access has been sent to your email.',
      'id': 'Akses produk telah dikirim ke email Anda.',
    },
    'pbiajqpc': {
      'en': 'Back',
      'id': 'Kembali',
    },
    '6v2m2af1': {
      'en': 'Delivery Email',
      'id': 'Email Pengiriman',
    },
    'b4pvb9cz': {
      'en': 'example@gmail.com',
      'id': 'example@gmail.com',
    },
    '165zgnrd': {
      'en': 'It usually arrives within 1-2 minutes. ',
      'id': 'Biasanya masuk dalam 1-2 menit.',
    },
    'zzu69b7y': {
      'en': 'Haven\'t received the email?',
      'id': 'Belum menerima email?',
    },
    'xsj7f8dt': {
      'en': 'Check your Spam/Promotion',
      'id': 'Cek Spam/Promosi',
    },
    'pmaxbsra': {
      'en': 'Make sure the email is correct',
      'id': 'Pastikan email benar',
    },
    'xv7e3t21': {
      'en': 'Contact Admin if you still have not received it',
      'id': 'Hubungi Admin jika masih belum menerima',
    },
    'h93uraca': {
      'en': 'Chat Admin on WhatsApp',
      'id': 'Hubungi Admin di WhatsApp?',
    },
    'i4hv13mz': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // MySBLinkPage
  {
    'z3u2tlji': {
      'en': 'Dashboard',
      'id': 'Dasbor',
    },
    'onuemxr9': {
      'en': 'Tantri Maharani Setyorini',
      'id': 'Tantri Maharani Setyorini',
    },
    'y27fbjr5': {
      'en': 'Your SBLink',
      'id': 'SBLink Anda',
    },
    'btb7viwv': {
      'en': 'sbcare.co.id/bidan-tantri-maharani',
      'id': 'sbcare.co.id/bidan-tantri-maharani',
    },
    'qr3aj6tr': {
      'en': '247',
      'id': '247',
    },
    'idpre6gc': {
      'en': 'Total Sales',
      'id': 'Penjualan',
    },
    'fegs4wef': {
      'en': 'Rp 550.000,00',
      'id': 'Rp 550.000,00',
    },
    'g8znvqzl': {
      'en': 'Total Income',
      'id': 'Omzet',
    },
    'xq2xxaqh': {
      'en': 'Manage Products',
      'id': 'Kelola Produk',
    },
    'e6nqaeus': {
      'en': 'Add, edit, or remove digital products from your SBLInk',
      'id': 'Tambahkan, edit, atau hapus produk digital dari SBLink Anda',
    },
    'l2qgn9fz': {
      'en': 'Withdraw SBLink Balance',
      'id': 'Tarik Saldo SBLink',
    },
    'rbvtvthc': {
      'en': 'Balance: ',
      'id': 'Saldo: ',
    },
    'jlownnbw': {
      'en': 'Rp 75.000,00',
      'id': 'Rp 75.000,00',
    },
    'h8hefmq7': {
      'en': 'Add, edit, or remove digital products from your SBLInk',
      'id': 'Tambahkan, edit, atau hapus produk digital dari SBLink Anda',
    },
    'wocftl7b': {
      'en': 'Edit SBLink Page',
      'id': 'Edit Halaman SBLink',
    },
    'fjanp4a9': {
      'en': 'Customize your SBLink appearance and details',
      'id': 'Sesuaikan tampilan dan detail SBLink Anda.',
    },
    'ujj8vl6y': {
      'en': 'Preview SBLink',
      'id': 'Pratinjau SBLink',
    },
    'b2xttiec': {
      'en': 'See how your SBLink looks to customers',
      'id': 'Lihat bagaimana tampilan SBLink Anda di mata pelanggan.',
    },
    '9liee4n7': {
      'en': 'Recent Orders',
      'id': 'Pesanan Terbaru',
    },
    'k041u3so': {
      'en': 'View All',
      'id': 'Lihat Semua',
    },
    '031p6qc5': {
      'en': 'Panduan Napas Anti-Mual Trimester 1',
      'id': 'Panduan Napas Anti-Mual Trimester 1',
    },
    'rgie73vh': {
      'en': 'Order #12847',
      'id': 'Order #12847',
    },
    '7xhulm7j': {
      'en': '30 December 2025 20:30',
      'id': '30 Desember 2025 20:30',
    },
    'ishfpl4y': {
      'en': 'Rp 50.000,00',
      'id': 'Rp 50.000,00',
    },
    'hxtl2xd0': {
      'en': 'Paid',
      'id': 'Dibayar',
    },
    'wtm6ky6a': {
      'en': 'Ebook Posisi Nyaman Tidur Ibu Hamil',
      'id': 'Ebook Posisi Nyaman Tidur Ibu Hamil',
    },
    'pxnwh0kn': {
      'en': 'Order #12846',
      'id': 'Order #12846',
    },
    'yehk8mb6': {
      'en': '30 December 2025 20:00',
      'id': '30 Desember 2025 20:00',
    },
    'hzl8uq99': {
      'en': 'Rp 30.000,00',
      'id': 'Rp 30.000,00',
    },
    '6l6gysiz': {
      'en': 'Pending',
      'id': 'Tertunda',
    },
    'bsy94oi3': {
      'en': 'My SBLink',
      'id': 'SBLink Saya',
    },
  },
  // ManageProductPage
  {
    '7i9uh8nk': {
      'en': 'Manage Your Products',
      'id': 'Kelola Produk Anda',
    },
    'c7bfj6gg': {
      'en': 'Add, edit, or remove products from your store',
      'id': 'Tambahkan, edit, atau hapus produk dari toko Anda.',
    },
    'wj31s4bu': {
      'en': 'Search products...',
      'id': 'Cari produk...',
    },
    'rtadks4s': {
      'en': 'Panduan Napas Anti-Mual Trimester 1',
      'id': 'Panduan Napas Anti-Mual Trimester 1',
    },
    'g4uqdn7k': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    '3js6pikh': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    'bx3bwjoa': {
      'en': '',
      'id': '',
    },
    '4sbr4gke': {
      'en': 'Rp 50.000,00',
      'id': 'Rp 50.000,00',
    },
    'fbstz3op': {
      'en': 'Format : ',
      'id': 'Format : ',
    },
    'izc8qftr': {
      'en': 'PDF',
      'id': 'PDF',
    },
    'r25ai6zf': {
      'en': '',
      'id': '',
    },
    '9ikhl288': {
      'en': 'Active',
      'id': 'Aktif',
    },
    'i84e80lc': {
      'en': 'Ebook Posisi Nyaman Tidur Ibu Hamil',
      'id': 'Ebook Posisi Nyaman Tidur Ibu Hamil',
    },
    'u9u1bfcg': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    'rw2m1qqo': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    'pgjzx56u': {
      'en': '',
      'id': '',
    },
    'sw9lewpb': {
      'en': 'Rp 30.000,00',
      'id': 'Rp 30.000,00',
    },
    '6v3tc9y1': {
      'en': 'Format : ',
      'id': 'Format : ',
    },
    '4ohtj1f3': {
      'en': 'Video + PDF',
      'id': 'Video + PDF',
    },
    'wsud433s': {
      'en': '',
      'id': '',
    },
    'wun8iwcp': {
      'en': 'Draft',
      'id': 'Draf',
    },
    'w4a4qaki': {
      'en': 'Template Jadwal Latihan Prenatal 7 Hari',
      'id': 'Template Jadwal Latihan Prenatal 7 Hari',
    },
    '8rwotgt5': {
      'en': 'Duration : ',
      'id': 'Masa Aktif : ',
    },
    'tgxs7gyp': {
      'en': '30 Days',
      'id': '30 Hari',
    },
    'gbgg9x0q': {
      'en': '',
      'id': '',
    },
    'kvtvvi6z': {
      'en': 'Rp 70.000,00',
      'id': 'Rp 70.000,00',
    },
    'rbttr6cx': {
      'en': 'Format : ',
      'id': 'Format : ',
    },
    'aw4ybmz7': {
      'en': 'Video',
      'id': 'Video',
    },
    'i5dqp4a5': {
      'en': '',
      'id': '',
    },
    'vuxgjdoj': {
      'en': 'Active',
      'id': 'Aktif',
    },
    'af9a4r4l': {
      'en': 'Add Product',
      'id': 'Tambah Produk',
    },
    'b94v5yux': {
      'en': 'Product Management',
      'id': 'Manajemen Produk',
    },
  },
  // ProductSettingPage
  {
    '50mm5cph': {
      'en': 'Product Settings',
      'id': 'Pengaturan Produk',
    },
    '680v2uui': {
      'en': 'PRODUCT COVER',
      'id': 'SAMPUL PRODUK',
    },
    'u9m7igfm': {
      'en': 'Upload Cover Image',
      'id': 'Unggah Gambar Sampul',
    },
    'dvutuqhu': {
      'en': 'Recommended: 1200x800px',
      'id': 'Rekomendasi: 1200x800px',
    },
    '17l07u4k': {
      'en': 'PRODUCT TITLE',
      'id': 'JUDUL PRODUK',
    },
    'm85pucv1': {
      'en': 'Enter product title',
      'id': 'Masukkan judul produk',
    },
    't60gzixk': {
      'en': 'DESCRIPTION',
      'id': 'DESKRIPSI',
    },
    '07j27mh4': {
      'en': 'Describe what the buyer will get',
      'id': 'Jelaskan apa yang pembeli akan dapatkan',
    },
    '1tbfgpxn': {
      'en': 'REGULAR PRICE',
      'id': 'HARGA REGULER',
    },
    'zsb4snx5': {
      'en': 'Rp',
      'id': 'Rp',
    },
    'drlpd4aw': {
      'en': '',
      'id': '',
    },
    'uj2bpohm': {
      'en': 'PROMO PRICE',
      'id': 'HARGA PROMO',
    },
    'b5u7n3ip': {
      'en': 'Rp',
      'id': 'Rp',
    },
    'ewkktqjp': {
      'en': '',
      'id': '',
    },
    'f9cpfftw': {
      'en': '',
      'id': '',
    },
    't654j1ex': {
      'en': 'DURATION',
      'id': 'MASA AKTIF',
    },
    'ki1emkrn': {
      'en': 'e.g., 30 days, Lifetime access',
      'id': 'misalnya, 30 hari, Akses seumur hidup',
    },
    'rlcnf2cd': {
      'en': 'PRODUCT TYPE',
      'id': 'JENIS PRODUK',
    },
    'yqd1iwos': {
      'en': 'Select product type',
      'id': 'Pilih jenis produk',
    },
    'azrt5xor': {
      'en': 'PDF',
      'id': '',
    },
    'lsvg8z7i': {
      'en': 'Video',
      'id': '',
    },
    'b5msz2gy': {
      'en': 'Video + PDF',
      'id': '',
    },
    'jys9ihr7': {
      'en': 'ACCESS LINK',
      'id': 'LINK AKSES',
    },
    'qlyagq7p': {
      'en': 'https://example.com/product-access',
      'id': 'https://example.com/product-access',
    },
    '2al1a31f': {
      'en': 'STATUS',
      'id': 'STATUS',
    },
    '5fn74mzc': {
      'en': 'Draft',
      'id': 'Draf',
    },
    'liy7xn64': {
      'en': 'Active',
      'id': 'Aktif',
    },
    '2km0syln': {
      'en': 'Cancel',
      'id': 'Batal',
    },
    'wwd6c0vk': {
      'en': 'Save Product',
      'id': 'Simpan Produk',
    },
    't62wfod5': {
      'en': 'Enter product title is required',
      'id': '',
    },
    'bswfvo7f': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'wt0rx01g': {
      'en': 'Describe what the buyer will get... is required',
      'id': '',
    },
    'jvn70wn5': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    '0j10x60e': {
      'en': 'Rp is required',
      'id': '',
    },
    'cy0io60f': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'jorgh5k3': {
      'en': 'Rp is required',
      'id': '',
    },
    '31zu6ied': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'ug1dosof': {
      'en': 'e.g., 30 days, Lifetime access is required',
      'id': '',
    },
    'rgm64o6b': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
    'dovm4ypy': {
      'en': 'https://example.com/product-access is required',
      'id': '',
    },
    'h0gy81am': {
      'en': 'Please choose an option from the dropdown',
      'id': 'Silakan pilih opsi dari dropdown',
    },
  },
  // WithdrawSBLinkPage
  {
    '8xcqzs2t': {
      'en': 'Available Balance',
      'id': 'Saldo Tersedia',
    },
    'nbbu9vi9': {
      'en': 'Rp 75.000,00',
      'id': 'Rp 75.000,00',
    },
    'eirobg8f': {
      'en': 'Withdraw Amount',
      'id': 'Jumlah Penarikan',
    },
    'vqds2kah': {
      'en': 'Rp',
      'id': 'Rp',
    },
    'tb0zq861': {
      'en': 'Withdraw to',
      'id': 'Tujuan',
    },
    'lbu2r69j': {
      'en': 'Select account',
      'id': 'Pilih akun',
    },
    '4vbhtv3q': {
      'en': 'Bank Account ****1234',
      'id': '',
    },
    '5wcyuy9b': {
      'en': 'PayPal Account',
      'id': '',
    },
    'gcn3etm4': {
      'en': 'Crypto Wallet',
      'id': '',
    },
    'n2cszubi': {
      'en': 'Withdraw Funds',
      'id': 'Tarik Dana',
    },
    '0sc6mqus': {
      'en': 'Recent Withdrawals',
      'id': 'Penarikan Dana Terbaru',
    },
    '8nt8ihbz': {
      'en': 'View All',
      'id': 'Lihat Semua',
    },
    '4i6lcgx3': {
      'en': 'Bank Transfer',
      'id': 'Bank Transfer',
    },
    '3exy9b3z': {
      'en': 'Dec 15, 2024 • 2:30 PM',
      'id': 'Dec 15, 2024 • 2:30 PM',
    },
    'dkuyt0nm': {
      'en': 'Rp 500.000,00',
      'id': 'Rp 500.000,00',
    },
    '7472c1e0': {
      'en': 'Completed',
      'id': 'Selesai',
    },
    '4spu3p5s': {
      'en': 'PayPal Transfer',
      'id': 'PayPal Transfer',
    },
    'zuj9dzkj': {
      'en': 'Dec 12, 2024 • 10:15 AM',
      'id': 'Dec 12, 2024 • 10:15 AM',
    },
    '2swcqt2s': {
      'en': 'Rp 150.000,00',
      'id': 'Rp 150.000,00',
    },
    'ycixcwmv': {
      'en': 'Processing',
      'id': 'Dalam Proses',
    },
    'wsxklhkn': {
      'en': 'Crypto Withdrawal',
      'id': 'Crypto Withdrawal',
    },
    'e4zrb514': {
      'en': 'Dec 10, 2024 • 4:45 PM',
      'id': 'Dec 10, 2024 • 4:45 PM',
    },
    '8fn9zr04': {
      'en': 'Rp 250.000,00',
      'id': 'Rp 250.000,00',
    },
    'h2wcvc96': {
      'en': 'Completed',
      'id': 'Selesai',
    },
    'uy1h55xu': {
      'en': 'Bank Transfer',
      'id': 'Bank Transfer',
    },
    's17nsb0e': {
      'en': 'Dec 8, 2024 • 11:20 AM',
      'id': 'Dec 8, 2024 • 11:20 AM',
    },
    '1xvmryqz': {
      'en': 'Rp 250.000,00',
      'id': 'Rp 250.000,00',
    },
    '4ab3r5ai': {
      'en': 'Completed',
      'id': 'Selesai',
    },
    '5fw5fzmz': {
      'en': 'Withdraw SBLink',
      'id': 'Tarik SBLink',
    },
  },
  // TopupErrorScreen
  {
    'lnulbqk5': {
      'en': 'Topup Error!',
      'id': 'Topup Error!',
    },
    '06n8qqrx': {
      'en': 'Chat Admin on WhatsApp',
      'id': 'Hubungi Admin di WhatsApp?',
    },
    'r3xj3wks': {
      'en': 'Back',
      'id': 'Kembali',
    },
    '7vdnx23s': {
      'en': 'Home',
      'id': 'Beranda',
    },
  },
  // CreatorPublicPage
  {
    'c5xwqn56': {
      'en': 'Purchase',
      'id': 'Beli',
    },
    '4q0xn6jd': {
      'en': 'SBLink',
      'id': 'SBLink',
    },
    'enhqs8og': {
      'en': 'Home',
      'id': '',
    },
  },
  // CurriculumVitaePage
  {
    'ski7ywi2': {
      'en': 'Radendy Bahtiar',
      'id': 'Radendy Bahtiar',
    },
    'ko7jgvhr': {
      'en': 'Software Engineer',
      'id': 'Software Engineer',
    },
    'khk3k5bz': {
      'en': 'radenbahtiar26@gmail.com',
      'id': 'radenbahtiar26@gmail.com',
    },
    'fyzd0bbi': {
      'en': '+62-852-9047-3566',
      'id': '+62-852-9047-3566',
    },
    'hj6efkrn': {
      'en': 'Cilacap, Jawa Tengah, ID',
      'id': 'Cilacap, Jawa Tengah, ID',
    },
    'd67fxdsm': {
      'en': 'Professional Summary',
      'id': 'Professional Summary',
    },
    'k0kijbpj': {
      'en':
          'Experienced software engineer with 6+ years developing scalable web & mobile applications and coordinating cross-functional teams. Expertise in full-stack development, project management, and agile methodologies. Passionate about creating innovative solutions that drive business growth.',
      'id':
          'Experienced software engineer with 6+ years developing scalable web & mobile applications and coordinating cross-functional teams. Expertise in full-stack development, project management, and agile methodologies. Passionate about creating innovative solutions that drive business growth.',
    },
    'slqwkfeu': {
      'en': 'Work Experience',
      'id': 'Work Experience',
    },
    'fy4obyty': {
      'en': 'Software Developer',
      'id': 'Software Developer',
    },
    'y0xudj58': {
      'en': 'Oct 2023 - Oct 2026',
      'id': 'Oct 2023 - Oct 2026',
    },
    '7wcffwcg': {
      'en': '+ Project Manager',
      'id': '+ Project Manager',
    },
    'caktihyz': {
      'en': 'Smile Birth Corp',
      'id': 'Smile Birth Corp',
    },
    'xhl72u4i': {
      'en':
          '• Project Management: Oversaw timelines, product delivery, and workflow optimization.\n• Cross-Team Collaboration: Acted as a bridge between technical and non-technical teams (administration, marketing, and development), ensuring clear communication and alignment of goals.\n• Dashboard Development: Built and maintained an Admin Dashboard using Laravel (Fullstack).\n• Mobile Application Development: Designed and developed mobile applications with Flutter (Frontend).',
      'id':
          '• Project Management: Oversaw timelines, product delivery, and workflow optimization.\n• Cross-Team Collaboration: Acted as a bridge between technical and non-technical teams (administration, marketing, and development), ensuring clear communication and alignment of goals.\n• Dashboard Development: Built and maintained an Admin Dashboard using Laravel (Fullstack).\n• Mobile Application Development: Designed and developed mobile applications with Flutter (Frontend).',
    },
    'f876yh52': {
      'en': 'Data Entry',
      'id': 'Data Entry',
    },
    '0smqudl6': {
      'en': 'Nov 2022 - Mar 2023',
      'id': 'Nov 2022 - Mar 2023',
    },
    'rsq9a3iv': {
      'en': 'BPS Cilacap',
      'id': 'BPS Cilacap',
    },
    's1glmnvm': {
      'en':
          '• Enter, update, and verify data in databases, spreadsheets, and company systems.\n• Maintain accurate records and ensure data integrity.\n• Review and correct errors in data entry to prevent inconsistencies.',
      'id':
          '• Enter, update, and verify data in databases, spreadsheets, and company systems.\n• Maintain accurate records and ensure data integrity.\n• Review and correct errors in data entry to prevent inconsistencies.',
    },
    'wawc1s0c': {
      'en': 'Programmer',
      'id': 'Programmer',
    },
    'gp7m3ad2': {
      'en': 'Oct 2022 - Jun 2023',
      'id': 'Oct 2022 - Jun 2023',
    },
    'fbmmh9tq': {
      'en': 'Freelancer',
      'id': 'Freelancer',
    },
    'rt5qswsz': {
      'en':
          '• \tDesign and implement RESTful APIs for oil & gas shipment tracking and management.\n• \tEnsure secure data exchange between internal systems and external stakeholders.\n• \tOptimize API performance for high-volume transactions.\n• Build and maintain Point-of-Sale applications using .NET frameworks.\n• Integrate POS with inventory, billing, and reporting modules.\n• Ensure compliance with industry standards and financial regulations.',
      'id':
          '• \tDesign and implement RESTful APIs for oil & gas shipment tracking and management.\n• \tEnsure secure data exchange between internal systems and external stakeholders.\n• \tOptimize API performance for high-volume transactions.\n• Build and maintain Point-of-Sale applications using .NET frameworks.\n• Integrate POS with inventory, billing, and reporting modules.\n• Ensure compliance with industry standards and financial regulations.',
    },
    'tfcv5zyk': {
      'en': 'Application Support Engineer',
      'id': 'Application Support Engineer',
    },
    'c2o91555': {
      'en': 'Feb 2022 - May 2022',
      'id': 'Feb 2022 - May 2022',
    },
    'doq72h9b': {
      'en': 'Agile Technica',
      'id': 'Agile Technica',
    },
    'f52lqfke': {
      'en':
          '• \tClient Support: Responded to and assisted clients with bug reports, feature requests, and inquiries related to the ERPNext web application.\n• \tQuality Assurance: Conducted testing of ERP systems in staging environments to ensure stability and functionality prior to release.\n• \tDocumentation: Prepared and maintained documentation, including release notes, module workflows, and user guides.\n• \tProduct Demonstrations: Supported the Product Owner in delivering application demos to stakeholders and clients.',
      'id':
          '• \tClient Support: Responded to and assisted clients with bug reports, feature requests, and inquiries related to the ERPNext web application.\n• \tQuality Assurance: Conducted testing of ERP systems in staging environments to ensure stability and functionality prior to release.\n• \tDocumentation: Prepared and maintained documentation, including release notes, module workflows, and user guides.\n• \tProduct Demonstrations: Supported the Product Owner in delivering application demos to stakeholders and clients.',
    },
    'g6pwc79o': {
      'en': 'Junior Web Developer',
      'id': 'Junior Web Developer',
    },
    '3trlrx7m': {
      'en': 'Oct 2019 - Apr 2021',
      'id': 'Oct 2019 - Apr 2021',
    },
    'yen8gzr0': {
      'en': 'DEOS Group',
      'id': 'DEOS Group',
    },
    'gyx4cqol': {
      'en':
          '• \tFeature Development: Designed and implemented new features for HRIS modules within the web application.\n• \tReporting: Created custom reports using Telerik Reporting Designer to support business needs.\n• \tBug Resolution: Diagnosed and fixed issues at both the code and database levels.\n• \tDatabase Management: Developed new tables and stored procedures in SQL Server to enhance system functionality.\n• \tAPI Development: Built and integrated new APIs to support HRIS mobile applications.\n• \tSecurity Testing: Conducted SQL Injection penetration testing to ensure application security and data integrity.',
      'id':
          '• \tFeature Development: Designed and implemented new features for HRIS modules within the web application.\n• \tReporting: Created custom reports using Telerik Reporting Designer to support business needs.\n• \tBug Resolution: Diagnosed and fixed issues at both the code and database levels.\n• \tDatabase Management: Developed new tables and stored procedures in SQL Server to enhance system functionality.\n• \tAPI Development: Built and integrated new APIs to support HRIS mobile applications.\n• \tSecurity Testing: Conducted SQL Injection penetration testing to ensure application security and data integrity.',
    },
    'qu82fv5d': {
      'en': 'Education',
      'id': '',
    },
    'evd640yu': {
      'en': 'Management Information Systems',
      'id': 'Management Information Systems',
    },
    'j6b6ivah': {
      'en': '2025 - Present',
      'id': '2025 - Present',
    },
    'f69vlsj0': {
      'en': 'Universitas Terbuka, Purwokerto',
      'id': 'Universitas Terbuka, Purwokerto',
    },
    '3h82knfo': {
      'en': 'Ongoing Semester 4 • Cumulative GPA: 3.78/4.00',
      'id': 'Ongoing Semester 4 • Cumulative GPA: 3.78/4.00',
    },
    'h7m2w57j': {
      'en': 'Technical Skills',
      'id': '',
    },
    '1o02yvha': {
      'en': 'Certifications',
      'id': '',
    },
    'ah30m274': {
      'en': 'Junior Computer Network Technician (BNSP)',
      'id': 'Junior Computer Network Technician (BNSP)',
    },
    'gz0sx997': {
      'en': 'Junior Web Programmer (Kominfo)',
      'id': 'Junior Web Programmer (Kominfo)',
    },
    'bu13uewv': {
      'en': 'IT Essentials (Cisco)',
      'id': 'IT Essentials (Cisco)',
    },
    'trchoq7g': {
      'en': 'Curriculum Vitae',
      'id': 'Curriculum Vitae',
    },
  },
  // SBLinkPublicPage
  {
    '18lqji6z': {
      'en': 'Purchase',
      'id': 'Beli',
    },
    '3wp7zs3o': {
      'en': 'SBLink Beta',
      'id': 'SBLink Beta',
    },
    'ebd8lcls': {
      'en': 'Home',
      'id': '',
    },
  },
  // PortfolioPage
  {
    'hojyn5ah': {
      'en': 'Radendy Bahtiar',
      'id': 'Radendy Bahtiar',
    },
    'oppligpl': {
      'en': 'Software Developer',
      'id': 'Software Developer',
    },
    'g86nuqe9': {
      'en': 'SBCare - SmileBirth',
      'id': 'SBCare - SmileBirth',
    },
    's3inavq4': {
      'en': 'About Me',
      'id': 'About Me',
    },
    '4bkcr4ux': {
      'en':
          'Passionate full-stack developer specializing in maternal healthcare technology. I lead the development of SBCare\'s core platform, focusing on creating intuitive and secure solutions that support expecting mothers throughout their pregnancy journey.',
      'id':
          'Passionate full-stack developer specializing in maternal healthcare technology. I lead the development of SBCare\'s core platform, focusing on creating intuitive and secure solutions that support expecting mothers throughout their pregnancy journey.',
    },
    'umhg1x4f': {
      'en': 'Key Projects',
      'id': 'Key Projects',
    },
    'v4b0dmj8': {
      'en': 'Pregnancy Specialist Platform',
      'id': 'Pregnancy Specialist Platform',
    },
    '1ao5ldn6': {
      'en':
          'A platform that supports women\'s health holistically. Includes mind, body and soul in everyday life.',
      'id':
          'A platform that supports women\'s health holistically. Includes mind, body and soul in everyday life.',
    },
    'ky5yggm1': {
      'en': 'Secure Patient Portal',
      'id': 'Secure Patient Portal',
    },
    '4d5k17r4': {
      'en':
          'HIPAA-compliant communication platform connecting patients with healthcare providers',
      'id':
          'HIPAA-compliant communication platform connecting patients with healthcare providers',
    },
    'pc79la4c': {
      'en': 'Mobile Birth Plan Builder',
      'id': 'Mobile Birth Plan Builder',
    },
    'oilof5rz': {
      'en':
          'Interactive module helping mothers create personalized birth plans with medical guidance',
      'id':
          'Interactive module helping mothers create personalized birth plans with medical guidance',
    },
    '7leacfbj': {
      'en': 'Technology Used',
      'id': 'Technology Used',
    },
    'kag469mf': {
      'en': 'Flutter',
      'id': 'Flutter',
    },
    'ltgbvinh': {
      'en': 'Ruby on Rails',
      'id': 'Ruby on Rails',
    },
    'bxzrh6jp': {
      'en': 'MySQL',
      'id': 'MySQL',
    },
    'm1zpnvne': {
      'en': 'AWS',
      'id': 'AWS',
    },
    '84j5x36r': {
      'en': 'Laravel',
      'id': 'Laravel',
    },
    'v86t5t07': {
      'en': 'REST APIs',
      'id': 'REST APIs',
    },
    'gidbl05i': {
      'en': '6+',
      'id': '6+',
    },
    'wlqn84lx': {
      'en': 'Years \nExperience',
      'id': 'Years \nExperience',
    },
    '5w0xm74r': {
      'en': '6K+',
      'id': '6K+',
    },
    '9vzwixur': {
      'en': 'Registered \nUsers',
      'id': 'Registered \nUsers',
    },
    'ebkyc7g2': {
      'en': '99.9%',
      'id': '99.9%',
    },
    'ztuu38js': {
      'en': 'Uptime\n',
      'id': 'Uptime\n',
    },
    'ohltaf5b': {
      'en': 'Contact Information',
      'id': 'Contact Information',
    },
    'cf34g2cf': {
      'en': 'radenbahtiar26@gmail.com',
      'id': 'radenbahtiar26@gmail.com',
    },
    'tfkv7x58': {
      'en': '+62 852 9047 3566',
      'id': '+62 852 9047 3566',
    },
    '0knxq9pv': {
      'en': 'Cilacap, Jawa Tengah, ID',
      'id': 'Cilacap, Jawa Tengah, ID',
    },
    'tj5t76cp': {
      'en': 'Developer Portfolio',
      'id': '',
    },
  },
  // EmptyListAppointmentComponent
  {
    'srjkbo7e': {
      'en': 'No Appointment Found',
      'id': 'Janji Temu Tidak Ditemukan ',
    },
    'u2mxcncg': {
      'en':
          'Your appointment is currently empty. Book a new appointment to get started.',
      'id':
          'Jadwal janji temu Anda saat ini kosong. Pesan janji temu baru untuk memulai.',
    },
    'vnpkd7av': {
      'en': 'View Services',
      'id': 'Lihat Layanan',
    },
  },
  // EmptyListOnlineClassScheduleComponent
  {
    'hlev1mga': {
      'en': 'No Online Class Found',
      'id': 'Kelas Online Tidak Ditemukan',
    },
    '6kpq74tp': {
      'en':
          'Your online class schedule is currently empty. Book an online class to get started.',
      'id':
          'Jadwal kelas online Anda saat ini kosong. Pesan kelas online baru untuk memulai.',
    },
    'v86blgt1': {
      'en': 'View Online Services',
      'id': 'Lihat Layanan Online',
    },
  },
  // EmptyListAppointmentMitraComponent
  {
    'pi103x7f': {
      'en': 'No Appointment Found',
      'id': 'Janji Temu Tidak Ditemukan',
    },
  },
  // EmptySearchELearningComponent
  {
    'rc7neqy6': {
      'en': 'No Results Found',
      'id': 'Pencarian Tidak Ditemukan',
    },
    '515dl6ly': {
      'en':
          'Try adjusting your search or filter to find what you\'re looking for.',
      'id':
          'Coba sesuaikan pencarian atau filter Anda untuk menemukan apa yang Anda cari.',
    },
  },
  // EmptyListOnlineClassComponent
  {
    'q2itdtoz': {
      'en': 'No Online Class Found',
      'id': 'Kelas Online Tidak Ditemukan',
    },
    'wki76aje': {
      'en': 'Please contact SBCare Admin for more information.',
      'id':
          'Kelas Online Anda saat ini kosong. Tambahkan kelas online baru untuk memulai.',
    },
  },
  // EmptySearchProviderComponent
  {
    '96lnasx6': {
      'en': 'No Results Found',
      'id': 'Pencarian Tidak Ditemukan',
    },
    'po7p78yo': {
      'en':
          'Try adjusting your search or filter to find what you\'re looking for.',
      'id':
          'Coba sesuaikan pencarian atau filter Anda untuk menemukan apa yang Anda cari.',
    },
  },
  // EmptyListProviderComponent
  {
    '01og6xua': {
      'en': 'No Provider Found',
      'id': 'Mitra Tidak Ditemukan',
    },
    'uh4av4kb': {
      'en': 'Please set your home address first.',
      'id': 'Silakan atur alamat rumah Anda terlebih dahulu.',
    },
    'oa76fkka': {
      'en': 'Set Address',
      'id': 'Atur Alamat',
    },
  },
  // EmptyListServiceComponent
  {
    'av01595u': {
      'en': 'No Provider Services Found',
      'id': 'Layanan Mitra Tidak Ditemukan',
    },
    'iekdy8ei': {
      'en':
          'Your Provider services is not available at the moment. Please contact your provider directly, or contact SBCare Admin for more information.',
      'id':
          'Layanan Mitra Anda tidak tersedia saat ini. Silakan hubungi Mitra Anda secara langsung, atau hubungi Admin SBCare untuk informasi lebih lanjut.',
    },
  },
  // EmptyListTopupComponent
  {
    'tyc5imeg': {
      'en': 'No Top up History Found',
      'id': 'Riwayat Top up Tidak Ditemukan',
    },
  },
  // EmptyListTransferComponent
  {
    'r9kpdaqx': {
      'en': 'No Transfer History Found',
      'id': 'Riwayat Transfer Tidak Ditemukan',
    },
  },
  // EmptyListMyELearningComponent
  {
    'm55heswb': {
      'en': 'No Modules Found',
      'id': 'Modul Tidak Ditemukan',
    },
    'fy4ikms4': {
      'en': 'You can purchase a module in\nE-Learning menu.',
      'id': 'Anda dapat membeli modul di menu E-Learning.',
    },
    'pigxani0': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
  },
  // EmptyListModuleMitraComponent
  {
    '87lhcuq2': {
      'en': 'No Modules Found',
      'id': 'Modul Tidak Ditemukan',
    },
    '3fgr5v5m': {
      'en':
          'You have not owned any License yet. In order to have a module, you need to purchase a license first.',
      'id':
          'Anda belum memiliki Lisensi apa pun. Untuk memiliki modul, Anda perlu membeli lisensi terlebih dahulu.',
    },
    '4yc7ucn8': {
      'en': 'Purchase Licence',
      'id': 'Beli Lisensi',
    },
  },
  // EmptyListAddressMitraComponent
  {
    '2clt69vq': {
      'en': 'No Practice Address Found',
      'id': 'Alamat Praktik Tidak Ditemukan',
    },
    'i6bxfes5': {
      'en':
          'Your services would not be visible to your clients if you have not added any practice address!',
      'id':
          'Layanan Anda tidak akan terlihat oleh klien Anda jika Anda belum menambahkan alamat praktik!',
    },
    'ztdfcrq5': {
      'en': 'Add your practice address via above button or below button.',
      'id':
          'Tambahkan alamat praktik Anda melalui tombol di atas atau tombol di bawah.',
    },
    '9em6jwc6': {
      'en': 'Add new address',
      'id': 'Tambahkan alamat baru',
    },
  },
  // EmptyListOwnedServiceComponent
  {
    '8n75x7cc': {
      'en': 'No Services Found',
      'id': 'Layanan Tidak Ditemukan',
    },
    '6vmm3qmz': {
      'en': 'You do not have any licences yet.',
      'id': 'Anda belum memiliki lisensi apa pun.',
    },
    'hs4a3e33': {
      'en': 'Purchase Licence',
      'id': 'Beli Lisensi',
    },
  },
  // EmptyListTransactionComponent
  {
    'qn0sj7li': {
      'en': 'No Transaction Found',
      'id': 'Transaksi Tidak Ditemukan',
    },
    '0m19peyf': {
      'en': 'You have not made any transactions before.',
      'id': 'Anda belum pernah melakukan transaksi apa pun sebelumnya.',
    },
  },
  // EmptyListModuleContentComponent
  {
    'fywr2w27': {
      'en': 'No Module Contents Found',
      'id': 'Isi Modul Tidak Ditemukan',
    },
    'iwsxydkr': {
      'en': 'Please contact SBCare Admin for more information.',
      'id': 'Silakan hubungi Admin SBCare untuk informasi lebih lanjut.',
    },
  },
  // EmptyListWalletTransactionsComponent
  {
    'ytkvmyv8': {
      'en': 'No SBPay Transactions Found',
      'id': 'Transaksi SBPay Tidak Ditemukan',
    },
    'd37oill3': {
      'en': 'You have not made any SBPay transactions before.',
      'id': 'Anda belum pernah melakukan transaksi SBPay apa pun sebelumnya.',
    },
  },
  // EmptyListWithdrawComponent
  {
    '2bed9p75': {
      'en': 'No Withdraw History Found',
      'id': 'Riwayat Penarikan Saldo Tidak Ditemukan',
    },
  },
  // EmptyListLicenceComponent
  {
    'wnmm33b3': {
      'en': 'No Licences Found',
      'id': 'Lisensi Tidak Ditemukan',
    },
    'h47ev20r': {
      'en': 'You do not have any licences yet.',
      'id': 'Anda belum memiliki lisensi apa pun.',
    },
    '8v8z6xxn': {
      'en': 'Purchase Licence',
      'id': 'Beli Lisensi',
    },
  },
  // EmptyListELearningComponent
  {
    'bibx7fso': {
      'en': 'No E-Learning Found',
      'id': 'E-Learning Tidak Ditemukan',
    },
    'mumjyxxc': {
      'en': 'Please contact SBCare Admin for more information.',
      'id': 'Silakan hubungi Admin SBCare untuk informasi lebih lanjut.',
    },
  },
  // EmptySearchModuleComponent
  {
    'tmbfsxk0': {
      'en': 'No Results Found',
      'id': 'Pencarian Tidak Ditemukan',
    },
    'lf6q5n4m': {
      'en':
          'Try adjusting your search or filter to find what you\'re looking for.',
      'id':
          'Coba sesuaikan pencarian atau filter Anda untuk menemukan apa yang Anda cari.',
    },
  },
  // EmptySearchMyModuleComponent
  {
    'u1z02rpz': {
      'en': 'No Results Found',
      'id': 'Pencarian Tidak Ditemukan',
    },
    'htplt7pa': {
      'en':
          'Try adjusting your search or filter to find what you\'re looking for.',
      'id':
          'Coba sesuaikan pencarian atau filter Anda untuk menemukan apa yang Anda cari.',
    },
  },
  // AppointmentWalkthroughComponent
  {
    'u2015kgd': {
      'en': 'Appointment Schedule',
      'id': 'Jadwal Janji Temu',
    },
    'ary4t2x2': {
      'en': 'Easily schedule your pregnancy consultations.',
      'id': 'Jadwalkan konsultasi kehamilan dengan mudah.',
    },
  },
  // DefaultProviderWalkthroughComponent
  {
    '6f7q5h9q': {
      'en': 'Default Provider',
      'id': 'Mitra Default',
    },
    'bbl8x5o1': {
      'en': 'Gain swift access to your preferred pregnancy provider.',
      'id': 'Dapatkan akses cepat ke mitra layanan kehamilan pilihan Anda.',
    },
  },
  // ELearningWalkthroughComponent
  {
    '4rerqc7q': {
      'en': 'E-Learning',
      'id': 'E-Learning',
    },
    '6wie8vnw': {
      'en':
          'Get pregnancy-related information through interactive learning modules.',
      'id':
          'Dapatkan informasi terkait kehamilan melalui modul pembelajaran interaktif.',
    },
  },
  // OnlineClassScheduleWalkthroughComponent
  {
    'z16vzjea': {
      'en': 'Online Class Schedule',
      'id': 'Jadwal Kelas Online',
    },
    'ieu313w2': {
      'en':
          'View and manage schedules for pregnancy education classes led by professional midwives.',
      'id':
          'Lihat dan kelola jadwal kelas edukasi kehamilan yang dipimpin oleh Bidan profesional.',
    },
  },
  // OnlineClassServiceWalkthroughComponent
  {
    'f2cettmc': {
      'en': 'Online Class Services',
      'id': 'Layanan Kelas Online',
    },
    'mi1vlyej': {
      'en': 'Access various online pregnancy class services flexibly.',
      'id': 'Akses berbagai layanan kelas kehamilan daring secara fleksibel.',
    },
  },
  // SBCareLicenceWalkthroughComponent
  {
    'ahcltulj': {
      'en': 'SBCare Licence',
      'id': 'Lisensi SBCare',
    },
    'eyd1vjjq': {
      'en': 'Purchase available service licences directly through the app.',
      'id': 'Beli lisensi layanan yang tersedia langsung melalui aplikasi.',
    },
  },
  // TransactionHistoryWalkthroughComponent
  {
    'xtfzvmad': {
      'en': 'Transaction History',
      'id': 'Riwayat Transaksi',
    },
    '6pfgatu9': {
      'en': 'Easily view your pregnancy service transactions.',
      'id': 'Lihat transaksi layanan kehamilan Anda dengan mudah.',
    },
  },
  // ContractionTimerWalkthroughComponent
  {
    '21pvqy1r': {
      'en': 'Contraction Timer',
      'id': 'Pengatur Waktu Kontraksi',
    },
    'ugr30jmh': {
      'en':
          'Record the times of your contractions to determine the right time to go to the hospital.',
      'id':
          'Catat waktu kontraksi Anda untuk menentukan waktu yang tepat untuk pergi ke rumah sakit.',
    },
  },
  // PrologueWalkthroughComponent
  {
    'slm6oir3': {
      'en': 'Welcome to Your Pregnancy Companion!',
      'id': 'Selamat Datang di Pendamping Kehamilan Anda!',
    },
    'chaim1km': {
      'en':
          'A trusted app to guide you through every stage of pregnancy with expert health insights and tools.',
      'id':
          'Aplikasi tepercaya untuk memandu Anda melalui setiap tahap kehamilan dengan wawasan dan alat kesehatan dari ahlinya.',
    },
    'yogd3ksr': {
      'en': 'Next',
      'id': '',
    },
  },
  // SBPayWalkthroughComponent
  {
    'qnqnnkez': {
      'en': 'SBPay Balance',
      'id': 'Saldo SBPay',
    },
    'rquyj71l': {
      'en': 'Top up Balance',
      'id': 'Top up Saldo',
    },
    'e5ltn7xf': {
      'en': 'Add funds to your SBPay wallet',
      'id': 'Tambahkan dana ke dompet SBPay Anda',
    },
    '6fhr2984': {
      'en': 'Multiple payment methods available',
      'id': 'Tersedia beberapa metode pembayaran',
    },
    'r8sqr8i9': {
      'en': 'Transfer Funds',
      'id': 'Transfer Saldo',
    },
    'xfak0nfb': {
      'en': 'Send money to other users',
      'id': 'Kirim saldo ke pengguna lain',
    },
    'u1ythqi1': {
      'en': 'Fast and secure transfers',
      'id': 'Transfer cepat dan aman',
    },
    '3c5jnnnj': {
      'en': 'Get Started',
      'id': 'Mulai',
    },
  },
  // ClosingWalkthroughComponent
  {
    'dwu8yd2s': {
      'en': 'Thank you for your attention!',
      'id': 'Terima kasih atas perhatian Anda!',
    },
    '0vkfnjf2': {
      'en':
          'We hope this app supports your pregnancy journey with ease and comfort. Tap \'Next\' to continue or explore the available features. We wish you a healthy and happy pregnancy! ',
      'id':
          'Kami harap aplikasi ini mendukung perjalanan kehamilan Anda dengan mudah dan nyaman. Ketuk \'Berikutnya\' untuk melanjutkan atau menjelajahi fitur-fitur yang tersedia. Semoga kehamilan Anda sehat dan bahagia!',
    },
    'n2t7l51i': {
      'en': 'Next',
      'id': 'Berikutnya',
    },
  },
  // EmptyListVoucherComponent
  {
    '44xwkfpp': {
      'en': 'No History Found',
      'id': 'Riwayat Tidak Ditemukan',
    },
    'e8tols3c': {
      'en': 'You have not created any voucher before.',
      'id': 'Anda belum pernah membuat voucher apapun sebelumnya.',
    },
  },
  // ProfileIntroWalkthroughComponent
  {
    '4dv7n1sy': {
      'en': 'Welcome to Your Profile!',
      'id': 'Selamat Datang di Profil Anda!',
    },
    '86b22hha': {
      'en': 'Manage your account and settings easily here.',
      'id': 'Kelola akun dan pengaturan Anda dengan mudah di sini.',
    },
    'jjzriujk': {
      'en': 'Personal Information',
      'id': 'Informasi Pribadi',
    },
    'n7ln42uc': {
      'en': 'Update your profile details and contact information',
      'id': 'Perbarui detail profil dan informasi kontak Anda',
    },
    '7p5e0701': {
      'en': 'Account Settings',
      'id': 'Pengaturan Akun',
    },
    '3ivq49v3': {
      'en': 'Customize your preferences and notification settings',
      'id': 'Sesuaikan preferensi dan pengaturan notifikasi Anda',
    },
    'giqfcl9q': {
      'en': 'Privacy & Security',
      'id': 'Privasi & Keamanan',
    },
    '5geaqm0m': {
      'en': 'Manage your security settings and privacy controls',
      'id': 'Kelola pengaturan keamanan dan kontrol privasi Anda',
    },
    'vf5nsfjg': {
      'en': 'Next',
      'id': 'Berikutnya',
    },
  },
  // FeatureWalkthroughComponent
  {
    'dz5mohj7': {
      'en': 'Profile',
      'id': 'Profil',
    },
    'aibofy8u': {
      'en': 'View and edit your personal information',
      'id': 'Lihat dan edit informasi pribadi Anda',
    },
    'qlf4mcmr': {
      'en': 'Account',
      'id': 'Akun',
    },
    'uehv339y': {
      'en': 'Manage account settings and security',
      'id': 'Kelola pengaturan dan keamanan akun',
    },
    'bs3ak490': {
      'en': 'Address',
      'id': 'Alamat',
    },
    'iq62ra8l': {
      'en': 'Add or update your home address',
      'id': 'Tambahkan atau perbarui alamat rumah Anda',
    },
    'i36rud4g': {
      'en': 'Notifications',
      'id': 'Notifikasi',
    },
    'pfcgdwlq': {
      'en': 'Customize your notification preferences',
      'id': 'Sesuaikan preferensi notifikasi Anda',
    },
    'j70mebcw': {
      'en': 'Language',
      'id': 'Bahasa',
    },
    '7mvfedsy': {
      'en': 'Select your preferred language',
      'id': 'Pilih bahasa pilihan Anda',
    },
    'uaafu2ya': {
      'en': 'Next',
      'id': 'Berikutnya',
    },
  },
  // CSWalkthroughComponent
  {
    's1ql4048': {
      'en': 'Quick Support',
      'id': 'Dukungan Cepat',
    },
    '06hui7uc': {
      'en':
          'Need help? Contact the SBCare Admin directly via WhatsApp with one click!',
      'id':
          'Butuh bantuan? Hubungi Admin SBCare langsung melalui WhatsApp dengan satu klik!',
    },
    'n09vm1wp': {
      'en': 'Next',
      'id': 'Berikutnya',
    },
  },
  // EmptyListEbookStoreComponent
  {
    'bzlobn2p': {
      'en': 'No Program Found',
      'id': 'Program Tidak Ditemukan',
    },
    'e44jtr9e': {
      'en': 'Please contact SBCare Admin for more information.',
      'id': 'Silakan hubungi Admin SBCare untuk informasi lebih lanjut.',
    },
  },
  // EmptySearchEbookStoreComponent
  {
    'hxnik3oh': {
      'en': 'No Results Found',
      'id': 'Pencarian Tidak Ditemukan',
    },
    'zuwj3x16': {
      'en':
          'Try adjusting your search or filter to find what you\'re looking for.',
      'id':
          'Coba sesuaikan pencarian atau filter Anda untuk menemukan apa yang Anda cari.',
    },
  },
  // ExitPopupComponent
  {
    '9q0ot1f1': {
      'en': 'Are you sure?',
      'id': 'Apa Anda yakin?',
    },
    '9r52ma24': {
      'en': 'You\'re about to close SBCare.',
      'id': 'Anda akan menutup SBCare.',
    },
    '0ww15x7v': {
      'en': 'Cancel',
      'id': 'Batal',
    },
    '0uf42pku': {
      'en': 'Leave',
      'id': 'Keluar',
    },
  },
  // EmptyListMyEbookComponent
  {
    '6nwk4l1u': {
      'en': 'No Program Found',
      'id': 'Program Tidak Ditemukan',
    },
    '47lbhi1c': {
      'en': 'You can purchase a Program in\nProgram menu.',
      'id': 'Anda dapat membeli Program di menu Program.',
    },
    'fp86dysp': {
      'en': 'Purchase Program',
      'id': 'Beli Program',
    },
  },
  // EmptySearchMyEbookComponent
  {
    'pdl8ci0z': {
      'en': 'No Results Found',
      'id': 'Pencarian Tidak Ditemukan',
    },
    's7skn7n7': {
      'en':
          'Try adjusting your search or filter to find what you\'re looking for.',
      'id':
          'Coba sesuaikan pencarian atau filter Anda untuk menemukan apa yang Anda cari.',
    },
  },
  // ELearningDetailSheet
  {
    '9qd1jmnn': {
      'en': 'Module Content',
      'id': 'Konten Modul',
    },
    'htwz84xm': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
  },
  // ELearningDetailSheetPublic
  {
    '36m3nshk': {
      'en': 'Module Content',
      'id': 'Konten Modul',
    },
    'x4ztcwhj': {
      'en': 'Purchase E-Learning',
      'id': 'Beli E-Learning',
    },
  },
  // EmptyListFilteredOwnedServiceComponent
  {
    '53mcaucq': {
      'en': 'No Services Found',
      'id': 'Layanan Tidak Ditemukan',
    },
  },
  // EmptyFilteredLicenceComponent
  {
    '1y9rlyl9': {
      'en': 'No Licences Found',
      'id': 'Lisensi Tidak Ditemukan',
    },
  },
  // EmptyListContractionTimerProComponent
  {
    'yuvbht6m': {
      'en': 'No Contraction Pro Found',
      'id': 'Kontraksi Pro Tidak Ditemukan',
    },
  },
  // HomecareServiceFullDetailsComponent
  {
    'u7vjiwi5': {
      'en': 'Pijat Laktasi Lengkap',
      'id': 'Pijat Laktasi Lengkap',
    },
    '522idmne': {
      'en': 'Description',
      'id': 'Deskripsi',
    },
    'qtixy15r': {
      'en': 'Close',
      'id': 'Tutup',
    },
  },
  // SignInPopUpComponent
  {
    'vmxxfpqk': {
      'en': 'Sign In',
      'id': '',
    },
    '5ova9srk': {
      'en': 'Don\'t have an account?',
      'id': 'Belum memiliki akun?',
    },
    'z3c3qx83': {
      'en': 'Sign up',
      'id': 'Daftar',
    },
  },
  // Miscellaneous
  {
    'yjacmasa': {
      'en': 'Allow SBCare to access your camera?',
      'id': 'Izinkan SBCare mengakses kamera Anda?',
    },
    'ui5ehtxb': {
      'en': 'Allow SBCare to access your photos and media?',
      'id': 'Izinkan SBCare mengakses foto dan media Anda?',
    },
    'loo1ywm3': {
      'en': '',
      'id': '',
    },
    'kkz1gsh6': {
      'en': 'Password reset email sent!',
      'id': 'Email pengaturan ulang kata sandi telah terkirim!',
    },
    'pyc0mgks': {
      'en': 'Email required!',
      'id': 'Email dibutuhkan!',
    },
    '9grz03ev': {
      'en': 'Phone number required and has to start with +.',
      'id': 'Nomor telepon diperlukan dan harus dimulai dengan +.',
    },
    'kab5ysme': {
      'en': 'Passwords don\'t match',
      'id': 'Kata sandi tidak cocok',
    },
    'clmr7tb8': {
      'en': 'Enter SMS verification code',
      'id': 'Masukkan kode verifikasi SMS',
    },
    '5xfklfby': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
      'id':
          'Sudah lama sejak terakhir kali masuk. Masuk lagi sebelum menghapus akun Anda.',
    },
    'iopip3na': {
      'en':
          'Too long since most recent sign in. Sign in again before updating your email.',
      'id':
          'Sudah lama sejak terakhir kali masuk. Masuk lagi sebelum memperbarui email Anda.',
    },
    'hgpm2mqx': {
      'en': 'Email change confirmation email sent!',
      'id': 'Email konfirmasi perubahan telah terkirim!',
    },
    'ekyhmi38': {
      'en': 'Email already in use by another account',
      'id': 'Email sudah digunakan oleh akun lain',
    },
    'y3ggqb3z': {
      'en':
          'The supplied auth credential is incorrect, malformed or has expired',
      'id':
          'Kredensial autentikasi yang diberikan salah, salah format, atau telah kedaluwarsa',
    },
    'hejz0izb': {
      'en': '',
      'id': '',
    },
    'aqynu9po': {
      'en': '',
      'id': '',
    },
    'r7zqfo3w': {
      'en': '',
      'id': '',
    },
    'gg9gqw0k': {
      'en': '',
      'id': '',
    },
    'yprk7xyg': {
      'en': '',
      'id': '',
    },
    's70ddxr7': {
      'en': '',
      'id': '',
    },
    'wj71oox3': {
      'en': '',
      'id': '',
    },
    'i4jtipcr': {
      'en': '',
      'id': '',
    },
    'xo71mnue': {
      'en': '',
      'id': '',
    },
    '3sm4isut': {
      'en': '',
      'id': '',
    },
    '0pvzvfg4': {
      'en': '',
      'id': '',
    },
    'ps0n7qh2': {
      'en': '',
      'id': '',
    },
    'pe21d6if': {
      'en': '',
      'id': '',
    },
    'a1ojomau': {
      'en': '',
      'id': '',
    },
    'ptq6o7os': {
      'en': '',
      'id': '',
    },
  },
].reduce((a, b) => a..addAll(b));
