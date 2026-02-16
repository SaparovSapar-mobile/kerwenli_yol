import 'package:kerwenli_yol/models/maps.dart';
import 'package:kerwenli_yol/models/opportunity.dart';
import 'package:kerwenli_yol/models/qr_code.dart';
import 'package:kerwenli_yol/models/social.dart';
import 'package:kerwenli_yol/models/taxi_number.dart';
import 'package:kerwenli_yol/models/translation.dart';
import 'package:kerwenli_yol/models/vr.dart';
import 'package:kerwenli_yol/models/working_time.dart';

class CompanyModel {
  final String uuid, individualUuid, photo, nameTm, nameRu, nameEn;

  CompanyModel({
    required this.uuid,
    required this.individualUuid,
    required this.photo,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      uuid: json['uuid'],
      individualUuid: json['individual_uuid'],
      photo: json['photo'] ?? '',
      nameTm: json['name_tm'] ?? '',
      nameRu: json['name_ru'] ?? '',
      nameEn: json['name_en'] ?? '',
    );
  }
}

class CompanyDetailModel {
  final String id;
  final MainInfoModel mainInfo;
  final TranslationModel businessName;
  final TranslationModel description;
  final TranslationModel address;
  final CompContactModel contact;

  CompanyDetailModel({
    required this.id,
    required this.mainInfo,
    required this.businessName,
    required this.description,
    required this.address,
    required this.contact,
  });

  factory CompanyDetailModel.defaultValue() {
    return CompanyDetailModel(
      id: '',
      mainInfo: MainInfoModel.defaultValue(),
      businessName: TranslationModel.defaultValue(),
      description: TranslationModel.defaultValue(),
      address: TranslationModel.defaultValue(),
      contact: CompContactModel.defaultValue(),
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
      address: json['address'] == null
          ? TranslationModel.defaultValue()
          : TranslationModel.fromJson(json['address']),
      contact: json['contact'] == null
          ? CompContactModel.defaultValue()
          : CompContactModel.fromJson(json['contact']),
    );
  }
}

class CompContactModel {
  final List<dynamic> phones, banners;
  final List<SocialModel> socials;
  final OpportunityModel opportunity;
  final List<WorkingTimeModel> workingTimes;
  final QrCodeModel qrCode;
  final MapsModel maps;
  final VrModel vr;
  final TaxiNumberModel taxiNumber;

  CompContactModel({
    required this.phones,
    required this.banners,
    required this.socials,
    required this.opportunity,
    required this.workingTimes,
    required this.qrCode,
    required this.maps,
    required this.vr,
    required this.taxiNumber,
  });

  factory CompContactModel.defaultValue() {
    return CompContactModel(
      phones: [],
      banners: [],
      socials: [],
      opportunity: OpportunityModel.defaultValue(),
      workingTimes: [],
      qrCode: QrCodeModel.defaultValue(),
      maps: MapsModel.defaultValue(),
      vr: VrModel.defaultValue(),
      taxiNumber: TaxiNumberModel.defaultValue(),
    );
  }

  factory CompContactModel.fromJson(Map<String, dynamic> json) {
    return CompContactModel(
      phones: json['phones'] ?? [],
      banners: json['banners'] ?? [],
      socials: json['social'] == null || json['social'] == []
          ? []
          : List<SocialModel>.from(
              json['social'].map((dataJson) => SocialModel.fromJson(dataJson)),
            ),
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
    );
  }
}

class MainInfoModel {
  final String logoImg, invoiceDate, categoryId, publicationId, countryId;

  MainInfoModel({
    required this.logoImg,
    required this.invoiceDate,
    required this.categoryId,
    required this.publicationId,
    required this.countryId,
  });

  factory MainInfoModel.defaultValue() {
    return MainInfoModel(
      logoImg: '',
      invoiceDate: '',
      categoryId: '',
      publicationId: '',
      countryId: '',
    );
  }

  factory MainInfoModel.fromJson(Map<String, dynamic> json) {
    return MainInfoModel(
      logoImg: json['logo_img'] ?? '',
      invoiceDate: json['invoice_date'] ?? '',
      categoryId: json['category_id'] ?? '',
      publicationId: json['publication_id'] ?? '',
      countryId: json['country_id'] ?? '',
    );
  }
}
