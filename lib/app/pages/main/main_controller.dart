import 'package:get/get.dart';

import '../../../base/controller/common_controller.dart';
import 'main_state.dart';

class MainController extends CommonController<MainState> {
  final MainState state = MainState();

  MainController(String tag){
    controllerTag = tag;
  }
  @override
  MainState createState() {
   return state;
  }
}
