import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../app_constants.dart';
import '../models/blog_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_images.dart';
import 'hover_button.dart';

class BlogsSidebar extends StatelessWidget {
  const BlogsSidebar({super.key, this.shrinkWrap = false});
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: ListView(
        shrinkWrap: shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        children: [
          HoverButton(
            endScale: 1.01,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.grey, width: 2.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: .5,
                    blurRadius: 30,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ابحث',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.grey, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.grey, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.grey, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      //TODO

                      List<Map<String, dynamic>> test =
                          List.generate(15, (index) {
                        var title = 'Testing number: ${index + 1}';
                        return Blog(
                          id: index.toString(),
                          title: title,
                          contentJson: AppConstants.textBlogContentJson,
                          createdAt: Timestamp.fromDate(
                              DateTime.now().copyWith(day: index + 1)),
                          htmlContent: '',
                          imageUrls: [],
                          slug: title.replaceAll(' ', '-'),
                          tags: ['tag $index', 'tag ${index + 1}'],
                          thumbnailImageUrl: AppImages.team,
                        ).toFirestore();
                      });

                      for (var doc in test) {
                        FirebaseFirestore.instance
                            .collection(ApiKeys.blogsCollection)
                            .add(doc);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(12),
                      child: HoverButton(
                        endScale: 1.15,
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.grey, width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: .5,
                  blurRadius: 30,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
            child: Column(
              children: [
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
