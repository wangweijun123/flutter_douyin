import 'dart:convert';

import '../model/service_data.dart';
import '../model/video_model.dart';
import '../util/log_util.dart';

class FirstPageController {
  var dataList = <VideoModel>[];
  // 模拟网络
  Future<void> fetchVideoList() async {
    myPrint('$hashCode  ,Awaiting get video list...');
    var list = await _fetchVideoList();
    dataList.addAll(list);
    myPrint('result finished:');
  }

  Future<List<VideoModel>> _fetchVideoList() {
    return Future.delayed(const Duration(seconds: 3), () {
      List<VideoModel> result = [];
      final List<dynamic> dataList = jsonDecode(jsonArray);
      for (dynamic jsonItem in dataList) {
        VideoModel item = VideoModel.fromJson(jsonItem);
        result.add(item);
      }
      return result;
    });
  }
}
