class ConfirmTokenResponseModel {
  ConfirmTokenResponseModel({
    this.currentOrganisationId,
    this.settings,
    this.company,
    this.firstName,
    this.id,
    this.lastName,
    this.token,
    this.userRole,
    this.externalType,
    this.organisationId,
    this.signingType,
    this.shortName,
    this.isAdmin,
    this.clearData,
    this.organisations,
    this.environmentModel,
    this.email,
    this.part145,
  });

  ConfirmTokenResponseModel.fromJson(dynamic json) {
    currentOrganisationId = json['currentOrganisationId'];
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
    company = json['company'];
    firstName = json['firstName'];
    id = json['id'];
    lastName = json['lastName'];
    token = json['token'];
    userRole = json['userRole'];
    externalType = json['externalType'];
    organisationId = json['organisationId'];
    signingType = json['signingType'];
    shortName = json['shortName'];
    isAdmin = json['isAdmin'];
    clearData = json['clearData'];
    if (json['organisations'] != null) {
      organisations = [];
      json['organisations'].forEach((v) {
        organisations?.add(Organisations.fromJson(v));
      });
    }
    environmentModel = json['environmentModel'];
    email = json['email'];
    part145 = json['part145'];
  }
  String? currentOrganisationId;
  Settings? settings;
  String? company;
  String? firstName;
  String? id;
  String? lastName;
  String? token;
  String? userRole;
  num? externalType;
  String? organisationId;
  num? signingType;
  String? shortName;
  bool? isAdmin;
  bool? clearData;
  List<Organisations>? organisations;
  dynamic environmentModel;
  dynamic email;
  dynamic part145;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentOrganisationId'] = currentOrganisationId;
    if (settings != null) {
      map['settings'] = settings?.toJson();
    }
    map['company'] = company;
    map['firstName'] = firstName;
    map['id'] = id;
    map['lastName'] = lastName;
    map['token'] = token;
    map['userRole'] = userRole;
    map['externalType'] = externalType;
    map['organisationId'] = organisationId;
    map['signingType'] = signingType;
    map['shortName'] = shortName;
    map['isAdmin'] = isAdmin;
    map['clearData'] = clearData;
    if (organisations != null) {
      map['organisations'] = organisations?.map((v) => v.toJson()).toList();
    }
    map['environmentModel'] = environmentModel;
    map['email'] = email;
    map['part145'] = part145;
    return map;
  }
}

class Organisations {
  Organisations({
    this.accessFailedCounts,
    this.address,
    this.appSettings,
    this.appVersion,
    this.azureClientId,
    this.azureTenantId,
    this.baseUrl,
    this.groundControlTimeOut,
    this.id,
    this.lockoutEnds,
    this.logoDark,
    this.logoLight,
    this.name,
    this.smsApiId,
    this.status,
    this.updated,
    this.updatedBy,
    this.webVersion,
    this.includedScopes,
    this.scopes,
    this.fileTransferSettings,
  });

  Organisations.fromJson(dynamic json) {
    accessFailedCounts = json['accessFailedCounts'];
    address = json['address'];
    appSettings = json['appSettings'] != null
        ? AppSettings.fromJson(json['appSettings'])
        : null;
    appVersion = json['appVersion'];
    azureClientId = json['azureClientId'];
    azureTenantId = json['azureTenantId'];
    baseUrl = json['baseUrl'];
    groundControlTimeOut = json['groundControlTimeOut'];
    id = json['id'];
    lockoutEnds = json['lockoutEnds'];
    logoDark = json['logoDark'];
    logoLight = json['logoLight'];
    name = json['name'];
    smsApiId = json['smsApiId'];
    status = json['status'];
    updated = json['updated'];
    updatedBy = json['updatedBy'];
    webVersion = json['webVersion'];
    includedScopes = json['includedScopes'];
    scopes = json['scopes'];
    fileTransferSettings = json['fileTransferSettings'];
  }
  num? accessFailedCounts;
  String? address;
  AppSettings? appSettings;
  String? appVersion;
  String? azureClientId;
  String? azureTenantId;
  String? baseUrl;
  num? groundControlTimeOut;
  String? id;
  num? lockoutEnds;
  String? logoDark;
  String? logoLight;
  String? name;
  String? smsApiId;
  num? status;
  String? updated;
  String? updatedBy;
  String? webVersion;
  bool? includedScopes;
  dynamic scopes;
  dynamic fileTransferSettings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessFailedCounts'] = accessFailedCounts;
    map['address'] = address;
    if (appSettings != null) {
      map['appSettings'] = appSettings?.toJson();
    }
    map['appVersion'] = appVersion;
    map['azureClientId'] = azureClientId;
    map['azureTenantId'] = azureTenantId;
    map['baseUrl'] = baseUrl;
    map['groundControlTimeOut'] = groundControlTimeOut;
    map['id'] = id;
    map['lockoutEnds'] = lockoutEnds;
    map['logoDark'] = logoDark;
    map['logoLight'] = logoLight;
    map['name'] = name;
    map['smsApiId'] = smsApiId;
    map['status'] = status;
    map['updated'] = updated;
    map['updatedBy'] = updatedBy;
    map['webVersion'] = webVersion;
    map['includedScopes'] = includedScopes;
    map['scopes'] = scopes;
    map['fileTransferSettings'] = fileTransferSettings;
    return map;
  }
}

