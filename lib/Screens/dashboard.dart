import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 932,
      width: 430,
      child: Stack(
        children: [
          Container(
            color: const Color(0xFFA79F9F),
          ),
          Container( height: 100,
          width: 430,
          color: const Color(0xffD9D9D9),
          ),
          ListView(
            children: const [
              ContBox(
                height: 160,
                width: 430,
                text: 'Hi There!',
              ),
              Gap(110),
              Padding(
                padding: EdgeInsets.all(9),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ContBox(
                          height: 160,
                          width: 182,
                          text: 'Thyroid',
                        ),
                        Gap(20),
                        ContBox(
                          height: 160,
                          width: 182,
                          text: 'Glucose',
                        ),
                      ],
                    ),
                    Gap(10),
                    ContBox(
                      height: 350,
                      width: 182,
                      text: 'Blood Pressure',
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text(
                      'See More...',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ContBox extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  const ContBox({super.key, this.height = 10, this.width = 10, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Color(0xffD9D9D9),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
