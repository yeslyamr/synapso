import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:synapso/features/my_experiments/model/my_experiment_model.dart';

class MyExperimentWidget extends StatefulWidget {
  const MyExperimentWidget({
    super.key,
    required this.experiment,
  });

  final MyExperimentModel experiment;

  @override
  State<MyExperimentWidget> createState() => _MyExperimentWidgetState();
}

class _MyExperimentWidgetState extends State<MyExperimentWidget> with TickerProviderStateMixin {
  late final AnimationController iconAnimationController;
  final ExpandableController expandableController = ExpandableController(initialExpanded: false);

  @override
  void initState() {
    iconAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      upperBound: 3.2,
      reverseDuration: const Duration(milliseconds: 500),
      vsync: this,
    );
    expandableController.addListener(() {
      if (expandableController.expanded) {
        iconAnimationController.forward();
      } else {
        iconAnimationController.reverse();
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.zero,
          bottom: Radius.circular(6.r),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Type:'),
              Container(
                decoration: BoxDecoration(
                  color: widget.experiment.type == 'recall' ? Colors.amber : Colors.blue,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
                child: widget.experiment.type == 'recall'
                    ? const Text('Recall')
                    : const Text(
                        'Recognition',
                        style: TextStyle(color: Colors.white),
                      ),
              )
            ],
          ),
          Text('Response: ${widget.experiment.response}'),
          Text(
              'Time to complete: ${Duration(milliseconds: widget.experiment.timeToComplete).toString().split('.').first.padLeft(8, "0")}'),
        ],
      ),
    );
  }
}
