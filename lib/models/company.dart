import 'package:kerwenli_yol/models/maps.dart';
import 'package:kerwenli_yol/models/opportunity.dart';
import 'package:kerwenli_yol/models/qr_code.dart';
import 'package:kerwenli_yol/models/social.dart';
import 'package:kerwenli_yol/models/taxi_number.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/models/vr.dart';
import 'package:kerwenli_yol/models/working_time.dart';

class FollowedCompanyModel {
  final String id, logoImg, categoryId;
  final TranslationModel businessName, categoryName, publicationLabel;

  FollowedCompanyModel({
    required this.id,
    required this.logoImg,
    required this.categoryId,
    required this.businessName,
    required this.categoryName,
    required this.publicationLabel,
  });

  factory FollowedCompanyModel.fromJson(Map<String, dynamic> json) {
    return FollowedCompanyModel(
      id: json['uuid'] ?? '',
      logoImg: json['logo_img'] ?? '',
      categoryId: json['category_uuid'] ?? '',
      businessName: json['business_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['business_name']),
      categoryName: json['category_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['category_name']),
      publicationLabel: json['publication_label'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['publication_label']),
    );
  }
}

class CompanyModel {
  final String uuid,
      individualUuid,
      photo,
      nameTm,
      nameRu,
      nameEn,
      publicationLabelTm,
      publicationLabelRu,
      publicationLabelEn;
  final bool isFollowed, isBookmarked;
  final TranslationModel categoryName;

  CompanyModel({
    required this.uuid,
    required this.individualUuid,
    required this.photo,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
    required this.isFollowed,
    required this.isBookmarked,
    required this.categoryName,
    required this.publicationLabelTm,
    required this.publicationLabelRu,
    required this.publicationLabelEn,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      uuid: json['uuid'] ?? '',
      individualUuid: json['individual_uuid'] ?? '',
      photo: json['photo'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
      isFollowed: json['is_followed'] ?? false,
      isBookmarked: json['is_bookmarked'] ?? false,
      categoryName: json['category_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['category_name']),
      publicationLabelTm: json['publication_label_tm'] ?? '',
      publicationLabelRu: json['publication_label_ru'] ?? '',
      publicationLabelEn: json['publication_label_en'] ?? '',
    );
  }
}

class CompanyDetailModel {
  final String id;
  final MainInfoModel mainInfo;
  final TranslationModel businessName, description, address, categoryName;
  final CompContactModel contact;
  final List<dynamic> banners;
  final OpportunityModel opportunity;
  final List<WorkingTimeModel> workingTimes;
  final QrCodeModel qrCode;
  final MapsModel maps;
  final VrModel vr;
  final TaxiNumberModel taxiNumber;
  final bool isFollowed, isBookmarked;

  CompanyDetailModel({
    required this.id,
    required this.mainInfo,
    required this.businessName,
    required this.description,
    required this.address,
    required this.contact,
    required this.banners,
    required this.opportunity,
    required this.workingTimes,
    required this.qrCode,
    required this.maps,
    required this.vr,
    required this.taxiNumber,
    required this.isFollowed,
    required this.isBookmarked,
    required this.categoryName,
  });

  factory CompanyDetailModel.defaultValue() {
    return CompanyDetailModel(
      id: '',
      mainInfo: MainInfoModel.defaultValue(),
      businessName: TranslationModel.defaultValue(),
      categoryName: TranslationModel.defaultValue(),
      description: TranslationModel.defaultValue(),
      address: TranslationModel.defaultValue(),
      contact: CompContactModel.defaultValue(),
      banners: [],
      opportunity: OpportunityModel.defaultValue(),
      workingTimes: [],
      qrCode: QrCodeModel.defaultValue(),
      maps: MapsModel.defaultValue(),
      vr: VrModel.defaultValue(),
      taxiNumber: TaxiNumberModel.defaultValue(),
      isBookmarked: false,
      isFollowed: false,
    );
  }

  factory CompanyDetailModel.fromJson(Map<String, dynamic> json) {
    return CompanyDetailModel(
      id: json['uuid'] ?? '',
      mainInfo: json['main_info'] == null
          ? MainInfoModel.defaultValue()
          : MainInfoModel.fromJson(json['main_info']),
      businessName: json['business_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['business_name']),
      description: json['description'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['description']),
      categoryName: json['category_name'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['category_name']),
      address: json['address'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['address']),
      contact: json['contact'] == null
          ? CompContactModel.defaultValue()
          : CompContactModel.fromJson(json['contact']),
      banners: json['banners'] ?? [],
      opportunity: json['opportunity'] == null
          ? OpportunityModel.defaultValue()
          : OpportunityModel.fromJson(json['opportunity']),
      workingTimes: json['working_time'] == null || json['working_time'] == []
          ? []
          : List<WorkingTimeModel>.from(
              json['working_time'].map(
                (dataJson) => WorkingTimeModel.fromJson(dataJson),
              ),
            ),
      qrCode: json['qr_code'] == null
          ? QrCodeModel.defaultValue()
          : QrCodeModel.fromJson(json['qr_code']),
      maps: json['maps'] == null
          ? MapsModel.defaultValue()
          : MapsModel.fromJson(json['maps']),
      vr: json['vr'] == null
          ? VrModel.defaultValue()
          : VrModel.fromJson(json['vr']),
      taxiNumber: json['taxi_number'] == null
          ? TaxiNumberModel.defaultValue()
          : TaxiNumberModel.fromJson(json['taxi_number']),
      isFollowed: json['is_followed'] ?? false,
      isBookmarked: json['is_bookmarked'] ?? false,
    );
  }
}

class CompContactModel {
  final List<dynamic> phones;
  final List<SocialModel> socials;

  CompContactModel({required this.phones, required this.socials});

  factory CompContactModel.defaultValue() {
    return CompContactModel(phones: [], socials: []);
  }

  factory CompContactModel.fromJson(Map<String, dynamic> json) {
    return CompContactModel(
      phones: json['phones'] ?? [],
      socials: json['social'] == null || json['social'] == []
          ? []
          : List<SocialModel>.from(
              json['social'].map((dataJson) => SocialModel.fromJson(dataJson)),
            ),
    );
  }
}

class MainInfoModel {
  final String logoImg, invoiceDate, categoryId, publicationId, countryId;
  final List<dynamic> sub;

  MainInfoModel({
    required this.logoImg,
    required this.invoiceDate,
    required this.categoryId,
    required this.publicationId,
    required this.countryId,
    required this.sub,
  });

  factory MainInfoModel.defaultValue() {
    return MainInfoModel(
      logoImg: '',
      invoiceDate: '',
      categoryId: '',
      publicationId: '',
      countryId: '',
      sub: [],
    );
  }

  factory MainInfoModel.fromJson(Map<String, dynamic> json) {
    return MainInfoModel(
      logoImg: json['logo_img'] ?? '',
      invoiceDate: json['invoice_date'] ?? '',
      categoryId: json['category_id'] ?? '',
      publicationId: json['publication_id'] ?? '',
      countryId: json['country_id'] ?? '',
      sub: json['sub'] ?? [],
    );
  }
}
