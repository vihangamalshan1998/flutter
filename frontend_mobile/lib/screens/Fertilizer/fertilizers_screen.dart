import 'package:flutter/material.dart';
import 'package:frontend_mobile/providers/fertilizer_provider.dart';
import 'package:frontend_mobile/screens/Fertilizer/Widgets/fertilizer_tile_widget.dart';
import 'package:frontend_mobile/screens/Fertilizer/add_edit_fertilizer_screen.dart';
import 'package:frontend_mobile/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class FertilizersScreen extends StatefulWidget {
  const FertilizersScreen({Key? key}) : super(key: key);
  static const String routeName = '/fertilizers';
  @override
  State<FertilizersScreen> createState() => _FertilizersScreenState();
}

class _FertilizersScreenState extends State<FertilizersScreen> {
  late bool loading;
  @override
  void initState() {
    loading = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Fertilizers fertilizers = Provider.of<Fertilizers>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditFertilizerScreen(),
            ),
          ).whenComplete(() {
            refresh();
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      // drawer: const AppDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only( bottom: 25),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                'Fertilizers',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Provider.of<Fertilizers>(context, listen: false)
                  .fetchFertilizers(),
              builder: (ctx, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (dataSnapshot.hasData) {
                  return const Center(
                    child: Text('No Fertilizers To Load'),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    return Center(
                      child: Text(
                        dataSnapshot.error.toString(),
                      ),
                    );
                  } else {
                    return Consumer<Fertilizers>(
                      builder: (ctx, fertilizerData, child) => ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: fertilizerData.getFertilizers().length,
                        itemBuilder: (ctx, i) =>
                            FertilizerTile(fertilizerData.getFertilizers()[i]),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  refresh() {}
}
