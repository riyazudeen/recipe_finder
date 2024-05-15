import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_finder/loader.dart';

import '../api_services.dart';
import '../model_class/recipie_detail_data.dart';
class RecipeDetailPage extends ConsumerStatefulWidget {
 final int id;
 final bool isFavorite;
  const RecipeDetailPage({required this.id,required this.isFavorite , super.key});

  @override
  ConsumerState<RecipeDetailPage> createState() => _RecipetDetailPageState();
}

class _RecipetDetailPageState extends ConsumerState<RecipeDetailPage> {
 late RecipeDetailData recipeDetailData;
 bool isLoading = false;
 final abiServices = ApiServices();

 @override
  void initState() {
   getDetailData(widget.id);
    super.initState();
  }


void getDetailData(int id) async{
  isLoading = true;
  RecipeDetailData data = await abiServices.getRecipeDetailData(id);
  recipeDetailData = data;
  isLoading = false;
  setState(() { });
}

Widget title(String text){
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
     child:  Text(text,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
         color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp
     ),),
   );
}

  @override
  Widget build(BuildContext context) {
    return isLoading ? Loader(loading: isLoading) :SafeArea(child:  Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:  MediaQuery.of(context).size.height / 2.5,
                child: Stack(
                  children: [
                    Image.network(recipeDetailData.image),
                    Positioned(
                      top: 10.h,
                      bottom: 220.h,
                      left: 25.w ,
                      right: 20.w,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.r)
                              ),
                              child:  const Icon(Icons.arrow_back_ios_new),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {

                              });
                            },
                            child: Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.r)
                              ),
                              child: widget.isFavorite ? const Icon(Icons.favorite,color: Colors.red) : Icon(Icons.favorite_outline_outlined),
                            ),
                          ),

                        ],
                      )),
                    Positioned(
                      top: 180.h,
                      bottom: 0.h,
                      left: 20.w ,
                      right: 20.w,
                      child: Container(

                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4.r,
                              offset: const Offset(4, 8), // Shadow position
                            ),
                          ],
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('RECIPE',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontStyle: FontStyle.italic,color: Colors.black
                            ),),
                            SizedBox(height: 4.h,),
                            Text(recipeDetailData.title,maxLines: 2,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.black,fontWeight: FontWeight.bold,fontSize: recipeDetailData.title.length > 30 ? 13.sp : 15.sp
                            ),),

                          ],
                        ),
                      ),),
                  ],
                ),

              ),
              title('Summary'),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: HtmlWidget(recipeDetailData.summary,
                customStylesBuilder: (element) {
                  if (element.classes.contains('foo')) {
                    return {'color': 'red'};
                  }
                  return null;
                },
                renderMode: RenderMode.column,
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,fontSize:12.sp
                ),
              ),
              ),
              title('Ingredients'),
              ListView.builder(
                shrinkWrap: true,
                  //padding: EdgeInsets.symmetric(vertical: 10.h),
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: recipeDetailData.extendedIngredients.length,
                  itemBuilder: (context,index){
                   final data = recipeDetailData.extendedIngredients[index];
                return ListTile(
                  minVerticalPadding: 20.h,
                  titleTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                  leading: SizedBox(
                    width: 50.w,
                    height: 100.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.network(data.image,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                        return Image.network('https://plus.unsplash.com/premium_photo-1670963025556-c2d4dc880a45?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
                      },
                      ),

                    ),
                  ),
                  //isThreeLine: true,
                  title: Text(data.name),
                  trailing: Wrap(
                     spacing: 10,
                    children: [
                      Text(data.amount.toString()),
                      Text(data.unit,style:  Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
              title('Directions'),
              ListView.builder(
                  shrinkWrap: true,
                  physics:const NeverScrollableScrollPhysics(),
                  itemCount: recipeDetailData.analyzedInstructions.length,
                  itemBuilder: (context,index){
                    final data = recipeDetailData.analyzedInstructions[index];
                    return Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: data.steps.length,itemBuilder: (context,index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [

                              Text("step ",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.black,fontWeight: FontWeight.bold
                              ),),
                              Text(data.steps[index].number.toString(),style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.black
                              ),),
                            ],
                          ),
                          Text(data.steps[index].step,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black
                          ),),
                         Container(
                           margin: EdgeInsets.symmetric(vertical: 10.h),
                           height: 60.h,
                           width: double.infinity,
                           child: ListView.builder(
                               shrinkWrap: true,
                               scrollDirection:  Axis.horizontal,
                               itemCount: data.steps[index].ingredients.length,
                               itemBuilder: (context,ingIndex){
                                 return
                                   data.steps[index].ingredients[ingIndex].image.isEmpty ? Container() : SizedBox(
                                     height: 100.h,
                                     child: Image.network(data.steps[index].ingredients[ingIndex].image, errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                       return Container(

                                         margin: EdgeInsets.symmetric(horizontal: 5.w),
                                         decoration: BoxDecoration(

                                           borderRadius: BorderRadius.circular(30.r),
                                           border: Border.all(
                                             color: Colors.black
                                           )
                                         ),
                                         padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),child:  Icon(Icons.broken_image_sharp),); },),
                                   );
                               }),
                         )

                        ],
                      );
                    }),
                    );
                  }),
            ],
          ),
        )
    ));
  }
}
