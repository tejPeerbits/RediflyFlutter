import 'dart:convert';

class AppModel {
  AppModel({
    this.organisationId,
    this.documents,
    this.lastUpdateDevice,
    this.lastUpdateGround,
    this.template,
  });

  AppModel.fromJson(dynamic json) {
    organisationId = json['OrganisationId'];
    if (json['Documents'] != null) {
      documents = [];
      json['Documents'].forEach((v) {
        documents?.add(Documents.fromJson(v));
      });
    }
    lastUpdateDevice = json['LastUpdateDevice'];
    lastUpdateGround = json['LastUpdateGround'];
    template =
        json['Template'] != null ? Template.fromJson(json['Template']) : null;
  }

  String? organisationId;
  List<Documents>? documents;
  String? lastUpdateDevice;
  String? lastUpdateGround;
  Template? template;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrganisationId'] = organisationId;
    if (documents != null) {
      map['Documents'] = documents?.map((v) => v.toJson()).toList();
    }
    map['LastUpdateDevice'] = lastUpdateDevice;
    map['LastUpdateGround'] = lastUpdateGround;
    if (template != null) {
      map['Template'] = template?.toJson();
    }
    return map;
  }
}

class Template {
  Template({
    this.organisationId,
    this.controlTemplates,
    this.id,
    this.lastUpdateGround,
    this.menuTemplates,
  });

  Template.fromJson(dynamic json) {
    organisationId = json['OrganisationId'];
    if (json['ControlTemplates'] != null) {
      var decodedControlTemplates = jsonDecode(json['ControlTemplates']);
      controlTemplates = [];
      decodedControlTemplates.forEach((v) {
        controlTemplates?.add(ControlTemplates.fromJson(v));
      });
    }
    id = json['Id'];
    lastUpdateGround = json['LastUpdateGround'];
    if (json['MenuTemplates'] != null) {
      var decodedMenuTemplates = jsonDecode(json['MenuTemplates']);
      menuTemplates = [];
      decodedMenuTemplates.forEach((v) {
        menuTemplates?.add(MenuTemplates.fromJson(v));
      });
    }
  }

  String? organisationId;
  List<ControlTemplates>? controlTemplates;
  String? id;
  String? lastUpdateGround;
  List<MenuTemplates>? menuTemplates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrganisationId'] = organisationId;
    if (controlTemplates != null) {
      map['ControlTemplates'] =
          jsonEncode(controlTemplates?.map((v) => v.toJson()).toList());
    }
    map['Id'] = id;
    map['LastUpdateGround'] = lastUpdateGround;
    if (menuTemplates != null) {
      map['MenuTemplates'] =
          jsonEncode(menuTemplates?.map((v) => v.toJson()).toList());
    }
    return map;
  }
}

class MenuTemplates {
  MenuTemplates({
    this.heading,
    this.headingList,
    this.menuType,
    this.promptDescription,
    this.userRoles,
  });

  MenuTemplates.fromJson(dynamic json) {
    heading = json['Heading'];
    headingList = json['HeadingList'];
    menuType = json['MenuType'];
    promptDescription = json['PromptDescription'];
    userRoles = json['UserRoles'];
  }

  String? heading;
  String? headingList;
  num? menuType;
  String? promptDescription;
  String? userRoles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Heading'] = heading;
    map['HeadingList'] = headingList;
    map['MenuType'] = menuType;
    map['PromptDescription'] = promptDescription;
    map['UserRoles'] = userRoles;
    return map;
  }
}

class ControlTemplates {
  ControlTemplates(
      {this.controlId,
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
      this.value});

  ControlTemplates.fromJson(dynamic json) {
    controlId = json['ControlId'];
    controlType = json['ControlType'];
    controlFunction = json['ControlFunction'];
    gridGroup = json['GridGroup'];
    heading = json['Heading'];
    description = json['Description'];
    isRequired = json['IsRequired'];
    menuName = json['MenuName'];
    printGroup = json['PrintGroup'];
    propertyName = json['PropertyName'];
    userRoles = json['UserRoles'];
    params = json['Params'];
    textCase = json['TextCase'];
    textFont = json['TextFont'];
    isControlVisible = json['IsControlVisible'];
    value = json['value'];
  }

  String? controlId;
  num? controlType;
  num? controlFunction;
  num? gridGroup;
  String? heading;
  String? description;
  bool? isRequired;
  String? menuName;
  num? printGroup;
  String? propertyName;
  String? userRoles;
  String? params;
  String? value;
  num? textCase;
  num? textFont;
  bool? isControlVisible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ControlId'] = controlId;
    map['ControlType'] = controlType;
    map['ControlFunction'] = controlFunction;
    map['GridGroup'] = gridGroup;
    map['Heading'] = heading;
    map['Description'] = description;
    map['IsRequired'] = isRequired;
    map['MenuName'] = menuName;
    map['PrintGroup'] = printGroup;
    map['PropertyName'] = propertyName;
    map['UserRoles'] = userRoles;
    map['Params'] = params;
    map['TextCase'] = textCase;
    map['TextFont'] = textFont;
    map['IsControlVisible'] = isControlVisible;
    map['value'] = value;
    return map;
  }

  ControlTemplates.fromJsonDatabase(dynamic json) {
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

  Map<String, dynamic> toDatabaseMap() {
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

class Documents {
  Documents({
    this.document,
    this.parentId,
    this.id,
    this.organisationId,
    this.status,
    this.created,
    this.updated,
  });

  Documents.fromJson(dynamic json) {
    document = json['Document'];
    parentId = json['ParentId'];
    id = json['Id'];
    organisationId = json['OrganisationId'];
    status = json['Status'];
    created = json['Created'];
    updated = json['Updated'];
  }

  String? document;
  String? parentId;
  String? id;
  String? organisationId;
  num? status;
  String? created;
  String? updated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Document'] = document;
    map['ParentId'] = parentId;
    map['Id'] = id;
    map['OrganisationId'] = organisationId;
    map['Status'] = status;
    map['Created'] = created;
    map['Updated'] = updated;
    return map;
  }
}
