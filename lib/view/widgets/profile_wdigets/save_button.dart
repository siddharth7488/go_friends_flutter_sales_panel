import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/app_button.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/text_controllers.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class SaveButtonProfile extends StatelessWidget {
  final ProfileViewModel value;
  const SaveButtonProfile(
    this.value, {
    super.key,
    required this.profileFormKey,
  });

  final GlobalKey<FormState> profileFormKey;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: value.onEditPressed ? 1 : .5,
      child: CustomButton(
        function: value.onEditPressed
            ? () {
                if (profileFormKey.currentState!.validate() &&
                    value.dob != null) {
                      final File? imageFile = value.newImagePath==null?null: File(value.newImagePath!); 
                  final updatedData = {
                    "name": nameController.text,
                    "company_name": companyNameController.text,
                    "email": emailController.text,
                    "dob": value.dob,
                    "phone": mobileController.text,
                    "frequent_flyer_no": frequentController.text,
                    "additional_details": additionalController.text,
                    "image": imageFile
                   
                  };

                  log('shahu ${value.profileResponse!.data.user.id}');
                  context.read<ProfileViewModel>().updateProfile(
                      value.profileResponse!.data.user.id, updatedData);
                } else {
                  return;
                }
              }
            : () {},
        text: 'Save',
        fontSize: 0.04,
        buttonTextColor: AppColors.whiteColor,
        borderColor: AppColors.transparentColor,
        fontFamily: CustomFonts.poppins,
      ),
    );
  }
}
