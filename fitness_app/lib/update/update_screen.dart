import 'dart:math';

import 'package:fitness_app/common/strings.dart';
import 'package:fitness_app/database/database_helper.dart';
import 'package:fitness_app/database/models/exercise_dao.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late List<ExerciseDao> exercisesDB;

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
    return Column(
      children: [
        exercisesDB.isNotEmpty
            ? Container(
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: exercisesDB.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(exercisesDB[index].name),
                      subtitle: Text(
                          'Description: ${exercisesDB[index].description}, ID: ${exercisesDB[index].id}'),
                      // onTap: () {
                      //   // Show dialog for editing or deleting patient
                      //   showEditDeleteDialog(patients[index]);
                      // },
                    );
                  },
                ),
              )
            : const Center(
                child: Text('No exercises available'),
              ),
        FloatingActionButton(
          onPressed: () {
            showAddExerciseDialog();
          },
          child: const Icon(Icons.add),
        )
      ],
    );
  }

  Future<void> showAddExerciseDialog() async {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController typeController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Patient'),
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
              TextField(
                controller: typeController,
                decoration: const InputDecoration(labelText: 'Type'),
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
                  // Set to 0 as it will be auto-incremented by the database
                  name: nameController.text,
                  description: descriptionController.text,
                  typeTraining: typeController.text,
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
}
