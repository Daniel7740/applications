class BaseResponse<E> {
  final E? model;
  final String? errorText;

  BaseResponse({
    this.model,
    this.errorText,
  });

  @override
  String toString() => 'BaseResponse(model: $model, errorText: $errorText)';
}
