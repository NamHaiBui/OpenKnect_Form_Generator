import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/provider/editing_provider.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/application_tracker_expandable_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/scaffold_component/form_creation_widget.dart';
import 'package:openknect_form_generator/json/form_repo.dart';

final GlobalKey<FormBuilderState> _formCreatorKey =
    GlobalKey<FormBuilderState>();

class AdminScreen extends ConsumerStatefulWidget {
  const AdminScreen({super.key});

  @override
  ConsumerState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends ConsumerState<AdminScreen> {
  ///Input Steps -> Submit Button -> Next Part
  ///

  int stepCount = 0;
  bool hasSubmitted = false;
  List<String> steps = [];
  final _formRepo = const FormRepository();
  void setStepCount(p0) {
    final stepNotifier = ref.watch(stepProvider.notifier);
    if (p0 != null) {
      return setState(
        () {
          stepCount = int.tryParse(p0) ?? 4;
          steps = List.generate(stepCount, (index) => "Step $index");
          stepNotifier.setSteps(steps);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget? res = stepCount != 0
        ? ApplicationStatusTrackerWidget(
            steps: steps,
            currentStep: 0,
            isExample: true,
          )
        : null;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            FutureBuilder<DynamicForm?>(
              future: _formRepo.loadAdminForm(),
              builder:
                  (BuildContext context, AsyncSnapshot<DynamicForm?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("Loading form, please wait..."),
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Something bad happened ${snapshot.error}"),
                  );
                }
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilder(
                      key: _formCreatorKey,
                      child: Column(
                        children: [
                          DynamicFormInput(
                            field: snapshot.data!.fields[0],
                            onSaved: (p0) {
                              setStepCount(p0);
                            },
                            onSubmit: (p0) {
                              setStepCount(p0);
                            },
                          ),
                          MaterialButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              _formCreatorKey.currentState?.saveAndValidate();
                            },
                            child: const Text('Save'),
                          ),
                          stepCount != 0
                              ? SingleChildScrollView(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return DynamicFormInput(
                                              field: snapshot.data!.fields[1],
                                              onSaved: (p0) {},
                                              onSubmit: (p0) {
                                                setState(
                                                  () {
                                                    steps[index] = p0;
                                                    debugPrint(
                                                        steps.toString());
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          itemCount: stepCount,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          MaterialButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: () {
                              _formCreatorKey.currentState?.saveAndValidate();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormCreationWidget(
                                    processBar: res!,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Save & Generate'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(child: Text("Form does not exist."));
              },
            ),
            const SizedBox(height: 16),
            res ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
