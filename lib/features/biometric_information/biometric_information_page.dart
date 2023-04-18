// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_cycles/core/widgets/custom_auth_dialog.dart';
// import 'package:project_cycles/features/biometric_information/biometric_information_controller.dart';
// import 'package:project_cycles/features/biometric_information/biometric_information_state.dart';
// import 'package:project_cycles/features/sign_in/sign_in_page.dart';

// class BiometricInformationPage extends StatefulWidget {
//   const BiometricInformationPage({super.key});

//   static const route = '/biometric_information_page';

//   @override
//   State<BiometricInformationPage> createState() =>
//       _BiometricInformationPageState();
// }

// class _BiometricInformationPageState extends State<BiometricInformationPage> {
//   @override
//   Widget build(BuildContext context) {
//     final biometricInformationController =
//         context.read<BiometricInformationController>();

//     const hrv = 10;
//     const heartBeat = 5;
//     const remsLeep = 20;
//     const deepsLeep = 100;
//     const restTime = 100;
//     const activityTime = 50;
//     const temperature = 35;
//     const respiratoryRate = 100;

//     return BlocListener<BiometricInformationController,
//         BiometricInformationState>(
//       listener: (context, state) {
//         if (state is BiometricInformationLoadingState) {
//           const Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is BiometricInformationErrorState) {
//           final error = (state).message;
//           customAuthDialog(context,
//               customMessage: error,
//               customMessageButton: 'Try Again',
//               customRoute: null,
//               customTypeRouter: TypeRouter.pop);
//           log("error");
//         } else if (state is BiometricInformationSuccessState) {
//           customAuthDialog(context,
//               customMessage: 'Successfully registered!!!',
//               customMessageButton: 'Sign In',
//               customRoute: SignInPage.route,
//               customTypeRouter: TypeRouter.pushReplacementNamed);
//           log("OK");
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Teste BiometricInformation'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   await biometricInformationController.callBiometricInformation(
//                     activityTime: activityTime,
//                     deepsLeep: deepsLeep,
//                     hrv: hrv,
//                     heartBeat: heartBeat,
//                     remsLeep: remsLeep,
//                     respiratoryRate: respiratoryRate,
//                     restTime: restTime,
//                     temperature: temperature,
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