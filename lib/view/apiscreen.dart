import 'package:api_and_hive/view/segment.dart';
import 'package:api_and_hive/view/sliverdelegate.dart';
import 'package:api_and_hive/view/sliverlistview.dart';
import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Apiscreen extends StatefulWidget {
  Apiscreen({super.key});

  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {
 

  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(
      builder: (context, provider, child) {
        return Scaffold(
            body: Stack( 
            // alignment: Alignment.bottomCenter,
              children: [Sliverlistview(),
                Align(alignment:Alignment.bottomCenter,child:  Segment( )),
              ],
            )
            //  CustomScrollView(
            //   slivers: [
            // SliverToBoxAdapter(child: Sliverlistview()),
            // const  Sliverdelegate()
            //   ],
            // )
            );
      },
    );
  }
}
