import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/view/widgets/home_screen_widgets/custom_list.dart';
import 'package:gofreindsgo_sales/view_model/stories_viewmodel.dart';

import 'package:provider/provider.dart';

class StoryViewWIdget extends StatelessWidget {
  const StoryViewWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mediaqueryheight(0.12, context),
      child: Consumer<StoriesViewModel>(
        builder: (context, storiesViewModel, child) {
          if (storiesViewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: storiesViewModel.storiesResponse!.data.stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: StoryItem(
                    currentIndex: index,
                    allStories: storiesViewModel.storiesResponse!.data.stories,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
