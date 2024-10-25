import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/services/api/app_apis.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';

class ImageOfProfile extends StatelessWidget {
  final ProfileViewModel value;
  final String imagePath;
  const ImageOfProfile({
    super.key,
    required this.value,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value.onEditPressed ? value.addNewImage() : null;
      },
      child: Container(
        height: mediaqueryheight(0.13, context),
        width: mediaqueryheight(0.13, context),
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: value.newImagePath == null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: mediaqueryheight(0.1, context),
                  height: mediaqueryheight(0.1, context),
                  imageUrl: API.baseImageUrl + imagePath,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.file(
                  File(value.newImagePath!),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
