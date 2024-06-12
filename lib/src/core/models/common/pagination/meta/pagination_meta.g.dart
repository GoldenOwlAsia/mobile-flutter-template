// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MPaginationMetaImpl _$$MPaginationMetaImplFromJson(
        Map<String, dynamic> json) =>
    _$MPaginationMetaImpl(
      pageSize: (json['page_size'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      pageNumber: (json['page_number'] as num).toInt(),
      prevPage: (json['prev_page'] as num?)?.toInt() ?? 0,
      nextPage: (json['next_page'] as num?)?.toInt() ?? 0,
      lastPage: (json['last_page'] as num).toInt(),
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
