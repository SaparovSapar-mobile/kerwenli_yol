/// Türkmen harplaryny adaty harplara öwürýär: klawiaturada ä/ň/ş ýok bolsa-da
/// "sohlat" ýazyp "Şöhlat" tapyp bolýar.
const Map<String, String> _foldMap = {
  'ä': 'a',
  'ý': 'y',
  'ň': 'n',
  'ö': 'o',
  'ü': 'u',
  'ş': 's',
  'ç': 'c',
  'ž': 'z',
  'ğ': 'g',
  'ı': 'i',
  'İ': 'i',
  'ё': 'е',
};

String _normalize(String text) {
  final String lower = text.toLowerCase();
  final StringBuffer buffer = StringBuffer();

  for (final String char in lower.split('')) {
    buffer.write(_foldMap[char] ?? char);
  }

  return buffer.toString();
}

/// true, eger [values] - iň haýsydyr biri [query] - i saklaýan bolsa.
/// Boş query - hemmesi geçýär.
/// Ähli dillerdäki atlary deňeşdirýäris, sebäbi maglumat garyşyk bolup bilýär:
/// programmanyň dili türkmen bolsa-da at diňe rusça ýazylan bolup biler.
bool matchesSearchQuery(String query, List<String> values) {
  final String needle = _normalize(query.trim());
  if (needle.isEmpty) return true;

  for (final String value in values) {
    if (value.isEmpty) continue;
    if (_normalize(value).contains(needle)) return true;
  }

  return false;
}
