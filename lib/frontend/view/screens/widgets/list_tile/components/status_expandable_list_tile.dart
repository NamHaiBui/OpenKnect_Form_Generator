import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/steps_button.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:openknect_form_generator/json/form_repo.dart';

class StatusExpandableListTile extends StatefulWidget {
  /// Creates a new [StatusExpandableListTile] widget.
  const StatusExpandableListTile({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.maxDotSize,
    this.formRepository = const FormRepository(),
    this.isInConsideration,
    this.isExample = false,
  });

  /// The list of steps in the form.
  final List<String> steps;

  /// The current step in the form.
  final int currentStep;

  /// The maximum size of the circle in the status indicators.
  final double maxDotSize;

  /// The repository to load the form from.
  final FormRepository formRepository;

  /// Whether the applicant is in consideration.
  final bool? isInConsideration;

  final bool isExample;
  @override
  State<StatusExpandableListTile> createState() =>
      _StatusExpandableListTileState();
}

class _StatusExpandableListTileState extends State<StatusExpandableListTile> {
  /// The key for the form builder.
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      /// The background color of the collapsed list tile.
      collapsedBackgroundColor: const Color.fromARGB(255, 235, 235, 235),

      /// The shape of the collapsed list tile.
      collapsedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),

      /// The background color of the expanded list tile.
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),

      /// The shape of the expanded list tile.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),

      /// The title of the list tile.
      title: Center(
        child: Row(
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
                  isExample: widget.isExample),
              if (i < widget.steps.length - 1)
                Container(
                  width: 50,
                  height: 5,
                  color:
                      widget.currentStep > i ? Colors.blue : Colors.grey[300],
                ),
            }
          ],
        ),
      ),

      /// The children of the list tile.
      children: widget.isExample
          ? [const Text("Just an example")]
          : [
              if (widget.isInConsideration == null)
                const Text("Pending Decision")
              else
                widget.isInConsideration!
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: SingleChildScrollView(
                          child: FutureBuilder<DynamicForm?>(
                            future: widget.formRepository
                                .loadForm(widget.currentStep.toString()), //
                            builder: (BuildContext context,
                                AsyncSnapshot<DynamicForm?> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  child: Text(
                                      "Something bad happened ${snapshot.error}"),
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
                                              onSaved: (value) {},
                                              onSubmit:
                                                  (value) {}, //TODO: inject in the required onSubmit and on onSaved function
                                              field: field,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                );
                              }
                              return const Center(
                                  child: Text("Form does not exist."));
                            },
                          ),
                        ),
                      )
                    : const Text(
                        "We regret to inform you that we have chosen to pursue other applicants"),
            ],
    );
  }
}
