import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class PaginateDto extends Equatable {
  final int page;
  final int limit;
  final String? search;

  const PaginateDto({
    this.page = 1,
    this.limit = 20,
    this.search,
  });

  @override
  List<Object?> get props => [page, limit, search];

  PaginateDto copyWith({
    int? page,
    int? limit,
    ValueGetter<String?>? search,
  }) {
    return PaginateDto(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      search: search != null ? search() : this.search,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'limit': limit,
      'search': search,
    };
  }

  factory PaginateDto.fromMap(Map<String, dynamic> map) {
    return PaginateDto(
      page: map['page']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
      search: map['search'],
    );
  }
}
