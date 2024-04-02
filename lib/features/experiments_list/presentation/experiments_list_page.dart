import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:dropdown_button2/dropdown_button2.dart';
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
  bool isDropdownOpen = false;
  int? selectedExperimentType;

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
        centerTitle: false,
        title: const Text('Experiments List'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<int>(
              onMenuStateChange: (isOpen) {
                isDropdownOpen = isOpen;
                setState(() {});
              },
              isExpanded: true,
              items: const [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Recall',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text(
                    'Recognition',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Collins',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              value: selectedExperimentType,
              onChanged: (value) {
                if (value == selectedExperimentType) {
                  selectedExperimentType = null;
                } else {
                  selectedExperimentType = value;
                }
                setState(() {});
              },
              customButton: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: isDropdownOpen
                        ? const BorderRadius.vertical(top: Radius.circular(6))
                        : BorderRadius.circular(6),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedExperimentType == null
                          ? 'All'
                          : selectedExperimentType == 0
                              ? 'Recall'
                              : selectedExperimentType == 1
                                  ? 'Recognition'
                                  : 'Collins',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    isDropdownOpen
                        ? const ImageIcon(
                            key: ValueKey('up'),
                            AssetImage('assets/icons/arrow_up.png'),
                            color: Colors.white,
                          )
                        : const ImageIcon(
                            key: ValueKey('down'),
                            AssetImage('assets/icons/arrow_down.png'),
                            color: Colors.white,
                          ),
                  ],
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                padding: const EdgeInsets.all(0),
                elevation: 0,
                maxHeight: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(6)),
                  color: Theme.of(context).colorScheme.primary,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(4),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(height: 35),
            ),
          ).paddingOnly(right: 16.w),
        ],
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
                  (store.experimentsModel?.recognition?.isEmpty ?? true) &&
                  (store.experimentsModel?.collin?.isEmpty ?? true)) {
                return const Center(
                  child: Text('No experiments available'),
                );
              }
              return ListView(
                children: [
                  if (selectedExperimentType == null || selectedExperimentType == 0)
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
                                  Text('Recall Task: ${e.name.isEmpty ? 'Recall #${e.id}' : e.name}')
                                ],
                              ).paddingSymmetric(vertical: 16.h, horizontal: 12.w),
                            ).paddingSymmetric(vertical: 8.h, horizontal: 16.w),
                          );
                        },
                      ).toList() ??
                      [],
                  if (selectedExperimentType == null || selectedExperimentType == 1)
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
                                      'Recognition Task:  ${e.name.isEmpty ? 'Recognition #${e.id}' : e.name}'),
                                  ],
                                ).paddingSymmetric(vertical: 16.h, horizontal: 12.w),
                              ).paddingSymmetric(vertical: 8.h, horizontal: 16.w),
                            );
                          },
                        ).toList() ??
                        [],
                  if (selectedExperimentType == null || selectedExperimentType == 2)
                    ...store.experimentsModel?.collin?.map(
                          (e) {
                            return InkWell(
                              onTap: () {
                                if (e.data.isNotEmpty) {
                                  context.push(
                                    '/collins',
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
                                    Text('Collins Task:  ${e.name.isEmpty ? 'Collins #${e.id}' : e.name}'),
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
