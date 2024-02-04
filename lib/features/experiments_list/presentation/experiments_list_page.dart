import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:synapso/features/experiments_list/stores/experiments_list_store.dart';

class ExperimentsListPage extends StatefulWidget {
  const ExperimentsListPage({super.key});

  @override
  State<ExperimentsListPage> createState() => _ExperimentsListPageState();
}

class _ExperimentsListPageState extends State<ExperimentsListPage> {
  @override
  void initState() {
    final store = Provider.of<ExperimentsListStore>(context, listen: false);
    store.fetchRepos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ExperimentsListStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiments List'),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<ExperimentsListStore>(context, listen: false).fetchRepos();
        },
        child: Observer(
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
              if ((store.experimentsModel?.recall?.isEmpty ?? true) &&
                  (store.experimentsModel?.recognition?.isEmpty ?? true)) {
                return const Center(
                  child: Text('No experiments available'),
                );
              }
              return ListView(
                children: [
                  ...store.experimentsModel?.recall?.map(
                        (e) {
                          return InkWell(
                            onTap: () {
                              if (e.stimulus.stimuli.isNotEmpty) {
                                context.push(
                                  '/recall_task_presentation',
                                  extra: e,
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text('Recall Task: ${e.name}'),
                                  Text('Recall Task: ${e.name.isEmpty ? 'Recall #${e.id}' : e.name}')
                                ],
                              ).paddingSymmetric(vertical: 16.h, horizontal: 12.w),
                            ).paddingSymmetric(vertical: 8.h, horizontal: 16.w),
                          );
                        },
                      ).toList() ??
                      [],
                  ...store.experimentsModel?.recognition?.map(
                        (e) {
                          return InkWell(
                            onTap: () {
                              if (e.data.isNotEmpty) {
                                context.push(
                                  '/recognition_task_presentation',
                                  extra: e,
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Recognition Task:  ${e.name == 'sosi huy' || e.name.isEmpty ? 'Recognition #${e.id}' : e.name}'),
                                ],
                              ).paddingSymmetric(vertical: 16.h, horizontal: 12.w),
                            ).paddingSymmetric(vertical: 8.h, horizontal: 16.w),
                          );
                        },
                      ).toList() ??
                      [],
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
