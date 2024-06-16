import 'package:get/get.dart';

import '../../../base/controller/common_controller.dart';
import 'main_state.dart';

class MainController extends CommonController<MainState> {
  final MainState state = MainState();

  @override
  MainState createState() {
   return state;
  }
}
