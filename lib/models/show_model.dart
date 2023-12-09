class ShowModel {
  final String id,
      title,
      startDate,
      endDate,
      location,
      img,
      genre,
      state,
      openrun;

  ShowModel.fromJson(Map<String, dynamic> json)
      : id = json['mt20id'],
        title = json['prfnm'],
        startDate = json['prfpdfrom'],
        endDate = json['prfpdto'],
        location = json['fcltynm'],
        img = json['poster'],
        genre = json['genrenm'],
        state = json['prfstate'],
        openrun = json['openrun'];
}
