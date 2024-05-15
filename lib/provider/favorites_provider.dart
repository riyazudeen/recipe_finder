import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_finder/model_class/search_recipe_data.dart';


final favoriteProvider = StateNotifierProvider<FavoriteProvider,List<Results>>((ref) => FavoriteProvider([]));

class FavoriteProvider extends StateNotifier<List<Results>>{
  FavoriteProvider(super.state);

  addToFavorites(Results results){
    state.add(results);
    state = [...state];
  }

  removeFromFavorites(Results results){
    state.removeWhere((element) => element.id == results.id);
    state = [...state];
  }
}