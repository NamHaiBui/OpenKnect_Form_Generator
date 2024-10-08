import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:openknect_form_generator/frontend/model/dynamic_form/dynamic_form_model.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/list_tile/components/dynamic_form_input.dart';
import 'package:openknect_form_generator/json/form_repo.dart';

class BasicForm extends StatefulWidget {
  final FormRepository formRepository;

  const BasicForm({
    super.key,
    required this.formRepository,
  });

  @override
  State<BasicForm> createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Forms"),
      ),
      body: FutureBuilder<DynamicForm?>(
        future: widget.formRepository.loadForm("0"),
        builder: (BuildContext context, AsyncSnapshot<DynamicForm?> snapshot) {
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
                          onSaved: (value) {},
                          onSubmit: (value) {},
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
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          if (_formKey.currentState!.saveAndValidate(focusOnInvalid: false)) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 10),
                content: Text(
                  'Form successfully validated and saved. Form data: ${_formKey.currentState!.value}',
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Form validation failed'),
              ),
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
