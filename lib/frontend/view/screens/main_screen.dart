import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openknect_form_generator/frontend/provider/screen_selection_provider.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/scaffold_component/admin_screen.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/scaffold_component/app_bar.dart';
import 'package:openknect_form_generator/frontend/view/screens/widgets/scaffold_component/recipient_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize:
            Size.fromHeight(kToolbarHeight), // Standard AppBar height
        child: MainScreenAppBar(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final selectedScreen =
                            ref.watch(selectedScreenProvider);
                        if (selectedScreen == 'Admin Screen') {
                          return const AdminScreen();
                        } else {
                          return const RecipientScreen();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
