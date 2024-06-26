import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:synapso/features/recall_task/models/recall_task_model.dart';
import 'package:synapso/features/recall_task/repository/recall_task_repository.dart';

class RecallTaskRecallPage extends StatefulWidget {
  const RecallTaskRecallPage({super.key, required this.model});

  final RecallTaskModel model;

  @override
  State<RecallTaskRecallPage> createState() => _RecallTaskRecallPageState();
}

class _RecallTaskRecallPageState extends State<RecallTaskRecallPage> {
  List<TextEditingController> _controllers = [];

  final stopwatch = Stopwatch();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Instructions'),
              content: Text(widget.model.recallInstructionText),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Start'),
                ),
              ],
            );
          },
        ).then(
          (value) {
            stopwatch.start();
              
          },
        );
      },
    );
    _controllers = [for (int i = 0; i < widget.model.stimulus.stimuli.length; i++) TextEditingController()];
    super.initState();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: LoaderOverlay(
          overlayOpacity: 0.5,
          overlayColor: Colors.grey.shade200.withOpacity(0.5),
          overlayWidget: const CircularProgressIndicator.adaptive(),
          child: Scaffold(
            appBar: AppBar(
              leading: null,
              automaticallyImplyLeading: false,
              title: const Text('Recall task'),
            ),
            // bottomNavigationBar: widget.model.isFreeRecall
            //     ? null
            //     : Container(
            //         color: Theme.of(context).colorScheme.primary,
            //         child: SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: Builder(builder: (context) {
            //             List<StimulusElement> shuffledStimuli = [...widget.model.stimulus.stimuli]; //.shuffle();
            //             shuffledStimuli.shuffle();
            //             return Row(
            //               children: [
            //                 for (int i = 0; i < shuffledStimuli.length; i++)
            //                   Draggable<String>(
            //                     data: shuffledStimuli[i].data,
            //                     feedback: Material(
            //                       child: Container(
            //                         decoration: BoxDecoration(
            //                           color: Theme.of(context).colorScheme.surface,
            //                           borderRadius: BorderRadius.circular(8),
            //                         ),
            //                         padding: const EdgeInsets.all(8),
            //                         child: Text(
            //                           shuffledStimuli[i].data,
            //                           style: const TextStyle(fontSize: 18),
            //                         ),
            //                       ),
            //                     ),
            //                     child: Container(
            //                       decoration: BoxDecoration(
            //                         color: Theme.of(context).colorScheme.surface,
            //                         borderRadius: BorderRadius.circular(8),
            //                       ),
            //                       padding: const EdgeInsets.all(8),
            //                       child: Text(
            //                         shuffledStimuli[i].data,
            //                         style: const TextStyle(fontSize: 16),
            //                       ),
            //                     ).paddingAll(8),
            //                   )
            //               ],
            //             ).paddingSymmetric(vertical: 8, horizontal: 16);
            //           }),
            //         ),
            //       ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < widget.model.stimulus.stimuli.length; i++)
                    Row(
                      children: [
                        widget.model.stimulus.stimuli[i].cue != null
                            ? Text('${widget.model.stimulus.stimuli[i].cue!}:').paddingOnly(right: 8)
                            : const SizedBox.shrink(),
                        Expanded(
                          child: DragTarget<String>(
                            builder: (_, __, ___) {
                              return TextField(
                                controller: _controllers[i],
                                textInputAction: i == widget.model.stimulus.stimuli.length - 1
                                    ? TextInputAction.done
                                    : TextInputAction.next,
                              );
                            },
                            onAccept: (value) {
                              _controllers[i].text = value;
                            },
                          ),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 8, horizontal: 16),
                  ElevatedButton(
                    onPressed: () async {
                      context.loaderOverlay.show();
                      final success = await RecallTaskRepository().submitResult(
                        response: _controllers.map((e) => e.text).where((element) => element.isNotEmpty).toList(),
                        id: widget.model.id,
                        timeToComplete: stopwatch.elapsedMilliseconds,
                      );
                      if (context.mounted) {
                        context.loaderOverlay.hide();
                        Fluttertoast.cancel();

                        Fluttertoast.showToast(
                          msg: success ? 'Submitted' : 'Failed',
                          backgroundColor: success ? Colors.green : Theme.of(context).colorScheme.error,
                          textColor: Colors.white,
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_LONG,
                          timeInSecForIosWeb: 1,
                          fontSize: 16.0,
                        );
                        context.pop();
                        context.go('/home');
                      }
                    },
                    child: const Text('Submit'),
                  ).paddingSymmetric(vertical: 8, horizontal: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
