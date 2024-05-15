import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_finder/loader.dart';
import 'package:recipe_finder/model_class/search_recipe_data.dart';
import 'package:recipe_finder/pages/recipie_detail_page.dart';
import 'package:recipe_finder/provider/favorites_provider.dart';

import '../api_services.dart';

class SearchRecipe extends ConsumerStatefulWidget {
  const SearchRecipe({super.key});

  @override
  ConsumerState<SearchRecipe> createState() => _SearchRecipeState();
}

class _SearchRecipeState extends ConsumerState<SearchRecipe> {
bool isLoading = false;
 List<Results> results = [];
 List diets = [
   'Pescetarian', 'Lacto Vegetarian', 'Ovo Vegetarian', 'Vegan', 'Paleo', 'Primal', 'Vegetarian'
 ];
final searchQuery = TextEditingController();
final abiServices = ApiServices();
String query ="";
String diet = "";
int number = 10;
late  ScrollController singleScroll;

@override
void initState() {
  getRecipe();
  singleScroll = ScrollController()..addListener(() {
    if(singleScroll.position.maxScrollExtent == singleScroll.position.pixels){
      setState(() {
      });
      number += 10;
      getRecipe();
    }
  });

  super.initState();
}

   getRecipe() async{
  setState(() {

  });
    isLoading = true;
    var data = await abiServices.getSearchData(query, diet, number.toString());

     if(results.isEmpty){
       results =  data.results;
     } else{
       results.clear();
       results.addAll(data.results);
     }
    isLoading = false;
    setState(() {
    });
  }

   Future showBottomSheet() async{
   showModalBottomSheet(
       backgroundColor: Colors.white,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadiusDirectional.only(
           topEnd: Radius.circular(25.r),
           topStart: Radius.circular(25.r),
         ),
       ),
       context: context, builder: (context){
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState){
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),child:  Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('Diet',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
               fontWeight: FontWeight.w900
             )),
             TextButton(onPressed: (){
               setState((){
                 diet = "";
                 Navigator.pop(context);
                 getRecipe();
               });
             }, child: const Text('clear'))
           ],
         ),),
          ListView.builder(
          shrinkWrap: true,
          itemCount: diets.length,
          itemBuilder: (context, index){
            return  RadioListTile(

              value: diets[index], groupValue: diet, onChanged: (value) {

              diet = value;
              Navigator.pop(context);
              setState(() {
                results.clear();
                getRecipe();
              });
            },
              title: Text(diets[index],style: Theme.of(context).textTheme.bodyMedium,),
            );
          })
        ],
      );
    });
  });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: PreferredSize(preferredSize: Size.fromHeight(20.h),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40.h,

                    margin: EdgeInsets.only(

                        bottom: 10.h,
                        top: 10.h
                    ),
                    width:280.w,
                    child: TextFormField(
                      controller: searchQuery,
                      onEditingComplete: (){
                        FocusScope.of(context).unfocus();
                        results.clear();
                        setState(() {
                        });
                        query = searchQuery.text;
                        getRecipe();
                      },

                                            decoration: InputDecoration(

                        contentPadding: EdgeInsets.only(left: 20.w,bottom: 10.h),
                        labelText: 'Search',

                        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          FocusScope.of(context).unfocus();
                          setState(() {

                          });
                          results.clear();
                          query = searchQuery.text;
                          getRecipe();
                        }, icon: const Icon(Icons.search,)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),

                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),

                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: () async{
                    await showBottomSheet();
                  setState(() {

                  });
                  }, icon: const Icon(Icons.filter_list_outlined))

                ],
              ),
        ),
        ),
        body:isLoading ? Loader(loading: isLoading)  :
        results.isEmpty ? SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/no_result_founded.png'),
              const Text('No result Founded !')
            ],
          ),
        ) :  GridView.builder(
          controller: singleScroll,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ), itemCount: results.length,
            itemBuilder: (context,index){
              return     GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailPage(id: results[index].id,isFavorite: ref.watch(favoriteProvider).any((element) => element.id == results[index].id),)));
                },
                child: Container(

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.r,
                          offset: const Offset(4, 8), // Shadow position
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20.r),
                      image: DecorationImage(
                          image: NetworkImage(results[index].image
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
                        child: GestureDetector(
                          onTap: (){
                            setState(() {

                            });
                            if(ref.watch(favoriteProvider).any((element) => element.id == results[index].id)){
                              ref.watch(favoriteProvider.notifier).removeFromFavorites(results[index]);
                            }else{
                              ref.watch(favoriteProvider.notifier).addToFavorites(results[index]);
                            }
  },
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.r)
                            ),
                            child: ref.watch(favoriteProvider).any((element) => element.id == results[index].id) ? const Icon(Icons.favorite,color: Colors.red) : Icon(Icons.favorite_outline_outlined),
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
                                child: SizedBox(
                                  width: 150.w,
                                  child: Text(results[index].title,maxLines: 2,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold
                                  ),
                                  ),
                                )
                              )))
                    ],
                  ),

                ),
                
              );
            })
    ));
  }
}
