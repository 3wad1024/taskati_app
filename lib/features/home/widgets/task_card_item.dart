import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_app/core/storage/task_model.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/core/utils/styles.dart';

class TaskCardItem extends StatelessWidget {
  const TaskCardItem({super.key, required this.model});

  final Task model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: model.isComplete
              ? AppColors.greencolor
              : (model.color == 0
                  ? AppColors.primarycolor
                  : model.color == 1
                      ? AppColors.orangecolor
                      : AppColors.redcolor)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: getTiteleStyle(color: AppColors.whitecolor, fontSize: 18),
              ),
              const Gap(10),
              Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: AppColors.whitecolor,
                  ),
                  const Gap(10),
                  Text('${model.startTime} - ${model.endTime}',
                      style: getSmallStyle(color: AppColors.whitecolor))
                ],
              ),
              const Gap(10),
              Text(model.note,
                  style: getBodyStyle(color: AppColors.whitecolor)),
            ],
          ),
          const Spacer(),
          Container(
            width: .5,
            height: 60,
            color: AppColors.whitecolor.withOpacity(.5),
          ),
          const Gap(10),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                model.isComplete ? 'COMPLETED' : 'TODO',
                style: getTiteleStyle(fontSize: 14, color: AppColors.whitecolor),
              ))
        ],
      ),
    );
  }
}