import 'dart:math';

import 'package:fitness_app/common/app_colors.dart';
import 'package:fitness_app/common/mock_data.dart';
import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/components/custom_exercise_card_item.dart';
import 'package:fitness_app/database/database_helper.dart';
import 'package:fitness_app/database/models/exercise_dao.dart';
import 'package:fitness_app/models/exercise/exercise.dart';
import 'package:flutter/material.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  late List<ExerciseDao> exercisesDB;

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
      child: Stack(
        children: [
          Column(
            children: [
              exercisesDB.isNotEmpty
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Card(
                          child: Column(
                            children: exercisesDB.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  showEditDeleteDialog(item, context);
                                },
                                child: CustomExerciseCardItem(
                                    exercise:
                                        ExerciseDao.convertToExercise(item),
                                    color: AppColors.lightGreen),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              color: AppColors.yellow,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'No exercises available :)',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.justGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: FloatingActionButton(
              backgroundColor: AppColors.green,
              onPressed: () {
                showAddExerciseDialog();
              },
              child: const Icon(
                Icons.add,
                color: AppColors.justWhite,
              ),
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
          title: const Text(
            'Add new Exercise',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.justGrey,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.justGrey,
                ),
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: AppColors.justGrey,
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.justGrey,
                ),
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: AppColors.justGrey,
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.justGrey,
                  ),
                ),
                value: _selectedType,
                icon: const Icon(
                  Icons.arrow_downward_sharp,
                  size: 14,
                ),
                items: listTypeTrainings.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.justGrey,
                      ),
                    ),
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

  Future<void> showEditDeleteDialog(
      ExerciseDao exerciseDao, dynamic context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundGrey,
          title: const Text(
            'Edit or Delete Exercise :)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.edit,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  print('edit');
                  showEditExerciseDialog(exerciseDao);
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(
                      Icons.delete,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onTap: () async {
                  await DatabaseHelper.instance.deleteExercise(exerciseDao.id!);
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

  Future<void> showEditExerciseDialog(ExerciseDao exerciseDao) async {
    TextEditingController nameController =
        TextEditingController(text: exerciseDao.name);
    TextEditingController descriptionController =
        TextEditingController(text: exerciseDao.description);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Edit Patient',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.justGrey,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.justGrey,
                ),
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: AppColors.justGrey,
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.justGrey,
                ),
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: AppColors.justGrey,
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Type',
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: AppColors.justGrey,
                  ),
                ),
                value: _selectedType,
                icon: const Icon(
                  Icons.arrow_downward_sharp,
                  size: 14,
                ),
                items: listTypeTrainings.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.justGrey,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedType = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return _selectedType;
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
                ExerciseDao updatedExerciseDao = ExerciseDao(
                  id: exerciseDao.id,
                  name: nameController.text,
                  description: descriptionController.text,
                  typeTraining: _selectedType.toString(),
                  pathImage: Strings.imageWorkoutLateralAbdominal,
                );

                await DatabaseHelper.instance
                    .updateExercise(updatedExerciseDao);
                loadExercises();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
