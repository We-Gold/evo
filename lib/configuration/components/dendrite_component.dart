import 'dart:ui';

import 'package:evo/configuration/components/axon_component.dart';
import 'package:evo/configuration/components/node_component.dart';
import 'package:evo/configuration/configuration.dart';
import 'package:evo/game_common/models/node_model.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:evo/resources/game_constants.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart' hide Gradient;

class DendriteComponent extends CircleComponent
    with HasGameRef<ConfigurationGame> {
  final Paint dendritePaint = Paint()
    ..color = GameColors.synapseColor
    ..style = PaintingStyle.fill
    ..shader = Gradient.radial(
        const Offset(GameConstants.synapseRadius, GameConstants.synapseRadius),
        GameConstants.synapseRadius,
        [GameColors.synapseColor, const Color.fromARGB(255, 187, 187, 187)],
        [0.4, 1]);

  final Paint synapsePaint = Paint()
    ..color = GameColors.synapseColor
    ..style = PaintingStyle.fill;

  final int _index;
  int get index => _index;

  late NodeComponent parentComponent;
  AxonComponent? axonComponent;

  DendriteComponent(Vector2 position, this._index)
      : super(
            position: position,
            anchor: Anchor.center,
            radius: GameConstants.synapseRadius,
            priority: 2);

  @override
  Future<void>? onLoad() async {
    parentComponent = getParentComponent();
  }

  NodeComponent getParentComponent() {
    return findParent<NodeComponent>()!;
  }

  Node getNode() {
    return parentComponent.node;
  }

  void setAxonComponent(AxonComponent? axonComponent) {
    this.axonComponent?.removeDendriteComponent();
    this.axonComponent = axonComponent;
  }

  void removeAxonComponent() {
    axonComponent = null;
  }

  bool isAttachedToAxon() {
    return axonComponent != null;
  }

  @override
  void render(Canvas canvas) {
    if (isAttachedToAxon()) {
      drawSynapseCircleWithShadow(canvas, Offset(radius, radius));
    } else {
      drawDendriteCircle(canvas, Offset(radius, radius));
    }
  }

  void drawDendriteCircle(Canvas canvas, Offset offset) {
    canvas.drawCircle(offset, radius, dendritePaint);
  }

  void drawSynapseCircleWithShadow(Canvas canvas, Offset offset) {
    Rect circleRect = Rect.fromCircle(center: offset, radius: radius);

    canvas.drawShadow(Path()..addOval(circleRect), Colors.black, 1, false);

    canvas.drawCircle(offset, radius, synapsePaint);
  }
}
