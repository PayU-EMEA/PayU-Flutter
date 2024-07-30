import 'package:flutter/material.dart';
import 'package:payu_ui/payu_ui.dart';

import '../../../payu_mastercard_installments.dart';
import 'installments_options_list_tile_data.dart';

class InstallmentsOptionsListTile extends StatelessWidget {
  final InstallmentsOptionsListTileData data;
  final Function(InstallmentOption) onTap;

  const InstallmentsOptionsListTile({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PayuPadding.padding4,
        horizontal: PayuPadding.padding16,
      ),
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            vertical: PayuPadding.padding8,
            horizontal: PayuPadding.padding16,
          ),
          leading: const SizedBox(
            height: double.infinity,
            child: Icon(Icons.date_range_outlined),
          ),
          title: Text(
            data.title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: Wrap(
            direction: Axis.vertical,
            spacing: PayuPadding.padding8,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              Wrap(
                spacing: PayuPadding.padding8,
                children: [
                  if (data.prefix != null) Text(data.prefix!),
                  Text(
                    data.subtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(data.total),
            ],
          ),
          onTap: () => onTap(data.option),
        ),
      ),
    );
  }
}
