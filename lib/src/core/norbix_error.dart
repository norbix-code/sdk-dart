class NorbixError implements Exception {
  final String code;
  final int status;
  final String message;
  final Map<String, dynamic> details;

  const NorbixError({
    required this.message,
    this.code = 'NORBIX_ERROR',
    this.status = 0,
    this.details = const {},
  });

  @override
  String toString() => '$code ($status): $message';
}
