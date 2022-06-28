class RadioModel {
  final int id;
  final String radioName;
  final String radioUrl;
  final String radioDesc;
  final String radioWebsite;
  final String radioPic;
  final bool isBookMarked;

  RadioModel({
    required this.id,
    required this.radioName,
    required this.radioUrl,
    required this.radioDesc,
    required this.radioWebsite,
    required this.radioPic,
    required this.isBookMarked,
  });
}
