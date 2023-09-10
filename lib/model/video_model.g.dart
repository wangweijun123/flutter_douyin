// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
// // "id": "1", "url": "xx", "playCount"
VideoModel _$VideoFromJson(Map<String, dynamic> json) => VideoModel(
      id: json['id'] as String,
      url: json['url'] as String,
      playCount: json['playCount'] as int,
      isLike: json['isLike'] ?? false,
    );

Map<String, dynamic> _$VideoToJson(VideoModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'playCount': instance.id,
    };
