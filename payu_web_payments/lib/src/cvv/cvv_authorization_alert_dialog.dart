import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payu_state_management/payu_state_management.dart';
import 'package:payu_translations/payu_translations.dart';

import '../../payu_web_payments.dart';
import 'cvv_authorization_assembler.dart';
import 'cvv_authorization_controller.dart';

class CVVAuthorizationAlertDialog extends StatelessWidget {
  final String refReqId;

  const CVVAuthorizationAlertDialog({Key? key, required this.refReqId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PayuWidget<CVVAuthorizationController, CVVAuthorizationAssembler>(
      assembler: () => CVVAuthorizationAssembler(refReqId),
      builder: (context, controller) => AlertDialog(
        title: Text('enter_cvv_code'.translated()),
        content: TextField(
          controller: controller.textEditingController,
          maxLength: 3,
          decoration: InputDecoration(
            hintText: 'cvv_code'.translated(),
            errorText: controller.codeLiteral,
            counterText: '',
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(CVVAuthorizationResult.cancelled),
            child: Text('back'.translated()),
          ),
          if (controller.isEnabled)
            TextButton(
              onPressed: () => _didTapConfirmButton(context, controller),
              child: Text('ok'.translated()),
            ),
          if (!controller.isEnabled)
            TextButton(
              onPressed: null,
              child: Text('ok'.translated()),
            ),
        ],
      ),
    );
  }

  void _didTapConfirmButton(BuildContext context, CVVAuthorizationController controller) async {
    await controller.didTapConfirmButton();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(CVVAuthorizationResult.success);
  }
}
