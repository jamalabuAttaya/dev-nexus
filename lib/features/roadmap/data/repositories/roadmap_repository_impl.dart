import '../../domain/entities/roadmap_entity.dart';
import '../../domain/entities/roadmap_summary_entity.dart';
import '../../domain/repositories/roadmap_repository.dart';
import '../services/roadmap_api_service.dart'; 
import '../services/roadmap_local_service.dart'; 
import 'package:flutter/foundation.dart';

class RoadmapRepositoryImpl implements RoadmapRepository {
  final RoadmapApiService api;
  final RoadmapLocalService local;

  RoadmapRepositoryImpl({
    required this.api,
    required this.local,
  });

  @override
  Future<List<RoadmapSummaryEntity>> getAllRoadmaps() async {
    try {
      final data = await api.fetchAllRoadmaps();
      return data.map((e) => RoadmapSummaryEntity(
        id: e['id'] ?? '',
        title: e['title'] ?? 'Unknown',
        description: e['description'] ?? '',
        level: e['level'] ?? 'All Levels',
      )).toList();
    } catch (e) {
      debugPrint(' API failed, using local fallback: $e');
      
      return local.getAllRoadmaps().map((e) => RoadmapSummaryEntity(
        id: e['id'] ?? '',
        title: e['title'] ?? 'Unknown',
        description: e['description'] ?? '',
        level: e['level'] ?? 'All Levels',
      )).toList();
    }
  }

  @override
  Future<RoadmapEntity> getRoadmapDetail(String id) async {
    try {
      final model = await api.fetchRoadmapDetail(id);
      return model.toEntity();
    } catch (e) {
      debugPrint(' API failed for $id, using local fallback: $e');
     
      return local.getRoadmapDetail(id);
    }
  }
}