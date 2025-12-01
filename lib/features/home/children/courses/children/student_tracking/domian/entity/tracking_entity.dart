import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/progress_entity.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/domian/entity/statistics_entity.dart';

class TrackingEntity {
  final List<ReadingProgressEntity> progresses;
  final StatisticsEntity statistics;

  TrackingEntity({required this.progresses, required this.statistics});
}
