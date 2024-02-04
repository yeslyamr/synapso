import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';

class RecognitionTaskPresentationPage extends StatefulWidget {
  const RecognitionTaskPresentationPage({super.key, required this.recognitionTaskModel});

  final RecognitionTaskModel recognitionTaskModel;

  @override
  State<RecognitionTaskPresentationPage> createState() => _RecognitionTaskPresentationPageState();
}

class _RecognitionTaskPresentationPageState extends State<RecognitionTaskPresentationPage> {
  CarouselController carouselController = CarouselController();
  Timer? _autoplayTimer;
  bool isInterStimuliDelay = false;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Recognition task'),
              content: Text(
                  'You will be presented with a series of ${widget.recognitionTaskModel.type}. You should recall them.'),
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
          Duration(milliseconds: widget.recognitionTaskModel.data[0].delay),
          (_) async {
            isInterStimuliDelay = true;
            setState(() {});
            await Future.delayed(
              Duration(milliseconds: widget.recognitionTaskModel.interStimuliDelay),
            );
            isInterStimuliDelay = false;
            setState(() {});

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
        appBar: AppBar(
          title: const Text('Recognition Task presentation'),
        ),
        body: CarouselSlider.builder(
          carouselController: carouselController,
          disableGesture: true,
          itemCount: widget.recognitionTaskModel.data.length,
          itemBuilder: (context, itemIndex, _) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                widget.recognitionTaskModel.data[itemIndex].displayed,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) async {
              _autoplayTimer?.cancel();
              _autoplayTimer = Timer.periodic(
                Duration(milliseconds: widget.recognitionTaskModel.data[index].delay),
                (_) async {
                  isInterStimuliDelay = true;
                  setState(() {});
                  await Future.delayed(
                    Duration(milliseconds: widget.recognitionTaskModel.interStimuliDelay),
                  );
                  isInterStimuliDelay = false;
                  setState(() {});
                  carouselController.nextPage(duration: const Duration(milliseconds: 150));
                },
              );
              if (index == widget.recognitionTaskModel.data.length - 1) {
                await Future.delayed(
                  Duration(milliseconds: widget.recognitionTaskModel.data[index].delay),
                );
                if (context.mounted) context.push('/recognition_task_recall', extra: widget.recognitionTaskModel);
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
