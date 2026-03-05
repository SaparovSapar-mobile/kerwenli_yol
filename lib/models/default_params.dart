import 'package:equatable/equatable.dart';

class DefaultParams extends Equatable {
  final int? page, pageSize;

  const DefaultParams({this.page, this.pageSize});

  @override
  List<Object?> get props => [page, pageSize];
}
