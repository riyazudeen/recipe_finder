import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_finder/pages/recipie_detail_page.dart';

import '../model_class/search_recipe_data.dart';
import '../provider/favorites_provider.dart';
class FavoriteRecipe extends ConsumerStatefulWidget {
  const FavoriteRecipe({super.key});

  @override
  ConsumerState<FavoriteRecipe> createState() => _FavouritesState();
}

class _FavouritesState extends ConsumerState<FavoriteRecipe> {
  @override
  Widget build(BuildContext context) {
    List<Results> favoriterRecipe = ref.watch(favoriteProvider);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('FavoriteRecipes'),
      ),
        body: SingleChildScrollView(
          child:       favoriterRecipe.isEmpty?  Center(
            child:  SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.heart_broken,size: 50,),
                  Text('Favorites is empty!')
                ],
              ) ,
            )
          ):   GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ), itemCount: favoriterRecipe.length,
              itemBuilder: (context,index){
                return     GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(id: favoriterRecipe[index].id, isFavorite: ref.watch(favoriteProvider).any((element) => element.id == favoriterRecipe[index].id),)));
                  },
                  child: Container(

                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4.r,
                            offset: Offset(4, 8), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20.r),
                        image: DecorationImage(
                            image: NetworkImage(favoriterRecipe[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 6.h,
                          bottom: 110.h,
                          left: 115.w,
                          right: 10.w,
                          child:  GestureDetector(
                            onTap: (){
                              setState(() {

                              });
                              if(ref.watch(favoriteProvider).any((element) => element.id == favoriterRecipe[index].id)){
                                ref.watch(favoriteProvider.notifier).removeFromFavorites(favoriterRecipe[index]);
                              }else{
                                ref.watch(favoriteProvider.notifier).addToFavorites(favoriterRecipe[index]);
                              }
                            },
                            child: Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.r)
                              ),
                              child: ref.watch(favoriteProvider).any((element) => element.id == favoriterRecipe[index].id) ? Icon(Icons.favorite,color: Colors.red) : Icon(Icons.favorite_outline_outlined),
                            ),
                          ),),
                        Positioned(
                            top: 110.h,
                            bottom: 0.h,
                            left: 0.w,
                            right: 0.w,
                            child:   Container(
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r)
                                  ),

                                ),
                                child: Center(
                                  child:  SizedBox(
                                    width: 150.w,
                                    child: Text(favoriterRecipe[index].title,maxLines: 2,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold
                                    ),
                                    ),
                                  )
                                  ),
                                ))
                      ],
                    ),

                  ),

                );
              })
        )
    ));
  }
}

