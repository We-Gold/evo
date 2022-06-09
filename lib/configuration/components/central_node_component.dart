import 'package:evo/configuration/components/node_component.dart';
import 'package:evo/game_common/node_types/central_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class CentralNodeComponent extends NodeComponent {
  static final Paint boxPaint_ = Paint()
    ..color = GameColors.centralNodeColor
    ..style = PaintingStyle.fill;

  CentralNodeComponent(CentralNode centralNode, Vector2? position)
      : super(centralNode, boxPaint_, position);
}
