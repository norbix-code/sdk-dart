import '../core/transport.dart';
import 'assign.dart';
import 'authenticate.dart';
import 'block.dart';
import 'delete.dart';
import 'get.dart';
import 'invite.dart';
import 'regenerate.dart';
import 'save.dart';
import 'unblock.dart';
import 'update.dart';

class ApiNamespace {
  final Transport _transport;
  ApiNamespace(this._transport);
  ApiAssignModule get assign => ApiAssignModule(_transport);
  ApiAuthenticateModule get authenticate => ApiAuthenticateModule(_transport);
  ApiBlockModule get block => ApiBlockModule(_transport);
  ApiDeleteModule get delete => ApiDeleteModule(_transport);
  ApiGetModule get get_ => ApiGetModule(_transport);
  ApiInviteModule get invite => ApiInviteModule(_transport);
  ApiRegenerateModule get regenerate => ApiRegenerateModule(_transport);
  ApiSaveModule get save => ApiSaveModule(_transport);
  ApiUnblockModule get unblock => ApiUnblockModule(_transport);
  ApiUpdateModule get update => ApiUpdateModule(_transport);
}
