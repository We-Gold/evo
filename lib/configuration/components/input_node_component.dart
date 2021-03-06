import 'package:evo/configuration/components/node_component.dart';
import 'package:evo/game_common/node_types/input_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class InputNodeComponent extends NodeComponent {
  static final Paint boxPaint_ = Paint()
    ..color = GameColors.inputNodeColor
    ..style = PaintingStyle.fill;

  InputNodeComponent(InputNode inputNode, Vector2? position)
      : super(inputNode, boxPaint_, position);
}
