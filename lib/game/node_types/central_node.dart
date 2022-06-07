import 'package:evo/game/models/node_model.dart';

class CentralNode extends Node {
  CentralNode(int numberOfInputs, int numberOfOutputs)
      : super(List<Node?>.filled(numberOfInputs, null),
            List<Node?>.filled(numberOfOutputs, null));
}
