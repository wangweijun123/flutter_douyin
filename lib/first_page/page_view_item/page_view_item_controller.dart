import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/video_model.dart';

class PageViewItemController extends GetxController {
  var _likeIconUrl = ''.obs;

  String get likeIconUrl => _likeIconUrl.value;

  set likeIconUrl(String url) => _likeIconUrl.value = url;
}
