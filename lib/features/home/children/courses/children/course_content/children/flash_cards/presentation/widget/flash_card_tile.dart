import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/core/routing/route_names.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/domain/entity/param_flashcard_entity.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flashcard_bloc/flash_card_bloc.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/widget/dialog_enough_translations.dart';
import 'package:client_app/shared/widgets/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../../../../core/common/utils/date_util.dart';
import '../../../../data/models/activity_model/activity_model.dart';

class FlashCardTileContent extends StatelessWidget {
  final int activityId;
  final int flashCardActivityId;
  final String title;
  final String description;
  final DateTime dueDate;
  final int maxCards;
  final String cardOrder;
  final bool hasScoring;
  final ActivityModel activity;
  final double? bestScore;

  const FlashCardTileContent({
    super.key,
    required this.activityId,
    required this.flashCardActivityId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.maxCards,
    required this.cardOrder,
    required this.hasScoring,
    required this.activity,
    required this.bestScore,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<FlashCardBloc>().add(
          FlashCardLoadAll(
            limit: maxCards,
            order: cardOrder,
            currentFlashCardActivity: flashCardActivityId,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocConsumer<FlashCardBloc, FlashCardState>(
                builder: (context, state) {
                  final isItOurs =
                      flashCardActivityId == state.currentFlashCardActivity;
                  if (state.isGettingAllCards && isItOurs) {
                    return LoaderIndicator(spinnerSize: 20);
                  }

                  return SizedBox(height: 20, width: 20);
                },
                listener: (context, state) {
                  final cardsReady =
                      state.isCardsLoaded &&
                      state.flashCardAction == FlashCardAction.loadAll;
                  final isOurActivity =
                      flashCardActivityId == state.currentFlashCardActivity;

                  if (cardsReady && isOurActivity) {
                    if (state.cards.length < maxCards) {
                      showNotEnoughTranslations(context, maxCards);
                      return;
                    }

                    context.read<FlashCardBloc>().add(
                      FlashCardCreateInitialSession(activityId: activityId),
                    );
                  }

                  final initialSessionError =
                      state.errorInitialSession.isNotEmpty &&
                      state.flashCardAction == FlashCardAction.initSession &&
                      isOurActivity &&
                      !state.isCreatingInitialSession;

                  if (initialSessionError) {
                    ToastMessageUtil.showToast(
                      state.errorInitialSession ?? '',
                      context,
                    );
                  }

                  if (state.currentFlashcardSession.id != 0 &&
                      state.flashCardAction == FlashCardAction.initSession &&
                      isOurActivity &&
                      !state.isCreatingInitialSession) {
                    context.push(
                      RouteNames.activityFlashCard,
                      extra: ParamFlashCardEntity(
                        translations: state.cards,
                        activityId: activityId,
                      ),
                    );
                  }
                },
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/flashcards.svg',
                    height: 48,
                    width: 48,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (bestScore != null)
                    Text(
                      "Score: $bestScore/100",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),

              Text(
                description,
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _buildInfoChip(
                    Icons.collections,
                    "$maxCards tarjetas",
                    Colors.green,
                  ),
                  _buildInfoChip(
                    Icons.sort,
                    "Orden: $cardOrder",
                    Colors.blueAccent,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "Fecha límite: ${DateUtil.formatDate(dueDate.toString())}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Chip(
      avatar: Icon(icon, size: 16, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    );
  }
}
