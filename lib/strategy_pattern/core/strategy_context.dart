import 'package:flutter/material.dart';

enum StrategyResult {
  success,
  failure,
}

mixin Operation {
  Future<StrategyResult?> execute(BuildContext context);
}

class StrategyContext {
  StrategyContext(this._operation, {required this.context});
  final BuildContext context;
  Operation _operation;

  void setStrategy(Operation operation) {
    _operation = operation;
  }

  Future<StrategyResult?> run() async => await _operation.execute(context);
}
