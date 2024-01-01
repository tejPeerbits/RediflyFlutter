class ReportDetails {
  ReportDetails({
    this.typeOfReport,
    this.severity,
    this.location,
    this.idString,
    this.additionalFields,
    this.processStatus,
    this.actionDateTime,
    // this.id,
    this.organisationId,
    this.status,
    this.created,
    this.updated,
    this.updatedBy,
  });

  ReportDetails.fromJson(dynamic json) {
    typeOfReport = json['type_of_report'];
    severity = json['severity'];
    location = json['location'];
    idString = json['id_string'];
    additionalFields = json['additional_fields'];
    processStatus = json['process_status'];
    actionDateTime = json['action_date_time'];
    // id = json['Id'];
    organisationId = json['organisation_id'];
    status = json['status'];
    created = json['created'];
    updated = json['updated'];
    updatedBy = json['updated_by'];
  }
  String? typeOfReport;
  num? severity;
  String? location;
  String? idString;
  String? additionalFields;
  num? processStatus;
  String? actionDateTime;
  // String? id;
  String? organisationId;
  num? status;
  String? created;
  String? updated;
  String? updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_of_report'] = typeOfReport;
    map['severity'] = severity;
    map['location'] = location;
    map['id_string'] = idString;
    map['additional_fields'] = additionalFields;
    map['process_status'] = processStatus;
    map['action_date_time'] = actionDateTime;
    // map['Id'] = id;
    map['organisation_id'] = organisationId;
    map['status'] = status;
    map['created'] = created;
    map['updated'] = updated;
    map['updated_by'] = updatedBy;
    return map;
  }
}

class Controls {
  Controls({
    this.controlId,
    this.controlType,
    this.controlFunction,
    this.gridGroup,
    this.heading,
    this.description,
    this.isRequired,
    this.menuName,
    this.printGroup,
    this.propertyName,
    this.userRoles,
    this.params,
    this.textCase,
    this.textFont,
    this.isControlVisible,
    this.value,
  });

  Controls.fromJson(dynamic json) {
    controlId = json['control_id'];
    controlType = json['control_type'];
    controlFunction = json['control_function'];
    gridGroup = json['grid_group'];
    heading = json['heading'];
    description = json['description'];
    isRequired = json['is_required'];
    menuName = json['menu_name'];
    printGroup = json['print_group'];
    propertyName = json['property_name'];
    userRoles = json['user_roles'];
    params = json['params'];
    textCase = json['text_case'];
    textFont = json['text_font'];
    isControlVisible = json['is_control_visible'];
    value = json['value'];
  }

  String? controlId;
  String? controlType;
  String? controlFunction;
  String? gridGroup;
  String? heading;
  String? description;
  String? isRequired;
  String? menuName;
  String? printGroup;
  String? propertyName;
  String? userRoles;
  String? params;
  String? value;
  String? textCase;
  String? textFont;
  String? isControlVisible;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['control_id'] = controlId;
  //   map['control_type'] = controlType;
  //   map['control_function'] = controlFunction;
  //   map['grid_group'] = gridGroup;
  //   map['heading'] = heading;
  //   map['description'] = description;
  //   map['is_required'] = isRequired;
  //   map['menu_name'] = menuName;
  //   map['print_group'] = printGroup;
  //   map['property_name'] = propertyName;
  //   map['user_roles'] = userRoles;
  //   map['params'] = params;
  //   map['text_case'] = textCase;
  //   map['text_font'] = textFont;
  //   map['is_control_visible'] = isControlVisible;
  //   map['value'] = value;
  //   return map;
  // }

  Map<String, dynamic> toMap() {
    return {
      '"control_id"': '"$controlId"',
      '"control_type"': '"$controlType"',
      '"control_function"': '"$controlFunction"',
      '"grid_group"': '"$gridGroup"',
      '"heading"': '"$heading"',
      '"description"': '"$description"',
      '"is_required"': '"$isRequired"',
      '"menu_name"': '"$menuName"',
      '"print_group"': '"$printGroup"',
      '"property_name"': '"$propertyName"',
      '"user_roles"': '"$userRoles"',
      '"params"': '"$params"',
      '"text_case"': '"$textCase"',
      '"text_font"': '"$textFont"',
      '"is_control_visible"': '"$isControlVisible"',
      '"value"': '"$value"',
    };
  }
}