class AppSettings {
  AppSettings({
    this.addressString,
    this.addressStringColor,
    this.allowLightMode,
    this.backgroundColorDark,
    this.backgroundColorLight,
    this.colorGreen,
    this.colorHighlightDate,
    this.colorHighlightEditor,
    this.colorHighlightEntry,
    this.colorHighlightNumeric,
    this.colorHighlightPicker,
    this.colorHighlightTime,
    this.colorHighlightTypeAhead,
    this.colorInfo,
    this.colorOrange,
    this.colorRed,
    this.colorRequiredField,
    this.iconBackgroundColorLight,
    this.listTake,
    this.logoBackgroundColor,
    this.logoDark,
    this.logoLight,
    this.logoSizeMargins,
    this.savePhotoToAlbum,
    this.sectorColorCompleted,
    this.sectorColorOpen,
    this.showImageGallery,
    this.textColorDark,
    this.textColorLight,
    this.useAirports,
    this.useNotifications,
    this.useOwnId,
    this.userRoles,
    this.pilot,
    this.cabin,
    this.tech,
    this.admin,
    this.idType,
    this.isLockSignatureButtonEnabled,
    this.isNewControlDesignEnabled,
    this.avatar,
    this.isBriefingRequired,
    this.isMainMenuHistory,
    this.useNewApp,
    this.hasChildItems,
    this.isDayViewVisible,
    this.isSectorIdVisible,
    this.flightTimeRefresh,
    this.compressionGallery,
    this.compressionPhoto,
    this.roleIconDark,
    this.userName,
    this.shortName,
    this.fontSizeHeading,
    this.fontSizeText,
    this.isLightMode,
    this.photoSizeCamera,
    this.photoSizeGallery,
    this.showLocation,
    this.useDatePicker,
    this.useLocation,
    this.useTimePicker,
    this.roleIconLight,
  });

