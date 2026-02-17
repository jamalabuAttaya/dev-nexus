import '../../domain/entities/roadmap_entity.dart';

class RoadmapModel {
  final String id;
  final String title;
  final String description;
  final String seo;
  final String? pdfUrl;
  final Map<String, dynamic> nodes;

  RoadmapModel({
    required this.id,
    required this.title,
    required this.description,
    required this.seo,
    this.pdfUrl,
    required this.nodes,
  });

  
  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    return RoadmapModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      seo: json['seo'] ?? '',
      pdfUrl: json['pdfUrl'],
      nodes: json['nodes'] ?? {},
    );
  }
  


factory RoadmapModel.fromDefault(String id) {
  return RoadmapModel(
    id: id,
    title: '${id[0].toUpperCase()}${id.substring(1)} Roadmap',
    description: 'Complete guide to becoming a $id developer',
    seo: id,
    nodes: {},
  );
}




   


 
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'seo': seo,
      'pdfUrl': pdfUrl,
      'nodes': nodes,
    };
  }

  
  RoadmapEntity toEntity() {
    
    final nodeList = <RoadmapNode>[];
    
    if (nodes.isNotEmpty) {
      nodes.forEach((key, value) {
        if (value is Map<String, dynamic>) {
          nodeList.add(RoadmapNode(
            id: key,
            label: value['label'] ?? key,
            description: value['description'] ?? '',
            children: List<String>.from(value['children'] ?? []),
            resource: value['resource'],
          ));
        }
      });
    }

    
    final level = _determineLevel(nodeList.length);
    final duration = _determineDuration(nodeList.length);

    return RoadmapEntity(
      id: id,
      title: title,
      description: description,
      icon: _getIconForRoadmap(id),
      level: level,
      duration: duration,
      nodes: nodeList,
      resources: _extractResources(nodeList),
    );
  }

  
  String _determineLevel(int nodeCount) {
    if (nodeCount < 10) return 'Beginner';
    if (nodeCount < 20) return 'Intermediate';
    return 'Expert';
  }

 
  String _determineDuration(int nodeCount) {
    final weeks = (nodeCount * 1.5).round();
    if (weeks < 4) return '$weeks weeks';
    if (weeks < 8) return '${(weeks / 4).round()} months';
    return '${(weeks / 4).round()}+ months';
  }

  
  String _getIconForRoadmap(String id) {
    const icons = {
      'flutter': 'flutter_dash',
      'frontend': 'web_rounded',
      'backend': 'storage_rounded',
      'devops': 'cloud_rounded',
      'android': 'android_rounded',
      'ios': 'apple_rounded',
      'python': 'code_rounded',
      'java': 'code_rounded',
      'react': 'javascript_rounded',
      'angular': 'code_rounded',
      'vue': 'code_rounded',
      'nodejs': 'storage_rounded',
      'go': 'code_rounded',
      'rust': 'code_rounded',
      'kubernetes': 'cloud_circle_rounded',
      'docker': 'docker_rounded',
      'aws': 'cloud_rounded',
      'azure': 'cloud_rounded',
      'gcp': 'cloud_rounded',
      'data-science': 'analytics_rounded',
      'ai': 'psychology_rounded',
      'machine-learning': 'psychology_rounded',
      'cybersecurity': 'security_rounded',
      'game-dev': 'sports_esports_rounded',
    };
    
    return icons[id] ?? 'map_rounded';
  }

 
  List<String> _extractResources(List<RoadmapNode> nodes) {
    final resources = <String>[];
    for (var node in nodes) {
      if (node.resource != null && node.resource!.isNotEmpty) {
        resources.add(node.resource!);
      }
    }
    return resources;
  }
}