import '../../../Data/Models/post_models.dart';

  abstract class PostState{}

   class PostLoadingState extends PostState{}

   class PostLoadedState extends PostState{
     final List<PostModel> post;
     PostLoadedState(this.post);
  }

   class PostErrorState extends PostState{
     final String error;
     PostErrorState(this.error);
  }

