class FacetModel {
  FacetModel({
    this.isCommercial,
    this.controlTemplates,
    this.recordRules,
    this.facetGroupId,
    this.facetGroup,
    this.flightNumbers,
    this.id,
    this.lastUpdateGround,
    this.listItems,
    this.menuTemplates,
    this.textStrings,
    this.users,
    this.dashboardType,
    this.releaseType,
    this.useNewDashboard,
    this.releaseSettings,
  });

  FacetModel.fromJson(dynamic json) {
    isCommercial = json['IsCommercial'];
    controlTemplates = json['ControlTemplates'];
    recordRules = json['RecordRules'];
    facetGroupId = json['FacetGroupId'];
    facetGroup = json['FacetGroup'];
    if (json['FlightNumbers'] != null) {
      flightNumbers = [];
      json['FlightNumbers'].forEach((v) {
        flightNumbers?.add(FlightNumbers.fromJson(v));
      });
    }
    id = json['Id'];
    lastUpdateGround = json['LastUpdateGround'];
    if (json['ListItems'] != null) {
      listItems = [];
      json['ListItems'].forEach((v) {
        listItems?.add(ListItems.fromJson(v));
      });
    }
    menuTemplates = json['MenuTemplates'];
    if (json['TextStrings'] != null) {
      textStrings = [];
      json['TextStrings'].forEach((v) {
        textStrings?.add(TextStrings.fromJson(v));
      });
    }
    if (json['Users'] != null) {
      users = [];
      json['Users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
    dashboardType = json['DashboardType'];
    releaseType = json['ReleaseType'];
    useNewDashboard = json['UseNewDashboard'];
    releaseSettings = json['ReleaseSettings'];
  }

  bool? isCommercial;
  String? controlTemplates;
  String? recordRules;
  String? facetGroupId;
  num? facetGroup;
  List<FlightNumbers>? flightNumbers;
  String? id;
  String? lastUpdateGround;
  List<ListItems>? listItems;
  String? menuTemplates;
  List<TextStrings>? textStrings;
  List<Users>? users;
  num? dashboardType;
  num? releaseType;
  bool? useNewDashboard;
  String? releaseSettings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsCommercial'] = isCommercial;
    map['ControlTemplates'] = controlTemplates;
    map['RecordRules'] = recordRules;
    map['FacetGroupId'] = facetGroupId;
    map['FacetGroup'] = facetGroup;
    if (flightNumbers != null) {
      map['FlightNumbers'] = flightNumbers?.map((v) => v.toJson()).toList();
    }
    map['Id'] = id;
    map['LastUpdateGround'] = lastUpdateGround;
    if (listItems != null) {
      map['ListItems'] = listItems?.map((v) => v.toJson()).toList();
    }
    map['MenuTemplates'] = menuTemplates;
    if (textStrings != null) {
      map['TextStrings'] = textStrings?.map((v) => v.toJson()).toList();
    }
    if (users != null) {
      map['Users'] = users?.map((v) => v.toJson()).toList();
    }
    map['DashboardType'] = dashboardType;
    map['ReleaseType'] = releaseType;
    map['UseNewDashboard'] = useNewDashboard;
    map['ReleaseSettings'] = releaseSettings;
    return map;
  }
}

class Users {
  Users({
    this.facetId,
    this.firstName,
    this.lastName,
    this.part145,
    this.pin,
    this.role,
    this.searchString,
    this.shortName,
    this.id,
    this.status,
    this.created,
    this.updated,
  });

  Users.fromJson(dynamic json) {
    facetId = json['FacetId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    part145 = json['Part145'];
    pin = json['Pin'];
    role = json['Role'];
    searchString = json['SearchString'];
    shortName = json['ShortName'];
    id = json['Id'];
    status = json['Status'];
    created = json['Created'];
    updated = json['Updated'];
  }

  String? facetId;
  String? firstName;
  String? lastName;
  String? part145;
  String? pin;
  num? role;
  String? searchString;
  String? shortName;
  String? id;
  num? status;
  String? created;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FacetId'] = facetId;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Part145'] = part145;
    map['Pin'] = pin;
    map['Role'] = role;
    map['SearchString'] = searchString;
    map['ShortName'] = shortName;
    map['Id'] = id;
    map['Status'] = status;
    map['Created'] = created;
    map['Updated'] = updated;
    return map;
  }
}

class TextStrings {
  TextStrings({
    this.keyValue,
    this.valueString,
  });

  TextStrings.fromJson(dynamic json) {
    keyValue = json['KeyValue'];
    valueString = json['ValueString'];
  }

  String? keyValue;
  String? valueString;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KeyValue'] = keyValue;
    map['ValueString'] = valueString;
    return map;
  }
}

class ListItems {
  ListItems({
    this.facetId,
    this.id,
    this.listName,
    this.title,
    this.updated,
  });

  ListItems.fromJson(dynamic json) {
    facetId = json['FacetId'];
    id = json['Id'];
    listName = json['ListName'];
    title = json['Title'];
    updated = json['Updated'];
  }

  String? facetId;
  String? id;
  String? listName;
  String? title;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FacetId'] = facetId;
    map['Id'] = id;
    map['ListName'] = listName;
    map['Title'] = title;
    map['Updated'] = updated;
    return map;
  }
}

class FlightNumbers {
  FlightNumbers({
    this.arrivalTime,
    this.days,
    this.departureTime,
    this.departureTimeZone,
    this.destinationStationCode,
    this.flightNumber,
    this.originStationCode,
    this.id,
    this.status,
    this.created,
    this.updated,
  });

  FlightNumbers.fromJson(dynamic json) {
    arrivalTime = json['ArrivalTime'];
    days = json['Days'];
    departureTime = json['DepartureTime'];
    departureTimeZone = json['DepartureTimeZone'];
    destinationStationCode = json['DestinationStationCode'];
    flightNumber = json['FlightNumber'];
    originStationCode = json['OriginStationCode'];
    id = json['Id'];
    status = json['Status'];
    created = json['Created'];
    updated = json['Updated'];
  }

  String? arrivalTime;
  String? days;
  String? departureTime;
  num? departureTimeZone;
  String? destinationStationCode;
  String? flightNumber;
  String? originStationCode;
  String? id;
  num? status;
  String? created;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ArrivalTime'] = arrivalTime;
    map['Days'] = days;
    map['DepartureTime'] = departureTime;
    map['DepartureTimeZone'] = departureTimeZone;
    map['DestinationStationCode'] = destinationStationCode;
    map['FlightNumber'] = flightNumber;
    map['OriginStationCode'] = originStationCode;
    map['Id'] = id;
    map['Status'] = status;
    map['Created'] = created;
    map['Updated'] = updated;
    return map;
  }
}
