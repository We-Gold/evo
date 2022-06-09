import 'package:evo/configuration/configuration.dart';
import 'package:evo/game_common/node_types/input_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:evo/resources/game_constants.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Draggable;

class InputNodeComponent extends PositionComponent
    with Draggable, Hoverable, HasGameRef<ConfigurationGame> {
  final InputNode inputNode;

  final Paint boxPaint = Paint()
    ..color = GameColors.inputNodeColor
    ..style = PaintingStyle.fill;

  final Paint synapsePaint = Paint()
    ..color = GameColors.synapseColor
    ..style = PaintingStyle.fill;

  Vector2? dragDeltaPosition;
  bool get isDragging => dragDeltaPosition != null;

  InputNodeComponent(this.inputNode, Vector2? position)
      : super(
            size: GameConstants.nodeSize,
            position: position,
            anchor: Anchor.center,
            priority: 2);

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    scale = Vector2.all(size.y * 1 / 1000);
  }

  @override
  bool onDragStart(DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.game - position;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (isDragging) {
      final localCoords = info.eventPosition.game;
      Vector2 position_ = localCoords - dragDeltaPosition!;

      if (gameRef.containsPoint(position_)) position = position_;
    }
    return false;
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel() {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onHoverEnter(PointerHoverInfo info) {
    gameRef.mouseCursor.value = SystemMouseCursors.click;
    return true;
  }

  @override
  bool onHoverLeave(PointerHoverInfo info) {
    gameRef.mouseCursor.value = SystemMouseCursors.basic;
    return true;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    Rect boxRect = Rect.fromCenter(
        center: Offset(size.x / 2, size.y / 2), width: size.x, height: size.y);

    canvas.drawShadow(Path()..addRect(boxRect), Colors.black, 3, false);

    canvas.drawRect(boxRect, boxPaint);

    Rect circleRect = Rect.fromCircle(
        center: Offset(size.x, size.y / 2),
        radius: GameConstants.synapseRadius);

    canvas.drawShadow(Path()..addOval(circleRect), Colors.black, 3, false);

    canvas.drawCircle(
        Offset(size.x, size.y / 2), GameConstants.synapseRadius, synapsePaint);
  }
}
