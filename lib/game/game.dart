import 'package:evo/game/systems/move_system.dart';
import 'package:evo/game/systems/sprite_system.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_oxygen/flame_oxygen.dart';
import 'package:flutter/material.dart';

class EvoGame extends OxygenGame {
  @override
  Color backgroundColor() {
    return AppColors.theme3;
  }

  @override
  Future<void> init() async {
    world.registerSystem(SpriteSystem());
    world.registerSystem(MoveSystem());

    world.createEntity()
      ..add<SpriteComponent, SpriteInit>(
        SpriteInit(await loadSprite('creature.png')),
      )
      ..add<PositionComponent, Vector2>(
          Vector2(canvasSize.x / 2, canvasSize.y / 2));
  }
}
