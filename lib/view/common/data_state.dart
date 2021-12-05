class DataState<T> {
  final T? data;
  final Object? error;

  final bool isLoading;
  final bool isError;
  final bool isSuccess;

  const DataState.loading():
    isLoading = true, isError = false, isSuccess = false,
    data = null, error = null;

  const DataState.error(this.error):
    isLoading = false, isError = true, isSuccess = false,
    data = null;

  const DataState.success(this.data):
    isLoading = false, isError = false, isSuccess = true,
    error = null;
}
