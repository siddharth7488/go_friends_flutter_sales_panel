import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
import 'package:gofreindsgo_sales/utils/constants/app_button.dart';
import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
import 'package:gofreindsgo_sales/utils/constants/paths.dart';
import 'package:gofreindsgo_sales/utils/constants/screen_padding.dart';
import 'package:gofreindsgo_sales/utils/constants/sizedbox.dart';
import 'package:gofreindsgo_sales/view/screens/profile_screen/profile_option_screen.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/app_bar.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/custom_field.dart';
// import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/date_of_birth.dart';
import 'package:gofreindsgo_sales/view/widgets/profile_wdigets/marriage_anniversary.dart';
import 'package:gofreindsgo_sales/view_model/edit_profile_viewmodel.dart';
import 'package:gofreindsgo_sales/view_model/profile_viewmodel.dart';
import 'package:gofreindsgo_sales/view_model/user_details.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

DateTime? _selectedDate;

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Fetch the profile data and populate controllers
    final profileViewModel =
        Provider.of<ProfileViewModel>(context, listen: false);
    profileViewModel.fetchProfile().then((_) {
      setState(() {
        _nameController.text = profileViewModel.userName ?? '';
        _emailController.text = profileViewModel.userEmail ?? '';
        _phoneController.text = profileViewModel.userPhone ?? '';
        _sourceController.text = profileViewModel.source ?? '';
        _referralController.text = profileViewModel.referral ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context, listen: true);
    return Scaffold(
      appBar: appBarProfileEditingScreen(),
      body: Padding(
        padding: commonScreenPadding(context),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                key: _signUpFormKey,
                child: Consumer<ProfileViewModel>(
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomSizedBoxHeight(0.02),
                        ProfileImageStack(
                          value,
                          imagePath: value.profilePic ?? '',
                        ),
                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          keyboardType: TextInputType.name,
                          textInputFormatter: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]'))
                          ],
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "please enter your name";
                            } else {
                              return null;
                            }
                          },
                          controller: _nameController,
                          hintText: 'Enter your Name',
                          labelText: 'Name',
                          prefixIcon: const Icon(Icons.account_circle_outlined),

                        ),
                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "please enter your Phone Number";
                            } else {
                              return null;
                            }
                          },
                          controller: _phoneController,
                          hintText: 'Enter your Phone',
                          labelText: 'Phone',
                          prefixIcon: const Icon(Icons.call_outlined),
                          suffix: const Icon(
                            Icons.verified_outlined,
                            color: AppColors.succesIconColor,
                          ),
                        ),

                        // const Align(
                        //   alignment: AlignmentDirectional.topStart,
                        //   child: CustomText(
                        //     fontFamily: CustomFonts.poppins,
                        //     text: 'Date of Birth',
                        //     size: 0.04,
                        //     color: AppColors.blackColor,
                        //   ),
                        // ),
                        // const DateOfBirthContainer(),

                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          submitFun: (value) {
                            if (_signUpFormKey.currentState!.validate()) {
                              _sourceController.text =
                                  userViewModel.sourceController;
                            } else {
                              return;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          hintText: 'Enter your Email Address',
                          labelText: 'Email Address',
                          prefixIcon: const Icon(Icons.email_outlined),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            final emailRegExp = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            );
                            if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const CustomSizedBoxHeight(0.02),
                        const DatePickerContainer(),
                        const CustomSizedBoxHeight(0.02),
                        LabeledInputField(
                          controller: _referralController,
                          hintText: 'Backend',
                          labelText: 'Designation',
                          prefixIcon: const Icon(Icons.location_city),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const CustomSizedBoxHeight(0.02),
              Column(
                children: [
                  const CustomSizedBoxHeight(0.03),
                  CustomButton(
                    function: () async {
                      if (_signUpFormKey.currentState!.validate()) {
                        final profileViewModel =
                            Provider.of<EditProfileViewmodel>(context,
                                listen: false);

                        // Create a map of the updated data
                        Map<String, dynamic> updatedData = {
                          "name": "dsa",
                          "company_name": "adsfasd",
                          "email": "user4@gmail.com",
                          "dob": _selectedDate,
                          "phone": "9999999999",
                          "frequent_flyer_no": "asdfasd",
                          "additional_details": "adsfasdf"
                          // "name": _nameController.text,
                          // "email": _emailController.text,
                          // "phone": _phoneController.text,
                          // "dob": "User DOB",
                          // "frequent_flyer_no":
                          //     _referralController.text.isNotEmpty
                          //         ? _referralController.text
                          //         : null,
                          // "additional_details":
                          //     "User additional details" // You can add more fields here if needed
                        };

                        profileViewModel.updateUserProfile(updatedData);
                        Get.to(const ProfileOptionScreen());
                        // Optionally show a success message or navigate to another screen
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text('Profile updated successfully'),
                        //   backgroundColor: Colors.green,
                        // ));
                        // } catch (error) {
                        //   print('erro');
                        //   // Handle errors and show an error message
                        //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   //   content: Text('Failed to update profile'),
                        //   //   backgroundColor: Colors.red,
                        //   // ));
                        // }
                      }
                    },
                    text: 'Save',
                    fontSize: 0.04,
                    buttonTextColor: AppColors.whiteColor,
                    borderColor: AppColors.transparentColor,
                    fontFamily: CustomFonts.poppins,
                  ),
                  const CustomSizedBoxHeight(0.03),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:gofreindsgo_sales/utils/color_theme/colors.dart';
// import 'package:gofreindsgo_sales/utils/constants/custom_text.dart';
// import 'package:gofreindsgo_sales/utils/constants/mediaquery.dart';
class DatePickerContainer extends StatefulWidget {
  const DatePickerContainer({super.key});

  @override
  _DatePickerContainerState createState() => _DatePickerContainerState();
}

class _DatePickerContainerState extends State<DatePickerContainer> {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  DateTime? _selectedDate; // To hold the selected date

  // This function will call your API to store the selected date
  void _storeSelectedDateToApi(String date) {
    // Call your API service to store the selected date
    // Example:
    // APIService.storeDate(date);
    print("Storing selected date to API: $date");
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      // Format and store the date to API
      String formattedDate = _dateFormat.format(picked);
      _storeSelectedDateToApi(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomText(
            fontFamily: CustomFonts.poppins,
            text: 'Date of Birth',
            size: 0.04,
            color: AppColors.blackColor,
          ),
        ),
        SizedBox(height: mediaqueryheight(0.01, context)),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromARGB(54, 38, 8, 37)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Leading calendar icon
                const Icon(Icons.cake, color: Color.fromARGB(255, 80, 79, 80)),
                SizedBox(width: mediaquerywidth(0.04, context)),
                // Show the selected date or a placeholder text
                // Vertical Divider
                const VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Color.fromARGB(255, 150, 150, 150), // Customize the color as needed
                ),
                CustomText(
                  fontFamily: CustomFonts.poppins,
                  text: _selectedDate != null
                      ? _dateFormat.format(_selectedDate!)
                      : 'Select Date',
                  size: 0.035,
                  color: AppColors.blackColor,
                ),
                SizedBox(width: mediaquerywidth(0.46, context)),
                const Icon(
                  Icons.verified_outlined,
                  color: AppColors.succesIconColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
