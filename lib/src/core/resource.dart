import 'transport.dart';

/// Base class for every resource module (e.g. `UsersResource`,
/// `ProjectsResource`). Holds the shared [Transport] so resources can be
/// constructed lazily by the client.
abstract class Resource {
  final Transport transport;
  const Resource(this.transport);
}
