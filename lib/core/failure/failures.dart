class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}

class OfflineFailure extends Failure {
  const OfflineFailure() : super(errorMessage: 'No internet connection');
}
