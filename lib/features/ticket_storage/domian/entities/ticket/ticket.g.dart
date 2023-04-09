// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ticket _$$_TicketFromJson(Map<String, dynamic> json) => _$_Ticket(
      url: json['url'] as String,
      downloadStarted: json['downloadStarted'] == null
          ? false
          : booleanFromInt(json['downloadStarted'] as int),
      downloaded: json['downloaded'] == null
          ? false
          : booleanFromInt(json['downloaded'] as int),
      totalSize: json['totalSize'] as int? ?? 1,
      downloadedSize: json['downloadedSize'] as int? ?? 0,
      errorOnDownloading: json['errorOnDownloading'] == null
          ? false
          : booleanFromInt(json['errorOnDownloading'] as int),
    );

Map<String, dynamic> _$$_TicketToJson(_$_Ticket instance) => <String, dynamic>{
      'url': instance.url,
      'downloadStarted': booleanToInt(instance.downloadStarted),
      'downloaded': booleanToInt(instance.downloaded),
      'totalSize': instance.totalSize,
      'downloadedSize': instance.downloadedSize,
      'errorOnDownloading': booleanToInt(instance.errorOnDownloading),
    };
