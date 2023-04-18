// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_cycles/core/widgets/custom_auth_dialog.dart';
// import 'package:project_cycles/features/activies/activities_controller.dart';
// import 'package:project_cycles/features/activies/activities_state.dart';
// import 'package:project_cycles/features/biometric_information/biometric_information_page.dart';

// class ActivitiesPage extends StatefulWidget {
//   const ActivitiesPage({super.key});

//   static const route = '/activies_page';

//   @override
//   State<ActivitiesPage> createState() => _ActivitiesPageState();
// }

// class _ActivitiesPageState extends State<ActivitiesPage> {
//   @override
//   Widget build(BuildContext context) {
//     final activitiesController = context.read<ActivitiesController>();

//     const activeName = "running";
//     const activeDescription = "running in road";
//     const List<String> checklist = ["running", "walk"];

    
//     return BlocListener<ActivitiesController, ActivitiesState>(
//       listener: (context, state) {
//         if (state is ActivitiesLoadingState) {
//           const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is ActivitiesErrorState) {
//           final error = (state).message;
//           customAuthDialog(context,
//               customMessage: error,
//               customMessageButton: 'Try Again',
//               customRoute: null,
//               customTypeRouter: TypeRouter.pop);
//           log("error");
//         } else if (state is ActivitiesSuccessState) {
//           customAuthDialog(context,
//               customMessage: 'Successfully registered!!!',
//               customMessageButton: 'Sign In',
//               customRoute: BiometricInformationPage.route,
//               customTypeRouter: TypeRouter.pushNamed);
//           log("OK");
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Teste Activies'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   await activitiesController.callActivities(
//                     activeDescription: activeDescription,
//                     activeName: activeName,
//                     checklist: checklist,
//                   );
//                 },
//                 child: const Text('Enabled'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// TODO (CHARLESTON): Rever se podemos remover código morto