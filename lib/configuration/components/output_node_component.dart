import 'package:evo/configuration/components/node_component.dart';
import 'package:evo/game_common/node_types/output_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class OutputNodeComponent extends NodeComponent {
  static final Paint boxPaint_ = Paint()
    ..color = GameColors.outputNodeColor
    ..style = PaintingStyle.fill;

  OutputNodeComponent(OutputNode outputNode, Vector2? position)
      : super(outputNode, boxPaint_, position);
}
