import 'package:evo/configuration/configuration.dart';
import 'package:evo/game_common/node_types/input_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:evo/resources/game_constants.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Draggable;

class InputNodeComponent extends PositionComponent
    with Draggable, Tappable, Hoverable, HasGameRef<ConfigurationGame> {
  final InputNode inputNode;

  final Paint boxPaint = Paint()
    ..color = GameColors.inputNodeColor
    ..style = PaintingStyle.fill;

  InputNodeComponent(this.inputNode, Vector2? position)
      : super(
            size: GameConstants.nodeSize,
            position: position,
            anchor: Anchor.center);

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    scale = Vector2.all(size.y * 1 / 1000);
  }

  @override
  bool onHoverEnter(PointerHoverInfo info) {
    gameRef.mouseCursor.value = SystemMouseCursors.click;

    info.handled = true;
    return true;
  }

  @override
  bool onHoverLeave(PointerHoverInfo info) {
    gameRef.mouseCursor.value = SystemMouseCursors.basic;

    info.handled = true;
    return true;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.x / 2, size.y / 2),
            width: size.x,
            height: size.y),
        boxPaint);
  }
}
