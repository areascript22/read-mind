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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200, width: 1),
            // Diferenciador: fondo sutil con gradiente para flashcards
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple.shade50.withOpacity(0.1),
                Colors.blue.shade50.withOpacity(0.1),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Estado de carga
                BlocConsumer<FlashCardBloc, FlashCardState>(
                  builder: (context, state) {
                    final isItOurs =
                        flashCardActivityId == state.currentFlashCardActivity;
                    if (state.isGettingAllCards && isItOurs) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.purple.shade100,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            LoaderIndicator(spinnerSize: 15),
                            const SizedBox(width: 8),
                            Text(
                              'Cargando tarjetas...',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.purple.shade700,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
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
                const SizedBox(height: 4),

                // Header con título y score
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mantengo el SVG original
                    SvgPicture.asset(
                      'assets/images/svg/flashcards.svg',
                      height: 48,
                      width: 48,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Indicador visual de tipo de actividad (flashcards)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade100,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'FLASHCARDS',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.purple.shade800,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    if (bestScore != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _getScoreColor(bestScore!),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: _getScoreColor(
                                bestScore!,
                              ).withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${bestScore!.toInt()}/100",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'MEJOR',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                // Chips de información específicos para flashcards
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _buildInfoChip(
                      Icons.collections,
                      "$maxCards tarjetas",
                      Colors.purple.shade600,
                    ),
                    _buildInfoChip(
                      Icons.sort,
                      "Orden: $cardOrder",
                      Colors.blue.shade600,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Fecha límite con estilo diferenciado
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getDueDateColor(dueDate).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getDueDateColor(dueDate).withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 12,
                        color: _getDueDateColor(dueDate),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "Fecha límite: ${DateUtil.formatDate(dueDate.toString())}",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: _getDueDateColor(dueDate),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getDueDateColor(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = DateTime(dueDate.year, dueDate.month, dueDate.day);

    if (due.isBefore(today)) {
      return Colors.red.shade600;
    } else if (due.isAtSameMomentAs(today)) {
      return Colors.orange.shade600;
    } else {
      return Colors.green.shade600;
    }
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green.shade500;
    if (score >= 60) return Colors.orange.shade500;
    return Colors.red.shade500;
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
