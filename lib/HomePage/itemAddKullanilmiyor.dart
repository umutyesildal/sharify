import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sharify/constants.dart';

class itemAdd extends StatefulWidget {
  @override
  _itemAddState createState() => _itemAddState();
}

class _itemAddState extends State<itemAdd> {
  TextEditingController photoController = TextEditingController();
  TextEditingController headerController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  List<Step> steps = [
    Step(
      title: const Text("Category"),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: [
          Text(
            '   Choose a Category',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 37.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            '   to share.',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: 37.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/add.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'food',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/add.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'books',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/add.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'clothes',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30.0),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/add.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'techs',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Adress'),
      content: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: "XD"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "XD"),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "XD"),
          )
        ],
      ),
    ),
  ];
  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Create an account'),
        backgroundColor: kalphaGreen,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: photoController,
            decoration: InputDecoration(labelText: "photolink"),
          ),
          TextFormField(
            controller: headerController,
            decoration: InputDecoration(labelText: "header"),
          ),
          TextFormField(
            controller: usernameController,
            decoration: InputDecoration(labelText: "username"),
          ),
          RaisedButton(
            child: Text(
              "bas yolla koc"
            ),
            onPressed: () async {
              print(photoController.text);
              print(headerController.text);
              print(usernameController.text);
              FirebaseFirestore.instance.collection('items').add({"photo": photoController.text, "header": headerController.text, "username": usernameController.text});
            },
          )
        ],
      )

        /*  Column(     // Stepper bunun içinde ama tam yapamadığım için sonra yapcam
        children: [
          complete ? Expanded(
            child: Center(
              child: AlertDialog(
                title: new Text("Profile Created"),
                content: new Text(
                  "Tada!",
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("Close"),
                    onPressed: () {
                      setState(() => complete = false);
                    },
                  ),
                ],
              ),
            ),
          )
              : Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          ),
        ],
      ),
      */
    );
  }
}
