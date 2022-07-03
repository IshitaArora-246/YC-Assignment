import 'package:flutter/material.dart';
import 'package:yellow_class_assignment/views/widgets/custom_appbar.dart';
import 'package:yellow_class_assignment/views/widgets/video_list.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: const [
                SizedBox(height: 85),
                Expanded(child: VideoList()),
              ],
            ),
            const CustomAppBar(),
          ],
        ),
      ),
    );
  }
}
