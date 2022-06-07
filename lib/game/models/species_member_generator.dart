import 'package:evo/game/node_types/central_node.dart';
import 'package:evo/game/node_types/input_node.dart';
import 'package:evo/game/node_types/output_node.dart';

class SpeciesMemberGenerator {
  List<InputNode> inputNodes;
  List<CentralNode> centralNodes;
  List<OutputNode> outputNodes;

  SpeciesMemberGenerator(this.inputNodes, this.centralNodes, this.outputNodes);

  SpeciesMemberGenerator.createRandom()
      : inputNodes = [],
        centralNodes = [],
        outputNodes = [];
}
