import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../domain/entities/summary_attempt_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class SummaryAttemptsPage extends StatefulWidget {
  final int aiReadingId;
  const SummaryAttemptsPage({super.key, required this.aiReadingId});

  @override
  State<SummaryAttemptsPage> createState() => _SummaryAttemptsPageState();
}

class _SummaryAttemptsPageState extends State<SummaryAttemptsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _fetchSummaries();
  }

  void _fetchSummaries() {
    context.read<TrackingBloc>().add(
      FetchAllSummaryAttempts(aiReadingId: widget.aiReadingId),
    );
  }

  void _onRefresh() {
    _fetchSummaries();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrackingBloc, TrackingState>(
      listener: (context, state) {
        if (state is TrackingError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is TrackingLoading &&
            state.operation == TrackingOperation.allSummaries) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TrackingAllSummariesLoaded) {
          final List<SummaryAttemptEntity> summaries = state.summaries;

          if (summaries.isEmpty) {
            return const Center(child: Text("No summary attempts yet."));
          }

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            header: const WaterDropHeader(),
            child: ListView.builder(
              itemCount: summaries.length,
              itemBuilder: (context, index) {
                final attempt = summaries[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      "Accuracy: ${attempt.accuracyScore.toStringAsFixed(2)} | Coverage: ${attempt.coverageScore.toStringAsFixed(2)}",
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
