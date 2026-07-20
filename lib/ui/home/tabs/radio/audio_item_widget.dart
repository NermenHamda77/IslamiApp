import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_colors.dart';
import 'package:islami_app/utils/app_images.dart';
import 'package:islami_app/utils/app_styles.dart';

class AudioItemWidget extends StatefulWidget {
  final String title;

  const AudioItemWidget({super.key, required this.title});

  @override
  State<AudioItemWidget> createState() => _AudioItemWidgetState();
}

class _AudioItemWidgetState extends State<AudioItemWidget> {
  bool isPlayed = false;
  bool isFav = false;
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: isPlayed
              ? AssetImage(AppImages.radioPlayedImage)
              : AssetImage(AppImages.radioPausedImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Text(widget.title, style: AppStyles.bold20Black),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15,
            children: [
              IconButton(
                onPressed: () {
                  isFav = !isFav;
                  setState(() {});
                },
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.blackColor,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  isPlayed = !isPlayed;
                  setState(() {});
                },
                icon: Icon(
                  isPlayed ? Icons.pause : Icons.play_arrow,
                  color: AppColors.blackColor,
                  size: 44,
                ),
              ),

              IconButton(
                onPressed: () {
                  isMuted = !isMuted;
                  setState(() {});
                },
                icon: Icon(
                  isMuted ? Icons.volume_off : Icons.volume_up,
                  color: AppColors.blackColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
