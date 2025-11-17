class TranslationEntity {
  final int id;
  final String sourceText;
  final String translated;
  final String sourceLang;
  final String targetLang;
  final DateTime createdAt;
  final int timesUsed;

  TranslationEntity({
    required this.id,
    required this.sourceText,
    required this.translated,
    required this.sourceLang,
    required this.targetLang,
    required this.createdAt,
    required this.timesUsed,
  });
}
