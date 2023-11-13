import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/recall_task/models/recall_task_model.dart';

class RecallTaskRecallPage extends StatefulWidget {
  const RecallTaskRecallPage({super.key, required this.model});

  final RecallTaskModel model;

  @override
  State<RecallTaskRecallPage> createState() => _RecallTaskRecallPageState();
}

class _RecallTaskRecallPageState extends State<RecallTaskRecallPage> {
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    _controllers = [for (int i = 0; i < widget.model.stimulus.stimuli.length; i++) TextEditingController()];
    super.initState();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: const Text('Recall task'),
        ),
        bottomNavigationBar: widget.model.isFreeRecall
            ? null
            : Container(
                color: Theme.of(context).colorScheme.primary,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Builder(builder: (context) {
                    List<StimulusElement> shuffledStimuli = [...widget.model.stimulus.stimuli]; //.shuffle();
                    shuffledStimuli.shuffle();
                    return Row(
                      children: [
                        for (int i = 0; i < shuffledStimuli.length; i++)
                          Draggable<String>(
                            data: shuffledStimuli[i].data,
                            feedback: Material(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  shuffledStimuli[i].data,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                shuffledStimuli[i].data,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ).paddingAll(8),
                          )
                      ],
                    ).paddingSymmetric(vertical: 8, horizontal: 16);
                  }),
                ),
              ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              widget.model.isSequenceMatter
                  ? const Text(
                      'You should recall in the same order as it was presented',
                      style: TextStyle(fontSize: 18),
                    ).paddingSymmetric(vertical: 8, horizontal: 16)
                  : const Text(
                      'You can recall in any order',
                      style: TextStyle(fontSize: 18),
                    ).paddingSymmetric(vertical: 8, horizontal: 16),
              for (int i = 0; i < widget.model.stimulus.stimuli.length; i++)
                Row(
                  children: [
                    widget.model.stimulus.stimuli[i].cue != null
                        ? Text('${widget.model.stimulus.stimuli[i].cue!}:').paddingOnly(right: 8)
                        : const SizedBox.shrink(),
                    Expanded(
                      child: DragTarget<String>(
                        builder: (_, __, ___) => TextField(
                          controller: _controllers[i],
                          textInputAction: i == widget.model.stimulus.stimuli.length - 1
                              ? TextInputAction.done
                              : TextInputAction.next,
                        ),
                        onAccept: (value) {
                          _controllers[i].text = value;
                        },
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: 8, horizontal: 16),
              ElevatedButton(
                onPressed: () {
                  context.pop();
                  context.pop();
                },
                child: const Text('Submit'),
              ).paddingSymmetric(vertical: 8, horizontal: 16),
            ],
          ),
        ),
      ),
    );
  }
}
