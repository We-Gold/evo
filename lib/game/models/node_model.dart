import 'package:flutter/material.dart';

class Node {
  List<Node?> inputs;
  List<Node?> outputs;

  final String title;
  final String subtitle;
  final Color nodeColor;
  final double cost;

  Node(this.inputs, this.outputs, this.title, this.subtitle, this.nodeColor,
      this.cost);

  String getTitle() {
    return title;
  }

  String getSubtitle() {
    return subtitle;
  }

  Color getNodeColor() {
    return nodeColor;
  }

  List<Node?> getInputs() {
    return inputs;
  }

  List<Node?> getOutputs() {
    return outputs;
  }

  void setInputNodeAtIndex(int index, Node? node) {
    if (!isInputIndexValid(index)) return;

    inputs[index] = node;
  }

  void setOutputNodeAtIndex(int index, Node? node) {
    if (!isOutputIndexValid(index)) return;

    outputs[index] = node;
  }

  bool isInputIndexValid(int index) {
    return index >= getNumberOfInputs() || index < 0;
  }

  bool isOutputIndexValid(int index) {
    return index >= getNumberOfOutputs() || index < 0;
  }

  Node? getInputNodeAtIndex(int index) {
    if (isInputIndexValid(index)) {
      return inputs[index];
    } else {
      return null;
    }
  }

  Node? getOutputNodeAtIndex(int index) {
    if (isOutputIndexValid(index)) {
      return outputs[index];
    } else {
      return null;
    }
  }

  int getNumberOfInputs() {
    return inputs.length;
  }

  int getNumberOfOutputs() {
    return outputs.length;
  }
}
