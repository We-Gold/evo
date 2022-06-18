import 'dart:math';

import 'package:evo/configuration/components/central_node_component.dart';
import 'package:evo/configuration/components/input_node_component.dart';
import 'package:evo/configuration/components/output_node_component.dart';
import 'package:evo/configuration/components/toggle_menu_component.dart';
import 'package:evo/game_common/nodes/chemical_sensing_node.dart';
import 'package:evo/game_common/nodes/extra_brainpower.dart';
import 'package:evo/game_common/nodes/taxis_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ConfigurationGame extends FlameGame
    with HasDraggables, HasTappables, HasHoverables {
  @override
  Color backgroundColor() => AppColors.theme4;

  @override
  Future<void>? onLoad() async {
    add(ToggleMenuComponent());

    add(InputNodeComponent(
        ChemicalSensingNode(), Vector2(canvasSize.x / 4, canvasSize.y / 2)));

    add(CentralNodeComponent(ExtraBrainpowerNode(),
        Vector2(2 * canvasSize.x / 4, canvasSize.y / 2)));

    add(OutputNodeComponent(
        TaxisNode(), Vector2(3 * canvasSize.x / 4, canvasSize.y / 2)));
  }

  double getScale() {
    return sqrt(size.x * size.y) * 1 / 1000;
  }

  double clamp(double input, double minimum, double maximum) {
    return min(max(input, minimum), maximum);
  }
}
