import 'package:flame/game.dart';
import 'package:flame_oxygen/flame_oxygen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestSystem extends BaseSystem {
  final debugPaint = Paint()
    ..color = Colors.green
    ..style = PaintingStyle.stroke;

  final textPainter = TextPaint(
    style: const TextStyle(color: Colors.green, fontSize: 10),
  );

  final statusPainter = TextPaint(
    style: TextStyle(
        color: Colors.green,
        fontSize: 16,
        fontFamily: GoogleFonts.zillaSlab().fontFamily),
  );

  @override
  List<Filter<Component>> get filters => [];

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    statusPainter.render(
      canvas,
      [
        'Creatures: ${world!.entities.length}',
      ].join('\n'),
      Vector2.zero(),
    );
  }

  @override
  void renderEntity(Canvas canvas, Entity entity) {}
}
