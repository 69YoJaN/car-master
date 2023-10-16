import 'package:car_master/constants/colors.dart';
import 'package:car_master/models/get_all_details/get_all_details.dart';
import 'package:car_master/utils/device/device_utils.dart';
import 'package:car_master/widgets/image_card.dart';
import 'package:flutter/material.dart';

class CarDetailsCard extends StatelessWidget {
  final CarData? item;
  final image;
  const CarDetailsCard({super.key, this.item, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 3.5)),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius:
                BorderRadius.circular(DeviceUtils.getScaledWidth(context, 2)),
            border: Border.all(color: AppColors.appBlue)),
        child: Padding(
          padding: EdgeInsets.all(DeviceUtils.getScaledWidth(context, 3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleValue('Car_RC_No : ', item!.rcNumber.toString(), context),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 1),
              ),
              _titleValue('Car_Name : ', item!.model, context),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 1),
              ),
              _titleValue('Model : ', item!.model, context),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 1),
              ),
              _titleValue('Capacity : ', item!.capacity.toString(), context),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 1),
              ),
              _titleValue('Attachments : ', '', context),
              SizedBox(
                height: DeviceUtils.getScaledHeight(context, 1),
              ),
              // Visibility(
              //   visible: true,
              _buildCarDetailsList(),
              ImageCard(
                rc_no: item!.rcNumber.toString(),
                car_name: item!.model,
                image: image,
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildCarDetailsList() {
    return item != null
        ? ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: item!.attachments!.length,
            // _getAllDetailsStore.rolesResponse!.services.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1} : ${item!.attachments![index].attachmentType}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: DeviceUtils.getScaledWidth(context, 4.5)),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: DeviceUtils.getScaledHeight(context, 1),
                  ),
                ],
              );
            })
        : Container();
  }

  Widget _titleValue(title, value, context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: DeviceUtils.getScaledWidth(context, 4.5)),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontSize: DeviceUtils.getScaledWidth(context, 4.5)),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
