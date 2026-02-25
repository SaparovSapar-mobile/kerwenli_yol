import 'package:kerwenli_yol/enums/banner_type.dart';
import 'package:kerwenli_yol/models/banner.dart';

List<List<BannerModel>> sortBannerTypes(List<BannerModel> all) {
  final Map<String, List<BannerModel>> grouped = {
    BannerType.type1: [],
    BannerType.type2: [],
    BannerType.type3: [],
    BannerType.type4: [],
  };

  for (final BannerModel b in all) {
    (grouped[b.type] ??= []).add(b);
  }

  // Type1 -> Type4 sırasıyla boş olmayanları al
  final ordered = <List<BannerModel>>[
    grouped[BannerType.type1]!,
    grouped[BannerType.type2]!,
    grouped[BannerType.type3]!,
    grouped[BannerType.type4]!,
  ].where((lst) => lst.isNotEmpty).toList();

  // UI'da 4 slot var: eksikse boş liste ekleyelim
  while (ordered.length < 4) {
    ordered.add(<BannerModel>[]);
  }

  return ordered.take(4).toList(); // [slot1, slot2, slot3, slot4]
}
