sealed class Result<T> {
  const Result();

  factory Result.ok(T value) => Ok(value);
  factory Result.error(Exception error) => Error(error);
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  final T value;

  const Ok(this.value);
}

/// Subclass of Result for errors
final class Error<T> extends Result<T> {
  final Exception error;

  const Error(this.error);
}
