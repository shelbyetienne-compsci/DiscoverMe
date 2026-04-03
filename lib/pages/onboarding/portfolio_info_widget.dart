import 'package:discover_me/controllers/portfolio_controller.dart';
import 'package:discover_me/models/portfolio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PortfolioInfoWidget extends ConsumerStatefulWidget {
  final Portfolio portfolio;

  const PortfolioInfoWidget({super.key, required this.portfolio});

  @override
  ConsumerState<PortfolioInfoWidget> createState() =>
      _PortfolioInfoWidgetState();
}

class _PortfolioInfoWidgetState extends ConsumerState<PortfolioInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: Form(
            child: Column(
              children: [

                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(portfolioControllerProvider.notifier)
                        .savePortfolio();
                  },
                  child: Text("SUBMIT"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
