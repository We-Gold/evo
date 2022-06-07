import 'package:evo/game/models/node_model.dart';

class OutputNode extends Node {
  OutputNode() : super([null], []);

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
