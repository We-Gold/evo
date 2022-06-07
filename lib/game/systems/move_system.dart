import 'package:flame_oxygen/flame_oxygen.dart';

class MoveSystem extends System with UpdateSystem {
  Query? _query;

  final double speed = 15.0;

  @override
  void init() {
    _query = createQuery([Has<PositionComponent>()]);
  }

  @override
  void update(double delta) {
    for (final entity in _query?.entities ?? <Entity>[]) {
      final position = entity.get<PositionComponent>()!;

      position.x += speed * delta;
    }
  }
}
