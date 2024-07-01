class StrainModel {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String desc;

  StrainModel({
    required this.id,
    required this.name,
    this.imageUrl = 'assets/images/strains.png',
    required this.price,
    this.desc =
        'Indoor AAA hybrid grade, cultivated between 19-32% THC. Best strain for someone looking for an energetic vibe with a satisfying head-high.',
  });
}

List<StrainModel> strains = [
  StrainModel(id: 's1', name: 'Girl Scout Cookies', price: 100),
  StrainModel(id: 's2', name: 'Blueberry Muffin', price: 80),
  StrainModel(id: 's3', name: 'Caribbean breeze', price: 110),
  StrainModel(id: 's4', name: 'Exodus Cheese', price: 90),
  StrainModel(id: 's5', name: 'Wedding pie', price: 60),
  StrainModel(id: 's6', name: 'Wedding Cake', price: 80),
  StrainModel(id: 's7', name: 'Fig Jam', price: 110),
  StrainModel(id: 's8', name: 'Sir Lowery', price: 100),
  StrainModel(id: 's9', name: 'Blue Dream', price: 80),
  StrainModel(id: 's10', name: 'Honey Comb', price: 120),
];
