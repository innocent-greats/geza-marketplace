// import 'package:geza_pro/utils/dimensions.dart';
// import 'package:geza_pro/utils/strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
// import 'package:geza_pro/utils/colors.dart';
//
// class GoalPieChartWidget extends StatefulWidget {
//   @override
//   _GoalPieChartWidgetState createState() => _GoalPieChartWidgetState();
// }
//
// class _GoalPieChartWidgetState extends State<GoalPieChartWidget> {
//
//   final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 7,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             Strings.completeOurGoal,
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: Dimensions.largeTextSize
//             ),
//           ),
//           AnimatedCircularChart(
//             key: _chartKey,
//             size: Size.square(150),
//             initialChartData: <CircularStackEntry>[
//               new CircularStackEntry(
//                 <CircularSegmentEntry>[
//                   new CircularSegmentEntry(
//                     75.00,
//                     CustomColor.primaryColor,
//                     rankKey: 'completed',
//                   ),
//                   new CircularSegmentEntry(
//                     25.00,
//                     Colors.grey,
//                     rankKey: 'remaining',
//                   ),
//                 ],
//                 rankKey: 'progress',
//               ),
//             ],
//             chartType: CircularChartType.Radial,
//             edgeStyle: SegmentEdgeStyle.round,
//             percentageValues: true,
//             holeLabel: '75%',
//             holeRadius: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
