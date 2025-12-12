import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/domain/entities/ai_reading_entity.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:client_app/features/home/children/courses/domain/entities/paraphrase_attempt_entity.dart';

import '../../../../../../../../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../cubit/attempts_cubit/attempts_cubit.dart';

Future<void> showParaphraseAttemptsDialog(
  BuildContext context,
  AIReadingEntity aiReadingEntity,
) async {
  showDialog(
    context: context,
    builder:
        (_) => BlocProvider.value(
          value: serviceLocator<AttemptsCubit>(),
          child: _ParaphraseAttemptsDialogBody(
            aiReadingEntity: aiReadingEntity,
          ),
        ),
  );
}

class _ParaphraseAttemptsDialogBody extends StatefulWidget {
  final AIReadingEntity aiReadingEntity;
  const _ParaphraseAttemptsDialogBody({
    super.key,
    required this.aiReadingEntity,
  });

  @override
  State<_ParaphraseAttemptsDialogBody> createState() =>
      _ParaphraseAttemptsDialogBodyState();
}

class _ParaphraseAttemptsDialogBodyState
    extends State<_ParaphraseAttemptsDialogBody> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    super.initState();
    context.read<AttemptsCubit>().getAllParaphraseAttempts(
      aiReadingId: widget.aiReadingEntity.aiReadingId,
      targetUserId: context.read<AppUserCubit>().user?.id ?? -1,
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
                    'Intentos de paráfrasis',
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
                        state.attemptOperation ==
                            AttemptOperation.paraphraseAll) {
                      ToastMessageUtil.showToast(state.message, context);
                      _refreshController.refreshCompleted();
                    }

                    if (state is AttemptParaphraseAll) {
                      _refreshController.refreshCompleted();
                    }
                  },
                  builder: (context, state) {
                    if (state is AttemptsLoading &&
                        state.attemptOperation ==
                            AttemptOperation.paraphraseAll) {
                      return const Center(child: LoaderIndicator());
                    }

                    if (state is AttemptsError &&
                        state.attemptOperation ==
                            AttemptOperation.paraphraseAll) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (state is AttemptParaphraseAll) {
                      final paraphrases = state.paraphrases;

                      if (paraphrases.isEmpty) {
                        return const Center(
                          child: Text('No se encontraron intentos todavía...'),
                        );
                      }

                      return SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        header: const WaterDropHeader(),
                        onRefresh:
                            () => context
                                .read<AttemptsCubit>()
                                .getAllParaphraseAttempts(
                                  aiReadingId:
                                      widget.aiReadingEntity.aiReadingId,
                                  targetUserId:
                                      context.read<AppUserCubit>().user?.id ??
                                      -1,
                                ),
                        child: ListView.builder(
                          itemCount: paraphrases.length,
                          itemBuilder: (context, index) {
                            final attempt = paraphrases[index];
                            return _ParaphraseAttemptTile(
                              attempt,
                              paraphrases.length - index,
                            );
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
  final ParaphraseAttemptEntity attempt;
  final int order;

  const _ParaphraseAttemptTile(this.attempt, this.order, {super.key});

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
                    'Intento #$order',
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
                _ScoreChip('Similarity', attempt.similarityScore),
                _ScoreChip('Fluency', attempt.fluencyScore),
                _ScoreChip('Originality', attempt.originalityScore),
              ],
            ),
            const SizedBox(height: 8),

            /// Feedback
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
