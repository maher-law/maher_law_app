import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'keyword_desktop_widget.dart';

class KeywordsDesktopListView extends StatelessWidget {
  const KeywordsDesktopListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeyworkDesktopWidget(text: 'كلام للتجربة فقط'),
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 1.h),
    );
  }
}
