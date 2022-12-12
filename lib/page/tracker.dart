import 'package:c06_pas_pbp/page/login.dart';
import 'package:c06_pas_pbp/page/trackerFetch.dart';
import 'package:flutter/material.dart';
import 'package:c06_pas_pbp/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  static const String title = 'Tracker';

  @override
  State<TrackerPage> createState() => _TrackerPage();
}

class _TrackerPage extends State<TrackerPage> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String age = '';
  String sex = '';
  String headCircumference = '';
  String height = '';
  String weight = '';
  String description = '';

  List<String> sexOptions = ['M', 'F'];
  String selectedSex = 'M';


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text(TrackerPage.title,
         textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff0ebce))),
        backgroundColor: Color(0xffAA8B56),
      
      ),
      drawer: const PTS_Drawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    icon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onChanged: (value) => email = value!,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Age',
                    labelText: 'Age',
                    icon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  onChanged: (value) => age = value!,
                ),
                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'Sex',
                    icon: const Icon(Icons.wc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  items: sexOptions.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedSex = value!;
                    });
                  },
                  value: selectedSex,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Head Circumference',
                    labelText: 'Head Circumference (cm)',
                    icon: const Icon(Icons.public),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your head circumference';
                    }
                    return null;
                  },
                  onChanged: (value) => headCircumference = value!,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Height',
                    labelText: 'Height (cm)',
                    icon: const Icon(Icons.accessibility),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                  onChanged: (value) => height = value!,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Weight',
                    labelText: 'Weight (kg)',
                    icon: const Icon(Icons.line_weight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  onChanged: (value) => weight = value!,
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                    icon: const Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onChanged: (value) => description = value!,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Submit',
                   textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff0ebce))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()){
                      final response = await request.post(
                        "https://pts-c06-pbp.up.railway.app/tracking/post-tracker/",
                        {
                          'email': email,
                          'age': age,
                          'gender': selectedSex,
                          'head_circumference': headCircumference,
                          'height': height,
                          'weight': weight,
                          'description': description,  
                        }
                      );
                       if (response["status"]) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 15,
                                      child: Container(
                                        child: ListView(
                                          padding: const EdgeInsets.all((20)),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Successful",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextButton(
                                                onPressed: (() {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const TrackerPage()),
                                                  );
                                                  ;
                                                }),
                                                child: Text(
                                                  'ok',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                )),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                    }
                  },
                ),
                if(LoginState.loggedIn == true && LoginState.userRole == 'DOKTER')
                  ElevatedButton(
                     style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffAA8B56),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
 // Background color
  ),
                  child: Text('DATA',
                   textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xfff0ebce))),
                    onPressed: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => TrackerData())
                    );
                  },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}