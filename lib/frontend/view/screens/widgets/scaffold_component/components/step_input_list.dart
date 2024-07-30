import 'package:flutter/material.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';

class StepInputList extends StatefulWidget {
  final List<String> steps;
  final DynamicForm form;
  final Function(int, String) onStepUpdate;

  const StepInputList({
    super.key,
    required this.steps,
    required this.form,
    required this.onStepUpdate,
  });

  @override
  State<StepInputList> createState() => _StepInputListState();
}

class _StepInputListState extends State<StepInputList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return DynamicFormInput(
                  field: widget.form.fields[1],
                  onSaved: (p0) {
                    setState(() {
                      widget.onStepUpdate(index, p0);
                    });
                  },
                  onSubmit: (p0) {
                    setState(() {
                      widget.onStepUpdate(index, p0);
                    });
                  },
                );
              },
              itemCount: widget.steps.length,
            ),
          ),
        ),
      ],
    );
  }
}