  AppSettings.fromJson(dynamic json) {
    addressString = json['addressString'];
    addressStringColor = json['addressStringColor'];
    allowLightMode = json['allowLightMode'];
    backgroundColorDark = json['backgroundColorDark'];
    backgroundColorLight = json['backgroundColorLight'];
    colorGreen = json['colorGreen'];
    colorHighlightDate = json['colorHighlightDate'];
    colorHighlightEditor = json['colorHighlightEditor'];
    colorHighlightEntry = json['colorHighlightEntry'];
    colorHighlightNumeric = json['colorHighlightNumeric'];
    colorHighlightPicker = json['colorHighlightPicker'];
    colorHighlightTime = json['colorHighlightTime'];
    colorHighlightTypeAhead = json['colorHighlightTypeAhead'];
    colorInfo = json['colorInfo'];
    colorOrange = json['colorOrange'];
    colorRed = json['colorRed'];
    colorRequiredField = json['colorRequiredField'];
    iconBackgroundColorLight = json['iconBackgroundColorLight'];
    listTake = json['listTake'];
    logoBackgroundColor = json['logoBackgroundColor'];
    logoDark = json['logoDark'];
    logoLight = json['logoLight'];
    logoSizeMargins = json['logoSizeMargins'];
    savePhotoToAlbum = json['savePhotoToAlbum'];
    sectorColorCompleted = json['sectorColorCompleted'];
    sectorColorOpen = json['sectorColorOpen'];
    showImageGallery = json['showImageGallery'];
    textColorDark = json['textColorDark'];
    textColorLight = json['textColorLight'];
    useAirports = json['useAirports'];
    useNotifications = json['useNotifications'];
    useOwnId = json['useOwnId'];
    userRoles = json['userRoles'];
    pilot = json['pilot'];
    cabin = json['cabin'];
    tech = json['tech'];
    admin = json['admin'];
    idType = json['idType'];
    isLockSignatureButtonEnabled = json['isLockSignatureButtonEnabled'];
    isNewControlDesignEnabled = json['isNewControlDesignEnabled'];
    avatar = json['avatar'];
    isBriefingRequired = json['isBriefingRequired'];
    isMainMenuHistory = json['isMainMenuHistory'];
    useNewApp = json['useNewApp'];
    hasChildItems = json['hasChildItems'];
    isDayViewVisible = json['isDayViewVisible'];
    isSectorIdVisible = json['isSectorIdVisible'];
    flightTimeRefresh = json['flightTimeRefresh'];
    compressionGallery = json['compressionGallery'];
    compressionPhoto = json['compressionPhoto'];
    roleIconDark = json['roleIconDark'];
    userName = json['userName'];
    shortName = json['shortName'];
    fontSizeHeading = json['fontSizeHeading'];
    fontSizeText = json['fontSizeText'];
    isLightMode = json['isLightMode'];
    photoSizeCamera = json['photoSizeCamera'];
    photoSizeGallery = json['photoSizeGallery'];
    showLocation = json['showLocation'];
    useDatePicker = json['useDatePicker'];
    useLocation = json['useLocation'];
    useTimePicker = json['useTimePicker'];
    roleIconLight = json['roleIconLight'];
  }
  dynamic addressString;
  String? addressStringColor;
  bool? allowLightMode;
  String? backgroundColorDark;
  String? backgroundColorLight;
  String? colorGreen;
  String? colorHighlightDate;
  String? colorHighlightEditor;
  String? colorHighlightEntry;
  String? colorHighlightNumeric;
  String? colorHighlightPicker;
  String? colorHighlightTime;
  String? colorHighlightTypeAhead;
  String? colorInfo;
  String? colorOrange;
  String? colorRed;
  String? colorRequiredField;
  String? iconBackgroundColorLight;
  num? listTake;
  dynamic logoBackgroundColor;
  dynamic logoDark;
  dynamic logoLight;
  String? logoSizeMargins;
  bool? savePhotoToAlbum;
  String? sectorColorCompleted;
  String? sectorColorOpen;
  bool? showImageGallery;
  String? textColorDark;
  String? textColorLight;
  bool? useAirports;
  bool? useNotifications;
  bool? useOwnId;
  String? userRoles;
  String? pilot;
  String? cabin;
  String? tech;
  String? admin;
  num? idType;
  bool? isLockSignatureButtonEnabled;
  bool? isNewControlDesignEnabled;
  String? avatar;
  bool? isBriefingRequired;
  bool? isMainMenuHistory;
  bool? useNewApp;
  bool? hasChildItems;
  bool? isDayViewVisible;
  bool? isSectorIdVisible;
  bool? flightTimeRefresh;
  num? compressionGallery;
  num? compressionPhoto;
  dynamic roleIconDark;
  dynamic userName;
  dynamic shortName;
  num? fontSizeHeading;
  num? fontSizeText;
  bool? isLightMode;
  num? photoSizeCamera;
  num? photoSizeGallery;
  bool? showLocation;
  bool? useDatePicker;
  bool? useLocation;
  bool? useTimePicker;
  dynamic roleIconLight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressString'] = addressString;
    map['addressStringColor'] = addressStringColor;
    map['allowLightMode'] = allowLightMode;
    map['backgroundColorDark'] = backgroundColorDark;
    map['backgroundColorLight'] = backgroundColorLight;
    map['colorGreen'] = colorGreen;
    map['colorHighlightDate'] = colorHighlightDate;
    map['colorHighlightEditor'] = colorHighlightEditor;
    map['colorHighlightEntry'] = colorHighlightEntry;
    map['colorHighlightNumeric'] = colorHighlightNumeric;
    map['colorHighlightPicker'] = colorHighlightPicker;
    map['colorHighlightTime'] = colorHighlightTime;
    map['colorHighlightTypeAhead'] = colorHighlightTypeAhead;
    map['colorInfo'] = colorInfo;
    map['colorOrange'] = colorOrange;
    map['colorRed'] = colorRed;
    map['colorRequiredField'] = colorRequiredField;
    map['iconBackgroundColorLight'] = iconBackgroundColorLight;
    map['listTake'] = listTake;
    map['logoBackgroundColor'] = logoBackgroundColor;
    map['logoDark'] = logoDark;
    map['logoLight'] = logoLight;
    map['logoSizeMargins'] = logoSizeMargins;
    map['savePhotoToAlbum'] = savePhotoToAlbum;
    map['sectorColorCompleted'] = sectorColorCompleted;
    map['sectorColorOpen'] = sectorColorOpen;
    map['showImageGallery'] = showImageGallery;
    map['textColorDark'] = textColorDark;
    map['textColorLight'] = textColorLight;
    map['useAirports'] = useAirports;
    map['useNotifications'] = useNotifications;
    map['useOwnId'] = useOwnId;
    map['userRoles'] = userRoles;
    map['pilot'] = pilot;
    map['cabin'] = cabin;
    map['tech'] = tech;
    map['admin'] = admin;
    map['idType'] = idType;
    map['isLockSignatureButtonEnabled'] = isLockSignatureButtonEnabled;
    map['isNewControlDesignEnabled'] = isNewControlDesignEnabled;
    map['avatar'] = avatar;
    map['isBriefingRequired'] = isBriefingRequired;
    map['isMainMenuHistory'] = isMainMenuHistory;
    map['useNewApp'] = useNewApp;
    map['hasChildItems'] = hasChildItems;
    map['isDayViewVisible'] = isDayViewVisible;
    map['isSectorIdVisible'] = isSectorIdVisible;
    map['flightTimeRefresh'] = flightTimeRefresh;
    map['compressionGallery'] = compressionGallery;
    map['compressionPhoto'] = compressionPhoto;
    map['roleIconDark'] = roleIconDark;
    map['userName'] = userName;
    map['shortName'] = shortName;
    map['fontSizeHeading'] = fontSizeHeading;
    map['fontSizeText'] = fontSizeText;
    map['isLightMode'] = isLightMode;
    map['photoSizeCamera'] = photoSizeCamera;
    map['photoSizeGallery'] = photoSizeGallery;
    map['showLocation'] = showLocation;
    map['useDatePicker'] = useDatePicker;
    map['useLocation'] = useLocation;
    map['useTimePicker'] = useTimePicker;
    map['roleIconLight'] = roleIconLight;
    return map;
  }
}

