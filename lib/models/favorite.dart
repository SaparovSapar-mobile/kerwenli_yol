import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final String id, type;

  const FavoriteModel({required this.id, required this.type});

  Map<String, dynamic> toMap() {
    return {'id': id, 'type': type};
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'favorite_type': type};
  }

  @override
  List<Object?> get props => [id, type];
}
