import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../domain/entities/paraphrase_attempt_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class ParaphraseAttemptsPage extends StatefulWidget {
  final int aiReadingId;
  const ParaphraseAttemptsPage({super.key, required this.aiReadingId});

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
      FetchAllParaphrasesAttempts(aiReadingId: widget.aiReadingId),
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
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      "Similarity: ${attempt.similarityScore.toStringAsFixed(2)} | Fluency: ${attempt.fluencyScore.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(attempt.feedback),
                    trailing: Text(
                      "${attempt.createdAt.toLocal()}".split(' ')[0],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const Center(child: Text("Pull down to refresh."));
      },
    );
  }
}
