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

List<ExampleProductCard> homeProducts = [
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
  ),
  ExampleProductCard(
    forVip: false,
    forNew: true,
    forExport: false,
    forVirtual: true,
    isOpen: true,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: true,
    forVirtual: false,
    isOpen: true,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: true,
    forExport: true,
    forVirtual: true,
    isOpen: false,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
  ),
  ExampleProductCard(
    forVip: true,
    forNew: false,
    forExport: false,
    forVirtual: false,
    isOpen: false,
  ),
];

class ExampleProductCard {
  final bool forVip, forNew, forExport, forVirtual, isOpen;

  ExampleProductCard({
    required this.forVip,
    required this.forNew,
    required this.forExport,
    required this.forVirtual,
    required this.isOpen,
  });
}
