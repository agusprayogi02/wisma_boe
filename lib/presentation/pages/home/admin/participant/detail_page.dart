import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:next_starter/common/utils/date_utils.dart';
import 'package:next_starter/data/models/participant_model.dart';
import 'package:next_starter/presentation/components/app_bar_wisma.dart';
import 'package:next_starter/presentation/components/base/base_scaffold.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class ParticipantDetailPage extends StatefulWidget {
  const ParticipantDetailPage({
    super.key,
    required this.item,
  });

  final ParticipantModel item;
  static const path = "/home/admin/participant/detail";

  @override
  State<ParticipantDetailPage> createState() => _ParticipantDetailPageState();
}

class _ParticipantDetailPageState extends State<ParticipantDetailPage> {
  late String jk;
  late final ParticipantModel item;

  @override
  void initState() {
    item = widget.item;
    jk = item.jenisKelamin ?? "";
    super.initState();
    if (jk.toLowerCase() == "l" || jk.toLowerCase() == "pria") {
      jk = "pria";
    } else if (jk.toLowerCase() == "p" || jk.toLowerCase() == "wanita") {
      jk = "wanita";
    }
  }

  final asrama = {
    "GBH": "Gedung Bima Hall",
    "KD": "Gedung Kendedes",
    "KU": "Gedung Ken Umang",
    "KA": "Gedung Ken Arok",
    "GH": "Gedung Guest House",
    "KJ": "Gedung Kertajaya",
    "BG": "Gedung Bima Graha",
  };

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const AppBarWisma(
        namePage: "Detail Peserta",
      ),
      body: Column(
        children: [
          Column(
            children: [
              SvgPicture.asset(
                "assets/icon/$jk.svg",
                height: 125,
              ),
              Text(jk, style: AppStyles.text12PxBold),
            ],
          ),
          12.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NIK: ${item.nik ?? '-'}",
                style: AppStyles.text14Px,
              ),
              Text(item.nama ?? "-", style: AppStyles.text18PxBold),
              Text(
                item.namaSekolah ?? "-",
                style: AppStyles.text14Px,
              ),
              Text(
                "${item.kotaUjob ?? '-'}, ${DateCommonUtils.formatDate(item.tanggalLahir)}",
                style: AppStyles.text14Px,
              ),
              const Divider(
                height: 8,
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                item.namaKelas ?? "-",
                style: AppStyles.text14Px,
              ),
              Text(
                item.klsTglCheckin == null
                    ? "Tanggal belum di set"
                    : "${DateCommonUtils.formatDate(item.klsTglCheckin)} - ${DateCommonUtils.formatDate(item.klsTglCheckin)}",
                style: AppStyles.text14PxSemiBold,
              ),
              const Divider(
                height: 8,
                color: Colors.black,
                thickness: 1,
              ),
              Text(
                asrama.keys.contains((item.roomName ?? '').split("-")[0])
                    ? asrama[(item.roomName ?? '').split("-")[0]] ?? 'asrama belum di set'
                    : "asrama belum di set",
                style: AppStyles.text14PxSemiBold,
              ),
              Text(
                item.roomName ?? 'ruangan belum di set',
                style: AppStyles.text14Px,
              ),
            ],
          )
        ],
      ),
    );
  }
}
