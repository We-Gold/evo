import 'package:evo/game/models/species_member_generator.dart';
import 'package:evo/game/node_types/central_node.dart';
import 'package:evo/game/node_types/input_node.dart';
import 'package:evo/game/node_types/output_node.dart';
import 'package:flame_oxygen/flame_oxygen.dart';

class Species {
  late SpeciesMemberGenerator speciesMemberGenerator;

  Species(List<InputNode> inputNodes, List<CentralNode> centralNodes,
      List<OutputNode> outputNodes) {
    speciesMemberGenerator =
        SpeciesMemberGenerator(inputNodes, centralNodes, outputNodes);
  }

  Species.createRandom()
      : speciesMemberGenerator = SpeciesMemberGenerator.createRandom();

  void createRandomMember(World world) {}

  void createInitialPopulation(World world) {}
}
