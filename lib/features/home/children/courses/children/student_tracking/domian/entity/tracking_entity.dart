import 'package:client_app/features/home/children/courses/children/student_tracking/data/model/progress/progress_model.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/progress_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/statistics_entity.dart';

class TrackingEntity {
  final List<ProgressModel> progresses;
  final StatisticsEntity statistics;

  TrackingEntity({required this.progresses, required this.statistics});
}
