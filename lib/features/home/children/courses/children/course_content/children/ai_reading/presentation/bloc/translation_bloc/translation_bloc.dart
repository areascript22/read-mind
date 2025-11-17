import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'translation_event.dart';
part 'translation_state.dart';

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  TranslationBloc() : super(TranslationInitial()) {
    on<TranslationEvent>((event, emit) {});
  }
}
