import 'package:equatable/equatable.dart';

import '../../common/extensions/extensions.dart';
import 'base_model.dart';

class PaginationModel<T extends BaseModel> extends Equatable {
  final num? currentPage;
  final List<T> data;
  final String? firstPageUrl;
  final num? from;
  final num? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final num? perPage;
  final dynamic prevPageUrl;
  final num? to;
  final num? total;

  const PaginationModel({
    this.currentPage,
    this.data = const [],
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory PaginationModel.fromJson(
      Map<String, Object?> json, T Function(Map<String, Object?>) fromJson) {
    return PaginationModel(
      currentPage: json['current_page'].toNum(),
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => fromJson(e as Map<String, Object?>))
              .toList() ??
          [],
      firstPageUrl: json['first_page_url'].toStringX(),
      from: json['from'].toNum(),
      lastPage: json['last_page'].toNum(),
      lastPageUrl: json['last_page_url'].toStringX(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, Object?>))
          .toList(),
      nextPageUrl: json['next_page_url'] as dynamic,
      path: json['path'].toStringX(),
      perPage: json['per_page'].toNum(),
      prevPageUrl: json['prev_page_url'] as dynamic,
      to: json['to'].toNum(),
      total: json['total'].toNum(),
    );
  }

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'data': data.map((e) => e.toJson()).toList(),
        'first_page_url': firstPageUrl,
        'from': from,
        'last_page': lastPage,
        'last_page_url': lastPageUrl,
        'links': links?.map((e) => e.toJson()).toList(),
        'next_page_url': nextPageUrl,
        'path': path,
        'per_page': perPage,
        'prev_page_url': prevPageUrl,
        'to': to,
        'total': total,
      };

  PaginationModel copyWith({
    int? currentPage,
    List<T>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) {
    return PaginationModel(
      currentPage: currentPage ?? this.currentPage,
      data: data ?? this.data,
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      links: links ?? this.links,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      prevPageUrl: prevPageUrl ?? this.prevPageUrl,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  @override
  List<Object?> get props {
    return [
      currentPage,
      data,
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      links,
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total,
    ];
  }
}

class Link extends Equatable {
  final dynamic url;
  final String? label;
  final bool? active;

  const Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, Object?> json) => Link(
        url: json['url'] as dynamic,
        label: json['label'].toStringX(),
        active: json['active'].toBool(),
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'label': label,
        'active': active,
      };

  Link copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) {
    return Link(
      url: url ?? this.url,
      label: label ?? this.label,
      active: active ?? this.active,
    );
  }

  @override
  List<Object?> get props => [url, label, active];
}
