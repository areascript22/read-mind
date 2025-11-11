import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../domain/entities/main_idea_attempt_entity.dart';
import '../bloc/progress_bloc/tracking_bloc.dart';

class MainIdeaAttemptsPage extends StatefulWidget {
  final int aiReadingId;
  const MainIdeaAttemptsPage({super.key, required this.aiReadingId});

  @override
  State<MainIdeaAttemptsPage> createState() => _MainIdeaAttemptsPageState();
}

class _MainIdeaAttemptsPageState extends State<MainIdeaAttemptsPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _fetchMainIdeas();
  }

  void _fetchMainIdeas() {
    context.read<TrackingBloc>().add(
      FetchAllMainIdeasAttempts(aiReadingId: widget.aiReadingId),
    );
  }

  void _onRefresh() {
    _fetchMainIdeas();
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
            state.operation == TrackingOperation.allMainIdeas) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is TrackingAllMainIdeasLoaded) {
          final List<MainIdeaAttemptEntity> mainIdeas = state.mainIdeas;

          if (mainIdeas.isEmpty) {
            return const Center(child: Text("No main idea attempts yet."));
          }

          return SmartRefresher(
            controller: _refreshController,
            onRefresh: _onRefresh,
            header: const WaterDropHeader(),
            child: ListView.builder(
              itemCount: mainIdeas.length,
              itemBuilder: (context, index) {
                final attempt = mainIdeas[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(
                      "Accuracy: ${attempt.accuracyScore.toStringAsFixed(2)} | Clarity: ${attempt.clarityScore.toStringAsFixed(2)}",
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
