import 'package:flutter/material.dart';

double horizontalTitlePadding(
    ScrollController scrollController, double expandedHeight) {
  double kBasePadding = 16;
  const kMultiplier = 0.5;

  if (scrollController.hasClients) {
    if (scrollController.offset < (expandedHeight / 2)) {
      return kBasePadding;
    }

    if (scrollController.offset > (expandedHeight - kToolbarHeight)) {
      return (expandedHeight / 2 - kToolbarHeight) * kMultiplier + kBasePadding;
    }

    return (scrollController.offset - (expandedHeight / 2)) * kMultiplier +
        kBasePadding;
  }

  return kBasePadding;
}
