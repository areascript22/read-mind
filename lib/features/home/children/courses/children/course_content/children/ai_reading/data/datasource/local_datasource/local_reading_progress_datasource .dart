import 'package:shared_preferences/shared_preferences.dart';

class LocalReadingProgressDataSource {
  final SharedPreferences sharedPreferences;

  LocalReadingProgressDataSource({required this.sharedPreferences});

  static const String _aiReadingKey = 'activity_completed_aiReading';
  static const String _paraphraseKey = 'activity_completed_paraphrase';
  static const String _mainIdeaKey = 'activity_completed_mainIdea';
  static const String _summaryKey = 'activity_completed_summary';

  // ───────────────────────────────
  // AI READING
  // ───────────────────────────────
  Future<bool> setAiReadingCompleted(bool completed, int activityId) async {
    return await sharedPreferences.setBool(
      '_aiReadingKey_$activityId',
      completed,
    );
  }

  bool isAiReadingCompleted(int activityId) {
    return sharedPreferences.getBool('_aiReadingKey_$activityId') ?? false;
  }

  Future<bool> clearAiReadingProgress(int activityId) async {
    return await sharedPreferences.remove(_aiReadingKey);
  }

  // ───────────────────────────────
  // PARAPHRASE
  // ───────────────────────────────
  Future<bool> setParaphraseCompleted(bool completed, int activityId) async {
    return await sharedPreferences.setBool(_paraphraseKey, completed);
  }

  bool isParaphraseCompleted(int activityId) {
    return sharedPreferences.getBool(_paraphraseKey) ?? false;
  }

  Future<bool> clearParaphraseProgress(int activityId) async {
    return await sharedPreferences.remove(_paraphraseKey);
  }

  // ───────────────────────────────
  // MAIN IDEA
  // ───────────────────────────────
  Future<bool> setMainIdeaCompleted(bool completed, int activityId) async {
    return await sharedPreferences.setBool(_mainIdeaKey, completed);
  }

  bool isMainIdeaCompleted(int activityId) {
    return sharedPreferences.getBool(_mainIdeaKey) ?? false;
  }

  Future<bool> clearMainIdeaProgress(int activityId) async {
    return await sharedPreferences.remove(_mainIdeaKey);
  }

  // ───────────────────────────────
  // SUMMARY
  // ───────────────────────────────
  Future<bool> setSummaryCompleted(bool completed, int activityId) async {
    return await sharedPreferences.setBool(_summaryKey, completed);
  }

  bool isSummaryCompleted(int activityId) {
    return sharedPreferences.getBool(_summaryKey) ?? false;
  }

  Future<bool> clearSummaryProgress(int activityId) async {
    return await sharedPreferences.remove(_summaryKey);
  }
}
