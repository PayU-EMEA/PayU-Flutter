import 'package:payu_api/payu_api.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'cvv_authorization_controller.dart';
import 'network/client/cvv_authorization_network_client.dart';

class CVVAuthorizationAssembler extends PayuAssembler {
  final String refReqId;

  CVVAuthorizationAssembler(this.refReqId);

  @override
  void assemble() {
    register(() => SecureHttpClient.create());
    register(() => CVVAuthorizationNetworkClient(find()));
    register(() => CVVAuthorizationController(refReqId, find()));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<SecureHttpClient>();
    unregister<CVVAuthorizationNetworkClient>();
    unregister<CVVAuthorizationController>();
    super.dispose();
  }
}
