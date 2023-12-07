import 'package:eggs/pages/home_page.dart';
import 'package:eggs/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 2), () {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const SplashPage(),
  //         ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('pt','BR'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          // title: const Text('EGGS'),
        ),
        body: SplashPage(), //HomePage() //
      ),
    );
  }

}
//
// class FilterChipExample extends StatefulWidget {
//   const FilterChipExample({super.key});
//
//   @override
//   State<FilterChipExample> createState() => _FilterChipExampleState();
// }
//
// class _FilterChipExampleState extends State<FilterChipExample> {
//   Set<ExerciseFilter> filters = <ExerciseFilter>{};
//
//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           //Text('Choose an exercise', style: textTheme.labelLarge),
//           //const SizedBox(height: 5.0),
//           Wrap(
//             spacing: 4.0,
//             children: ExerciseFilter.values.map((ExerciseFilter exercise) {
//               return FilterChip(
//                 label: Text(exercise.name),
//                 selected: filters.contains(exercise),
//                 onSelected: (bool selected) {
//                   setState(() {
//                     if (selected) {
//                       filters.add(exercise);
//                     } else {
//                       filters.remove(exercise);
//                     }
//                   });
//                 },
//               );
//             }).toList(),
//           ),
//           // const SizedBox(height: 10.0),
//           // Text(
//           //   'Looking for: ${filters.map((ExerciseFilter e) => e.name).join(', ')}',
//           //   style: textTheme.labelLarge,
//           // ),
//         ],
//       ),
//     );
//   }
// }
