import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:widget_mask/widget_mask.dart';
// import '';

class MovieItemBuilder extends StatelessWidget {
  const MovieItemBuilder(
      {Key? key,
      required this.mask,
      required this.image,
      required this.leftPadding,
      required this.rightPadding})
      : super(key: key);
  final String mask;
  final String image;
  final double leftPadding;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: SizedBox(
        height: 210,
        width: 160,
        child: WidgetMask(
          blendMode: BlendMode.srcATop,
          childSaveLayer: true,
          mask: FadeInImage(
            image:  CachedNetworkImageProvider(ApiConstance.imageUrl(image),),
              placeholder:const AssetImage('assets/loading.gif'),

              fit: BoxFit.cover,
            ),

          child: Image.asset(mask, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
