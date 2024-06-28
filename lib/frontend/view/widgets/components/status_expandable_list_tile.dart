import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/steps_button.dart';
import 'package:openknect_form_generator/frontend/view/widgets/components/dynamic_form_input.dart';
import 'package:openknect_form_generator/json/form_repo.dart';

class StatusExpandableListTile extends StatefulWidget {
  const StatusExpandableListTile({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.maxDotSize,
    this.formRepository = const FormRepository(),
  });

  final List<String> steps;
  final int currentStep;
  final double maxDotSize;
  final FormRepository formRepository;
  @override
  State<StatusExpandableListTile> createState() =>
      _StatusExpandableListTileState();
}

class _StatusExpandableListTileState extends State<StatusExpandableListTile> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: const Color.fromARGB(255, 235, 235, 235),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align to the start
            mainAxisSize: MainAxisSize.min,
            children: [
              // Temp placeholder for avatar
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              // Divider
              // const VerticalDivider(
              //   width: 10,
              //   thickness: 20,
              //   color: Color.fromARGB(255, 0, 0, 0),
              // ),
              const SizedBox(width: 10), // Add spacing after divider
              // Steps
              for (int i = 0; i < widget.steps.length; i++) ...{
                StepButton(
                  currentStep: widget.currentStep,
                  i: i,
                  maxDotSize: widget.maxDotSize,
                  steps: widget.steps,
                ),
                if (i < widget.steps.length - 1)
                  Container(
                    width: 50, // Line width
                    height: 5,
                    color:
                        widget.currentStep > i ? Colors.blue : Colors.grey[300],
                  ),
              }
            ],
          ),
        ],
      ),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: SingleChildScrollView(
            child: FutureBuilder<DynamicForm?>(
              future: widget.formRepository.loadForm(),
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
                      key: _formKey,
                      child: Column(
                        children: snapshot.data!.fields
                            .map(
                              (field) => DynamicFormInput(
                                field: field,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                }
                return const Center(child: Text("Form does not exist."));
              },
            ),
          ),
        ),
      ],
    );
  }
}
