
import 'package:api_practice/Apis/ApiDemo/Logic/Cubits/PostCubits/post_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Data/Models/post_models.dart';
import '../../../Data/Repository/post_repositorys.dart';


class PostCubit extends Cubit<PostState>{
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
}

  PostRepository postRepository = PostRepository();

  void fetchPosts() async{
    try{
     List<PostModel> posts = await postRepository.fetchPosts();
     emit(PostLoadedState(posts));
    }
    // catch(ex){
    //   emit(PostErrorState(ex.toString()));
    // }

    on DioError catch(ex){
      if(ex.type == DioErrorType.unknown){
        emit(PostErrorState("can't fetch post please, check your internet connection!"));
      }
      else{
        emit(PostErrorState(ex.error.toString()));
      }
    }

  }

}