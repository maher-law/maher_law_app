// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:maher_law_app/core/theme/app_colors.dart';
// import 'package:maher_law_app/core/theme/app_styles.dart';
// import 'package:maher_law_app/features/home/presentation/cubits/pagination_cubit/pagination_cubit.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../../blog/presentation/widgets/blog_tag_widget.dart';

// class PaginationControllers extends StatelessWidget {
//   const PaginationControllers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         CustomTextButton(
//           radius: 10,
//           onTap: () async {
//             if (!(await context.read<PaginationCubit>().previousPage())) {
//               if (context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     duration: const Duration(milliseconds: 800),
//                     content: Center(
//                       child: Text(
//                         'ليس هناك مقالات سابقة',
//                         style: AppStyles.style18bold(context).copyWith(
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             }
//           },
//           text: 'السابق',
//           style: AppStyles.style18medium(context),
//         ),
//         SizedBox(width: 2.w),
//         CustomTextButton(
//           radius: 10,
//           onTap: () async {
//             if (!(await context.read<PaginationCubit>().nextPage())) {
//               if (context.mounted) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     duration: const Duration(milliseconds: 800),
//                     content: Center(
//                       child: Text(
//                         'لم يعد هناك مقالات أخرى',
//                         style: AppStyles.style18bold(context).copyWith(
//                           color: AppColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//             }
//           },
//           text: 'التالي',
//           style: AppStyles.style18medium(context),
//         ),
//       ],
//     );
//   }
// }
