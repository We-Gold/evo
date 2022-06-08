import 'package:evo/game_common/models/node_model.dart';
import 'package:evo/resources/app_colors.dart';

class InputNode extends Node {
  InputNode(String title, String subtitle, double cost)
      : super([], [null], title, subtitle, GameColors.inputNodeColor, cost);

  void setOutputNode(Node outputNode) {
    setOutputNodeAtIndex(0, outputNode);
  }

  void removeOutputNode() {
    setOutputNodeAtIndex(0, null);
  }

  Node? getOutputNode() {
    return getOutputNodeAtIndex(0);
  }
}
