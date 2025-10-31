import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'translation_state.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationInitial());
}
