import 'dart:math';

import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_exercise_card_item.dart';
import 'package:fitness_app/database/database_helper.dart';
import 'package:fitness_app/database/models/exercise_dao.dart';
import 'package:fitness_app/models/enum_types.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late List<ExerciseDao> exercisesDB;
  final List<String> _types = [
    TypeTraining.cardio.name,
    TypeTraining.lower.name,
    TypeTraining.upper.name,
    TypeTraining.pole.name,
    TypeTraining.yoga.name,
  ];

  String? _selectedType;

  @override
  void initState() {
    super.initState();
    loadExercises();
  }

  Future<void> loadExercises() async {
    exercisesDB = await DatabaseHelper.instance.getAllExercises();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          exercisesDB.isNotEmpty
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Card(
                      child: Column(
                        children: exercisesDB.map((item) {
                          return CustomExerciseCardItem(
                              exercise: ExerciseDao.convertToExercise(item),
                              color: AppColors.lightGreen);
                        }).toList(),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: Text('No exercises available'),
                ),
          FloatingActionButton(
            backgroundColor: AppColors.green,
            onPressed: () {
              showAddExerciseDialog();
            },
            child: const Icon(
              Icons.add,
              color: AppColors.justWhite,
            ),
          )
        ],
      ),
    );
  }

  Future<void> showAddExerciseDialog() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add new Exercise'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                value: _selectedType,
                icon: const Icon(Icons.arrow_downward),
                items: _types.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Select a type';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                ExerciseDao newExercise = ExerciseDao(
                  id: generateRandomId(),
                  name: nameController.text,
                  description: descriptionController.text,
                  typeTraining: _selectedType!,
                  pathImage: Strings.imageWorkoutLateralAbdominal,
                );

                await DatabaseHelper.instance.insertExercise(newExercise);
                loadExercises();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  int generateRandomId() {
    Random random = Random();
    return random.nextInt(1000000);
  }

  Future<void> showEditDeleteDialog(Exercise exercise, dynamic context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit or Delete Patient'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Edit'),
                onTap: () {
                  Navigator.of(context).pop();
                  print('edit');
                  //showEditPatientDialog(patient);
                },
              ),
              ListTile(
                title: const Text('Delete'),
                onTap: () async {
                  await DatabaseHelper.instance.deleteExercise(exercise.name);
                  loadExercises();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget listExercises(List<Exercise> exercises) {
    return Card(
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return CustomExerciseCardItem(
              exercise: exercises[index], color: AppColors.green);
        },
      ),
    );
  }
}