class Settings {
  Settings({
    this.compressionGallery,
    this.compressionPhoto,
    this.roleIconDark,
    this.userName,
    this.shortName,
    this.fontSizeHeading,
    this.fontSizeText,
    this.isLightMode,
    this.photoSizeCamera,
    this.photoSizeGallery,
    this.showLocation,
    this.useDatePicker,
    this.useLocation,
    this.useTimePicker,
    this.roleIconLight,
  });

  Settings.fromJson(dynamic json) {
    compressionGallery = json['compressionGallery'];
    compressionPhoto = json['compressionPhoto'];
    roleIconDark = json['roleIconDark'];
    userName = json['userName'];
    shortName = json['shortName'];
    fontSizeHeading = json['fontSizeHeading'];
    fontSizeText = json['fontSizeText'];
    isLightMode = json['isLightMode'];
    photoSizeCamera = json['photoSizeCamera'];
    photoSizeGallery = json['photoSizeGallery'];
    showLocation = json['showLocation'];
    useDatePicker = json['useDatePicker'];
    useLocation = json['useLocation'];
    useTimePicker = json['useTimePicker'];
    roleIconLight = json['roleIconLight'];
  }
  num? compressionGallery;
  num? compressionPhoto;
  dynamic roleIconDark;
  dynamic userName;
  dynamic shortName;
  num? fontSizeHeading;
  num? fontSizeText;
  bool? isLightMode;
  num? photoSizeCamera;
  num? photoSizeGallery;
  bool? showLocation;
  bool? useDatePicker;
  bool? useLocation;
  bool? useTimePicker;
  dynamic roleIconLight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['compressionGallery'] = compressionGallery;
    map['compressionPhoto'] = compressionPhoto;
    map['roleIconDark'] = roleIconDark;
    map['userName'] = userName;
    map['shortName'] = shortName;
    map['fontSizeHeading'] = fontSizeHeading;
    map['fontSizeText'] = fontSizeText;
    map['isLightMode'] = isLightMode;
    map['photoSizeCamera'] = photoSizeCamera;
    map['photoSizeGallery'] = photoSizeGallery;
    map['showLocation'] = showLocation;
    map['useDatePicker'] = useDatePicker;
    map['useLocation'] = useLocation;
    map['useTimePicker'] = useTimePicker;
    map['roleIconLight'] = roleIconLight;
    return map;
  }
}
