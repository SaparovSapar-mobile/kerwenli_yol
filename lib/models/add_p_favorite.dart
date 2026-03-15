class AddPFavoriteModel {
  final String userId, productId;

  AddPFavoriteModel({required this.userId, required this.productId});

  Map<String, dynamic> toJson() {
    return {'user_uuid': userId, 'product_uuid': productId};
  }
}
