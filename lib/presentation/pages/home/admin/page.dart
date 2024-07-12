import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:next_starter/application/participant/participant_cubit.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/data/models/participant_model.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/app_bar_wisma.dart';
import 'package:next_starter/presentation/components/base/base_scaffold.dart';
import 'package:next_starter/presentation/pages/home/admin/participant/detail_page.dart';
import 'package:next_starter/presentation/pages/home/component/search_bar_widget.dart';

import 'participant_card.dart';

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
                  itemBuilder: (context, item, index) => InkWell(
                    onTap: () {
                      context.route.pushNamed(ParticipantDetailPage.path, extra: item);
                    },
                    child: ParticipantCard(
                      item: item,
                    ),
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
