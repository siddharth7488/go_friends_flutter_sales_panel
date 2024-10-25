import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/view_model/service_viewmodel.dart';
import 'package:provider/provider.dart';

class GridForHomeScreen extends StatefulWidget {
  const GridForHomeScreen({super.key});

  @override
  _GridForHomeScreenState createState() => _GridForHomeScreenState();
}

class _GridForHomeScreenState extends State<GridForHomeScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromRGBO(236, 228, 255, 1),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: mediaqueryheight(0.02, context),
            bottom: mediaqueryheight(0.02, context),
          ),
          child: Consumer<ServiceViewModel>(
            builder: (context, serviceViewModel, child) {
              if (serviceViewModel.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                int totalItems = serviceViewModel.services.length;
                int maxVisibleItems = 8;

                // Determine the item count based on whether it's expanded or not
                int itemCount = totalItems > maxVisibleItems && !_isExpanded
                    ? maxVisibleItems + 1 // 8 items + View More button
                    : totalItems + 1; // All items + View Less button

                int numRows = (itemCount / 4).ceil();
                double containerHeight =
                    numRows * mediaqueryheight(0.10, context);

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: containerHeight,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemCount,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      // Condition to check if we need to display View More/View Less button
                      if (index < maxVisibleItems || _isExpanded) {
                        if (index < serviceViewModel.services.length) {
                          final gridItems = serviceViewModel.services[index];
                          return GestureDetector(
                            onTap: () {
                              // PageNavigations().push(CreateChatScreen(
                              //   serviceName: gridItems.name,
                              //   image: gridItems.image,
                              // ));
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: mediaquerywidth(0.14, context),
                                  height: mediaqueryheight(0.06, context),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          API.baseImageUrl + gridItems.image,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              AppImages.goFriendsGoLogo),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaquerywidth(0.16, context),
                                  child: CustomText(
                                    textAlign: TextAlign.center,
                                    text: gridItems.name,
                                    fontFamily: CustomFonts.poppins,
                                    size: 0.03,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          // The "View Less" button
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _isExpanded = !_isExpanded;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  width: mediaquerywidth(0.14, context),
                                  height: mediaquerywidth(0.14, context),
                                  child: const Center(
                                    child: Icon(Icons.expand_less,
                                        color: AppColors.blackColor),
                                  ),
                                ),
                                SizedBox(
                                  width: mediaquerywidth(0.16, context),
                                  child: const CustomText(
                                    textAlign: TextAlign.center,
                                    text: 'View Less',
                                    fontFamily: CustomFonts.poppins,
                                    size: 0.03,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      } else {
                        // The "View More" button
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                                width: mediaquerywidth(0.14, context),
                                height: mediaquerywidth(0.14, context),
                                child: const Center(
                                  child: Icon(Icons.grid_view,
                                      color: AppColors.blackColor),
                                ),
                              ),
                              SizedBox(
                                width: mediaquerywidth(0.16, context),
                                child: const CustomText(
                                  textAlign: TextAlign.center,
                                  text: 'View More',
                                  fontFamily: CustomFonts.poppins,
                                  size: 0.03,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
