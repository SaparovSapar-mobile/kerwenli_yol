List<String> homeBanners = [
  'assets/examples/home_banner.png',
  'assets/examples/home_banner_1.png',
  'assets/examples/home_banner.png',
  'assets/examples/home_banner_1.png',
];

List<String> homeParts = [
  'Söwda nokatlar',
  'Hyzmatlar',
  'Syýahat',
  'Medeniýet',
  'Kärhanalar',
  'Syýahat',
  'Hyzmatlar',
];

List<String> headerCategories = [
  'All',
  'Et Onumleri',
  'Esikler',
  'Penoplast Onumleri',
  'Daslar',
  'Balyklar',
  'Rezinler',
];

List<ExampleProductCard> homeProducts = [
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
    images: [1],
  ),
  ExampleProductCard(
    forVip: false,
    forNew: true,
    forExport: false,
    forVirtual: true,
    isOpen: true,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: true,
    forVirtual: false,
    isOpen: true,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: true,
    forExport: true,
    forVirtual: true,
    isOpen: false,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
    images: [1, 2, 3],
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
    images: [1, 2, 3],
  ),
];

class ExampleProductCard {
  final bool forVip, forNew, forExport, forVirtual, isOpen;
  final List<int> images;

  ExampleProductCard({
    required this.forVip,
    required this.forNew,
    required this.forExport,
    required this.forVirtual,
    required this.isOpen,
    required this.images,
  });
}
