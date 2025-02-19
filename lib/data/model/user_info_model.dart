import 'package:hive/hive.dart';
part 'user_info_model.g.dart';

@HiveType(typeId: 0)
class UserInfoModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String course_taken;
  UserInfoModel({
    required this.course_taken,
    required this.name,
  });
}
