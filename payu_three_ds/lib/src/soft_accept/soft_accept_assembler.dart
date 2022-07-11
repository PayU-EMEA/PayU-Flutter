import 'package:payu_api/payu_api.dart';
import 'package:payu_state_management/payu_state_management.dart';

import 'helpers/soft_accept_components.dart';
import 'helpers/soft_accept_query_parameter_extractor.dart';
import 'helpers/soft_accept_uri_modifier.dart';
import 'models/soft_accept_request.dart';
import 'network/client/soft_accept_network_client.dart';
import 'soft_accept_controller.dart';
import 'soft_accept_service.dart';

class SoftAcceptAssembler extends PayuAssembler {
  final SoftAcceptRequest request;

  SoftAcceptAssembler(this.request);

  @override
  void assemble() {
    register(() => SoftAcceptComponents());
    register(() => SecureHttpClient.create());
    register(() => SoftAcceptNetworkClient(find()));
    register(() => SoftAcceptQueryParameterExtractor());
    register(() => SoftAcceptService(find(), find()));
    register(() => SoftAcceptUriModifier());
    register(() => SoftAcceptController(request, find(), find(), find()));
    super.assemble();
  }

  @override
  void dispose() {
    unregister<SoftAcceptComponents>();
    unregister<SecureHttpClient>();
    unregister<SoftAcceptNetworkClient>();
    unregister<SoftAcceptQueryParameterExtractor>();
    unregister<SoftAcceptService>();
    unregister<SoftAcceptUriModifier>();
    unregister<SoftAcceptController>();
    super.dispose();
  }
}
