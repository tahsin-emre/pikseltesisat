extension StringExt on String {
  List<String> get generateSearchIndex {
    final keywords = <String>[];
    final texts = toLowerCase().split(' ');
    for (final text in texts) {
      for (var i = 0; i < text.length; i++) {
        for (var j = i + 3; j <= text.length; j++) {
          keywords.add(text.substring(i, j));
        }
      }
    }
    return keywords;
  }
}
