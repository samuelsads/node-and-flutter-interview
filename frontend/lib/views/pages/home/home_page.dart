import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/utils/data_helper.dart';
import 'package:frontend/utils/lauch_url.dart';
import 'package:frontend/views/blocs/articles/articles_bloc.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        context.read<ArticlesBloc>().getAll();
      }
    });
    super.initState();
  }


  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: _body(),
    );
  }

  Widget _body(){
    return  BlocBuilder<ArticlesBloc, ArticlesState>(builder: (context, state) {
     if(state.loadingArticle || state.initialArticle){
      return const Center(child: CircularProgressIndicator());
     }


     if(state.successArticle){
      final data = state.articles??[];
      return ListView.builder(
        itemCount:  data.length,
        itemBuilder: (context, index) {
          final element  = data[index];
        return GestureDetector(
          onTap: (){
              try {
            LauchUrl().LaunchUrl(Uri.parse(element.url));
          } catch (e) {
            print(e);
          }
          },
          child: Container(
            margin:  EdgeInsets.only(left: 24, right: 24, top:(index  == 0)?27:12),
            width: 613,
            height: 152,
            decoration:  BoxDecoration(
              color:Colors.white,
              border: Border.all(width: 1,color: Colors.black ),
              borderRadius:const BorderRadius.all(Radius.circular(15)),
              ),
          
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:const  EdgeInsets.only(left: 36, bottom: 26, top: 26),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const Center(child: CircularProgressIndicator());
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.image_not_supported_sharp);
                        },
                            imageUrl: element.urlToImage,
                            height: 100,
                            width: 100,
                          ),
                    ),
                  ),
                 Expanded(
                   child: Container(
                    margin: const EdgeInsets.only(top:33.5, bottom: 29.5, right: 39, left: 24 ),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Container(
                        child: Text(element.title, maxLines: 1,overflow: TextOverflow.ellipsis, style:const  TextStyle(fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),textAlign: TextAlign.start,),
                      ),
                       Container(
                        margin: const EdgeInsets.only(top: 3),
                        child: Text(element.author, maxLines: 1,overflow: TextOverflow.ellipsis,style:const  TextStyle(fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),textAlign: TextAlign.start,),
                      ),
                       Expanded(
                         child: Container(
                              margin: const EdgeInsets.only( top: 3),
                              child: Text(element.description, maxLines: 2,overflow: TextOverflow.ellipsis, style:const  TextStyle(height: 1.25,fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 14,fontWeight: FontWeight.w400),),
                                             ),
                       ),
                      ],
                     ),
                   ),
                 )
                ],
              ),
          ),
        );
      },);
     }

     return const SizedBox.shrink();
   },); 
  }

  Widget _body1() {
   return  BlocBuilder<ArticlesBloc, ArticlesState>(builder: (context, state) {
     if(state.loadingArticle || state.initialArticle){
      return const Center(child: CircularProgressIndicator());
     }


     if(state.successArticle){
      final data = state.articles??[];
      return ListView.builder(
        itemCount:  data.length,
        itemBuilder: (context, index) {
          final element  = data[index];
        return GestureDetector(
          onTap: (){
              try {
            LauchUrl().LaunchUrl(Uri.parse(element.url));
          } catch (e) {
            print(e);
          }
          },
          child: Container(
            margin:const  EdgeInsets.only(left: 24, right: 24, top:12),
            width: MediaQuery.of(context).size.width,
            height: 470,
            decoration: const BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
          
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:const  EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const Center(child: CircularProgressIndicator());
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.image_not_supported_sharp);
                        },
                            imageUrl: element.urlToImage,
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                          ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12,right: 12, top: 12),
                    child: Text(element.title, maxLines: 3,overflow: TextOverflow.ellipsis, style:const  TextStyle(height: 1.25,fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),textAlign: TextAlign.start,),
                  ),
                   Container(
                    margin: const EdgeInsets.only(left: 12,right: 12, top: 12),
                    child: Text(element.description, maxLines: 4,overflow: TextOverflow.ellipsis,style:const  TextStyle(height: 1.25,fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 14),textAlign: TextAlign.start,),
                  ),
                   Container(
                        margin: const EdgeInsets.only(left: 12,right: 12, top: 12),
                        child: Text(element.author, style:const  TextStyle(fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 12),textAlign: TextAlign.justify,),
                                       ),
                   Container(
                        margin: const EdgeInsets.only(left: 12,right: 12, top: 12),
                        child: Text(DateHelper.formatDate(element.publishedAt), style:const  TextStyle(fontFamily: 'SourceCodePro',color: Colors.black, fontSize: 12),textAlign: TextAlign.justify,),
                                       ),
                ],
              ),
          ),
        );
      },);
     }

     return const SizedBox.shrink();
   },);
  }
}