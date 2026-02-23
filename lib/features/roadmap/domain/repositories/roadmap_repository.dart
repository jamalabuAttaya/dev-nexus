import '../entities/roadmap_entity.dart';
import '../entities/roadmap_summary_entity.dart';

abstract class RoadmapRepository {
  Future<List<RoadmapSummaryEntity>> getAllRoadmaps();
  Future<RoadmapEntity> getRoadmapDetail(String id);
}