import 'package:flame_oxygen/flame_oxygen.dart';
import 'package:flutter/material.dart';

class SpriteSystem extends System with RenderSystem {
  Query? _query;

  @override
  void init() {
    _query = createQuery([Has<SpriteComponent>(), Has<PositionComponent>()]);
  }

  @override
  void render(Canvas canvas) {
    for (final entity in _query?.entities ?? <Entity>[]) {
      final sprite = entity.get<SpriteComponent>()?.sprite;
      final position = entity.get<PositionComponent>()!.position;

      sprite?.render(canvas, position: position, anchor: Anchor.center);
    }
  }
}
