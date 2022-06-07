import 'package:evo/game/systems/test_system.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/game.dart';
import 'package:flame_oxygen/flame_oxygen.dart';
import 'package:flutter/material.dart';

class EvoGame extends OxygenGame {
  @override
  Color backgroundColor() {
    return AppColors.theme3;
  }

  @override
  Future<void> init() async {
    world.registerSystem(TestSystem());

    world.createEntity().add<TextComponent, TextInit>(
          TextInit('Your text', style: const TextStyle(color: Colors.white)),
        );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(canvasSize.x / 2, canvasSize.y / 2),
            width: 10,
            height: 10),
        Paint());
  }
}
