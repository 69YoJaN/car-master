// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:car_master/constants/colors.dart';
import 'package:car_master/models/get_all_details/get_all_details.dart';
import 'package:car_master/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final rc_no, car_name, image;

  const ImageCard({
    Key? key,
    this.rc_no,
    this.car_name,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<BusinessStoreImages> images = _businessStore
    // .merchantResponse!.data!.businessStoreImages!
    // .where((element) => element.category == 0)
    // .toList();
    return Card(
      elevation: 5,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(DeviceUtils.getScaledWidth(context, 2)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius:
              BorderRadius.circular(DeviceUtils.getScaledWidth(context, 2)),
          // border: Border.all(color: AppColors.textfeildBorder)
        ),
        child: Row(
          children: [
            Expanded(
              child: IntrinsicHeight(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: DeviceUtils.getScaledWidth(context, 3),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      DeviceUtils.getScaledHeight(context, 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      rc_no,
                                      // overflow: TextOverflow.ellipsis,
                                      // maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontSize:
                                                  DeviceUtils.getScaledWidth(
                                                      context, 4)),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: DeviceUtils.getScaledHeight(
                                        context,
                                        .5,
                                      ),
                                    ),
                                    Text(
                                      car_name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            fontSize:
                                                DeviceUtils.getScaledWidth(
                                                    context, 4),
                                          ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: DeviceUtils.getScaledWidth(context, 3),
                      ),
                      Image.network(image,
                          width: 80, height: 80, fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                        if (loadingProgress != null) {
                          return const SizedBox(
                            width: 80,
                            height: 80,
                          );
                        }
                        return Image.network(
                          image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        );
                      }, errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                        try {
                          return const SizedBox(
                            width: 80,
                            height: 80,
                          );
                          ;
                        } catch (e) {
                          return const SizedBox(
                            width: 80,
                            height: 80,
                          );
                        }
                      }),
                      // Image.network(
                      //   'https://i.pinimg.com/originals/1e/2f/28/1e2f28c0537debcf003afc48375d2775.jpg',
                      //   width: 80,
                      //   height: 80,
                      //   fit: BoxFit.fill,
                      // ),
                      // _buildListView(context),
                      SizedBox(
                        width: DeviceUtils.getScaledWidth(context, 3),
                      ),
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 10),
                        decoration: BoxDecoration(
                          color: AppColors.appBlue,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  DeviceUtils.getScaledWidth(context, 1)),
                              bottomLeft: Radius.circular(
                                  DeviceUtils.getScaledWidth(context, 1))),
                          // border: Border.all(color: AppColors.textfeildBorder)
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.star,
                          color: Colors.white,
                        )),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MediaQuery _buildListView(context) {
  //   List<Attachments> images = item!
  //       .where((element) => element.attachmentType == "Car_Photo")
  //       .toList();
  //   return MediaQuery.removePadding(
  //       context: context,
  //       removeTop: true,
  //       child: images != null
  //           ? ListView.builder(

  //               // To make listView scrollable
  //               // even if there is only a single item.
  //               physics: const AlwaysScrollableScrollPhysics(),
  //               itemCount: images.length,
  //               itemBuilder: (_, index) {
  //                 return Text('data');
  //                 //        ListView.builder(

  //                 // // To make listView scrollable
  //                 // // even if there is only a single item.
  //                 // var item=images[index].attachmentUrl;
  //                 // physics: const AlwaysScrollableScrollPhysics(),
  //                 // itemCount: images.attachmentUrl!.length,
  //                 // itemBuilder: (_, index) {
  //                 //  return  ImageWidget(images[index].attachmentUrl);
  //                 // })
  //               })
  //           : Container());
  // }

//   _buildImage(List<AttachmentUrl>? url) {
//     return url != null
//         ? ListView.builder(

//             // To make listView scrollable
//             // even if there is only a single item.
//             physics: const AlwaysScrollableScrollPhysics(),
//             itemCount: url.length,
//             itemBuilder: (_, index) {
//              return  ImageWidget(images[index]!.attachmentUrl);
//             })
//         : Container();
//   }
}

// class ImageWidget extends StatelessWidget {
//   AttachmentUrl? image;
//   ImageWidget({
//     Key? key,
//     this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       image!.url!,
//       // 'https://i.pinimg.com/originals/1e/2f/28/1e2f28c0537debcf003afc48375d2775.jpg',
//       width: 80,
//       height: 80,
//       fit: BoxFit.fill,
//     );
//   }
// }
