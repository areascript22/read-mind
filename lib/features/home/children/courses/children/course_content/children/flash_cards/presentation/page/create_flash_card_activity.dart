import 'package:client_app/core/common/utils/date_util.dart';
import 'package:client_app/core/common/utils/toast_util.dart';
import 'package:client_app/features/home/children/courses/children/course_content/children/flash_cards/presentation/cubit/flash_card_creation/flashcard_creation_cubit.dart';
import 'package:client_app/features/home/children/courses/children/course_content/presentation/bloc/course_content/course_content_bloc.dart';
import 'package:client_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateFlashCardsPage extends StatefulWidget {
  final int courseId;

  const CreateFlashCardsPage({super.key, required this.courseId});

  @override
  State<CreateFlashCardsPage> createState() => _CreateFlashCardsPageState();
}

class _CreateFlashCardsPageState extends State<CreateFlashCardsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FlashcardCreationCubit(flashCardRepository: serviceLocator()),
      child: _CreateFlashCardsPageBody(courseId: widget.courseId),
    );
  }
}

class _CreateFlashCardsPageBody extends StatefulWidget {
  final int courseId;

  const _CreateFlashCardsPageBody({required this.courseId});

  @override
  State<_CreateFlashCardsPageBody> createState() =>
      _CreateFlashCardsPageBodyState();
}

class _CreateFlashCardsPageBodyState extends State<_CreateFlashCardsPageBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _maxCardsController = TextEditingController(
    text: '10',
  );
  DateTime? _dueDate;
  String _cardOrder = 'Sequential';

  @override
  Widget build(BuildContext context) {
    return BlocListener<FlashcardCreationCubit, FlashcardCreationState>(
      listener: (context, state) {
        if (state is FlashcardCreationSuccess) {
          ToastMessageUtil.showToast("Flash cards creados", context);
          Navigator.pop(context);
          context.read<CourseContentBloc>().add(
            EventGetAllActivities(widget.courseId.toString()),
          );
        } else if (state is FlashcardCreationError) {
          ToastMessageUtil.showToast(state.message, context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Crear Flash Cards')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 10),
                _buildTitleField(),
                const SizedBox(height: 20),
                _buildDescriptionField(),
                const SizedBox(height: 20),
                _buildDueDateField(),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                _buildMaxCardsField(),
                const SizedBox(height: 20),
                _buildCardOrderSection(),
                const SizedBox(height: 30),
                _buildCreateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleField() {
    return TextFormField(
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Título *',
        hintText: 'Ingresa el título de la actividad',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.title),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'El título es requerido';
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      controller: _descriptionController,
      decoration: const InputDecoration(
        labelText: 'Descripción',
        hintText: 'Descripción opcional de la actividad',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.description),
      ),
      maxLines: 3,
    );
  }

  Widget _buildDueDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fecha de vencimiento *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: Text(
              _dueDate == null
                  ? 'Seleccionar fecha'
                  : DateUtil.formatDateWithTime(_dueDate!.toIso8601String()),
              style: TextStyle(
                color: _dueDate == null ? Colors.grey.shade600 : Colors.black87,
              ),
            ),
            trailing:
                _dueDate != null
                    ? IconButton(
                      icon: const Icon(Icons.clear, size: 20),
                      onPressed: _clearDueDate,
                    )
                    : null,
            onTap: _pickDueDateTime,
          ),
        ),
        if (_dueDate == null) ...[
          const SizedBox(height: 4),
          Text(
            'La fecha de vencimiento es obligatoria',
            style: TextStyle(color: Colors.red.shade600, fontSize: 12),
          ),
        ],
      ],
    );
  }

  Widget _buildMaxCardsField() {
    return TextFormField(
      controller: _maxCardsController,
      decoration: const InputDecoration(
        labelText: 'Máximo de cartas *',
        hintText: 'Entre 1 y 50',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.layers),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El número de cartas es requerido';
        }
        final cards = int.tryParse(value);
        if (cards == null || cards < 1 || cards > 50) {
          return 'Debe ser un número entre 1 y 50';
        }
        return null;
      },
    );
  }

  Widget _buildCardOrderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Orden de las cartas *',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildCardOrderOption(
                value: 'Sequential',
                title: 'Secuencial',
                subtitle: 'En orden fijo',
                icon: Icons.list,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildCardOrderOption(
                value: 'Random',
                title: 'Aleatorio',
                subtitle: 'Orden aleatorio',
                icon: Icons.shuffle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardOrderOption({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    final isSelected = _cardOrder == value;
    return Card(
      color: isSelected ? Colors.blue[50] : Colors.white,
      elevation: isSelected ? 2 : 1,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.grey),
        ),
        onTap: () => _onCardOrderChanged(value),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
    );
  }

  Widget _buildCreateButton() {
    return BlocBuilder<FlashcardCreationCubit, FlashcardCreationState>(
      builder: (context, state) {
        final isLoading = state is FlashcardCreationLoading;

        return ElevatedButton(
          onPressed: isLoading ? null : _createFlashCards,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child:
              isLoading
                  ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                  : const Text(
                    'Crear Flash Cards',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
        );
      },
    );
  }

  void _pickDueDateTime() async {
    FocusScope.of(context).unfocus();

    final now = DateTime.now();
    final initialDate = _dueDate?.isBefore(now) ?? true ? now : _dueDate;

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate == null) return;
    if (!mounted) return;

    final initialTime =
        _dueDate?.isBefore(now) ?? true
            ? TimeOfDay.now()
            : TimeOfDay.fromDateTime(_dueDate!);

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime == null) return;

    final newDueDate = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      _dueDate = newDueDate;
    });
  }

  void _clearDueDate() {
    setState(() {
      _dueDate = null;
    });
  }

  void _onCardOrderChanged(String value) {
    setState(() {
      _cardOrder = value;
    });
  }

  void _createFlashCards() {
    if (_dueDate == null) {
      ToastMessageUtil.showToast(
        "La fecha de vencimiento es obligatoria",
        context,
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      if (_titleController.text.trim().isEmpty) {
        ToastMessageUtil.showToast("El título es requerido", context);
        return;
      }

      if (_maxCardsController.text.trim().isEmpty) {
        ToastMessageUtil.showToast("El número de cartas es requerido", context);
        return;
      }

      final maxCards = int.tryParse(_maxCardsController.text);
      if (maxCards == null || maxCards < 1 || maxCards > 50) {
        ToastMessageUtil.showToast(
          "El número de cartas debe ser entre 1 y 50",
          context,
        );
        return;
      }

      context.read<FlashcardCreationCubit>().createFlashCardActivity(
        courseId: widget.courseId,
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        dueDate: _dueDate!.toUtc().toIso8601String(),
        hasScoring: true,
        maxScore: 100,
        maxCards: maxCards,
        cardOrder: _cardOrder,
      );
    } else {
      ToastMessageUtil.showToast(
        "Por favor completa todos los campos requeridos correctamente",
        context,
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _maxCardsController.dispose();
    super.dispose();
  }
}
