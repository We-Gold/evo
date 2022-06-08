import 'package:evo/game_common/models/node_model.dart';
import 'package:evo/resources/app_colors.dart';

class OutputNode extends Node {
  OutputNode(String title, String subtitle, double cost)
      : super([null], [], title, subtitle, GameColors.outputNodeColor, cost);

  void setInputNode(Node inputNode) {
    setInputNodeAtIndex(0, inputNode);
  }

  void removeInputNode() {
    setInputNodeAtIndex(0, null);
  }

  Node? getInputNode() {
    return getInputNodeAtIndex(0);
  }
}
