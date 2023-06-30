import 'package:flutter/material.dart';
import 'package:flutter_strategy_pattern/strategy_pattern/strategy_home_view.dart';

import 'core/strategy_context.dart';
import 'features/index.dart';

mixin StrategyHomeMixin on State<StrategyHomeView> {
  Future<void> onStartedLogic() async {
    final StrategyContext strategyContext = StrategyContext(
      context: context,
      const StrategyLicense(),
    );
    var response = await strategyContext.run();

    if (response != null) {
      if (!mounted) return;
      strategyContext.setStrategy(const StrategyApprove());
      response = await strategyContext.run();
    }

    response ??= StrategyResult.failure;
    if (!mounted) return;
    strategyContext.setStrategy(StrategyBottom(result: response));
    await strategyContext.run();
  }
}
