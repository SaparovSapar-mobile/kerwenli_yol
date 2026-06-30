String formatLogin(String input) {
  final trimmed = input.trim();

  if (trimmed.contains('@')) {
    return trimmed;
  }

  final cleaned = trimmed.replaceAll(RegExp(r'[\s-]'), '');

  if (cleaned.startsWith('+993')) return cleaned;
  if (cleaned.startsWith('993')) return '+$cleaned';
  return '+993$cleaned';
}