import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/core/constants/app_colors.dart';
import 'package:lmima_food/core/enums/app_enums.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_button.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';

class SliderComponent extends StatefulWidget {
  const SliderComponent({super.key});

  @override
  State<SliderComponent> createState() => _SliderComponentState();
}

class _SliderComponentState extends State<SliderComponent> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return CustomField(
        arrangement: FieldArrangement.column,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: R.size(20)),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: R.size(600),
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 1200),
              autoPlayInterval: const Duration(milliseconds: 5000),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {},
            ),
            items: [
              _buildSlider(
                  context: context,
                  title: "Discover Chef Lala Fatime's Delicious Dishes",
                  text:
                      "Chef Lala Fatime enchants with her skillfully crafted tajine and tanjiya, blending traditional Moroccan flavors with a modern twist.\nHer tajine, prepared with tender beef, simmers in a symphony of aromatic spices, creating a dish that is both comforting and rich in flavor.\nFor those preferring poultry, her tanjiya with succulent chicken offers a delightful alternative, cooked to perfection in a savory broth.\nBeyond savory delights, Chef Lala Fatime also delights patrons with her homemade sweets.\nFrom delicate pastries to decadent confections, each treat is a testament to her culinary artistry, ensuring every bite is a moment of pure indulgence.",
                  primaryColor: AppColors.yellowHoney,
                  secondaryColor: AppColors.light.primaryColor2,
                  chefProfilePicture: AppPaths.images.profilePicture,
                  sliderImage: AppPaths.images.sliderImage1),
              _buildSlider(
                  context: context,
                  title: "Discover Chef Lala Fatime's Delicious Dishes",
                  text:
                      "Chef Lala Fatime enchants with her skillfully crafted tajine and tanjiya, blending traditional Moroccan flavors with a modern twist.\nHer tajine, prepared with tender beef, simmers in a symphony of aromatic spices, creating a dish that is both comforting and rich in flavor.\nFor those preferring poultry, her tanjiya with succulent chicken offers a delightful alternative, cooked to perfection in a savory broth.\nBeyond savory delights, Chef Lala Fatime also delights patrons with her homemade sweets.\nFrom delicate pastries to decadent confections, each treat is a testament to her culinary artistry, ensuring every bite is a moment of pure indulgence.",
                  primaryColor: AppColors.light.primaryColor2,
                  secondaryColor: AppColors.yellowHoney,
                  chefProfilePicture: AppPaths.images.profilePicture,
                  sliderImage: AppPaths.images.sliderImage2),
            ],
          ),
        ]);
  }

  Widget _buildSlider({
    required BuildContext context,
    required String chefProfilePicture,
    required String title,
    required String text,
    required Color primaryColor,
    required Color secondaryColor,
    required String sliderImage,
  }) {
    return CustomField(
      arrangement: FieldArrangement.row,
      width: double.infinity,
      backgroundColor: primaryColor,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      borderRadius: R.size(10),
      gap: R.size(40),
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: EdgeInsets.symmetric(horizontal: R.size(50)),
      children: [
        CustomField(
            arrangement: FieldArrangement.column,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: R.size(10),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(R.size(30)),
                child: Image.asset(
                  chefProfilePicture,
                  width: R.size(70),
                  height: R.size(70),
                  fit: BoxFit.cover,
                ),
              ),
              CustomText(
                text: title,
                color: AppColors.whiteSolid,
                fontSize: R.size(30),
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                text: text,
                textAlign: TextAlign.left,
                color: AppColors.whiteSolid,
                fontSize: R.size(14),
                fontWeight: FontWeight.w400,
                lineHeight: 1.5,
              ),
              CustomButton(
                svgIconPath: AppPaths.vectors.longArrowRightIcon,
                iconTextPadding: R.size(10),
                iconHeight: R.size(16),
                iconColor: AppColors.whiteSolid,
                backgroundColor: secondaryColor,
                borderRadius: R.size(50),
                margin: EdgeInsets.only(top: R.size(30), left: R.size(10)),
                padding: EdgeInsets.symmetric(
                    vertical: R.size(20), horizontal: R.size(80)),
                iconPosition: CustomButtonIconPosition.right,
                text: 'Discover now',
                textSize: R.size(18),
                textColor: AppColors.whiteSolid,
                fontWeight: FontWeight.w400,
              ),
            ]),
        Image.asset(
          sliderImage,
          width: R.size(400),
        ),
      ],
    );
  }
}
