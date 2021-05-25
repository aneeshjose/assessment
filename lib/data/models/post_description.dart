class PostSubDescription {
  int index;
  String titleSub;
  String descriptionSub;
  PostSubDescription.fromJson(Map subJson)
      : index = subJson["index"] as int,
        titleSub = subJson["title"],
        descriptionSub = subJson['description'];
}
