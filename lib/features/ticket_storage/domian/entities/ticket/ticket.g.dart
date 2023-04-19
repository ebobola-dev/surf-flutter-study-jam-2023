// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      url: json['url'] as String,
      downloadingStatus: $enumDecodeNullable(
              _$DownloadingStatusEnumMap, json['downloadingStatus']) ??
          DownloadingStatus.notStarted,
      totalSize: json['totalSize'] as int? ?? 1,
      downloadedSize: json['downloadedSize'] as int? ?? 0,
      savedFileFullPath: json['savedFileFullPath'] as String,
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'url': instance.url,
      'downloadingStatus':
          _$DownloadingStatusEnumMap[instance.downloadingStatus]!,
      'totalSize': instance.totalSize,
      'downloadedSize': instance.downloadedSize,
      'savedFileFullPath': instance.savedFileFullPath,
    };

const _$DownloadingStatusEnumMap = {
  DownloadingStatus.notStarted: 'not_started',
  DownloadingStatus.inProgress: 'in_progress',
  DownloadingStatus.downloaded: 'downloaded',
  DownloadingStatus.canceledByUser: 'canceled_by_user',
  DownloadingStatus.hasError: 'has_error',
};
