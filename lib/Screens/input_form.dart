import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InputForm extends StatelessWidget {
  InputForm({super.key});
  Map<String, dynamic> credentials = {};
  String? name, bloodgroup, sex;
  int? age, height, weight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFffffff),
        body: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const Gap(40),
                  Image.asset('assets/logo/icon.png'),
                  const Gap(20),
                  const Text('Med Insights',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const Row(
                    children: [
                      Gap(30),
                      Text(
                        "Fill in the form below to get started",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 425,
                    width: 327,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Color(0xff99CBC3),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          height: 50,
                          width: 320,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              name = value;
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              age = int.parse(value);
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Age',
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Autocomplete(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return [
                                'A+',
                                'A-',
                                'B+',
                                'B-',
                                'AB+',
                                'AB-',
                                'O+',
                                'O-',
                                'Unknown'
                              ].where((element) => element.contains(
                                  textEditingValue.text.toLowerCase()));
                            },
                            onSelected: (value) {
                              bloodgroup = value;
                            },
                            fieldViewBuilder: (context, textEditingController,
                                focusNode, onFieldSubmitted) {
                              return TextFormField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                    hintText: 'Blood Group',
                                    border: InputBorder.none),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Autocomplete(
                            optionsBuilder:
                                (TextEditingValue textEditingValue) {
                              return ['male', 'female', 'other'].where(
                                  (element) => element.contains(
                                      textEditingValue.text.toLowerCase()));
                            },
                            onSelected: (value) {
                              sex = value;
                            },
                            fieldViewBuilder: (context, textEditingController,
                                focusNode, onFieldSubmitted) {
                              return TextFormField(
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                    hintText: 'Sex', border: InputBorder.none),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              height = int.parse(value);
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Height',
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: const EdgeInsets.only(left: 20),
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              weight = int.parse(value);
                            },
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Weight',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    String jsonCredentials = jsonEncode({
                      'name': name,
                      'age': age,
                      'bloodgroup': bloodgroup,
                      'sex':sex,
                      'height': height,
                      'weight': weight
                                          
                      });
                    print(jsonCredentials);
                    print('Submitted');
                  }, child: const Text('Submit'))
                ],
              ),
            ),
          ],
        ));
  }
}
