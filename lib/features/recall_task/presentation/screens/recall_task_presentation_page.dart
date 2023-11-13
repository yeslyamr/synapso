import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/recall_task/models/recall_task_model.dart';

class RecallTaskPresentationPage extends StatefulWidget {
  const RecallTaskPresentationPage({super.key, required this.model});

  final RecallTaskModel model;

  @override
  State<RecallTaskPresentationPage> createState() => _RecallTaskPresentationPageState();
}

class _RecallTaskPresentationPageState extends State<RecallTaskPresentationPage> {
  CarouselController carouselController = CarouselController();
  Timer? _autoplayTimer;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Recall task'),
              content: Text(
                  'You will be presented with a series of ${widget.model.stimulus.type}. ${widget.model.isSequenceMatter ? 'You should recall them in the same order.' : 'You can recall them in any order.'}'),
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
        );
        _autoplayTimer = Timer.periodic(
          Duration(milliseconds: widget.model.stimulus.stimuli[0].delay),
          (timer) {
            carouselController.nextPage(duration: const Duration(milliseconds: 150));
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        // TODO: make core component for app bar
        appBar: AppBar(
          leading: null,
          automaticallyImplyLeading: false,
          title: const Text('Recall task'),
        ),
        body: CarouselSlider.builder(
          carouselController: carouselController,
          disableGesture: true,
          itemCount: widget.model.stimulus.stimuli.length,
          itemBuilder: (context, itemIndex, _) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                widget.model.stimulus.stimuli[itemIndex].data +
                    (widget.model.stimulus.stimuli[itemIndex].cue != null
                        ? ' * ${widget.model.stimulus.stimuli[itemIndex].cue}'
                        : ''),
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) async {
              _autoplayTimer?.cancel();
              _autoplayTimer = Timer.periodic(
                Duration(milliseconds: widget.model.stimulus.stimuli[index].delay),
                (timer) {
                  carouselController.nextPage(duration: const Duration(milliseconds: 150));
                },
              );
              if (index == widget.model.stimulus.stimuli.length - 1) {
                await Future.delayed(
                  Duration(milliseconds: widget.model.stimulus.stimuli[index].delay),
                );
                if (context.mounted) context.push('/recall_task_recall', extra: widget.model);
              }
            },
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: false,
            height: context.height,
            enlargeCenterPage: true,
            pauseAutoPlayOnManualNavigate: false,
            pauseAutoPlayOnTouch: false,
            pauseAutoPlayInFiniteScroll: false,
            enableInfiniteScroll: false,
          ),
        ),
      ),
    );
  }
}
