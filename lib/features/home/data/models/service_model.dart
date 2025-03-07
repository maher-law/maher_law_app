import '../../../../core/theme/app_icons.dart';

class ServiceModel {
  final String icon, title, dsecription;

  ServiceModel({
    required this.icon,
    required this.title,
    required this.dsecription,
  });
}


List<ServiceModel> servicesData = [
  ServiceModel(
    icon: AppIcons.balance,
    title: 'تقديم الاستشارات القانونية',
    dsecription: 'المتعلّقة بجميع فروع القانون',
  ),
  ServiceModel(
    icon: AppIcons.hammer,
    title: 'عقود التكنولوجيا',
    dsecription: 'عقد توريد وترخيص استخدام البرمجيات',
  ),
  ServiceModel(
    icon: AppIcons.shield,
    title: 'عقود تطوير البرمجيات',
    dsecription: 'عقد شراكة فى تطبيق الكترونى',
  ),
  ServiceModel(
    icon: AppIcons.handshake,
    title: 'صياغة كلّ أنواع العقود',
    dsecription: 'باللّغتين العربية والإنجليزية',
  ),
];
