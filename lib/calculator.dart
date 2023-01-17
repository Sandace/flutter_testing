import 'package:equatable/equatable.dart';

class Calculator extends Equatable {
  add(int _x, int _y) => _x + _y;
  subtract(int _x, int _y) => _x - _y;
  multiply(int _x, int _y) => _x * _y;
  divide(int _x, int _y) => _x / _y;

  @override
  List<Object?> get props => [];
}
