class PostSubDescription {
  String titleSub;
  String descriptionSub;
  PostSubDescription.fromJson(Map subJson)
      : titleSub = subJson['title'],
        descriptionSub = subJson['description'];
}
