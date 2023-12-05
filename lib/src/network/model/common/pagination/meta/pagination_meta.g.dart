// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MPaginationMetaImpl _$$MPaginationMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$MPaginationMetaImpl(
      pageSize: json['page_size'] as int,
      totalCount: json['total_count'] as int,
      pageNumber: json['page_number'] as int,
      prevPage: json['prev_page'] as int? ?? 0,
      nextPage: json['next_page'] as int? ?? 0,
      lastPage: json['last_page'] as int,
    );

Map<String, dynamic> _$$MPaginationMetaImplToJson(
        _$MPaginationMetaImpl instance) =>
    <String, dynamic>{
      'page_size': instance.pageSize,
      'total_count': instance.totalCount,
      'page_number': instance.pageNumber,
      'prev_page': instance.prevPage,
      'next_page': instance.nextPage,
      'last_page': instance.lastPage,
    };
