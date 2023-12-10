class ShowDetailModel {
  String? id,
      facilitiesId,
      title,
      startDate,
      endDate,
      facilities,
      cast,
      crew,
      runtime,
      age,
      producer,
      price,
      poster,
      content,
      genre,
      state,
      openrun,
      time;

  List<String>? img;

  ShowDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['mt20id'];
    facilitiesId = json['mt10id'];
    title = json['prfnm'];
    startDate = json['prfpdfrom'];
    endDate = json['prfpdto'];
    facilities = json['fcltynm'];
    cast = json['prfcast'];
    crew = json['prfcrew'];
    runtime = json['prfruntime'];
    age = json['prfage'];
    producer = json['entrpsnm'];
    price = json['pcseguidance'];
    poster = json['poster'];
    content = json['sty'];
    genre = json['genrenm'];
    state = json['prfstate'];
    openrun = json['openrun'];
    var styurls = json['styurls']['styurl'];
    if (styurls is List) {
      // 여러장
      img = List<String>.from(styurls);
    } else if (styurls is String) {
      // 한장
      img = [styurls];
    }
    time = json['dtguidance'];
  }
}
