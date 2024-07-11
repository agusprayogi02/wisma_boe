import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:next_starter/application/participant/participant_cubit.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/common/utils/date_utils.dart';
import 'package:next_starter/data/models/participant_model.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/app_bar_wisma.dart';
import 'package:next_starter/presentation/components/base/base_scaffold.dart';
import 'package:next_starter/presentation/pages/home/component/search_bar_widget.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({super.key});

  static const path = "/home/admin";

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  final PagingController<int, ParticipantModel> _controller = PagingController(firstPageKey: 1);
  final cubit = locator<ParticipantCubit>();
  String? search;

  @override
  void initState() {
    super.initState();
    _controller.addPageRequestListener((pageKey) {
      cubit.getParticipantList(pageKey, search: search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BaseScaffold(
        appBar: const AppBarWisma(
          isHome: true,
        ),
        body: BlocListener<ParticipantCubit, ParticipantState>(
          listener: (context, state) {
            if (state is ParticipantLoaded) {
              if (state.data.data.isEmpty) {
                _controller.appendLastPage([]);
              } else {
                final isLastPage = state.data.currentPage == state.data.lastPage;
                if (isLastPage) {
                  _controller.appendLastPage(state.data.data);
                } else {
                  final nextPageKey = state.data.currentPage ?? 1 + 1;
                  _controller.appendPage(state.data.data, nextPageKey.toInt());
                }
              }
            } else if (state is ParticipantError) {
              _controller.error = state.message;
            }
          },
          child: Column(
            children: [
              SearchBarWidget(
                onSearch: (value) {
                  setState(() {
                    search = value;
                  });
                  _controller.refresh();
                },
                onClear: () {
                  setState(() {
                    search = null;
                  });
                  _controller.refresh();
                },
              ),
              16.verticalSpace,
              PagedListView<int, ParticipantModel>(
                pagingController: _controller,
                builderDelegate: PagedChildBuilderDelegate<ParticipantModel>(
                  itemBuilder: (context, item, index) => ParticipantCard(
                    item: item,
                  ).pOnly(bottom: 8),
                ),
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}

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
