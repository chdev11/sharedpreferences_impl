abstract class IClothState {}

class ClothReady extends IClothState {}

class ClothLoading extends IClothState {}

class ClothSuccess extends IClothState {}

class ClothError extends IClothState {
  final Exception exception;

  ClothError(this.exception);
}
