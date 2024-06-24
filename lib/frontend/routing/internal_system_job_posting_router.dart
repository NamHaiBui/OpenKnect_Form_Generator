import 'package:go_router/go_router.dart';

const Map<Type, String> internalSystemJobPostingRoutePaths = {
  InternalSystemJobPostingPage: '/internal_system/job_posting',
};

/// Define GoRouter's navigation routes of the feature
final List<GoRoute> internalSystemJobPostingGoRoutes = [
  GoRoute(
    path: internalSystemJobPostingRoutePaths[InternalSystemJobPostingPage]!,
    builder: (context, state) {
      return const InternalSystemJobPostingPage();
    },
  ),
];

final List<String> internalApplicationsJobPostingProtectedPaths = [
  internalSystemJobPostingRoutePaths[InternalSystemJobPostingPage]!,
];
