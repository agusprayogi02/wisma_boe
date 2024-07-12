import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/common/utils/date_utils.dart';
import 'package:next_starter/data/models/participant_model.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({
    super.key,
    required this.item,
  });

  final ParticipantModel item;

  @override
  Widget build(BuildContext context) {
    var jk = item.jenisKelamin ?? "";
    if (jk.toLowerCase() == "l" || jk.toLowerCase() == "pria") {
      jk = "pria";
    } else if (jk.toLowerCase() == "p" || jk.toLowerCase() == "wanita") {
      jk = "wanita";
    }
    return Container(
      padding: 8.all,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: 6.rounded,
      ),
      child: Row(
        children: [
          Column(
            children: [
              SvgPicture.asset(
                "assets/icon/$jk.svg",
                height: 50,
              ),
              Text(jk, style: AppStyles.text12PxBold),
            ],
          ),
          8.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.nama ?? "-", style: AppStyles.text16PxBold),
              Text(
                item.namaSekolah ?? "-",
                style: AppStyles.text13Px,
              ),
              Text(
                item.kotaUjob ?? "-",
                style: AppStyles.text13Px,
              ),
              const Divider(
                height: 8,
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                item.namaKelas ?? "-",
                style: AppStyles.text13Px,
              ),
              Text(
                item.klsTglCheckin == null
                    ? "Tanggal belum di set"
                    : "${DateCommonUtils.formatDate(item.klsTglCheckin)} - ${DateCommonUtils.formatDate(item.klsTglCheckin)}",
                style: AppStyles.text13PxSemiBold,
              ),
            ],
          ).expand(),
        ],
      ),
    );
  }
}
