import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBottomSheet extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final int itemCount;

  final String Function(int) itemTitleBuilder;
  final String Function(int)? itemSubtitleBuilder;
  final bool Function(int)? itemSelectedBuilder;
  final Widget? Function(int)? itemTrailingBuilder;
  final Future<void> Function(int) onTap;

  const SearchBottomSheet({
    super.key,
    required this.title,
    this.actions,
    required this.itemCount,
    required this.itemTitleBuilder,
    this.itemSubtitleBuilder,
    this.itemSelectedBuilder,
    this.itemTrailingBuilder,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        actions: actions,
      ),
      body: BottomSheet(
        enableDrag: false,
        onClosing: () => {},
        builder: (context) => ListView.separated(
          itemCount: itemCount,
          itemBuilder: (context, index) => ListTile(
            title: Text(itemTitleBuilder(index)),
            subtitle: itemSubtitleBuilder != null ? Text(itemSubtitleBuilder!(index)) : null,
            selected: itemSelectedBuilder != null ? itemSelectedBuilder!(index) : false,
            trailing: itemTrailingBuilder != null ? itemTrailingBuilder!(index) : null,
            onTap: () async {
              await onTap(index);
              Get.back();
            },
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
