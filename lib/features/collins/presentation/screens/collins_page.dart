import 'dart:async';

import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:synapso/features/collins/models/collins_model.dart';
import 'package:synapso/features/collins/models/collins_user_response_model.dart';
import 'package:synapso/features/collins/repository/collins_repository.dart';

class CollinsPage extends StatefulWidget {
  const CollinsPage({super.key, required this.collinsModel});

  final CollinsModel collinsModel;

  @override
  State<CollinsPage> createState() => _CollinsPageState();
}

class _CollinsPageState extends State<CollinsPage> {
  CarouselController carouselController = CarouselController();
  bool isInterStimuliDelay = false;

  final stopwatch = Stopwatch();

  List<CollinsUserResponseModel> response = [];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Instructions'),
              content: Text(widget.collinsModel.instructionText),
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
        stopwatch.start();
      },
    );
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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Semantics Experiment'),
            leading: null,
            automaticallyImplyLeading: false,
          ),
          body: CarouselSlider.builder(
            carouselController: carouselController,
            disableGesture: true,
            itemCount: widget.collinsModel.data.length,
            itemBuilder: (context, itemIndex, _) {
              return isInterStimuliDelay
                  ? const SizedBox.shrink()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.collinsModel.data[itemIndex].question,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 100.h,
                          child: Builder(builder: (context) {
                            List<String> asdf = [
                              widget.collinsModel.data[itemIndex].correct,
                              widget.collinsModel.data[itemIndex].wrong
                            ];
                            asdf.shuffle();
                            return Row(
                              children: [
                                for (final text in asdf)
                                  ElevatedButton(
                                    onPressed: () async {
                                      response.add(
                                        CollinsUserResponseModel(
                                          experimentId: widget.collinsModel.id,
                                          collinDataId: widget.collinsModel.data[itemIndex].id,
                                          response: text,
                                          timeToComplete: stopwatch.elapsedMilliseconds,
                                        ),
                                      );
                                      stopwatch.reset();
                                      if (itemIndex == widget.collinsModel.data.length - 1) {
                                        context.loaderOverlay.show();
                                        final success = await CollinsRepository().submitResult(response: response);
                                        if (context.mounted) {
                                          context.loaderOverlay.hide();
                                          Fluttertoast.cancel();

                                          Fluttertoast.showToast(
                                            msg: success ? 'Submitted' : 'Failed',
                                            backgroundColor:
                                                success ? Colors.green : Theme.of(context).colorScheme.error,
                                            textColor: Colors.white,
                                            gravity: ToastGravity.BOTTOM,
                                            toastLength: Toast.LENGTH_LONG,
                                            timeInSecForIosWeb: 1,
                                            fontSize: 16.0,
                                          );
                                          context.go('/home');
                                        }
                                      }
                                      isInterStimuliDelay = true;
                                      setState(() {});
                                      carouselController.nextPage(duration: const Duration(milliseconds: 1));
                                      await Future.delayed(
                                        Duration(milliseconds: widget.collinsModel.interStimuliDelay),
                                      );
                                      isInterStimuliDelay = false;
                                      stopwatch.reset();
                                      setState(() {});
                                    },
                                    child: Text(text),
                                  ).paddingAll(8).expanded()
                              ],
                            );
                          }),
                        ),
                      ],
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
      ),
    );
  }
}
