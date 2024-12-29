// ignore_for_file: constant_identifier_names
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;
  static late SupabaseClient _supabase;

  /// For Test DB
  static const String SUPABASE_URL =  "https://kgaoxylznephgkrlkadi.supabase.co";
  static const String SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtnYW94eWx6bmVwaGdrcmxrYWRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzExNzAyNDEsImV4cCI6MjA0Njc0NjI0MX0.gW-EKJlsrYtJPgd47LeM52Xr0LCVQrNzf14OVDPzLUQ";

  static SharedPreferences getInstance() => _preferences;

  static SupabaseClient getInstanceSupabase() => _supabase;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> initSupaBase() async {
    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY,
    );
    _supabase = Supabase.instance.client;
  }


  static void clearAllCash() {
    _preferences.clear();
  }
}
