import 'package:flutter/material.dart';

class AddEditFertilizerScreen extends StatefulWidget {
  const AddEditFertilizerScreen({Key? key}) : super(key: key);
  static const String routeName = '/addEditFertilizer';
  @override
  State<AddEditFertilizerScreen> createState() =>
      _AddEditFertilizerScreenState();
}

class _AddEditFertilizerScreenState extends State<AddEditFertilizerScreen> {
  final _formKey = GlobalKey<FormState>();
  late FocusScopeNode node;

  TextEditingController fertilizerName = TextEditingController();
  TextEditingController fertilizerCode = TextEditingController();
  TextEditingController fertilizerWeight = TextEditingController();
  TextEditingController fertilizerDescription = TextEditingController();
  late bool create;
  @override
  void initState() {
    create = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Create Fertilizer',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                fertilizerNameField(),
                fertilizerCodeField(),
                fertilizerWeightField(),
                fertilizerDescriptionField(),
                const SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ButtonTheme(
                    minWidth: double.infinity,
                    child: MaterialButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          create ? "Create" : "Update",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fertilizerNameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: (value) {},
        controller: fertilizerName,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => node.nextFocus(),
        decoration: const InputDecoration(
          labelText: "Name",
          hintText: "Name",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  Widget fertilizerCodeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: (value) {},
        controller: fertilizerCode,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => node.nextFocus(),
        decoration: const InputDecoration(
          labelText: "Code",
          hintText: "Code",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  Widget fertilizerWeightField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (value) {},
        controller: fertilizerName,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => node.nextFocus(),
        decoration: const InputDecoration(
          labelText: "Weight",
          hintText: "Weight",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  Widget fertilizerDescriptionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        validator: (value) {},
        controller: fertilizerName,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => node.nextFocus(),
        decoration: const InputDecoration(
          labelText: "Description",
          hintText: "Description",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }

  createFertilizer() {
    
  }
}
