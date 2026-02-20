import 'package:kerwenli_yol/models/product.dart';

class NewProductModel {
  final String id, companyId;
  final List<ProductModel> products;

  NewProductModel({
    required this.id,
    required this.companyId,
    required this.products,
  });

  factory NewProductModel.defaultValue() {
    return NewProductModel(id: '', companyId: '', products: []);
  }

  factory NewProductModel.fromJson(Map<String, dynamic> json) {
    return NewProductModel(
      id: json['uuid'] ?? '',
      companyId: json['company_uuid'] ?? '',
      products: json['products'] == null || json['products'] == []
          ? []
          : List<ProductModel>.from(
              json['products'].map(
                (dataJson) => ProductModel.fromJson(dataJson),
              ),
            ),
    );
  }
}
