import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith/hadeeth_item.dart';


class HadithTab extends StatelessWidget {
  HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CarouselSlider(
      options: CarouselOptions(
          height: height*0.66,
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
      ),
      items: List.generate(50, (index) => index + 1).map((index) {
        return HadeethItem(index: index,);
      }).toList(),

    );
  }
}
