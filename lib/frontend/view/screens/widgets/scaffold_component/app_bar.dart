import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/frontend/provider/screen_selection_provider.dart';

class MainScreenAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MainScreenAppBar({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 40); // Adjust height as needed

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedScreen =
        ref.watch(selectedScreenProvider); // Watch for state changes

    return AppBar(
      // Add a border around the app bar
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(color: Colors.grey, width: 1),
      ),
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
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
              style: const TextStyle(
                color: Colors.black, // Set text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
