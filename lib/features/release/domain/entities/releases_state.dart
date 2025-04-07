import 'package:flutter_template/features/release/domain/entities/entities.dart';

class ReleasesState {
  final Map<String, ReleaseEntity> releases;
  final bool isLoading;

  ReleasesState({
    this.releases = const {},
    this.isLoading = false,
  });

  ReleasesState copyWith({
    Map<String, ReleaseEntity>? releases,
    bool? isLoading,
  }) {
    return ReleasesState(
      releases: releases ?? this.releases,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, ReleaseEntity> getReleasesByCommercialFigures(String commercialFigures) {
    return releases.values
        .where((release) => release.commercialFigure == commercialFigures)
        .fold<Map<String, ReleaseEntity>>({}, (acc, release) {
      acc[release.id] = release;
      return acc;
    });
  }
}