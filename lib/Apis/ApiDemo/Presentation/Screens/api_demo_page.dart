import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/Models/post_models.dart';
import '../../Logic/Cubits/PostCubits/post_cubits.dart';
import '../../Logic/Cubits/PostCubits/post_state.dart';


class ApiDemoPage extends StatelessWidget {
  const ApiDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => PostCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Basic API ',style: TextStyle(
              fontFamily: 'poppins'
            ),),
            centerTitle: true,
          ),
          body: BlocConsumer<PostCubit , PostState>(
            listener: (context , state){
              if (state is PostErrorState){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content : Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                );
              }
            },
            builder: (context ,state){
              if (state is PostLoadingState){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PostLoadedState) {
                return buildPostListView(state.post);
                // return ListView.builder(
                //     itemCount: state.post.length,
                //   itemBuilder: (context ,index){
                //       PostModel post = state.post[index];
                //
                //       return ListTile(
                //         title: Text(post.title.toString()),
                //         subtitle: Text(post.body.toString()),
                //       );
                //   },
                // );
              }
              return Center(
                child: Text('An error occured!'),
              );
            }
          ),
        ),
      ),
    );
  }
  buildPostListView(List<PostModel> posts){
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: posts.length,
      itemBuilder: (context ,index){
        PostModel post = posts[index];

        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            elevation: 2,
            child: ListTile(
              title: Text(post.title.toString()),
              subtitle: Text(post.body.toString()),
            ),
          ),
        );
      },
    );
  }
}
