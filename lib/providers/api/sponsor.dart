import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/services/api/sponsor.dart';

final Provider<SponsorApiService> sponsorApiProvider =
    Provider<SponsorApiService>((ref) => SponsorApiService());
