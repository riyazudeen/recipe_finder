RecipeDetailData recipeDetailDataJson (json) => RecipeDetailData.fromJson(json);

class RecipeDetailData {
  RecipeDetailData({
    required this.vegetarian,
    required this.vegan,
    required this.glutenFree,
    required this.dairyFree,
    required this.veryHealthy,
    required this.cheap,
    required this.veryPopular,
    required this.sustainable,
    required this.lowFodmap,
    required this.weightWatcherSmartPoints,
    required this.gaps,
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.aggregateLikes,
    required this.healthScore,
    required this.creditsText,
    required this.license,
    required this.sourceName,
    required this.pricePerServing,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.taste,
    required this.summary,
    required this.cuisines,
    required this.dishTypes,
    required this.diets,
    required this.occasions,
    required this.winePairing,
    required this.instructions,
    required this.analyzedInstructions,
    this.originalId,
    required this.spoonacularScore,
    required this.spoonacularSourceUrl,
  });
  late final bool vegetarian;
  late final bool vegan;
  late final bool glutenFree;
  late final bool dairyFree;
  late final bool veryHealthy;
  late final bool cheap;
  late final bool veryPopular;
  late final bool sustainable;
  late final bool lowFodmap;
  late final int weightWatcherSmartPoints;
  late final String gaps;
  late final int preparationMinutes;
  late final int cookingMinutes;
  late final int aggregateLikes;
  late final int healthScore;
  late final String creditsText;
  late final String license;
  late final String sourceName;
  late final double pricePerServing;
  late final List<ExtendedIngredients> extendedIngredients;
  late final int id;
  late final String title;
  late final int readyInMinutes;
  late final int servings;
  late final String sourceUrl;
  late final String image;
  late final String imageType;
  late final Taste taste;
  late final String summary;
  late final List<dynamic> cuisines;
  late final List<String> dishTypes;
  late final List<String> diets;
  late final List<dynamic> occasions;
  late final WinePairing winePairing;
  late final String instructions;
  late final List<AnalyzedInstructions> analyzedInstructions;
  late final Null originalId;
  late final double spoonacularScore;
  late final String spoonacularSourceUrl;

