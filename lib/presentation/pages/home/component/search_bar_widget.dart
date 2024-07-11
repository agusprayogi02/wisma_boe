import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/common/extensions/extensions.dart';
import 'package:next_starter/presentation/theme/theme.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    this.onSearch,
    this.keyboardType = TextInputType.text,
    this.hint,
    this.disabled = false,
    this.controller,
    this.searchAllowEmpty = false,
    this.onClear,
    this.onTap,
    this.focusNode,
  });

  final ValueChanged<String>? onSearch;
  final VoidCallback? onClear;
  final bool disabled;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? hint;
  final bool searchAllowEmpty;
  final VoidCallback? onTap;
  final FocusNode? focusNode;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final TextEditingController edit;
  @override
  void initState() {
    super.initState();
    edit = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.disabled ? widget.onTap : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              4.verticalSpace,
              TextFormField(
                style: CustomTextTheme.paragraph2.copyWith(color: ColorTheme.neutral[800]),
                onTap: widget.onTap,
                focusNode: widget.focusNode,
                decoration: GenerateTheme.inputDecorationRounded(
                  widget.hint ?? 'Cari',
                  const Icon(Icons.search_rounded),
                  edit.text.trim().isNotEmpty
                      ? InkWell(
                          onTap: () {
                            edit.clear();
                            widget.onClear?.call();
                            setState(() {});
                          },
                          child: const Icon(Icons.clear_rounded, color: ColorTheme.statusRed),
                        )
                      : null,
                ),
                enabled: !widget.disabled,
                controller: edit,
                onChanged: (value) => setState(() {}),
                keyboardType: widget.keyboardType,
              ),
            ],
          ).expand(),
          8.horizontalSpaceRadius,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(.23.sw, 36.h),
            ),
            onPressed: (!widget.disabled && edit.text.trim().isNotEmpty) || widget.searchAllowEmpty
                ? () {
                    widget.onSearch?.call(edit.text.trim());
                  }
                : null,
            child: const Text('Cari'),
          )
        ],
      ),
    );
  }
}
