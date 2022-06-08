import 'package:evo/configuration/components/input_node_component.dart';
import 'package:evo/game_common/nodes/chemical_sensing_node.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ConfigurationGame extends FlameGame
    with HasDraggables, HasTappables, HasHoverables {
  @override
  Color backgroundColor() => AppColors.theme4;

  @override
  Future<void>? onLoad() async {
    add(InputNodeComponent(
        ChemicalSensingNode(), Vector2(canvasSize.x / 2, canvasSize.y / 2)));
  }
}
