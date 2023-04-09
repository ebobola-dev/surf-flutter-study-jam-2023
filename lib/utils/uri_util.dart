class UriUtil {
  static bool isValidPdfUri(String uri) {
    try {
      Uri.parse(uri);
      final filename = getFilenameFromUri(uri);
      final filenameExt = filename.split('.').last;
      if (filenameExt != 'pdf') {
        return false;
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  static String getFilenameFromUri(String uri) => uri.split('/').last;
}
