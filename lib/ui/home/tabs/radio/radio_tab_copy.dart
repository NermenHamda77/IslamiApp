import 'package:flutter/material.dart';
import 'package:islami_app/model/audio_type.dart';
import 'package:islami_app/ui/home/tabs/radio/audio_item_widget.dart';
import 'package:islami_app/ui/home/tabs/radio/selector_container_widget.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';

class RadioTabCopy extends StatefulWidget {
  const RadioTabCopy({super.key});

  @override
  State<RadioTabCopy> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTabCopy> {
  final radios = [
    "Radio Ibrahim",
    "Radio Ahmed",
    "Radio Makkah",
    "Radio Ibrahim",
    "Radio Ahmed",
    "Radio Makkah",
  ];

  final reciters = [
    "Abdul Basit",
    "Al Sudais",
    "Maher Al Muaiqly",
    "Abdul Basit",
    "Al Sudais",
    "Maher Al Muaiqly",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blackButtonColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                unselectedLabelStyle: AppStyles.bold16White,
                labelStyle: AppStyles.bold16Black,
                dividerColor: AppColors.transparentColor,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(child: Text("Radio")),
                  Tab(child: Text("Reciters")),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: height * 0.02,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AudioItemWidget(title: radios[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: height * 0.017);
                    },
                    itemCount: radios.length,
                  ),
                  ListView.separated(
                    padding: EdgeInsetsGeometry.symmetric(
                      vertical: height * 0.02,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AudioItemWidget(title: reciters[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: height * 0.017);
                    },
                    itemCount: reciters.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

