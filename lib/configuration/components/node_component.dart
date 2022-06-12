import 'dart:math';

import 'package:evo/configuration/components/axon_component.dart';
import 'package:evo/configuration/components/dendrite_component.dart';
import 'package:evo/configuration/configuration.dart';
import 'package:evo/game_common/models/node_model.dart';
import 'package:evo/resources/game_constants.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Draggable;

class NodeComponent extends PositionComponent
    with Draggable, Hoverable, HasGameRef<ConfigurationGame> {
  final Node node;

  final List<NodeComponent?> inputNodes;
  final List<NodeComponent?> outputNodes;

  final Paint boxPaint;

  Vector2? previousScreenSize;

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  NodeComponent(this.node, this.boxPaint, Vector2? position)
      : inputNodes =
            List<NodeComponent?>.filled(node.getNumberOfInputs(), null),
        outputNodes =
            List<NodeComponent?>.filled(node.getNumberOfOutputs(), null),
        super(
            size: GameConstants.nodeSize,
            position: position,
            anchor: Anchor.center,
            priority: 0);

  Vector2? getSynapsePosition(bool isInputSynapse, int index) {
    // Calculate where an axon or dendrite should be displayed, based on the
    // type and the index.
    // E.g. a node with one axon should display it halfway down the right side.
    if (isInputSynapse && index < inputNodes.length) {
      return Vector2(0, size.y * (index + 1) / (inputNodes.length + 1));
    } else if (!isInputSynapse && index < outputNodes.length) {
      return Vector2(size.x, size.y * (index + 1) / (outputNodes.length + 1));
    } else {
      return null;
    }
  }

  @override
  Future<void>? onLoad() async {
    // Add all output nodes (axons)
    // These can be connected to other nodes
    for (int i = 0; i < outputNodes.length; i++) {
      add(AxonComponent(getSynapsePosition(false, i)!, i));
    }

    // Add all input nodes (dendrites)
    // These receive axons from other nodes
    for (int i = 0; i < inputNodes.length; i++) {
      add(DendriteComponent(getSynapsePosition(true, i)!, i));
    }
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    previousScreenSize ??= size;

    double scale_ = (isPortraitMode() ? size.y : size.x) * 1 / 1000;

    scale = Vector2.all(clamp(scale_, 0.8, 1.1));

    // Scale the current position to match the new screen size
    position = Vector2((position.x / previousScreenSize!.x) * size.x,
        (position.y / previousScreenSize!.y) * size.y);

    previousScreenSize = size;
  }

  bool isPortraitMode() {
    return gameRef.size.x < gameRef.size.y;
  }

  double clamp(double input, double minimum, double maximum) {
    return min(max(input, minimum), maximum);
  }

  @override
  bool onDragStart(DragStartInfo info) {
    setHighPriority();
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (isDragging) {
      final localCoords = info.eventPosition.game;
      Vector2 position_ = localCoords - dragDeltaPosition!;

      if (gameRef.containsLocalPoint(position_)) {
        position = constrainNodeToGame(position_);
      }
    }
    return false;
  }

  Vector2 constrainNodeToGame(Vector2 position_) {
    Vector2 futurePosition = position.clone();

    double xOffset = scaledSize.x / 2;
    double yOffset = scaledSize.y / 2;

    // Check if the future position is outside the game window on both axes
    bool outsideXRange = (position_.x - xOffset) <= 0 ||
        (position_.x + xOffset) >= gameRef.size.x;
    bool outsideYRange = (position_.y - yOffset) <= 0 ||
        (position_.y + yOffset) >= gameRef.size.y;

    // Constrain the movement of the node to within the axes it has not exceeded.
    if (outsideXRange && !outsideYRange) {
      futurePosition.y = position_.y;
    } else if (outsideYRange && !outsideXRange) {
      futurePosition.x = position_.x;
    } else if (!outsideXRange && !outsideYRange) {
      futurePosition = position_;
    }

    return futurePosition;
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    dragDeltaPosition = null;
    setLowPriority();
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    setLowPriority();
    return false;
  }

  void setHighPriority() => priority = 1;
  void setLowPriority() => priority = 0;

  bool isHighPriority() => priority == 1;

  @override
  bool onHoverEnter(PointerHoverInfo info) {
    gameRef.mouseCursor = SystemMouseCursors.click;
    return true;
  }

  @override
  bool onHoverLeave(PointerHoverInfo info) {
    gameRef.mouseCursor = SystemMouseCursors.basic;
    return true;
  }

  bool isValidIndex(int index, List list) {
    return 0 <= index && index < list.length;
  }

  void connectInputSynapse(NodeComponent nodeComponent, int index) {
    if (isValidIndex(index, inputNodes)) {
      inputNodes[index] = nodeComponent;
    }
  }

  void connectOutputSynapse(NodeComponent nodeComponent, int index) {
    if (isValidIndex(index, outputNodes)) {
      outputNodes[index] = nodeComponent;
    }
  }

  void disconnectInputSynapse(int index) {
    if (isValidIndex(index, inputNodes)) {
      inputNodes[index] = null;
    }
  }

  void disconnectOutputSynapse(int index) {
    if (isValidIndex(index, outputNodes)) {
      outputNodes[index] = null;
    }
  }

  @override
  void render(Canvas canvas) {
    Rect boxRect = Rect.fromCenter(
        center: Offset(size.x / 2, size.y / 2), width: size.x, height: size.y);

    canvas.drawShadow(Path()..addRect(boxRect), Colors.black, 3, false);

    canvas.drawRect(boxRect, boxPaint);
  }
}
