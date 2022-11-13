import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class TransformPage extends StatefulWidget {
  const TransformPage({super.key});

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage>
    with SingleTickerProviderStateMixin {
  double xAxis = 0;
  double yAxis = 0;
  late AnimationController _animationController;
  _ontap() {
    if (xAxis == 0) {
      setState(() {
        xAxis = 100;
      });
    } else if (xAxis == 100) {
      setState(() {
        xAxis = 0;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Transform",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _animationController,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.amber,
                ),
                builder: ((context, child) {
                  return Transform.translate(
                    offset: Offset(_animationController.value * xAxis,
                        _animationController.value * yAxis),
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        padding: EdgeInsets.all(5),
                        color: Colors.teal,
                        child: GestureDetector(
                          onTap: () {
                            _ontap();
                          },
                          child: Image.asset(
                            "assets/images/img.webp",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ]),
    );
  }
}
