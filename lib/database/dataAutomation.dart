// CRUD operations
class dataAutomation {
  final String id;
  final String label;
  final String feature;
  dataAutomation({
    required this.id,
    required this.label,
    required this.feature,
  });
  factory dataAutomation.fromJson(Map<String, dynamic> data) => dataAutomation(
        id: data['id'],
        label: data['label'],
        feature: data['feature'],
      );
  Map<String, dynamic> toMap() =>
      {'id': id, 'label': label, 'feature': feature};
}
