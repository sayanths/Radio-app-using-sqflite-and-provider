import 'package:radio_app/model/base_model.dart';
import 'package:radio_app/model/db_model.dart';

class RadioApiModel extends BaseModel {
  List<RadioModel> data;

  RadioApiModel({required this.data});
 
  @override
  fromJson(Map<String, dynamic> json) {
    data =
        (json["Data"] as List).map((i) => RadioModel.fromMap(i)).toList();
    throw UnimplementedError();
  }
}

class RadioModel extends DBBaseModel {    
  static String table = 'radios';
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


factory RadioModel.fromMap(Map<String,dynamic>map){
  return RadioModel(id: map["id"], radioName: map["radioName"], radioUrl: map["radioUrl"], radioDesc: map["radioDesc"], radioWebsite: map["radioWebsite"], radioPic: map["radioPic"], isBookMarked: map["isFavourite"]==1 ?true :false,);
}

Map<String ,dynamic>map(){
  Map<String ,dynamic>map={
    'radioName':radioName,
    'radioUrl':radioUrl,
    'radioDesc':radioDesc,
    'radioWebsite':radioWebsite,
    'radioPic':radioPic,
  };
  if(id!=null){
    map['id']=id;
  }
  return map;
}

}
