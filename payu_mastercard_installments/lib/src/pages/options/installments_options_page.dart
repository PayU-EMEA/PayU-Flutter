import 'package:flutter/material.dart';

import 'package:payu_about/payu_about.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_ui/payu_ui.dart';

import '../../core/widgets/installments_header_widget.dart';
import '../../models/installment_proposal.dart';
import 'installments_options_assembler.dart';
import 'installments_options_controller.dart';
import 'installments_options_list_item.dart';
import 'installments_options_list_tile.dart';

class InstallmentsOptionsPage extends StatelessWidget {
  final InstallmentProposal proposal;

  const InstallmentsOptionsPage({Key? key, required this.proposal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<InstallmentsOptionsController, InstallmentsOptionsAssembler>(
      assembler: () => InstallmentsOptionsAssembler(proposal),
      builder: (context, controller) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: PayuImage.logo(),
          actions: [
            PayuAppBarIcon.info(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const AboutPage(),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: PayuPadding.padding16),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            final item = controller.items[index];
            if (item is InstallmenstOptionsListHeaderItem) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: PayuPadding.padding16),
                child: InstallmentsHeaderWidget(),
              );
            } else if (item is InstallmenstOptionsListOptionItem) {
              return InstallmentsOptionsListTile(
                data: item.data,
                onTap: (option) => controller.didSelectOption(context, option),
              );
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }
}
