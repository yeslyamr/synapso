import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';

class RecognitionTaskRecallPage extends StatefulWidget {
  const RecognitionTaskRecallPage({super.key, required this.recognitionTaskModel});

  final RecognitionTaskModel recognitionTaskModel;

  @override
  State<RecognitionTaskRecallPage> createState() => _RecognitionTaskRecallPageState();
}

class _RecognitionTaskRecallPageState extends State<RecognitionTaskRecallPage> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (itemIndex == widget.recognitionTaskModel.data.length - 1) {
                      context.pop();
                      context.pop();
                    }

                    carouselController.nextPage(duration: const Duration(milliseconds: 150));
                  },
                  child: Text(widget.recognitionTaskModel.data[itemIndex].displayed),
                ).paddingAll(8).expanded(),
                ElevatedButton(
                  onPressed: () {
                    if (itemIndex == widget.recognitionTaskModel.data.length - 1) {
                      context.pop();
                      context.pop();
                    }

                    carouselController.nextPage(duration: const Duration(milliseconds: 150));
                  },
                  child: Text(widget.recognitionTaskModel.data[itemIndex].hidden),
                ).paddingAll(8).expanded()
              ],
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
    );
  }
}
