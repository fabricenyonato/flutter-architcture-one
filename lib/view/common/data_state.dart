class DataState<T> {
  final T? data;
  final Object? error;

  final bool isLoading;
  final bool isError;

  const DataState.loading():
    isLoading = true, isError = false,
    data = null, error = null;

  const DataState.error(this.error):
    isLoading = false, isError = true,
    data = null;

  const DataState.success(this.data):
    isLoading = false, isError = false,
    error = null;
}
