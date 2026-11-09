import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://vagnvzvfcsyuicmsjjdy.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZhZ252enZmY3N5dWljbXNqamR5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk3MTExMzUsImV4cCI6MjA5NTI4NzEzNX0.u0sEYe6kPb7kgdn5ij3Eg3yx514cz_wGFcIqgbYpv6w';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        headers: {'X-Client-Info': 'flutterflow'},
        debug: false,
        authOptions:
            FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
