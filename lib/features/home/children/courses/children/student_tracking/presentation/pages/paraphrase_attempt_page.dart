import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/student_tracking/presentation/widgets/paraphrase_attempt_tile_t.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../../../core/common/entities/user_entity.dart';
import '../../../../domain/entities/paraphrase_attempt_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class ParaphraseAttemptsPage extends StatefulWidget {
  final int aiReadingId;
  final UserEntity userEntity;
  const ParaphraseAttemptsPage({
    super.key,
    required this.aiReadingId,
    required this.userEntity,
  });

  @override
  State<ParaphraseAttemptsPage> createState() => _ParaphraseAttemptsPageState();
}

class _ParaphraseAttemptsPageState extends State<ParaphraseAttemptsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _fetchParaphrases();
  }

  void _fetchParaphrases() {
    context.read<TrackingBloc>().add(
      FetchAllParaphrasesAttempts(
        aiReadingId: widget.aiReadingId,
        targetUserId: widget.userEntity.id,
      ),
    );
  }

  void _onRefresh() {
    _fetchParaphrases();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackingBloc, TrackingState>(
      listener: (context, state) {
        if (state is TrackingError) {
          ToastMessageUtil.showToast(state.message, context);
        }
      },
      builder: (context, state) {
        if (state is TrackingLoading &&
            state.operation == TrackingOperation.allParaphrases) {
          return const Center(child: LoaderIndicator());
        }

        if (state is TrackingAllParaphrasesLoaded) {
          final List<ParaphraseAttemptEntity> paraphrases = state.paraphrases;

          if (paraphrases.isEmpty) {
            return const Center(child: Text("No paraphrase attempts yet."));
          }

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            header: const WaterDropHeader(),
            child: ListView.builder(
              itemCount: paraphrases.length,
              itemBuilder: (context, index) {
                final attempt = paraphrases[index];
                return ParaphraseAttemptTileTracking(attempt: attempt);
              },
            ),
          );
        }

        return const Center(child: Text("Pull down to refresh."));
      },
    );
  }
}
