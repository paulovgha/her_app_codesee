// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:project_cycles/core/themes/app_colors.dart';

// class PageViewCard extends StatelessWidget {
//   const PageViewCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 320.0,
//                 child: Stack(
//                   children: [
//                     PageView(
//                       controller: PageController(initialPage: 0),
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Expanded(
//                               flex: 9,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: const BorderRadius.only(
//                                       bottomLeft: Radius.circular(0.0),
//                                       bottomRight: Radius.circular(0.0),
//                                       topLeft: Radius.circular(12.0),
//                                       topRight: Radius.circular(12.0),
//                                     ),
//                                     child: Image.network(
//                                       'https://i.imgur.com/GJmt88o.png',
//                                       width: double.infinity,
//                                       height: 200.0,
//                                       fit: BoxFit.fitHeight,
//                                     ),
//                                   ),
//                                   const Divider(),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Headache problems?',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .displaySmall,
//                                             ),
//                                             Text(
//                                               'We have some tips for you',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: const AlignmentDirectional(
//                                             0.0, 0.0),
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(120, 52),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             log('Button pressed ...');
//                                           },
//                                           child: const Text('Read more'),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Container(
//                                     decoration: const BoxDecoration(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Expanded(
//                               flex: 9,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: const BorderRadius.only(
//                                       bottomLeft: Radius.circular(0.0),
//                                       bottomRight: Radius.circular(0.0),
//                                       topLeft: Radius.circular(12.0),
//                                       topRight: Radius.circular(12.0),
//                                     ),
//                                     child: Image.network(
//                                       'https://i.imgur.com/MG0lht0.png',
//                                       width: double.infinity,
//                                       height: 200.0,
//                                       fit: BoxFit.fitHeight,
//                                     ),
//                                   ),
//                                   const Divider(),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.stretch,
//                                           children: [
//                                             Text(
//                                               'Having a breakout?',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .displaySmall,
//                                             ),
//                                             Text(
//                                               'We have some tips for you',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: const AlignmentDirectional(
//                                             0.0, 0.0),
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(120, 52),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             log('Button pressed ...');
//                                           },
//                                           child: const Text('Read more'),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Container(
//                                     decoration: const BoxDecoration(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Expanded(
//                               flex: 9,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: const BorderRadius.only(
//                                       bottomLeft: Radius.circular(0.0),
//                                       bottomRight: Radius.circular(0.0),
//                                       topLeft: Radius.circular(12.0),
//                                       topRight: Radius.circular(12.0),
//                                     ),
//                                     child: Image.network(
//                                       'https://i.imgur.com/awG5s8H.png',
//                                       width: double.infinity,
//                                       height: 200.0,
//                                       fit: BoxFit.fitHeight,
//                                     ),
//                                   ),
//                                   const Divider(),
//                                   Row(
//                                     mainAxisSize: MainAxisSize.max,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Expanded(
//                                         child: Column(
//                                           mainAxisSize: MainAxisSize.max,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Master your cycle!',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .displaySmall,
//                                             ),
//                                             Text(
//                                               'We have some tips for you',
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .labelSmall,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: const AlignmentDirectional(
//                                             0.0, 0.0),
//                                         child: ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             minimumSize: const Size(120, 52),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                           ),
//                                           onPressed: () {
//                                             log('Button pressed ...');
//                                           },
//                                           child: const Text('Read more'),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Container(
//                                     decoration: const BoxDecoration(),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Align(
//                       alignment: const AlignmentDirectional(0.0, 1.0),
//                       child: Padding(
//                         padding: const EdgeInsetsDirectional.fromSTEB(
//                             0.0, 0.0, 0.0, 10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: MediaQuery.of(context).size.height * 0.01,
//                               width: MediaQuery.of(context).size.width * 0.1,
//                               decoration: const BoxDecoration(
//                                 color: AppColors.primary,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(16),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.01,
//                             ),
//                             Container(
//                               height: MediaQuery.of(context).size.height * 0.01,
//                               width: MediaQuery.of(context).size.height * 0.01,
//                               decoration: BoxDecoration(
//                                 color: AppColors.primary.withOpacity(0.5),
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(16),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.01,
//                             ),
//                             Container(
//                               height: MediaQuery.of(context).size.height * 0.01,
//                               width: MediaQuery.of(context).size.height * 0.01,
//                               decoration: BoxDecoration(
//                                 color: AppColors.primary.withOpacity(0.5),
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(16),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
