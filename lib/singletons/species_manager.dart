import 'package:evo/game/models/species_model.dart';

class SpeciesManager {
  SpeciesManager._privateContructor();

  static final SpeciesManager _instance = SpeciesManager._privateContructor();

  static SpeciesManager get instance => _instance;

  List<Species> speciesList = [];

  void addSpecies(Species species) {
    speciesList.add(species);
  }

  void addRandomSpecies() {}
}
