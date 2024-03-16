import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 932,
      width: 430,
      child: Stack(
        children: [
          Container(
            color: const Color(0xFFA79F9F),
          ),
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 160,
                color: const Color(0xffD9D9D9),
                
              ),
              const Gap(110),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 182,
                          height: 160,
                          color: const Color(0xffD9D9D9),
                        ),
                        Gap(20),
                        Container(
                          width: 182,
                          height: 160,
                          color: const Color(0xffD9D9D9),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Container(
                      width: 182,
                      height: 362,
                      color: const Color(0xffD9D9D9),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
