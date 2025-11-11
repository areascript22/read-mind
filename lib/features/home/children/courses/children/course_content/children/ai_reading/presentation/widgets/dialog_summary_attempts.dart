import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/domain/entities/summary_attempt_entity.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../../../domain/entities/ai_reading_entity.dart';
import '../cubit/attempts_cubit/attempts_cubit.dart';

Future<void> showSummaryAttemptsDialog(
  BuildContext context,
  AIReadingEntity aiReadingEntity,
) async {
  showDialog(
    context: context,
    builder:
        (_) => BlocProvider.value(
          value: serviceLocator<AttemptsCubit>(),
          child: _SummaryAttemptsDialogBody(aiReadingEntity: aiReadingEntity),
        ),
  );
}

class _SummaryAttemptsDialogBody extends StatefulWidget {
  final AIReadingEntity aiReadingEntity;
  const _SummaryAttemptsDialogBody({super.key, required this.aiReadingEntity});

  @override
  State<_SummaryAttemptsDialogBody> createState() =>
      _SummaryAttemptsDialogBodyState();
}

class _SummaryAttemptsDialogBodyState
    extends State<_SummaryAttemptsDialogBody> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    context.read<AttemptsCubit>().getAllSummaryAttempts(
      widget.aiReadingEntity.aiReadingId,
      context.read<AppUserCubit>().user?.id ?? -1,
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Summary Attempts',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Expanded(
                child: BlocConsumer<AttemptsCubit, AttemptsState>(
                  listener: (context, state) {
                    if (state is AttemptsError &&
                        state.attemptOperation == AttemptOperation.summaryAll) {
                      ToastMessageUtil.showToast(state.message, context);
                      _refreshController.refreshCompleted();
                    }

                    if (state is AttemptSummaryAll) {
                      _refreshController.refreshCompleted();
                    }
                  },
                  builder: (context, state) {
                    if (state is AttemptsLoading &&
                        state.attemptOperation == AttemptOperation.summaryAll) {
                      return const Center(child: LoaderIndicator());
                    }

                    if (state is AttemptsError &&
                        state.attemptOperation == AttemptOperation.summaryAll) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (state is AttemptSummaryAll) {
                      final paraphrases = state.summaries;

                      if (paraphrases.isEmpty) {
                        return const Center(
                          child: Text('No attempts found yet'),
                        );
                      }

                      return SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        header: const WaterDropHeader(),
                        onRefresh:
                            () => context
                                .read<AttemptsCubit>()
                                .getAllSummaryAttempts(
                                  widget.aiReadingEntity.aiReadingId,
                                  context.read<AppUserCubit>().user?.id ?? -1,
                                ),
                        child: ListView.builder(
                          itemCount: paraphrases.length,
                          itemBuilder: (context, index) {
                            final attempt = paraphrases[index];
                            return _ParaphraseAttemptTile(attempt);
                          },
                        ),
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ParaphraseAttemptTile extends StatelessWidget {
  final SummaryAttemptEntity attempt;

  const _ParaphraseAttemptTile(this.attempt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Attempt #${attempt.id}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  _formatDate(attempt.createdAt),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 6),

            /// Puntuaciones (Wrap para evitar overflow)
            Wrap(
              spacing: 6,
              runSpacing: -4,
              children: [
                _ScoreChip('Clarity', attempt.clarityScore),
                _ScoreChip('Accuracy', attempt.accuracyScore),
                _ScoreChip('Coverage', attempt.coverageScore),
              ],
            ),
            const SizedBox(height: 8),

            Text(
              'Feedback:',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(attempt.feedback, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }
}

class _ScoreChip extends StatelessWidget {
  final String label;
  final double value;

  const _ScoreChip(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        '$label: ${value.toStringAsFixed(1)}',
        style: const TextStyle(fontSize: 12),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }
}
