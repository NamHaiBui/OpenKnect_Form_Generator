import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openknect_form_generator/frontend/provider/screen_selection_provider.dart';

class MainScreenAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainScreenAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedScreen =
        ref.watch(selectedScreenProvider); // Watch for state changes

    return AppBar(
      title: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), // Add rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
            border: Border.all(
              color: Colors.grey, // Add a border
              width: 1,
            ),
          ),
          child: DropdownButton<String>(
            value: selectedScreen,
            onChanged: (newValue) {
              ref
                  .read(selectedScreenProvider.notifier)
                  .setSelectedScreen(newValue!);
            },
            items: <String>['Recipient Screen', 'Admin Screen']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            underline: const SizedBox(), // Remove the default underline
            isExpanded: true, // Make the dropdown button fill the container
            style: const TextStyle(
              color: Colors.black, // Set text color
            ),
          ),
        ),
      ),
    );
  }
}
