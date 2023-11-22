import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';
import 'package:synapso/features/recognition_task/repository/recognition_task_repositry.dart';

class RecognitionTaskRecallPage extends StatefulWidget {
  const RecognitionTaskRecallPage({super.key, required this.recognitionTaskModel});

  final RecognitionTaskModel recognitionTaskModel;

  @override
  State<RecognitionTaskRecallPage> createState() => _RecognitionTaskRecallPageState();
}

class _RecognitionTaskRecallPageState extends State<RecognitionTaskRecallPage> {
  CarouselController carouselController = CarouselController();

  List<String> response = [];
  final stopwatch = Stopwatch();

  @override
  void initState() {
    stopwatch.start();
    super.initState();
  }

  @override
  void dispose() {
    stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayOpacity: 0.5,
      overlayColor: Colors.grey.shade200.withOpacity(0.5),
      overlayWidget: const CircularProgressIndicator.adaptive(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Recognition Task Recall'),
        ),
        body: CarouselSlider.builder(
          carouselController: carouselController,
          disableGesture: true,
          itemCount: widget.recognitionTaskModel.data.length,
          itemBuilder: (context, itemIndex, _) {
            return Container(
              alignment: Alignment.center,
              height: 50.h,
              child: Builder(
                builder: (context) {
                  List<String> randomOrder = [
                    widget.recognitionTaskModel.data[itemIndex].displayed,
                    widget.recognitionTaskModel.data[itemIndex].hidden
                  ];
                  randomOrder.shuffle();
                  return Row(
                    children: [
                      for (final text in randomOrder)
                        ElevatedButton(
                          onPressed: () async {
                            response.add(text);
                            if (itemIndex == widget.recognitionTaskModel.data.length - 1) {
                              context.loaderOverlay.show();
                              final success = await RecogntitionTaskRepository().submitResult(
                                response: response,
                                id: widget.recognitionTaskModel.id,
                                timeToComplete: stopwatch.elapsedMilliseconds,
                              );
                              if (context.mounted) {
                                context.loaderOverlay.show();
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
                                context.pop();
                                
                              }
                            }
                            carouselController.nextPage(duration: const Duration(milliseconds: 150));
                          },
                          child: Text(text),
                        ).paddingAll(8).expanded()
                    ],
                  );
                },
              ),
            );
          },
          options: CarouselOptions(
            scrollPhysics: const NeverScrollableScrollPhysics(),
            autoPlay: false,
            height: context.height,
            viewportFraction: 1,
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
