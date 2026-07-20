import 'package:flutter/material.dart';
import 'package:islami_app/model/audio_type.dart';
import 'package:islami_app/ui/home/tabs/radio/audio_item_widget.dart';
import 'package:islami_app/ui/home/tabs/radio/selector_container_widget.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../utils/app_colors.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  AudioType selected = AudioType.radio;
  final radios = ["Radio Ibrahim", "Radio Ahmed", "Radio Makkah","Radio Ibrahim", "Radio Ahmed", "Radio Makkah"];

  final reciters = ["Abdul Basit", "Al Sudais", "Maher Al Muaiqly","Abdul Basit", "Al Sudais", "Maher Al Muaiqly"];
  late final currentList = selected == AudioType.radio ? radios : reciters;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            spacing: width * 0.01,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    selected = AudioType.radio;
                    setState(() {});
                  },
                  child: SelectorContainerWidget(
                    title: 'Radio',
                    isSelected: selected == AudioType.radio,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    selected = AudioType.reciter;
                    setState(() {});},
                  child: SelectorContainerWidget(
                    title: 'Reciters',
                    isSelected: selected == AudioType.reciter,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              //controller: controller,
              padding: EdgeInsetsGeometry.symmetric(vertical: height * 0.02),
              itemBuilder: (BuildContext context, int index) {
                return selected == AudioType.radio ?
                  AudioItemWidget(title: radios[index],):
                  AudioItemWidget(title: reciters[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.017);
              },
              itemCount: currentList.length,
            ),
          ),
        ],
      ),
    );
  }

}
