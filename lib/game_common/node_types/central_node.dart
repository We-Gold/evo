import 'package:evo/game_common/models/node_model.dart';
import 'package:evo/resources/app_colors.dart';

class CentralNode extends Node {
  CentralNode(int numberOfInputs, int numberOfOutputs, String title,
      String subtitle, double cost)
      : super(
            List<Node?>.filled(numberOfInputs, null),
            List<Node?>.filled(numberOfOutputs, null),
            title,
            subtitle,
            GameColors.centralNodeColor,
            cost);
}
