import 'package:json_annotation/json_annotation.dart';

// 注意写这个以及是文件名的名字person_model
part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  /// The generated code assumes these values exist in JSON.
  final String id, url;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final int playCount;

  VideoModel({required this.id, required this.url, required this.playCount});

  // 1 fromJson本身是一个构造函数, 加上factory变成了工厂方法
  factory VideoModel.fromJson(Map<String, dynamic> map) => _$VideoFromJson(map);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  String toString() {
    return 'VideoModel{id: $id, url: $url, playCount: $playCount}';
  }
}
