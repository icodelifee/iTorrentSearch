enum SearchProvider {
  leetX,
  // kat,
  piratebay,
  // snowFL,
  // lime,
  // rarbg,
}

extension XSearchProvider on SearchProvider {
  String get title {
    switch (this) {
      case SearchProvider.leetX:
        return '1337x';
      // case SearchProvider.kat:
      //   return 'Kickass';
      case SearchProvider.piratebay:
        return 'Piratebay';
      // case SearchProvider.snowFL:
      //   return 'SnowFL';
      // case SearchProvider.lime:
      //   return 'Lime Torrent';
      // case SearchProvider.rarbg:
      //   return 'RARBG';
    }
  }
}
