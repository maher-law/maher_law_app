import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';
import 'hover_button.dart';

class BlogsSearchBar extends StatelessWidget {
  const BlogsSearchBar({super.key, this.decorated = true,  this.padding});
  final bool decorated;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.01,
      child: Container(
        padding:padding?? EdgeInsets.symmetric(horizontal: 2.w, vertical: 8.h),
        decoration: decorated
            ? BoxDecoration(
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
              )
            : null,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: 2),
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

                // List<Map<String, dynamic>> test =
                //     List.generate(15, (index) {
                //   var title = 'Testing number: ${index + 1}';
                //   return Blog(
                //     id: index.toString(),
                //     title: title,
                //     contentJson: AppConstants.textBlogContentJson,
                //     createdAt: Timestamp.fromDate(
                //         DateTime.now().copyWith(day: index + 1)),
                //     htmlContent: '',
                //     imageUrls: [],
                //     slug: title.replaceAll(' ', '-'),
                //     tags: ['tag $index', 'tag ${index + 1}'],
                //     thumbnailImageUrl: AppImages.team,
                //   ).toFirestore();
                // });

                // for (var doc in test) {
                //   FirebaseFirestore.instance
                //       .collection(ApiKeys.blogsCollection)
                //       .add(doc);
                // }
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
    );
  }
}
