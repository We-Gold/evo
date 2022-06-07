import 'package:evo/game/models/node_model.dart';

class InputNode extends Node {
  InputNode() : super([], [null]);

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
