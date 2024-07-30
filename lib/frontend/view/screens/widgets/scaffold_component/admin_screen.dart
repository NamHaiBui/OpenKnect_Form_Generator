import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/provider/editing_provider.dart';
import 'package:openknect_form_generator/frontend/view/page/widget/playground.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/application_tracker_expandable_widget.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/scaffold_component/components/step_input_list.dart';
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
  int stepCount = 0;
  bool hasSubmitted = false;
  List<String> steps = [];
  final _formRepo = const FormRepository();
  String? _selectedFormType;

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
    final currStep = ref.watch(stepProvider.notifier).currentStepIndex;
    final Widget? formSeriesExample = _selectedFormType == 'Dynamic Form Series'
        ? ApplicationStatusTrackerWidget(
            steps: steps,
            currentStep: currStep,
            isExample: true,
          )
        : null;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            if (formSeriesExample != null) formSeriesExample,
            Column(
              children: [
                FutureBuilder<DynamicForm?>(
                  future: _formRepo.loadAdminForm(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DynamicForm?> snapshot) {
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
                      return (_selectedFormType != null)
                          ? (_selectedFormType == 'Single Dynamic Form')
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: const PlaygroundWidget(currentStep: 0))
                              : Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: FormBuilder(
                                    key: _formCreatorKey,
                                    child: Column(
                                      children: [
                                        // Add the form type selection buttons

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
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          onPressed: () {
                                            setState(() {
                                              hasSubmitted = true;
                                            });
                                            _formCreatorKey.currentState
                                                ?.saveAndValidate();
                                          },
                                          child: const Text('Save'),
                                        ),
                                        stepCount != 0
                                            ? StepInputList(
                                                steps: steps,
                                                form: snapshot.data!,
                                                onStepUpdate:
                                                    (index, newValue) {
                                                  setState(() {
                                                    steps[index] = newValue;
                                                  });
                                                },
                                              )
                                            : const SizedBox.shrink(),
                                        if (hasSubmitted)
                                          Column(
                                            children: [
                                              MaterialButton(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                onPressed: _selectedFormType !=
                                                        null
                                                    ? () {
                                                        _formCreatorKey
                                                            .currentState
                                                            ?.saveAndValidate();
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                FormCreationWidget(
                                                              processBar:
                                                                  formSeriesExample!,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    : null,
                                                child: const Text(
                                                    'Save & Generate'),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedFormType = 'Single Dynamic Form';
                                    });
                                  },
                                  child: const Text('Single Dynamic Form'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _selectedFormType = 'Dynamic Form Series';
                                    });
                                  },
                                  child: const Text('Dynamic Form Series'),
                                ),
                              ],
                            );
                    }
                    return const Center(child: Text("Form does not exist."));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
