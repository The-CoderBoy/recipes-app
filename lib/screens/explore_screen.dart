import 'package:flutter/material.dart';
import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatefulWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreen();
}

class _ExploreScreen extends State<ExploreScreen> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print('reached the bottom');
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      print('reached the top!');
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.mockService.getExploreData(),
        builder: (context, snapshot) {
          // TODO: Add Nested List Views
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(snapshot.data!.todayRecipes),
                const SizedBox(height: 16),
                FriendPostListView(friendPosts: snapshot.data!.friendPosts),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
