import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/domain/entities/aireading_update_params_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/ai_reading/presentation/widgets/aireading_tile_content.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/date_cubit/flashcard_date_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flashcard_bloc/flash_card_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../core/common/utils/date_util.dart';
import '../../../../../../../../core/common/utils/toast_util.dart';
import '../../../../../../../../core/routing/route_names.dart';
import '../../../../../../../../init_dependencies.dart';
import '../../../../../../../../shared/widgets/loader_indicator.dart';
import '../../children/flash_cards/presentation/widget/flash_card_tile.dart';
import '../../data/models/activity_model/activity_model.dart';
import '../bloc/activity_progress/activity_progress_bloc.dart';

class ActivityTile extends StatelessWidget {
  final ActivityModel activity;
  final bool hasModifyPermission;
  final int courseId;

  const ActivityTile({
    super.key,
    required this.activity,
    required this.hasModifyPermission,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return activity.when(
      aIReading: (
        id,
        title,
        description,
        dueDate,
        aiReadingId,
        content,
        length,
        complexity,
        style,
        createdAt,
        updatedAt,
        totalScore,
      ) {
        return _buildAIReadingTile(
          aiReadingId: aiReadingId,
          context,
          id: activity.id,
          title: title,
          description: description,
          dueDate: dueDate,
          content: content,
          length: length,
          complexity: complexity,
          style: style,
          totalScore: totalScore,
          hasModifyPermission: hasModifyPermission,
        );
      },

      flashCard: (
        id,
        title,
        description,
        dueDate,
        hasScoring,
        maxScore,
        createdAt,
        updatedAt,
        flashCardActivityId,
        maxCards,
        cardOrder,
        bestScore,
      ) {
        return _buildFlashCardTile(
          context,
          activityId: id,
          flashCardActivityId: flashCardActivityId,
          title: title,
          description: description,
          dueDate: dueDate,
          maxCards: maxCards,
          cardOrder: cardOrder,
          hasScoring: hasScoring,
          bestScore: bestScore,
          hasModifyPermission: hasModifyPermission,
          courseId: courseId,
        );
      },
    );
  }

  Widget _buildAIReadingTile(
    BuildContext context, {
    required int id,
    required int aiReadingId,
    required String title,
    required String description,
    required DateTime dueDate,
    required String content,
    required String length,
    required String complexity,
    required String style,
    required double? totalScore,
    required bool hasModifyPermission,
  }) {
    return BlocProvider.value(
      value: serviceLocator<ActivityProgressBloc>(),
      child: AIReadingTileContent(
        aiReadingId: aiReadingId,
        id: id,
        activityId: id,
        title: title,
        description: description,
        dueDate: dueDate,
        content: content,
        length: length,
        complexity: complexity,
        style: style,
        activity: activity,
        totalScore: totalScore,
        hasModifyPermissions: hasModifyPermission,
      ),
    );
  }

  Widget _buildFlashCardTile(
    BuildContext context, {
    required int activityId,
    required int flashCardActivityId,
    required String title,
    required String description,
    required DateTime dueDate,
    required int maxCards,
    required String cardOrder,
    required bool hasScoring,
    required double? bestScore,
    required bool hasModifyPermission,
    required int courseId,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: serviceLocator<FlashCardBloc>()),
        BlocProvider.value(value: serviceLocator<FlashCardDateCubit>()),
      ],
      child: FlashCardTileContent(
        activityId: activityId,
        flashCardActivityId: flashCardActivityId,
        title: title,
        description: description,
        dueDate: dueDate,
        maxCards: maxCards,
        cardOrder: cardOrder,
        hasScoring: hasScoring,
        activity: activity,
        bestScore: bestScore,
        hasModifyPermission: hasModifyPermission,
        courseId: courseId,
      ),
    );
  }
}
