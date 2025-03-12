import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'keyword_tablet_widget.dart';

class KeywordsTabletGridView extends StatelessWidget {
  const KeywordsTabletGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 5.h,
        mainAxisSpacing: 1.h,
        crossAxisSpacing: 2.w,
      ),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const KeyworkTabletWidget(text: 'كلام للتجربة فقط');
      },
    );
  }
}
