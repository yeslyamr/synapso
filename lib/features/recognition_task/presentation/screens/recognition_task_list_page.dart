import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';
import 'package:synapso/features/recognition_task/repository/recognition_task_repositry.dart';

class RecognitionTaskList extends StatefulWidget {
  const RecognitionTaskList({super.key});

  @override
  State<RecognitionTaskList> createState() => _RecognitionTaskListState();
}

class _RecognitionTaskListState extends State<RecognitionTaskList> {
  late final Future loadRecognitionTask;

  @override
  void initState() {
    super.initState();

    // Assign that variable your Future.
    loadRecognitionTask = RecogntitionTaskRepository().getRecognitionTask(id: 9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: make core component for app bar
      appBar: AppBar(
        title: const Text('Recognition Task List'),
      ),
      body: Center(
        child: FutureBuilder(
          future: RecogntitionTaskRepository().getRecognitionTask(id: 9), //loadRecognitionTask,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) return const Text('Loading');

            return ElevatedButton(
              onPressed: () {
                if (snapshot.data is RecognitionTaskModel) {
                  context.push(
                    '/recognition_task_presentation',
                    extra: snapshot.data,
                  );
                }
              },
              child: const Text('Start recognition task'),
            ).paddingSymmetric(horizontal: 16);
          },
        ),
      ),
    );
  }
}
