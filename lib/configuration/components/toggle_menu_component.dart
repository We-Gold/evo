import 'package:evo/configuration/configuration.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:evo/resources/game_constants.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class ToggleMenuComponent extends ButtonComponent
    with HasGameRef<ConfigurationGame>, Hoverable {
  static final Paint enableMenuPaint = Paint()
    ..color = AppColors.theme5
    ..style = PaintingStyle.fill;

  static final Paint closeMenuPaint = Paint()
    ..color = AppColors.theme4
    ..style = PaintingStyle.fill;

  static final Paint plusOrXPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  bool menuIsVisible = false;

  ToggleMenuComponent() : super(button: PositionComponent());

  @override
  Future<void>? onLoad() async {
    position = gameRef.size;
    size = GameConstants.toggleMenuSize;
    anchor = Anchor.bottomRight;

    onPressed = () {
      menuIsVisible = !menuIsVisible;
    };
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    double scale_ = gameRef.getScale();

    scale = Vector2.all(scale_);

    position = size;
  }

  @override
  bool onHoverEnter(PointerHoverInfo info) {
    gameRef.mouseCursor = SystemMouseCursors.click;
    return true;
  }

  @override
  bool onHoverLeave(PointerHoverInfo info) {
    gameRef.mouseCursor = SystemMouseCursors.basic;
    return true;
  }

  @override
  void render(Canvas canvas) {
    Path buttonPath = Path()
      ..addPolygon(
          [Offset(size.x, size.y), Offset(size.x, 0), Offset(0, size.y)], true);

    canvas.drawPath(
        buttonPath, menuIsVisible ? closeMenuPaint : enableMenuPaint);

    Path plusPath = Path()
      ..addRect(Rect.fromCenter(
          center: Offset(size.x - size.x / 3.5, size.y - size.y / 3.5),
          width: size.x / 4,
          height: size.y / 20))
      ..addRect(Rect.fromCenter(
          center: Offset(size.x - size.x / 3.5, size.y - size.y / 3.5),
          width: size.y / 20,
          height: size.x / 4));

    canvas.drawShadow(plusPath, Colors.black, 2, false);

    canvas.drawPath(plusPath, plusOrXPaint);
  }
}
