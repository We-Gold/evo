import 'package:evo/configuration/components/dendrite_component.dart';
import 'package:evo/configuration/components/node_component.dart';
import 'package:evo/configuration/configuration.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:evo/resources/game_constants.dart';
import 'package:flame/components.dart';

import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Draggable;

class AxonComponent extends CircleComponent
    with Draggable, Hoverable, HasGameRef<ConfigurationGame> {
  final Paint synapsePaint = Paint()
    ..color = GameColors.synapseColor
    ..style = PaintingStyle.fill;

  final Paint synapseLinePaint = Paint()
    ..color = GameColors.synapseLineColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = GameConstants.synapseLineWidth;

  bool _isDragging = false;
  bool get isDragging => _isDragging;

  final Vector2 initialPosition;
  late NodeComponent parentComponent;
  DendriteComponent? dendriteComponent;

  final int _index;
  int get index => _index;

  AxonComponent(Vector2 position, this._index)
      : initialPosition = position,
        super(
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

  @override
  bool onDragStart(DragStartInfo info) {
    parentComponent.setHighPriority();
    _isDragging = true;
    return false;
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    if (isDragging) {
      position = localToParent(absoluteToLocal(info.eventPosition.game));
    }
    return false;
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    // Find all components on the screen at the location of the axon.
    Iterable<Component> components = gameRef.componentsAtPoint(absoluteCenter);

    if (components.isNotEmpty &&
        components.any((element) => element is DendriteComponent)) {
      // Find the first dendrite below the mouse cursor / touch
      Component? dendrite =
          components.firstWhere((element) => element is DendriteComponent);

      dendriteComponent = dendrite as DendriteComponent?;

      dendriteComponent!.setAxonComponent(this);
    } else {
      removeDendriteComponent();
      position = initialPosition;
      parentComponent.setLowPriority();
    }

    return handleDragEndOrCancel(info);
  }

  @override
  bool onDragCancel() {
    return handleDragEndOrCancel(null);
  }

  bool handleDragEndOrCancel(DragEndInfo? info) {
    _isDragging = false;

    return false;
  }

  void removeDendriteComponent() {
    dendriteComponent!.removeAxonComponent();
    dendriteComponent = null;
  }

  bool isAttachedToDendrite() {
    return dendriteComponent != null;
  }

  Vector2 getDendritePosition() {
    return localToParent(absoluteToLocal(dendriteComponent!.absolutePosition));
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
    if (isAttachedToDendrite() && !isDragging) {
      position = getDendritePosition();
    }

    if (isDragging || isAttachedToDendrite()) {
      Vector2 originalPosition = initialPosition.clone()..sub(position);
      Offset originalOffset =
          Offset(originalPosition.x + radius, originalPosition.y + radius);

      canvas.drawLine(originalOffset, Offset(radius, radius), synapseLinePaint);

      drawSynapseCircle(canvas, originalOffset);
    }

    drawSynapseCircle(canvas, Offset(radius, radius));
  }

  void drawSynapseCircle(Canvas canvas, Offset offset) {
    Rect circleRect = Rect.fromCircle(center: offset, radius: radius);

    canvas.drawShadow(Path()..addOval(circleRect), Colors.black, 3, false);

    canvas.drawCircle(offset, radius, synapsePaint);
  }
}
