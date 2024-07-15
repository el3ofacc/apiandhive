 
import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sliverdelegate extends StatefulWidget {
  const Sliverdelegate({super.key});

  @override
  State<Sliverdelegate> createState() => _SliverdelegateState();
}

class _SliverdelegateState extends State<Sliverdelegate> {
  @override
  void initState() {
 
    super.initState();
    Provider.of<Change>(context, listen: false).fetchdata(country: 'us',field: 'sport');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<Change>(
      builder: (context, provider, child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var element = provider.datalist[index];
              return Card(elevation: 10,
              color: Colors.cyan,
                child: Column(
                  children: [
                    SizedBox( 
                      child: ListTile(
                        title: Text(element.title==null?'title':
                          element.title.toString() ,style: TextStyle(color: Colors.white),
                          maxLines: 1,
                        ),
                        subtitle: Text(element.description==null?'description':
                          element.description.toString()  ,style: TextStyle(color: Colors.white),
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(//color: Colors.blue,
                        child:element.image==null?  const Center(
                              child: CircularProgressIndicator(),
                            ): ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(fit: BoxFit.cover,
                                image: NetworkImage(element.image.toString()),
                                height: size.height / 4,
                                width: size.width,
                              ),
                            ) 
                          
                      ),
                    )
                  ],
                ),
              );
            },
            childCount: provider.datalist.length,
          ),
        );
      },
    );
  }
}



 