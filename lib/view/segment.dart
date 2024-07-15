import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Segment extends StatefulWidget {
  Segment({
    super.key,
  });

  @override
  State<Segment> createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {
  Set<String> selected = {'science'};

  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(
      builder: (context, provider, child) {
        return SegmentedButton(
          style: SegmentedButton.styleFrom(
            backgroundColor: Colors.blue[100],
            selectedBackgroundColor: Colors.blue[500],
            selectedForegroundColor: Colors.blue[900],
            side: BorderSide(color: Colors.blue),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          ),
          segments: [
            ButtonSegment(
                value: 'science',
                label: Text(
                  'science',
                  overflow: TextOverflow.ellipsis,
                )),
            ButtonSegment(
                value: 'sport',
                label: Text(
                  'sport',
                  overflow: TextOverflow.ellipsis,
                )),
            ButtonSegment(
                value: 'entertainment',
                label: Text(
                  'entertainment',
                  overflow: TextOverflow.ellipsis,
                )),
            ButtonSegment(
                value: 'business',
                label: Text(
                  'business',
                  overflow: TextOverflow.ellipsis,
                )),
            ButtonSegment(
                value: 'health',
                label: Text(
                  'health',
                  overflow: TextOverflow.ellipsis,
                ))
          ],
          selected: selected,
          onSelectionChanged: (value) {
            // selected = value;setState(() {

            // });
            provider.changeselected(value);
            selected = provider.selected!;
          },
        );
      },
    );
  }
}


// import 'package:api_and_hive/viewmodel/change.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Segment extends StatefulWidget {
//   Segment({
//     super.key,
//   });

//   @override
//   State<Segment> createState() => _SegmentState();
// }

// class _SegmentState extends State<Segment> {
//   Set<String> selected = {'science'};

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Change>(
//       builder: (context, provider, child) {
//         return SegmentedButton(
//           style: SegmentedButton.styleFrom(
//             backgroundColor: Colors.white,
//             selectedForegroundColor: Colors.orange[900],
//             selectedBackgroundColor: Colors.orange[100],
//             side: BorderSide(color: Colors.orange[900]!),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//           segments: [
//             ButtonSegment(
//               value: 'science',
//               label: Text(
//                 'Science',
//                 textAlign: TextAlign.center,
//                 softWrap: false,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             ButtonSegment(
//               value: 'sport',
//               label: Text(
//                 'Sport',
//                 textAlign: TextAlign.center,
//                 softWrap: false,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             ButtonSegment(
//               value: 'entertainment',
//               label: Text(
//                 'Entertainment',
//                 textAlign: TextAlign.center,
//                 softWrap: false,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             ButtonSegment(
//               value: 'business',
//               label: Text(
//                 'Business',
//                 textAlign: TextAlign.center,
//                 softWrap: false,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             ButtonSegment(
//               value: 'health',
//               label: Text(
//                 'Health',
//                 textAlign: TextAlign.center,
               
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//           selected: selected,
//           onSelectionChanged: (value) {
//             setState(() {
//               provider.changeselected(value);
//               selected = provider.selected!;
//             });
//           },
//         );
//       },
//     );
//   }
// }
