import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:synapso/features/my_experiments/presentation/widgets/my_experiment_widget.dart';
import 'package:synapso/features/my_experiments/store/my_experiments_list_store.dart';

class MyExperimentsListPage extends StatefulWidget {
  const MyExperimentsListPage({super.key});

  @override
  State<MyExperimentsListPage> createState() => _MyExperimentsListPageState();
}

class _MyExperimentsListPageState extends State<MyExperimentsListPage> {
  @override
  void initState() {
    final store = Provider.of<MyExperimentsListStore>(context, listen: false);
    store.fetchRepos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MyExperimentsListStore>(context);

    return Scaffold(
      // TODO: make core component for app bar
      appBar: AppBar(
        title: const Text('Experiments List'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Observer(
        builder: (_) {
          if (store.fetchExperiments.status == FutureStatus.pending) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (store.fetchExperiments.status == FutureStatus.rejected) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return ListView.builder(
              itemCount: store.experimentsModel?.length ?? 0,
              itemBuilder: (context, index) {
                final experiment = store.experimentsModel![index];

                return MyExperimentWidget(experiment: experiment).paddingLTRB(16.w, 0, 16.w, 16.h);
              },
            ).paddingOnly(top: 16.h);
          }
        },
      ),
    );
  }
}
