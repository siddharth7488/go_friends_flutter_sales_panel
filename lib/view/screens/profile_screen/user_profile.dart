// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/screen_padding.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/utils/constants/text_controllers.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/app_bar.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/chat_history_card.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/custom_field.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/marriage_anniversary.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  final String name;
  final String conmpanyName;
  final String email;
  final String phone;
  final String dob;
  final String imagePath;

  const UserProfileScreen({
    super.key,
    required this.name,
    required this.conmpanyName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.imagePath,
  });

  @override
  UserProfileScreenScreenState createState() => UserProfileScreenScreenState();
}

class UserProfileScreenScreenState extends State<UserProfileScreen> {
  GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    // context.read<ProfileViewModel>().fetchProfile();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //   Fetch data from the provider
      final profileViewModel =
          Provider.of<ProfileViewModel>(context, listen: false);
      profileViewModel.disposing();
      nameController.text = widget.name;
      companyNameController.text = widget.conmpanyName;
      emailController.text = widget.email;
      mobileController.text = widget.phone;
      // frequentController.text = profileViewModel.frequentFlyerNo ?? '';
      // additionalController.text = widget.;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarProfile(),
      body: SafeArea(
        child: Padding(
          padding: commonScreenPadding(context),
          child: Consumer<ProfileViewModel>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SingleChildScrollView(
                  child: Form(
                    key: profileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileImageStack(value,
                            imagePath: value.profilePic ?? ''),
                        const CustomSizedBoxHeight(0.02),
                        Row(
                          children: [
                            CustomText(
                              text: nameController.text,
                              fontFamily: CustomFonts.roboto,
                              size: 0.055,
                              color: AppColors.blackColor,
                              weight: FontWeight.w900,
                            ),
                          ],
                        ),
                        if (!value.onEditPressed)
                          // ProfilepageeEditbutton(
                          //   ontap: () => value.editButtonPressed(),
                          // ),
                          const CustomSizedBoxHeight(0.01),
                        LabeledInputField(
                          hintText: 'Name',
                          labelText: 'Name',
                          controller: nameController,
                          isEnabled: value.onEditPressed,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "this field is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          hintText: 'Ab2C Travels',
                          labelText: 'Company Name',
                          controller: companyNameController,
                          isEnabled: value.onEditPressed,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "this field is required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          hintText: 'Abc@gmail.com',
                          labelText: 'Email',
                          controller: emailController,
                          isEnabled: false,
                          suffix: Icon(Icons.verified_outlined),
                        ),
                        const CustomSizedBoxHeight(0.02),
                        const Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomText(
                            fontFamily: CustomFonts.poppins,
                            text: 'Date of Birth',
                            size: 0.04,
                            color: AppColors.blackColor,
                          ),
                        ),
                        // DateOfBirthContainer(value),
                        if (value.onEditPressed && value.dob == null)
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "this field is required",
                                style: TextStyle(color: Colors.red),
                              )),
                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          keyboardType: TextInputType.phone,
                          hintText: 'Enter Mobile Number',
                          labelText: 'Mobile',
                          controller: mobileController,
                          isEnabled: value.onEditPressed,
                          validator: (value) {
                            if (value!.trim().isEmpty || !value.isPhoneNumber) {
                              return "please enter a valid phone number";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const CustomSizedBoxHeight(0.02),
                        const Align(
                          alignment: AlignmentDirectional.topStart,
                          child: CustomText(
                            fontFamily: CustomFonts.poppins,
                            text: 'Marriage anniversary',
                            size: 0.04,
                            color: AppColors.blackColor,
                          ),
                        ),
                        MarriageAnniversaryContainer(value),
                        const CustomSizedBoxHeight(0.02),
                        const ChatHistoryWidgetCard(),
                        const CustomSizedBoxHeight(0.04),
                      ],
                    ),
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