  RecipeDetailData.fromJson(Map<String, dynamic> json){
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    lowFodmap = json['lowFodmap'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    aggregateLikes = json['aggregateLikes'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    license = json['license']??"";
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    extendedIngredients = List.from(json['extendedIngredients']).map((e)=>ExtendedIngredients.fromJson(e)).toList();
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    taste = Taste.fromJson(json['taste']);
    summary = json['summary'];
    cuisines = List.castFrom<dynamic, dynamic>(json['cuisines']);
    dishTypes = List.castFrom<dynamic, String>(json['dishTypes']);
    diets = List.castFrom<dynamic, String>(json['diets']);
    occasions = List.castFrom<dynamic, dynamic>(json['occasions']);
    winePairing = WinePairing.fromJson(json['winePairing']);
    instructions = json['instructions'];
    analyzedInstructions = List.from(json['analyzedInstructions']).map((e)=>AnalyzedInstructions.fromJson(e)).toList();
    originalId = null;
    spoonacularScore = json['spoonacularScore'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['vegetarian'] = vegetarian;
    _data['vegan'] = vegan;
    _data['glutenFree'] = glutenFree;
    _data['dairyFree'] = dairyFree;
    _data['veryHealthy'] = veryHealthy;
    _data['cheap'] = cheap;
    _data['veryPopular'] = veryPopular;
    _data['sustainable'] = sustainable;
    _data['lowFodmap'] = lowFodmap;
    _data['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    _data['gaps'] = gaps;
    _data['preparationMinutes'] = preparationMinutes;
    _data['cookingMinutes'] = cookingMinutes;
    _data['aggregateLikes'] = aggregateLikes;
    _data['healthScore'] = healthScore;
    _data['creditsText'] = creditsText;
    _data['license'] = license;
    _data['sourceName'] = sourceName;
    _data['pricePerServing'] = pricePerServing;
    _data['extendedIngredients'] = extendedIngredients.map((e)=>e.toJson()).toList();
    _data['id'] = id;
    _data['title'] = title;
    _data['readyInMinutes'] = readyInMinutes;
    _data['servings'] = servings;
    _data['sourceUrl'] = sourceUrl;
    _data['image'] = image;
    _data['imageType'] = imageType;
    _data['taste'] = taste.toJson();
    _data['summary'] = summary;
    _data['cuisines'] = cuisines;
    _data['dishTypes'] = dishTypes;
    _data['diets'] = diets;
    _data['occasions'] = occasions;
    _data['winePairing'] = winePairing.toJson();
    _data['instructions'] = instructions;
    _data['analyzedInstructions'] = analyzedInstructions.map((e)=>e.toJson()).toList();
    _data['originalId'] = originalId;
    _data['spoonacularScore'] = spoonacularScore;
    _data['spoonacularSourceUrl'] = spoonacularSourceUrl;
    return _data;
  }
}

class ExtendedIngredients {
  ExtendedIngredients({
    required this.id,
    required this.aisle,
    required this.image,
    required this.consistency,
    required this.name,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
    required this.meta,
    required this.measures,
  });
  late final int id;
  late final String aisle;
  late final String image;
  late final String consistency;
  late final String name;
  late final String nameClean;
  late final String original;
  late final String originalName;
  late final double? amount;
  late final String unit;
  late final List<String> meta;
  late final Measures measures;

  ExtendedIngredients.fromJson(Map<String, dynamic> json){
    id = json['id'];
    aisle = json['aisle']??"";
    image = json['image']??"";
    consistency = json['consistency'];
    name = json['name'];
    nameClean = json['nameClean'];
    original = json['original'];
    originalName = json['originalName'];
    amount = json['amount'];
    unit = json['unit'];
    meta = List.castFrom<dynamic, String>(json['meta']);
    measures = Measures.fromJson(json['measures']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['aisle'] = aisle;
    _data['image'] = image;
    _data['consistency'] = consistency;
    _data['name'] = name;
    _data['nameClean'] = nameClean;
    _data['original'] = original;
    _data['originalName'] = originalName;
    _data['amount'] = amount;
    _data['unit'] = unit;
    _data['meta'] = meta;
    _data['measures'] = measures.toJson();
    return _data;
  }
}

class Measures {
  Measures({
    required this.us,
    required this.metric,
  });
  late final Us us;
  late final Metric metric;

  Measures.fromJson(Map<String, dynamic> json){
    us = Us.fromJson(json['us']);
    metric = Metric.fromJson(json['metric']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['us'] = us.toJson();
    _data['metric'] = metric.toJson();
    return _data;
  }
}

class Us {
  Us({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });
  late final double? amount;
  late final String unitShort;
  late final String unitLong;

  Us.fromJson(Map<String, dynamic> json){
    amount = json['amount'] ?? 0;
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['unitShort'] = unitShort;
    _data['unitLong'] = unitLong;
    return _data;
  }
}

class Metric {
  Metric({
    required this.amount,
    required this.unitShort,
    required this.unitLong,
  });
  late final double? amount;
  late final String unitShort;
  late final String unitLong;

  Metric.fromJson(Map<String, dynamic> json){
    amount = json['amount']??0;
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['amount'] = amount;
    _data['unitShort'] = unitShort;
    _data['unitLong'] = unitLong;
    return _data;
  }
}

class Taste {
  Taste({
    required this.sweetness,
    required this.saltiness,
    required this.sourness,
    required this.bitterness,
    required this.savoriness,
    required this.fattiness,
    required this.spiciness,
  });
  late final double sweetness;
  late final double saltiness;
  late final double sourness;
  late final double bitterness;
  late final double savoriness;
  late final double fattiness;
  late final double spiciness;

  Taste.fromJson(Map<String, dynamic> json){
    sweetness = json['sweetness'];
    saltiness = json['saltiness'];
    sourness = json['sourness'];
    bitterness = json['bitterness'];
    savoriness = json['savoriness'];
    fattiness = json['fattiness'];
    spiciness = json['spiciness'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sweetness'] = sweetness;
    _data['saltiness'] = saltiness;
    _data['sourness'] = sourness;
    _data['bitterness'] = bitterness;
    _data['savoriness'] = savoriness;
    _data['fattiness'] = fattiness;
    _data['spiciness'] = spiciness;
    return _data;
  }
}

class WinePairing {
  WinePairing({
    required this.pairedWines,
    required this.pairingText,
    required this.productMatches,
  });
  late final List<String> pairedWines;
  late final String pairingText;
  late final List<ProductMatches> productMatches;

  WinePairing.fromJson(Map<String, dynamic> json){
    pairedWines = List.castFrom<dynamic, String>(json['pairedWines']);
    pairingText = json['pairingText'];
    productMatches = List.from(json['productMatches']).map((e)=>ProductMatches.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pairedWines'] = pairedWines;
    _data['pairingText'] = pairingText;
    _data['productMatches'] = productMatches.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductMatches {
  ProductMatches({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.averageRating,
    required this.ratingCount,
    required this.score,
    required this.link,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String price;
  late final String imageUrl;
  late final double averageRating;
  late final double ratingCount;
  late final double score;
  late final String link;

  ProductMatches.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description']??"";
    price = json['price'] ?? "";
    imageUrl = json['imageUrl'];
    averageRating = json['averageRating'];
    ratingCount = json['ratingCount'];
    score = json['score'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['price'] = price;
    _data['imageUrl'] = imageUrl;
    _data['averageRating'] = averageRating;
    _data['ratingCount'] = ratingCount;
    _data['score'] = score;
    _data['link'] = link;
    return _data;
  }
}

class AnalyzedInstructions {
  AnalyzedInstructions({
    required this.name,
    required this.steps,
  });
  late final String name;
  late final List<Steps> steps;

  AnalyzedInstructions.fromJson(Map<String, dynamic> json){
    name = json['name'];
    steps = List.from(json['steps']).map((e)=>Steps.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['steps'] = steps.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Steps {
  Steps({
    required this.number,
    required this.step,
    required this.ingredients,
    required this.equipment,
  });
  late final int number;
  late final String step;
  late final List<Ingredients> ingredients;
  late final List<Equipment> equipment;

  Steps.fromJson(Map<String, dynamic> json){
    number = json['number'];
    step = json['step'];
    ingredients = List.from(json['ingredients']).map((e)=>Ingredients.fromJson(e)).toList();
    equipment = List.from(json['equipment']).map((e)=>Equipment.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['number'] = number;
    _data['step'] = step;
    _data['ingredients'] = ingredients.map((e)=>e.toJson()).toList();
    _data['equipment'] = equipment.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Ingredients {
  Ingredients({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String localizedName;
  late final String image;

  Ingredients.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['localizedName'] = localizedName;
    _data['image'] = image;
    return _data;
  }
}

class Equipment {
  Equipment({
    required this.id,
    required this.name,
    required this.localizedName,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String localizedName;
  late final String image;

  Equipment.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['localizedName'] = localizedName;
    _data['image'] = image;
    return _data;
  }
}