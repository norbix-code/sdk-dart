/* Options:
Date: 2026-10-31 09:57:13
Version: 10.20
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: http://localhost:5002

//GlobalNamespace: 
//AddServiceStackTypes: True
//AddResponseStatus: False
//AddImplicitVersion: 
//AddDescriptionAsComments: True
//IncludeTypes: 
//ExcludeTypes: 
//DefaultImports: package:servicestack/servicestack.dart
*/

import 'package:servicestack/servicestack.dart';
import 'dart:typed_data';

abstract class JsonSchemaFieldDto
{
    // @DataMember
    String fieldName = "";

    JsonSchemaFieldDto({this.fieldName=""});
    JsonSchemaFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        fieldName = json['fieldName'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'fieldName': fieldName
    };

    getTypeName() => "JsonSchemaFieldDto";
    TypeContext? context = _ctx;
}

class StringFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    String? format;

    // @DataMember
    String? pattern;

    // @DataMember
    int? minLength;

    // @DataMember
    int? maxLength;

    // @DataMember
    IReadOnlyDictionary<String,String>? translateOptions;

    // @DataMember
    String? Default;

    // @DataMember
    bool? unique;

    StringFieldDto({this.format,this.pattern,this.minLength,this.maxLength,this.translateOptions,this.Default,this.unique});
    StringFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        format = json['format'];
        pattern = json['pattern'];
        minLength = json['minLength'];
        maxLength = json['maxLength'];
        translateOptions = JsonConverters.fromJson(json['translateOptions'],'IReadOnlyDictionary<String,String>',context!);
        Default = json['default'];
        unique = json['unique'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'format': format,
        'pattern': pattern,
        'minLength': minLength,
        'maxLength': maxLength,
        'translateOptions': JsonConverters.toJson(translateOptions,'IReadOnlyDictionary<String,String>',context!),
        'default': Default,
        'unique': unique
    });

    getTypeName() => "StringFieldDto";
    TypeContext? context = _ctx;
}

class DecimalFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    double? minimum;

    // @DataMember
    double? maximum;

    // @DataMember
    double? multipleOf;

    // @DataMember
    double? Default;

    // @DataMember
    bool? unique;

    DecimalFieldDto({this.minimum,this.maximum,this.multipleOf,this.Default,this.unique});
    DecimalFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minimum = JsonConverters.toDouble(json['minimum']);
        maximum = JsonConverters.toDouble(json['maximum']);
        multipleOf = JsonConverters.toDouble(json['multipleOf']);
        Default = JsonConverters.toDouble(json['default']);
        unique = json['unique'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minimum': minimum,
        'maximum': maximum,
        'multipleOf': multipleOf,
        'default': Default,
        'unique': unique
    });

    getTypeName() => "DecimalFieldDto";
    TypeContext? context = _ctx;
}

class CurrencyDefaultDto implements IConvertible
{
    // @DataMember
    double value = 0;

    // @DataMember
    String currency = "";

    CurrencyDefaultDto({this.value=0,this.currency=""});
    CurrencyDefaultDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = JsonConverters.toDouble(json['value']) ?? 0;
        currency = json['currency'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value,
        'currency': currency
    };

    getTypeName() => "CurrencyDefaultDto";
    TypeContext? context = _ctx;
}

class CurrencyFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<String>? allowedCurrencies;

    // @DataMember
    double? multipleOf;

    // @DataMember
    double? minimum;

    // @DataMember
    double? maximum;

    // @DataMember
    CurrencyDefaultDto? Default;

    CurrencyFieldDto({this.allowedCurrencies,this.multipleOf,this.minimum,this.maximum,this.Default});
    CurrencyFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allowedCurrencies = JsonConverters.fromJson(json['allowedCurrencies'],'IReadOnlyList<String>',context!);
        multipleOf = JsonConverters.toDouble(json['multipleOf']);
        minimum = JsonConverters.toDouble(json['minimum']);
        maximum = JsonConverters.toDouble(json['maximum']);
        Default = JsonConverters.fromJson(json['default'],'CurrencyDefaultDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allowedCurrencies': JsonConverters.toJson(allowedCurrencies,'IReadOnlyList<String>',context!),
        'multipleOf': multipleOf,
        'minimum': minimum,
        'maximum': maximum,
        'default': JsonConverters.toJson(Default,'CurrencyDefaultDto',context!)
    });

    getTypeName() => "CurrencyFieldDto";
    TypeContext? context = _ctx;
}

class BooleanFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    bool? Default;

    BooleanFieldDto({this.Default});
    BooleanFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        Default = json['default'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'default': Default
    });

    getTypeName() => "BooleanFieldDto";
    TypeContext? context = _ctx;
}

class DateFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    int? minimum;

    // @DataMember
    int? maximum;

    // @DataMember
    int? Default;

    DateFieldDto({this.minimum,this.maximum,this.Default});
    DateFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minimum = json['minimum'];
        maximum = json['maximum'];
        Default = json['default'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minimum': minimum,
        'maximum': maximum,
        'default': Default
    });

    getTypeName() => "DateFieldDto";
    TypeContext? context = _ctx;
}

class IntegerFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    int? minimum;

    // @DataMember
    int? maximum;

    // @DataMember
    int? Default;

    // @DataMember
    bool? unique;

    IntegerFieldDto({this.minimum,this.maximum,this.Default,this.unique});
    IntegerFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minimum = json['minimum'];
        maximum = json['maximum'];
        Default = json['default'];
        unique = json['unique'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minimum': minimum,
        'maximum': maximum,
        'default': Default,
        'unique': unique
    });

    getTypeName() => "IntegerFieldDto";
    TypeContext? context = _ctx;
}

class GeolocationFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<String>? allowedTypes;

    GeolocationFieldDto({this.allowedTypes});
    GeolocationFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allowedTypes = JsonConverters.fromJson(json['allowedTypes'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allowedTypes': JsonConverters.toJson(allowedTypes,'IReadOnlyList<String>',context!)
    });

    getTypeName() => "GeolocationFieldDto";
    TypeContext? context = _ctx;
}

class TagsFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    int? minItems;

    // @DataMember
    int? maxItems;

    // @DataMember
    IReadOnlyList<String>? Default;

    TagsFieldDto({this.minItems,this.maxItems,this.Default});
    TagsFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minItems = json['minItems'];
        maxItems = json['maxItems'];
        Default = JsonConverters.fromJson(json['default'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minItems': minItems,
        'maxItems': maxItems,
        'default': JsonConverters.toJson(Default,'IReadOnlyList<String>',context!)
    });

    getTypeName() => "TagsFieldDto";
    TypeContext? context = _ctx;
}

class FileFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<String>? storages;

    // @DataMember
    int? minItems;

    // @DataMember
    int? maxItems;

    // @DataMember
    String? allowedFileType;

    // @DataMember
    double? maxSizeMb;

    FileFieldDto({this.storages,this.minItems,this.maxItems,this.allowedFileType,this.maxSizeMb});
    FileFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        storages = JsonConverters.fromJson(json['storages'],'IReadOnlyList<String>',context!);
        minItems = json['minItems'];
        maxItems = json['maxItems'];
        allowedFileType = json['allowedFileType'];
        maxSizeMb = JsonConverters.toDouble(json['maxSizeMb']);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'storages': JsonConverters.toJson(storages,'IReadOnlyList<String>',context!),
        'minItems': minItems,
        'maxItems': maxItems,
        'allowedFileType': allowedFileType,
        'maxSizeMb': maxSizeMb
    });

    getTypeName() => "FileFieldDto";
    TypeContext? context = _ctx;
}

class TaxonomySelectionFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    String? taxonomyId;

    // @DataMember
    bool? multiple;

    // @DataMember
    String? displayField;

    TaxonomySelectionFieldDto({this.taxonomyId,this.multiple,this.displayField});
    TaxonomySelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        taxonomyId = json['taxonomyId'];
        multiple = json['multiple'];
        displayField = json['displayField'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'taxonomyId': taxonomyId,
        'multiple': multiple,
        'displayField': displayField
    });

    getTypeName() => "TaxonomySelectionFieldDto";
    TypeContext? context = _ctx;
}

class CollectionSelectionFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    String? collectionId;

    // @DataMember
    String? displayField;

    // @DataMember
    bool? multiple;

    CollectionSelectionFieldDto({this.collectionId,this.displayField,this.multiple});
    CollectionSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionId = json['collectionId'];
        displayField = json['displayField'];
        multiple = json['multiple'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionId': collectionId,
        'displayField': displayField,
        'multiple': multiple
    });

    getTypeName() => "CollectionSelectionFieldDto";
    TypeContext? context = _ctx;
}

class UserSelectionFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    bool? multiple;

    // @DataMember
    String? displayField;

    UserSelectionFieldDto({this.multiple,this.displayField});
    UserSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        multiple = json['multiple'];
        displayField = json['displayField'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'multiple': multiple,
        'displayField': displayField
    });

    getTypeName() => "UserSelectionFieldDto";
    TypeContext? context = _ctx;
}

class RoleSelectionFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    bool? multiple;

    // @DataMember
    String? displayField;

    RoleSelectionFieldDto({this.multiple,this.displayField});
    RoleSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        multiple = json['multiple'];
        displayField = json['displayField'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'multiple': multiple,
        'displayField': displayField
    });

    getTypeName() => "RoleSelectionFieldDto";
    TypeContext? context = _ctx;
}

class EnumSelectionFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<String>? values;

    // @DataMember
    bool? multiple;

    // @DataMember
    IReadOnlyList<String>? Default;

    EnumSelectionFieldDto({this.values,this.multiple,this.Default});
    EnumSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        values = JsonConverters.fromJson(json['values'],'IReadOnlyList<String>',context!);
        multiple = json['multiple'];
        Default = JsonConverters.fromJson(json['default'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'values': JsonConverters.toJson(values,'IReadOnlyList<String>',context!),
        'multiple': multiple,
        'default': JsonConverters.toJson(Default,'IReadOnlyList<String>',context!)
    });

    getTypeName() => "EnumSelectionFieldDto";
    TypeContext? context = _ctx;
}

class ObjectFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<JsonSchemaFieldDto>? properties;

    // @DataMember
    IReadOnlyList<String>? Required;

    ObjectFieldDto({this.properties,this.Required});
    ObjectFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        properties = JsonConverters.fromJson(json['properties'],'IReadOnlyList<JsonSchemaFieldDto>',context!);
        Required = JsonConverters.fromJson(json['required'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'properties': JsonConverters.toJson(properties,'IReadOnlyList<JsonSchemaFieldDto>',context!),
        'required': JsonConverters.toJson(Required,'IReadOnlyList<String>',context!)
    });

    getTypeName() => "ObjectFieldDto";
    TypeContext? context = _ctx;
}

class ArrayFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    JsonSchemaFieldDto? items;

    // @DataMember
    int? minItems;

    // @DataMember
    int? maxItems;

    // @DataMember
    bool? uniqueItems;

    ArrayFieldDto({this.items,this.minItems,this.maxItems,this.uniqueItems});
    ArrayFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        items = JsonConverters.fromJson(json['items'],'JsonSchemaFieldDto',context!);
        minItems = json['minItems'];
        maxItems = json['maxItems'];
        uniqueItems = json['uniqueItems'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'items': JsonConverters.toJson(items,'JsonSchemaFieldDto',context!),
        'minItems': minItems,
        'maxItems': maxItems,
        'uniqueItems': uniqueItems
    });

    getTypeName() => "ArrayFieldDto";
    TypeContext? context = _ctx;
}

class JsonFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    int? maxBytes;

    JsonFieldDto({this.maxBytes});
    JsonFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        maxBytes = json['maxBytes'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'maxBytes': maxBytes
    });

    getTypeName() => "JsonFieldDto";
    TypeContext? context = _ctx;
}

// @DataContract(Namespace="http://codemash.io/types/")
class RequestBase implements IVersionBasedRequest, IHasCorrelationIdRequest, IConvertible
{
    /**
    * TimeZone
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="TimeZone", Name="TimeZoneId", ParameterType="header")
    String? timeZoneId;

    /**
    * The CodeMash API version used to fetch data from the API. If not specified, the last version will be used.  E.g.: v3
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="The CodeMash API version used to fetch data from the API. If not specified, the last version will be used.  E.g.: v3", IsRequired=true, Name="version", ParameterType="path")
    String version = "";

    /**
    * CorrelationId for each request
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="CorrelationId for each request", Name="CorrelationId", ParameterType="header")
    String? correlationId;

    RequestBase({this.timeZoneId,this.version="",this.correlationId});
    RequestBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        timeZoneId = json['timeZoneId'];
        version = json['version'] ?? "";
        correlationId = json['correlationId'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'timeZoneId': timeZoneId,
        'version': version,
        'correlationId': correlationId
    };

    getTypeName() => "RequestBase";
    TypeContext? context = _ctx;
}

abstract class IVersionBasedRequest
{
    String version = "";
}

abstract class IHasCorrelationIdRequest
{
    String? correlationId;
}

// @DataContract(Namespace="http://codemash.io/types/")
class CodeMashRequestBase extends RequestBase implements IHasProjectId, IHasEnv, IConvertible
{
    /**
    * ID of your project. Can be passed in a header as norbix-project-id.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="ID of your project. Can be passed in a header as norbix-project-id.", IsRequired=true, Name="norbix-project-id", ParameterType="header")
    String projectId = "";

    /**
    * Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.", Name="norbix-env", ParameterType="header")
    String? env;

    CodeMashRequestBase({this.projectId="",this.env});
    CodeMashRequestBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        projectId = json['projectId'] ?? "";
        env = json['env'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'projectId': projectId,
        'env': env
    });

    getTypeName() => "CodeMashRequestBase";
    TypeContext? context = _ctx;
}

abstract class IHasProjectId
{
    String projectId = "";
}

abstract class IHasEnv
{
    String? env;
}

enum Gender
{
    Male,
    Female,
    Other,
}

enum MarketingBlockReason
{
    Unspecified,
    Unsubscribed,
    Complaint,
    HardBounce,
    InvalidEmail,
    AdminBlock,
}

class UserGeneralInfoDto implements IConvertible
{
    String? phone;
    String? primaryEmail;
    String? displayName;
    String? firstName;
    String? lastName;
    String? fullName;
    String? addressLine1;
    String? addressLine2;
    String? country;
    String? city;
    String? state;
    String? postalCode;
    String? company;
    Gender? gender;
    int? birthDate;
    String? timeZone;
    String? language;
    bool? blockAllMarketingMessages;
    Map<String,Set<String>?>? blockedTags;
    List<MarketingBlockReason>? blockReasons;
    String? extraMetadata;
    String? notes;

    UserGeneralInfoDto({this.phone,this.primaryEmail,this.displayName,this.firstName,this.lastName,this.fullName,this.addressLine1,this.addressLine2,this.country,this.city,this.state,this.postalCode,this.company,this.gender,this.birthDate,this.timeZone,this.language,this.blockAllMarketingMessages,this.blockedTags,this.blockReasons,this.extraMetadata,this.notes});
    UserGeneralInfoDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        phone = json['phone'];
        primaryEmail = json['primaryEmail'];
        displayName = json['displayName'];
        firstName = json['firstName'];
        lastName = json['lastName'];
        fullName = json['fullName'];
        addressLine1 = json['addressLine1'];
        addressLine2 = json['addressLine2'];
        country = json['country'];
        city = json['city'];
        state = json['state'];
        postalCode = json['postalCode'];
        company = json['company'];
        gender = JsonConverters.fromJson(json['gender'],'Gender',context!);
        birthDate = json['birthDate'];
        timeZone = json['timeZone'];
        language = json['language'];
        blockAllMarketingMessages = json['blockAllMarketingMessages'];
        blockedTags = JsonConverters.fromJson(json['blockedTags'],'Map<String,Set<String>?>',context!);
        blockReasons = JsonConverters.fromJson(json['blockReasons'],'List<MarketingBlockReason>',context!);
        extraMetadata = json['extraMetadata'];
        notes = json['notes'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'phone': phone,
        'primaryEmail': primaryEmail,
        'displayName': displayName,
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'country': country,
        'city': city,
        'state': state,
        'postalCode': postalCode,
        'company': company,
        'gender': JsonConverters.toJson(gender,'Gender',context!),
        'birthDate': birthDate,
        'timeZone': timeZone,
        'language': language,
        'blockAllMarketingMessages': blockAllMarketingMessages,
        'blockedTags': JsonConverters.toJson(blockedTags,'Map<String,Set<String>?>',context!),
        'blockReasons': JsonConverters.toJson(blockReasons,'List<MarketingBlockReason>',context!),
        'extraMetadata': extraMetadata,
        'notes': notes
    };

    getTypeName() => "UserGeneralInfoDto";
    TypeContext? context = _ctx;
}

// @DataContract
abstract class SaveUser extends CodeMashRequestBase
{
    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    /**
    * User Info
    */
    // @DataMember
    // @ApiMember(DataType="object", Description="User Info", Name="UserGeneralInfo", ParameterType="body")
    UserGeneralInfoDto? userGeneralInfo;

    /**
    * Attach this login to an existing user id. Optional.
    */
    // @DataMember
    // @ApiMember(Description="Attach this login to an existing user id. Optional.")
    String? userId;

    /**
    * Ignore UserRegistersAsRole from Membership Settings
    */
    // @DataMember
    // @ApiMember(DataType="boolean", Description="Ignore UserRegistersAsRole from Membership Settings", Name="IgnoreUserRegistersAsRole", ParameterType="body")
    bool? ignoreUserRegistersAsRole;

    SaveUser({this.databaseIntegrationId,this.userGeneralInfo,this.userId,this.ignoreUserRegistersAsRole});
    SaveUser.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        databaseIntegrationId = json['databaseIntegrationId'];
        userGeneralInfo = JsonConverters.fromJson(json['userGeneralInfo'],'UserGeneralInfoDto',context!);
        userId = json['userId'];
        ignoreUserRegistersAsRole = json['ignoreUserRegistersAsRole'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId,
        'userGeneralInfo': JsonConverters.toJson(userGeneralInfo,'UserGeneralInfoDto',context!),
        'userId': userId,
        'ignoreUserRegistersAsRole': ignoreUserRegistersAsRole
    });

    getTypeName() => "SaveUser";
    TypeContext? context = _ctx;
}

// @DataContract
abstract class SaveUserWithRolesBase extends SaveUser
{
    // @DataMember
    List<String> roles = [];

    /**
    * Tags to put on the new user's contact (free labels campaigns and segments select by, normalised like any tag). Only here, on the routes that need membership:create — a public self sign-up cannot tag itself. Ignored for a service user (no contact).
    */
    // @DataMember
    // @ApiMember(Description="Tags to put on the new user's contact (free labels campaigns and segments select by, normalised like any tag). Only here, on the routes that need membership:create — a public self sign-up cannot tag itself. Ignored for a service user (no contact).")
    List<String>? tags;

    SaveUserWithRolesBase({this.roles=const [],this.tags});
    SaveUserWithRolesBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!) ?? [];
        tags = JsonConverters.fromJson(json['tags'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'roles': JsonConverters.toJson(roles,'List<String>',context!),
        'tags': JsonConverters.toJson(tags,'List<String>',context!)
    });

    getTypeName() => "SaveUserWithRolesBase";
    TypeContext? context = _ctx;
}

abstract class IPublicRegistrationRequest
{
    List<String>? roles;
}

class CodeMashListPaginationRequestBase extends RequestBase implements IHasProjectId, IHasEnv, IConvertible
{
    /**
    * ID of your project. Can be passed in a header as norbix-project-id.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="ID of your project. Can be passed in a header as norbix-project-id.", IsRequired=true, Name="norbix-project-id", ParameterType="header")
    String projectId = "";

    /**
    * Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Target environment for this request (e.g. TEST, STAGING). Optional — when omitted the request runs against PROD. Can be passed in a header as norbix-env.", Name="norbix-env", ParameterType="header")
    String? env;

    /**
    * Cursor token — fetch the page AFTER this item.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Cursor token — fetch the page AFTER this item.", Name="startingAfter", ParameterType="query")
    String? startingAfter;

    /**
    * Cursor token — fetch the page BEFORE this item.
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Cursor token — fetch the page BEFORE this item.", Name="endingBefore", ParameterType="query")
    String? endingBefore;

    /**
    * Amount of records to return.
    */
    // @DataMember
    // @ApiMember(DataType="integer", Description="Amount of records to return.", Format="int32", Name="pageSize", ParameterType="query")
    int? pageSize;

    CodeMashListPaginationRequestBase({this.projectId="",this.env,this.startingAfter,this.endingBefore,this.pageSize});
    CodeMashListPaginationRequestBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        projectId = json['projectId'] ?? "";
        env = json['env'];
        startingAfter = json['startingAfter'];
        endingBefore = json['endingBefore'];
        pageSize = json['pageSize'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'projectId': projectId,
        'env': env,
        'startingAfter': startingAfter,
        'endingBefore': endingBefore,
        'pageSize': pageSize
    });

    getTypeName() => "CodeMashListPaginationRequestBase";
    TypeContext? context = _ctx;
}

abstract class IPasskeyCeremonyRequest
{
}

class CursorArgs implements ICursorArgs, IConvertible
{
    String field = "";
    int order = 0;

    CursorArgs({this.field="",this.order=0});
    CursorArgs.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        field = json['field'] ?? "";
        order = json['order'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'field': field,
        'order': order
    };

    getTypeName() => "CursorArgs";
    TypeContext? context = _ctx;
}

class PagingArgs implements IConvertible
{
    CursorArgs? cursorArgs;
    int? pageSize;
    String? startingAfter;
    String? endingBefore;

    PagingArgs({this.cursorArgs,this.pageSize,this.startingAfter,this.endingBefore});
    PagingArgs.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        cursorArgs = JsonConverters.fromJson(json['cursorArgs'],'CursorArgs',context!);
        pageSize = json['pageSize'];
        startingAfter = json['startingAfter'];
        endingBefore = json['endingBefore'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'cursorArgs': JsonConverters.toJson(cursorArgs,'CursorArgs',context!),
        'pageSize': pageSize,
        'startingAfter': startingAfter,
        'endingBefore': endingBefore
    };

    getTypeName() => "PagingArgs";
    TypeContext? context = _ctx;
}

// @DataContract
class RegisterFileItem implements IConvertible
{
    // @DataMember
    String? path;

    // @DataMember
    String? ownerUserId;

    // @DataMember
    String? contentType;

    // @DataMember
    int? sizeBytes;

    // @DataMember
    String? fileName;

    RegisterFileItem({this.path,this.ownerUserId,this.contentType,this.sizeBytes,this.fileName});
    RegisterFileItem.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        path = json['path'];
        ownerUserId = json['ownerUserId'];
        contentType = json['contentType'];
        sizeBytes = json['sizeBytes'];
        fileName = json['fileName'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'path': path,
        'ownerUserId': ownerUserId,
        'contentType': contentType,
        'sizeBytes': sizeBytes,
        'fileName': fileName
    };

    getTypeName() => "RegisterFileItem";
    TypeContext? context = _ctx;
}

class WriteLogEntry implements IConvertible
{
    /**
    * information (default), warning or error.
    */
    // @ApiMember(Description="information (default), warning or error.")
    String? level;

    /**
    * A short line, 1–200 characters — what the Logs list shows.
    */
    // @ApiMember(Description="A short line, 1–200 characters — what the Logs list shows.", IsRequired=true)
    String title = "";

    /**
    * Details, at most 8 000 characters.
    */
    // @ApiMember(Description="Details, at most 8 000 characters.")
    String? message;

    /**
    * Your own code for this kind of line, e.g. order:paid — lower case letters, digits and _ . : -, at most 64. Stored as app:<code>; app:log when empty.
    */
    // @ApiMember(Description="Your own code for this kind of line, e.g. order:paid — lower case letters, digits and _ . : -, at most 64. Stored as app:<code>; app:log when empty.")
    String? eventCode;

    /**
    * Groups your lines into one flow in the Logs details view: at most 64 letters, digits, _ or -. Empty = the id of this request.
    */
    // @ApiMember(Description="Groups your lines into one flow in the Logs details view: at most 64 letters, digits, _ or -. Empty = the id of this request.")
    String? correlationId;

    /**
    * When it happened (UTC). Empty = when Norbix received it. At most 7 days old and at most 5 minutes ahead.
    */
    // @ApiMember(Description="When it happened (UTC). Empty = when Norbix received it. At most 7 days old and at most 5 minutes ahead.")
    DateTime? timestamp;

    /**
    * Extra fields, at most 20; key at most 64, value at most 2 000 characters. Values under secret-looking keys (password, token, apiKey …) are masked.
    */
    // @ApiMember(Description="Extra fields, at most 20; key at most 64, value at most 2 000 characters. Values under secret-looking keys (password, token, apiKey …) are masked.")
    Map<String,String?>? meta;

    WriteLogEntry({this.level,this.title="",this.message,this.eventCode,this.correlationId,this.timestamp,this.meta});
    WriteLogEntry.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        level = json['level'];
        title = json['title'] ?? "";
        message = json['message'];
        eventCode = json['eventCode'];
        correlationId = json['correlationId'];
        timestamp = JsonConverters.fromJson(json['timestamp'],'DateTime',context!);
        meta = JsonConverters.toStringMap(json['meta']);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'level': level,
        'title': title,
        'message': message,
        'eventCode': eventCode,
        'correlationId': correlationId,
        'timestamp': JsonConverters.toJson(timestamp,'DateTime',context!),
        'meta': meta
    };

    getTypeName() => "WriteLogEntry";
    TypeContext? context = _ctx;
}

// @DataContract
class PaymentOrderLineInput implements IConvertible
{
    // @DataMember
    String? sku;

    // @DataMember
    String? title;

    // @DataMember
    int quantity = 0;

    // @DataMember
    int unitAmountMinor = 0;

    PaymentOrderLineInput({this.sku,this.title,this.quantity=0,this.unitAmountMinor=0});
    PaymentOrderLineInput.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        sku = json['sku'];
        title = json['title'];
        quantity = json['quantity'] ?? 0;
        unitAmountMinor = json['unitAmountMinor'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'sku': sku,
        'title': title,
        'quantity': quantity,
        'unitAmountMinor': unitAmountMinor
    };

    getTypeName() => "PaymentOrderLineInput";
    TypeContext? context = _ctx;
}

// @DataContract
class FileChecksumDto implements IConvertible
{
    // @DataMember(Order=1)
    String algorithm = "";

    // @DataMember(Order=2)
    String hash = "";

    FileChecksumDto({this.algorithm="",this.hash=""});
    FileChecksumDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        algorithm = json['algorithm'] ?? "";
        hash = json['hash'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'algorithm': algorithm,
        'hash': hash
    };

    getTypeName() => "FileChecksumDto";
    TypeContext? context = _ctx;
}

// @DataContract
class FileResourceDto implements IConvertible
{
    // @DataMember(Order=1)
    String? id;

    // @DataMember(Order=2)
    String originalFileName = "";

    // @DataMember(Order=3)
    String Extension = "";

    // @DataMember(Order=4)
    String storedFileName = "";

    // @DataMember(Order=5)
    int? sizeBytes;

    // @DataMember(Order=6)
    FileChecksumDto? checksum;

    FileResourceDto({this.id,this.originalFileName="",this.Extension="",this.storedFileName="",this.sizeBytes,this.checksum});
    FileResourceDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        originalFileName = json['originalFileName'] ?? "";
        Extension = json['extension'] ?? "";
        storedFileName = json['storedFileName'] ?? "";
        sizeBytes = json['sizeBytes'];
        checksum = JsonConverters.fromJson(json['checksum'],'FileChecksumDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'originalFileName': originalFileName,
        'extension': Extension,
        'storedFileName': storedFileName,
        'sizeBytes': sizeBytes,
        'checksum': JsonConverters.toJson(checksum,'FileChecksumDto',context!)
    };

    getTypeName() => "FileResourceDto";
    TypeContext? context = _ctx;
}

enum FileProvider
{
    Local,
    AwsS3,
    AzureBlobStorage,
    GoogleCloudStorage,
    Ftp,
    AppleICloud,
    DropBox,
    GoogleDrive,
}

// @DataContract
class FileResourceRefDto implements IConvertible
{
    // @DataMember(Order=1)
    FileResourceDto? resource;

    // @DataMember(Order=2)
    String integrationId = "";

    // @DataMember(Order=3)
    FileProvider? provider;

    // @DataMember(Order=4)
    String path = "";

    // @DataMember(Order=5)
    String? publicUrl;

    // @DataMember(Order=6)
    bool? isPublic;

    FileResourceRefDto({this.resource,this.integrationId="",this.provider,this.path="",this.publicUrl,this.isPublic});
    FileResourceRefDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        resource = JsonConverters.fromJson(json['resource'],'FileResourceDto',context!);
        integrationId = json['integrationId'] ?? "";
        provider = JsonConverters.fromJson(json['provider'],'FileProvider',context!);
        path = json['path'] ?? "";
        publicUrl = json['publicUrl'];
        isPublic = json['isPublic'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'resource': JsonConverters.toJson(resource,'FileResourceDto',context!),
        'integrationId': integrationId,
        'provider': JsonConverters.toJson(provider,'FileProvider',context!),
        'path': path,
        'publicUrl': publicUrl,
        'isPublic': isPublic
    };

    getTypeName() => "FileResourceRefDto";
    TypeContext? context = _ctx;
}

class ImportColumnMappingDto implements IConvertible
{
    // @DataMember
    int csvColumnIndex = 0;

    // @DataMember
    String? csvHeader;

    // @DataMember
    String? propertyName;

    // @DataMember
    bool? dontImportOnError;

    ImportColumnMappingDto({this.csvColumnIndex=0,this.csvHeader,this.propertyName,this.dontImportOnError});
    ImportColumnMappingDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        csvColumnIndex = json['csvColumnIndex'] ?? 0;
        csvHeader = json['csvHeader'];
        propertyName = json['propertyName'];
        dontImportOnError = json['dontImportOnError'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'csvColumnIndex': csvColumnIndex,
        'csvHeader': csvHeader,
        'propertyName': propertyName,
        'dontImportOnError': dontImportOnError
    };

    getTypeName() => "ImportColumnMappingDto";
    TypeContext? context = _ctx;
}

enum EmailCampaignRecipientsSourceTypes
{
    AllUsers,
    SpecifiedUsers,
    AccountUsers,
    Email,
    Collection,
    TriggerSubject,
}

enum TokenMappingResolverType
{
    NotSet,
    Custom,
    Project,
    ProjectSocials,
    Initiator,
    Recipient,
    SchemaRecord,
    TargetUser,
    TagDefinitions,
    EmailSignatures,
    Campaign,
    Template,
    EmailFooters,
    Old,
    New,
    RequestInput,
    IntegrationConfig,
    IntegrationSecret,
    StepOutput,
}

enum SecretValueFormat
{
    Raw,
    Bearer,
    Basic,
    Prefixed,
}

// @DataContract
class TokenMappingDto implements IConvertible
{
    // @DataMember
    String key = "";

    // @DataMember
    String value = "";

    // @DataMember
    TokenMappingResolverType? resolver;

    // @DataMember
    List<String>? secretKeys;

    // @DataMember
    SecretValueFormat? secretFormat;

    TokenMappingDto({this.key="",this.value="",this.resolver,this.secretKeys,this.secretFormat});
    TokenMappingDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        key = json['key'] ?? "";
        value = json['value'] ?? "";
        resolver = JsonConverters.fromJson(json['resolver'],'TokenMappingResolverType',context!);
        secretKeys = JsonConverters.fromJson(json['secretKeys'],'List<String>',context!);
        secretFormat = JsonConverters.fromJson(json['secretFormat'],'SecretValueFormat',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
        'resolver': JsonConverters.toJson(resolver,'TokenMappingResolverType',context!),
        'secretKeys': JsonConverters.toJson(secretKeys,'List<String>',context!),
        'secretFormat': JsonConverters.toJson(secretFormat,'SecretValueFormat',context!)
    };

    getTypeName() => "TokenMappingDto";
    TypeContext? context = _ctx;
}

abstract class EmailCampaignRequest
{
    EmailCampaignRecipientsSourceTypes? source;
    String templateId = "";
    String? integrationId;
    String? validationIntegrationId;
    String? language;
    String? initiatorId;
    String? notes;
    // @DataMember
    List<TokenMappingDto>? mappedTokens;

    // @DataMember
    int? campaignTime;

    EmailCampaignRequest({this.source,this.templateId="",this.integrationId,this.validationIntegrationId,this.language,this.initiatorId,this.notes,this.mappedTokens,this.campaignTime});
    EmailCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        source = JsonConverters.fromJson(json['source'],'EmailCampaignRecipientsSourceTypes',context!);
        templateId = json['templateId'] ?? "";
        integrationId = json['integrationId'];
        validationIntegrationId = json['validationIntegrationId'];
        language = json['language'];
        initiatorId = json['initiatorId'];
        notes = json['notes'];
        mappedTokens = JsonConverters.fromJson(json['mappedTokens'],'List<TokenMappingDto>',context!);
        campaignTime = json['campaignTime'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'source': JsonConverters.toJson(source,'EmailCampaignRecipientsSourceTypes',context!),
        'templateId': templateId,
        'integrationId': integrationId,
        'validationIntegrationId': validationIntegrationId,
        'language': language,
        'initiatorId': initiatorId,
        'notes': notes,
        'mappedTokens': JsonConverters.toJson(mappedTokens,'List<TokenMappingDto>',context!),
        'campaignTime': campaignTime
    };

    getTypeName() => "EmailCampaignRequest";
    TypeContext? context = _ctx;
}

enum SmsCampaignRecipientsSourceTypes
{
    AllUsers,
    SpecifiedUsers,
    AccountUsers,
    PhoneNumbers,
    Collection,
    TriggerSubject,
}

// @flags()
class RespectTimeZoneSettings
{
    static const RespectTimeZoneSettings RespectToLastLoginZone = const RespectTimeZoneSettings._(1);
    static const RespectTimeZoneSettings RespectToRegistrationZone = const RespectTimeZoneSettings._(2);
    static const RespectTimeZoneSettings RespectToRegistrationProjectZone = const RespectTimeZoneSettings._(4);

    final int _value;
    const RespectTimeZoneSettings._(this._value);
    int get value => _value;
    static List<RespectTimeZoneSettings> get values => const [RespectToLastLoginZone,RespectToRegistrationZone,RespectToRegistrationProjectZone];
}

// @DataContract
class SmsCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    SmsCampaignRecipientsSourceTypes? recipientsSourceType;

    // @DataMember
    List<TokenMappingDto>? mappedTokens;

    // @DataMember
    int? campaignTime;

    // @DataMember
    RespectTimeZoneSettings? respectTimeZoneSettings;

    SmsCampaignDeliverySettingsDto({this.recipientsSourceType,this.mappedTokens,this.campaignTime,this.respectTimeZoneSettings});
    SmsCampaignDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        recipientsSourceType = JsonConverters.fromJson(json['recipientsSourceType'],'SmsCampaignRecipientsSourceTypes',context!);
        mappedTokens = JsonConverters.fromJson(json['mappedTokens'],'List<TokenMappingDto>',context!);
        campaignTime = json['campaignTime'];
        respectTimeZoneSettings = JsonConverters.fromJson(json['respectTimeZoneSettings'],'RespectTimeZoneSettings',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'recipientsSourceType': JsonConverters.toJson(recipientsSourceType,'SmsCampaignRecipientsSourceTypes',context!),
        'mappedTokens': JsonConverters.toJson(mappedTokens,'List<TokenMappingDto>',context!),
        'campaignTime': campaignTime,
        'respectTimeZoneSettings': JsonConverters.toJson(respectTimeZoneSettings,'RespectTimeZoneSettings',context!)
    };

    getTypeName() => "SmsCampaignDeliverySettingsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsToAllUsersDeliverySettingsDto extends SmsCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    List<String>? rolesNames;

    // @DataMember
    List<String>? userTags;

    SmsToAllUsersDeliverySettingsDto({this.rolesNames,this.userTags});
    SmsToAllUsersDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        rolesNames = JsonConverters.fromJson(json['rolesNames'],'List<String>',context!);
        userTags = JsonConverters.fromJson(json['userTags'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'rolesNames': JsonConverters.toJson(rolesNames,'List<String>',context!),
        'userTags': JsonConverters.toJson(userTags,'List<String>',context!)
    });

    getTypeName() => "SmsToAllUsersDeliverySettingsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsToUsersDeliverySettingsDto extends SmsCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    List<String> recipients = [];

    SmsToUsersDeliverySettingsDto({this.recipients=const []});
    SmsToUsersDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'List<String>',context!)
    });

    getTypeName() => "SmsToUsersDeliverySettingsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsToAccountUsersDeliverySettingsDto extends SmsCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    List<String> recipients = [];

    SmsToAccountUsersDeliverySettingsDto({this.recipients=const []});
    SmsToAccountUsersDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'List<String>',context!)
    });

    getTypeName() => "SmsToAccountUsersDeliverySettingsDto";
    TypeContext? context = _ctx;
}

enum CollectionEmailCampaignRecipientField
{
    User,
    Email,
}

// @DataContract
class SmsToCollectionRecordsDeliverySettingsDto extends SmsCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    List<String> fields = [];

    // @DataMember
    CollectionEmailCampaignRecipientField? fieldType;

    // @DataMember
    String schemaName = "";

    // @DataMember
    List<String>? roleNames;

    // @DataMember
    List<String>? languages;

    // @DataMember
    List<String>? recordIds;

    SmsToCollectionRecordsDeliverySettingsDto({this.fields=const [],this.fieldType,this.schemaName="",this.roleNames,this.languages,this.recordIds});
    SmsToCollectionRecordsDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        fields = JsonConverters.fromJson(json['fields'],'List<String>',context!) ?? [];
        fieldType = JsonConverters.fromJson(json['fieldType'],'CollectionEmailCampaignRecipientField',context!);
        schemaName = json['schemaName'] ?? "";
        roleNames = JsonConverters.fromJson(json['roleNames'],'List<String>',context!);
        languages = JsonConverters.fromJson(json['languages'],'List<String>',context!);
        recordIds = JsonConverters.fromJson(json['recordIds'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'fields': JsonConverters.toJson(fields,'List<String>',context!),
        'fieldType': JsonConverters.toJson(fieldType,'CollectionEmailCampaignRecipientField',context!),
        'schemaName': schemaName,
        'roleNames': JsonConverters.toJson(roleNames,'List<String>',context!),
        'languages': JsonConverters.toJson(languages,'List<String>',context!),
        'recordIds': JsonConverters.toJson(recordIds,'List<String>',context!)
    });

    getTypeName() => "SmsToCollectionRecordsDeliverySettingsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsToPhoneNumbersDeliverySettingsDto extends SmsCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    List<String> phoneNumbers = [];

    SmsToPhoneNumbersDeliverySettingsDto({this.phoneNumbers=const []});
    SmsToPhoneNumbersDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        phoneNumbers = JsonConverters.fromJson(json['phoneNumbers'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'phoneNumbers': JsonConverters.toJson(phoneNumbers,'List<String>',context!)
    });

    getTypeName() => "SmsToPhoneNumbersDeliverySettingsDto";
    TypeContext? context = _ctx;
}

enum PushCampaignRecipientsSourceTypes
{
    AllUsers,
    SpecifiedUsers,
    Collection,
    Devices,
    AccountUsers,
    TriggerSubject,
}

abstract class PushCampaignRequest
{
    PushCampaignRecipientsSourceTypes? source;
    String templateId = "";
    String? integrationId;
    String? language;
    String? initiatorId;
    String? notes;
    // @DataMember
    List<TokenMappingDto>? mappedTokens;

    // @DataMember
    int? campaignTime;

    PushCampaignRequest({this.source,this.templateId="",this.integrationId,this.language,this.initiatorId,this.notes,this.mappedTokens,this.campaignTime});
    PushCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        source = JsonConverters.fromJson(json['source'],'PushCampaignRecipientsSourceTypes',context!);
        templateId = json['templateId'] ?? "";
        integrationId = json['integrationId'];
        language = json['language'];
        initiatorId = json['initiatorId'];
        notes = json['notes'];
        mappedTokens = JsonConverters.fromJson(json['mappedTokens'],'List<TokenMappingDto>',context!);
        campaignTime = json['campaignTime'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'source': JsonConverters.toJson(source,'PushCampaignRecipientsSourceTypes',context!),
        'templateId': templateId,
        'integrationId': integrationId,
        'language': language,
        'initiatorId': initiatorId,
        'notes': notes,
        'mappedTokens': JsonConverters.toJson(mappedTokens,'List<TokenMappingDto>',context!),
        'campaignTime': campaignTime
    };

    getTypeName() => "PushCampaignRequest";
    TypeContext? context = _ctx;
}

// @DataContract
enum CodeMashRelease
{
    NotSet,
    Community,
    ManagedService,
    Enterprise,
}

enum CodeMashRuntime
{
    Development,
    CI,
    Staging,
    Production,
}

class EchoRegionDto implements IConvertible
{
    String code = "";
    String displayName = "";
    String apiUrl = "";
    String hubUrl = "";

    EchoRegionDto({this.code="",this.displayName="",this.apiUrl="",this.hubUrl=""});
    EchoRegionDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        code = json['code'] ?? "";
        displayName = json['displayName'] ?? "";
        apiUrl = json['apiUrl'] ?? "";
        hubUrl = json['hubUrl'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'code': code,
        'displayName': displayName,
        'apiUrl': apiUrl,
        'hubUrl': hubUrl
    };

    getTypeName() => "EchoRegionDto";
    TypeContext? context = _ctx;
}

class EchoAgentSnippetDto implements IConvertible
{
    String client = "";
    String kind = "";
    bool? recommended;
    String auth = "";
    String config = "";

    EchoAgentSnippetDto({this.client="",this.kind="",this.recommended,this.auth="",this.config=""});
    EchoAgentSnippetDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        client = json['client'] ?? "";
        kind = json['kind'] ?? "";
        recommended = json['recommended'];
        auth = json['auth'] ?? "";
        config = json['config'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'client': client,
        'kind': kind,
        'recommended': recommended,
        'auth': auth,
        'config': config
    };

    getTypeName() => "EchoAgentSnippetDto";
    TypeContext? context = _ctx;
}

class EchoAgentDto implements IConvertible
{
    String mcpUrl = "";
    String? oAuthMetadataUrl;
    String installationType = "";
    String onboardingDocsUrl = "";
    String toolsUrl = "";
    String cliPackage = "";
    String cliInstallCommand = "";
    String deviceAuthorizationUrl = "";
    String deviceTokenUrl = "";
    List<EchoAgentSnippetDto> snippets = [];

    EchoAgentDto({this.mcpUrl="",this.oAuthMetadataUrl,this.installationType="",this.onboardingDocsUrl="",this.toolsUrl="",this.cliPackage="",this.cliInstallCommand="",this.deviceAuthorizationUrl="",this.deviceTokenUrl="",this.snippets=const []});
    EchoAgentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        mcpUrl = json['mcpUrl'] ?? "";
        oAuthMetadataUrl = json['oAuthMetadataUrl'];
        installationType = json['installationType'] ?? "";
        onboardingDocsUrl = json['onboardingDocsUrl'] ?? "";
        toolsUrl = json['toolsUrl'] ?? "";
        cliPackage = json['cliPackage'] ?? "";
        cliInstallCommand = json['cliInstallCommand'] ?? "";
        deviceAuthorizationUrl = json['deviceAuthorizationUrl'] ?? "";
        deviceTokenUrl = json['deviceTokenUrl'] ?? "";
        snippets = JsonConverters.fromJson(json['snippets'],'List<EchoAgentSnippetDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'mcpUrl': mcpUrl,
        'oAuthMetadataUrl': oAuthMetadataUrl,
        'installationType': installationType,
        'onboardingDocsUrl': onboardingDocsUrl,
        'toolsUrl': toolsUrl,
        'cliPackage': cliPackage,
        'cliInstallCommand': cliInstallCommand,
        'deviceAuthorizationUrl': deviceAuthorizationUrl,
        'deviceTokenUrl': deviceTokenUrl,
        'snippets': JsonConverters.toJson(snippets,'List<EchoAgentSnippetDto>',context!)
    };

    getTypeName() => "EchoAgentDto";
    TypeContext? context = _ctx;
}

class EchoHostingPlatformDto implements IConvertible
{
    String provider = "";
    bool? isAws;

    EchoHostingPlatformDto({this.provider="",this.isAws});
    EchoHostingPlatformDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        provider = json['provider'] ?? "";
        isAws = json['isAws'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'provider': provider,
        'isAws': isAws
    };

    getTypeName() => "EchoHostingPlatformDto";
    TypeContext? context = _ctx;
}

// @DataContract
class QuickConnectProviderDto implements IConvertible
{
    // @DataMember
    String module = "";

    // @DataMember
    String provider = "";

    // @DataMember
    bool? available;

    // @DataMember
    String callbackKind = "";

    // @DataMember
    List<String> requiredInputs = [];

    // @DataMember
    List<String> modes = [];

    // @DataMember
    String redirectUrl = "";

    // @DataMember
    List<String> platformWebhookUrls = [];

    QuickConnectProviderDto({this.module="",this.provider="",this.available,this.callbackKind="",this.requiredInputs=const [],this.modes=const [],this.redirectUrl="",this.platformWebhookUrls=const []});
    QuickConnectProviderDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        module = json['module'] ?? "";
        provider = json['provider'] ?? "";
        available = json['available'];
        callbackKind = json['callbackKind'] ?? "";
        requiredInputs = JsonConverters.fromJson(json['requiredInputs'],'List<String>',context!) ?? [];
        modes = JsonConverters.fromJson(json['modes'],'List<String>',context!) ?? [];
        redirectUrl = json['redirectUrl'] ?? "";
        platformWebhookUrls = JsonConverters.fromJson(json['platformWebhookUrls'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'module': module,
        'provider': provider,
        'available': available,
        'callbackKind': callbackKind,
        'requiredInputs': JsonConverters.toJson(requiredInputs,'List<String>',context!),
        'modes': JsonConverters.toJson(modes,'List<String>',context!),
        'redirectUrl': redirectUrl,
        'platformWebhookUrls': JsonConverters.toJson(platformWebhookUrls,'List<String>',context!)
    };

    getTypeName() => "QuickConnectProviderDto";
    TypeContext? context = _ctx;
}

class EchoConnectDto implements IConvertible
{
    List<QuickConnectProviderDto> providers = [];

    EchoConnectDto({this.providers=const []});
    EchoConnectDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        providers = JsonConverters.fromJson(json['providers'],'List<QuickConnectProviderDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'providers': JsonConverters.toJson(providers,'List<QuickConnectProviderDto>',context!)
    };

    getTypeName() => "EchoConnectDto";
    TypeContext? context = _ctx;
}

class EchoKeylessDto implements IConvertible
{
    String issuer = "";
    bool? available;
    String? unavailableReason;

    EchoKeylessDto({this.issuer="",this.available,this.unavailableReason});
    EchoKeylessDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        issuer = json['issuer'] ?? "";
        available = json['available'];
        unavailableReason = json['unavailableReason'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'issuer': issuer,
        'available': available,
        'unavailableReason': unavailableReason
    };

    getTypeName() => "EchoKeylessDto";
    TypeContext? context = _ctx;
}

class PublicBrandDto implements IConvertible
{
    String displayName = "";
    String? mainColor;
    String? accentColor;
    String? logoUrl;
    String? iconUrl;

    PublicBrandDto({this.displayName="",this.mainColor,this.accentColor,this.logoUrl,this.iconUrl});
    PublicBrandDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        displayName = json['displayName'] ?? "";
        mainColor = json['mainColor'];
        accentColor = json['accentColor'];
        logoUrl = json['logoUrl'];
        iconUrl = json['iconUrl'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'mainColor': mainColor,
        'accentColor': accentColor,
        'logoUrl': logoUrl,
        'iconUrl': iconUrl
    };

    getTypeName() => "PublicBrandDto";
    TypeContext? context = _ctx;
}

class PublicPasswordPolicyDto implements IConvertible
{
    int minLength = 0;
    int? maxLength;
    int? minNumbers;
    int? minUpper;
    int? minLower;
    int? minSpecial;
    String? allowedSpecial;

    PublicPasswordPolicyDto({this.minLength=0,this.maxLength,this.minNumbers,this.minUpper,this.minLower,this.minSpecial,this.allowedSpecial});
    PublicPasswordPolicyDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        minLength = json['minLength'] ?? 0;
        maxLength = json['maxLength'];
        minNumbers = json['minNumbers'];
        minUpper = json['minUpper'];
        minLower = json['minLower'];
        minSpecial = json['minSpecial'];
        allowedSpecial = json['allowedSpecial'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'minLength': minLength,
        'maxLength': maxLength,
        'minNumbers': minNumbers,
        'minUpper': minUpper,
        'minLower': minLower,
        'minSpecial': minSpecial,
        'allowedSpecial': allowedSpecial
    };

    getTypeName() => "PublicPasswordPolicyDto";
    TypeContext? context = _ctx;
}

class PublicAuthDto implements IConvertible
{
    List<String> socialProviders = [];
    bool? passkey;
    List<String>? methods;
    PublicPasswordPolicyDto? passwordPolicy;

    PublicAuthDto({this.socialProviders=const [],this.passkey,this.methods,this.passwordPolicy});
    PublicAuthDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        socialProviders = JsonConverters.fromJson(json['socialProviders'],'List<String>',context!) ?? [];
        passkey = json['passkey'];
        methods = JsonConverters.fromJson(json['methods'],'List<String>',context!);
        passwordPolicy = JsonConverters.fromJson(json['passwordPolicy'],'PublicPasswordPolicyDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'socialProviders': JsonConverters.toJson(socialProviders,'List<String>',context!),
        'passkey': passkey,
        'methods': JsonConverters.toJson(methods,'List<String>',context!),
        'passwordPolicy': JsonConverters.toJson(passwordPolicy,'PublicPasswordPolicyDto',context!)
    };

    getTypeName() => "PublicAuthDto";
    TypeContext? context = _ctx;
}

class PublicAiAssistantDto implements IConvertible
{
    String id = "";
    String name = "";
    String? welcome;

    PublicAiAssistantDto({this.id="",this.name="",this.welcome});
    PublicAiAssistantDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        name = json['name'] ?? "";
        welcome = json['welcome'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'welcome': welcome
    };

    getTypeName() => "PublicAiAssistantDto";
    TypeContext? context = _ctx;
}

class PublicAiChatDto implements IConvertible
{
    bool? enabled;
    List<PublicAiAssistantDto> assistants = [];

    PublicAiChatDto({this.enabled,this.assistants=const []});
    PublicAiChatDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        enabled = json['enabled'];
        assistants = JsonConverters.fromJson(json['assistants'],'List<PublicAiAssistantDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'assistants': JsonConverters.toJson(assistants,'List<PublicAiAssistantDto>',context!)
    };

    getTypeName() => "PublicAiChatDto";
    TypeContext? context = _ctx;
}

class ErrorDto implements IConvertible
{
    String message = "";
    String? errorCode;
    Map<String,String?>? context;
    List<ErrorDto>? stackTrace;

    ErrorDto({this.message="",this.errorCode,this.context,this.stackTrace});
    ErrorDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        message = json['message'] ?? "";
        errorCode = json['errorCode'];
        context = JsonConverters.toStringMap(json['context']);
        stackTrace = JsonConverters.fromJson(json['stackTrace'],'List<ErrorDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'message': message,
        'errorCode': errorCode,
        'context': context,
        'stackTrace': JsonConverters.toJson(stackTrace,'List<ErrorDto>',context!)
    };

    getTypeName() => "ErrorDto";
    TypeContext? context = _ctx;
}

class CodeMashResponseStatus implements IConvertible
{
    bool? isSuccess;
    List<ErrorDto>? errors;

    CodeMashResponseStatus({this.isSuccess,this.errors});
    CodeMashResponseStatus.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        isSuccess = json['isSuccess'];
        errors = JsonConverters.fromJson(json['errors'],'List<ErrorDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'isSuccess': isSuccess,
        'errors': JsonConverters.toJson(errors,'List<ErrorDto>',context!)
    };

    getTypeName() => "CodeMashResponseStatus";
    TypeContext? context = _ctx;
}

// @DataContract
class ResponseBase implements IConvertible
{
    // @DataMember
    CodeMashResponseStatus? responseStatus;

    ResponseBase({this.responseStatus});
    ResponseBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        responseStatus = JsonConverters.fromJson(json['responseStatus'],'CodeMashResponseStatus',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'responseStatus': JsonConverters.toJson(responseStatus,'CodeMashResponseStatus',context!)
    };

    getTypeName() => "ResponseBase";
    TypeContext? context = _ctx;
}

class EndUserChatAttachment implements IConvertible
{
    String id = "";
    String sessionId = "";
    String fileName = "";
    String contentType = "";
    String kind = "";
    int size = 0;
    String? summary;
    DateTime? createdAtUtc;

    EndUserChatAttachment({this.id="",this.sessionId="",this.fileName="",this.contentType="",this.kind="",this.size=0,this.summary,this.createdAtUtc});
    EndUserChatAttachment.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        sessionId = json['sessionId'] ?? "";
        fileName = json['fileName'] ?? "";
        contentType = json['contentType'] ?? "";
        kind = json['kind'] ?? "";
        size = json['size'] ?? 0;
        summary = json['summary'];
        createdAtUtc = JsonConverters.fromJson(json['createdAtUtc'],'DateTime',context!) ?? DateTime(0);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'sessionId': sessionId,
        'fileName': fileName,
        'contentType': contentType,
        'kind': kind,
        'size': size,
        'summary': summary,
        'createdAtUtc': JsonConverters.toJson(createdAtUtc,'DateTime',context!)
    };

    getTypeName() => "EndUserChatAttachment";
    TypeContext? context = _ctx;
}

class EndUserChatMemoryNote implements IConvertible
{
    String id = "";
    String sessionId = "";
    String kind = "";
    String text = "";
    DateTime? createdAtUtc;

    EndUserChatMemoryNote({this.id="",this.sessionId="",this.kind="",this.text="",this.createdAtUtc});
    EndUserChatMemoryNote.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        sessionId = json['sessionId'] ?? "";
        kind = json['kind'] ?? "";
        text = json['text'] ?? "";
        createdAtUtc = JsonConverters.fromJson(json['createdAtUtc'],'DateTime',context!) ?? DateTime(0);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'sessionId': sessionId,
        'kind': kind,
        'text': text,
        'createdAtUtc': JsonConverters.toJson(createdAtUtc,'DateTime',context!)
    };

    getTypeName() => "EndUserChatMemoryNote";
    TypeContext? context = _ctx;
}

class EndUserChatAssistant implements IConvertible
{
    String id = "";
    String name = "";
    String? welcomeMessage;
    bool? isDefault;
    bool? memoryEnabled;

    EndUserChatAssistant({this.id="",this.name="",this.welcomeMessage,this.isDefault,this.memoryEnabled});
    EndUserChatAssistant.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        name = json['name'] ?? "";
        welcomeMessage = json['welcomeMessage'];
        isDefault = json['isDefault'];
        memoryEnabled = json['memoryEnabled'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'welcomeMessage': welcomeMessage,
        'isDefault': isDefault,
        'memoryEnabled': memoryEnabled
    };

    getTypeName() => "EndUserChatAssistant";
    TypeContext? context = _ctx;
}

class EndUserChatPlan implements IConvertible
{
    String id = "";
    String name = "";
    String quotaUnit = "";
    int monthlyQuota = 0;
    int used = 0;
    int remaining = 0;
    bool? attachments;
    bool? rag;
    bool? memory;

    EndUserChatPlan({this.id="",this.name="",this.quotaUnit="",this.monthlyQuota=0,this.used=0,this.remaining=0,this.attachments,this.rag,this.memory});
    EndUserChatPlan.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        name = json['name'] ?? "";
        quotaUnit = json['quotaUnit'] ?? "";
        monthlyQuota = json['monthlyQuota'] ?? 0;
        used = json['used'] ?? 0;
        remaining = json['remaining'] ?? 0;
        attachments = json['attachments'];
        rag = json['rag'];
        memory = json['memory'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quotaUnit': quotaUnit,
        'monthlyQuota': monthlyQuota,
        'used': used,
        'remaining': remaining,
        'attachments': attachments,
        'rag': rag,
        'memory': memory
    };

    getTypeName() => "EndUserChatPlan";
    TypeContext? context = _ctx;
}

class EndUserChatSession implements IConvertible
{
    String id = "";
    String? assistantId;
    String? title;
    bool? isPinned;
    bool? isArchived;
    int lastSeq = 0;
    DateTime? createdAtUtc;
    DateTime? updatedAtUtc;

    EndUserChatSession({this.id="",this.assistantId,this.title,this.isPinned,this.isArchived,this.lastSeq=0,this.createdAtUtc,this.updatedAtUtc});
    EndUserChatSession.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        assistantId = json['assistantId'];
        title = json['title'];
        isPinned = json['isPinned'];
        isArchived = json['isArchived'];
        lastSeq = json['lastSeq'] ?? 0;
        createdAtUtc = JsonConverters.fromJson(json['createdAtUtc'],'DateTime',context!) ?? DateTime(0);
        updatedAtUtc = JsonConverters.fromJson(json['updatedAtUtc'],'DateTime',context!) ?? DateTime(0);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'assistantId': assistantId,
        'title': title,
        'isPinned': isPinned,
        'isArchived': isArchived,
        'lastSeq': lastSeq,
        'createdAtUtc': JsonConverters.toJson(createdAtUtc,'DateTime',context!),
        'updatedAtUtc': JsonConverters.toJson(updatedAtUtc,'DateTime',context!)
    };

    getTypeName() => "EndUserChatSession";
    TypeContext? context = _ctx;
}

abstract class AiChatEntryWireDto
{
    String kind = "";
    String id = "";
    int seq = 0;
    DateTime? atUtc;
    String? refEntryId;
    String? workItemId;
    String? feedback;
    DateTime? feedbackAtUtc;
    String? feedbackByUserAuthId;

    AiChatEntryWireDto({this.kind="",this.id="",this.seq=0,this.atUtc,this.refEntryId,this.workItemId,this.feedback,this.feedbackAtUtc,this.feedbackByUserAuthId});
    AiChatEntryWireDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        kind = json['kind'] ?? "";
        id = json['id'] ?? "";
        seq = json['seq'] ?? 0;
        atUtc = JsonConverters.fromJson(json['atUtc'],'DateTime',context!) ?? DateTime(0);
        refEntryId = json['refEntryId'];
        workItemId = json['workItemId'];
        feedback = json['feedback'];
        feedbackAtUtc = JsonConverters.fromJson(json['feedbackAtUtc'],'DateTime',context!);
        feedbackByUserAuthId = json['feedbackByUserAuthId'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': id,
        'seq': seq,
        'atUtc': JsonConverters.toJson(atUtc,'DateTime',context!),
        'refEntryId': refEntryId,
        'workItemId': workItemId,
        'feedback': feedback,
        'feedbackAtUtc': JsonConverters.toJson(feedbackAtUtc,'DateTime',context!),
        'feedbackByUserAuthId': feedbackByUserAuthId
    };

    getTypeName() => "AiChatEntryWireDto";
    TypeContext? context = _ctx;
}

class EndUserAiToolParameter implements IConvertible
{
    String name = "";
    String type = "";
    bool? Required;
    String? description;

    EndUserAiToolParameter({this.name="",this.type="",this.Required,this.description});
    EndUserAiToolParameter.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        name = json['name'] ?? "";
        type = json['type'] ?? "";
        Required = json['required'];
        description = json['description'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'required': Required,
        'description': description
    };

    getTypeName() => "EndUserAiToolParameter";
    TypeContext? context = _ctx;
}

class EndUserAiTool implements IConvertible
{
    String name = "";
    String description = "";
    List<String> toolsets = [];
    bool? requiresConfirmation;
    List<EndUserAiToolParameter> parameters = [];

    EndUserAiTool({this.name="",this.description="",this.toolsets=const [],this.requiresConfirmation,this.parameters=const []});
    EndUserAiTool.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        name = json['name'] ?? "";
        description = json['description'] ?? "";
        toolsets = JsonConverters.fromJson(json['toolsets'],'List<String>',context!) ?? [];
        requiresConfirmation = json['requiresConfirmation'];
        parameters = JsonConverters.fromJson(json['parameters'],'List<EndUserAiToolParameter>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'toolsets': JsonConverters.toJson(toolsets,'List<String>',context!),
        'requiresConfirmation': requiresConfirmation,
        'parameters': JsonConverters.toJson(parameters,'List<EndUserAiToolParameter>',context!)
    };

    getTypeName() => "EndUserAiTool";
    TypeContext? context = _ctx;
}

enum AuthType
{
    Service,
    Email,
    UserName,
    Phone,
    Guest,
    Social,
}

class AccessInformationDto implements IConvertible
{
    String? ip;
    DateTime? date;
    String? timeZone;

    AccessInformationDto({this.ip,this.date,this.timeZone});
    AccessInformationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        ip = json['ip'];
        date = JsonConverters.fromJson(json['date'],'DateTime',context!);
        timeZone = json['timeZone'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'ip': ip,
        'date': JsonConverters.toJson(date,'DateTime',context!),
        'timeZone': timeZone
    };

    getTypeName() => "AccessInformationDto";
    TypeContext? context = _ctx;
}

class RegistrationDto implements IConvertible
{
    AccessInformationDto? registrationInformation;

    RegistrationDto({this.registrationInformation});
    RegistrationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        registrationInformation = JsonConverters.fromJson(json['registrationInformation'],'AccessInformationDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'registrationInformation': JsonConverters.toJson(registrationInformation,'AccessInformationDto',context!)
    };

    getTypeName() => "RegistrationDto";
    TypeContext? context = _ctx;
}

class LoginDto implements IConvertible
{
    bool? needChangePasswordOnNextLogin;
    AccessInformationDto? lastAccessInformation;

    LoginDto({this.needChangePasswordOnNextLogin,this.lastAccessInformation});
    LoginDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        needChangePasswordOnNextLogin = json['needChangePasswordOnNextLogin'];
        lastAccessInformation = JsonConverters.fromJson(json['lastAccessInformation'],'AccessInformationDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'needChangePasswordOnNextLogin': needChangePasswordOnNextLogin,
        'lastAccessInformation': JsonConverters.toJson(lastAccessInformation,'AccessInformationDto',context!)
    };

    getTypeName() => "LoginDto";
    TypeContext? context = _ctx;
}

enum AuthStatus
{
    Registered,
    PendingValidation,
    Invited,
    Active,
    Unregistered,
    Suspended,
    InActive,
    Blocked,
}

class AuthDto implements IBindableContract, IConvertible
{
    String id = "";
    AuthType? type;
    String? email;
    String? userName;
    RegistrationDto? registration;
    LoginDto? login;
    UserGeneralInfoDto? generalInfo;
    List<String>? roles;
    List<String>? pushDevices;
    List<String>? tags;
    AuthStatus? status;
    DateTime? createdOn;
    DateTime? modifiedOn;
    String? credentialVersion;

    AuthDto({this.id="",this.type,this.email,this.userName,this.registration,this.login,this.generalInfo,this.roles,this.pushDevices,this.tags,this.status,this.createdOn,this.modifiedOn,this.credentialVersion});
    AuthDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        type = JsonConverters.fromJson(json['type'],'AuthType',context!);
        email = json['email'];
        userName = json['userName'];
        registration = JsonConverters.fromJson(json['registration'],'RegistrationDto',context!);
        login = JsonConverters.fromJson(json['login'],'LoginDto',context!);
        generalInfo = JsonConverters.fromJson(json['generalInfo'],'UserGeneralInfoDto',context!);
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!);
        pushDevices = JsonConverters.fromJson(json['pushDevices'],'List<String>',context!);
        tags = JsonConverters.fromJson(json['tags'],'List<String>',context!);
        status = JsonConverters.fromJson(json['status'],'AuthStatus',context!);
        createdOn = JsonConverters.fromJson(json['createdOn'],'DateTime',context!) ?? DateTime(0);
        modifiedOn = JsonConverters.fromJson(json['modifiedOn'],'DateTime',context!) ?? DateTime(0);
        credentialVersion = json['credentialVersion'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'type': JsonConverters.toJson(type,'AuthType',context!),
        'email': email,
        'userName': userName,
        'registration': JsonConverters.toJson(registration,'RegistrationDto',context!),
        'login': JsonConverters.toJson(login,'LoginDto',context!),
        'generalInfo': JsonConverters.toJson(generalInfo,'UserGeneralInfoDto',context!),
        'roles': JsonConverters.toJson(roles,'List<String>',context!),
        'pushDevices': JsonConverters.toJson(pushDevices,'List<String>',context!),
        'tags': JsonConverters.toJson(tags,'List<String>',context!),
        'status': JsonConverters.toJson(status,'AuthStatus',context!),
        'createdOn': JsonConverters.toJson(createdOn,'DateTime',context!),
        'modifiedOn': JsonConverters.toJson(modifiedOn,'DateTime',context!),
        'credentialVersion': credentialVersion
    };

    getTypeName() => "AuthDto";
    TypeContext? context = _ctx;
}

class PaginatedResponse<TViewModelProjection> implements IConvertible
{
    List<TViewModelProjection>? items;
    bool? hasMore;
    bool? hasPrevious;
    String? startingAfter;
    String? endingBefore;

    PaginatedResponse({this.items,this.hasMore,this.hasPrevious,this.startingAfter,this.endingBefore});
    PaginatedResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        items = JsonConverters.fromJson(json['items'],'IList<${runtimeGenericTypeDefs(this,[0]).join(",")}>',context!);
        hasMore = json['hasMore'];
        hasPrevious = json['hasPrevious'];
        startingAfter = json['startingAfter'];
        endingBefore = json['endingBefore'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'items': JsonConverters.toJson(items,'List<TViewModelProjection>',context!),
        'hasMore': hasMore,
        'hasPrevious': hasPrevious,
        'startingAfter': startingAfter,
        'endingBefore': endingBefore
    };

    getTypeName() => "PaginatedResponse<$TViewModelProjection>";
    TypeContext? context = _ctx;
}

class UserMarketingPreferencesDto implements IConvertible
{
    bool? blockAllMarketingMessages;
    Map<String,Set<String>?>? blockedTags;
    List<MarketingBlockReason>? blockReasons;

    UserMarketingPreferencesDto({this.blockAllMarketingMessages,this.blockedTags,this.blockReasons});
    UserMarketingPreferencesDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        blockAllMarketingMessages = json['blockAllMarketingMessages'];
        blockedTags = JsonConverters.fromJson(json['blockedTags'],'Map<String,Set<String>?>',context!);
        blockReasons = JsonConverters.fromJson(json['blockReasons'],'List<MarketingBlockReason>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'blockAllMarketingMessages': blockAllMarketingMessages,
        'blockedTags': JsonConverters.toJson(blockedTags,'Map<String,Set<String>?>',context!),
        'blockReasons': JsonConverters.toJson(blockReasons,'List<MarketingBlockReason>',context!)
    };

    getTypeName() => "UserMarketingPreferencesDto";
    TypeContext? context = _ctx;
}

class PasskeyListItemDto implements IConvertible
{
    String credentialId = "";
    String friendlyName = "";
    DateTime? registeredOnUtc;
    DateTime? lastUsedOnUtc;
    bool? isRevoked;

    PasskeyListItemDto({this.credentialId="",this.friendlyName="",this.registeredOnUtc,this.lastUsedOnUtc,this.isRevoked});
    PasskeyListItemDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        credentialId = json['credentialId'] ?? "";
        friendlyName = json['friendlyName'] ?? "";
        registeredOnUtc = JsonConverters.fromJson(json['registeredOnUtc'],'DateTime',context!) ?? DateTime(0);
        lastUsedOnUtc = JsonConverters.fromJson(json['lastUsedOnUtc'],'DateTime',context!) ?? DateTime(0);
        isRevoked = json['isRevoked'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'credentialId': credentialId,
        'friendlyName': friendlyName,
        'registeredOnUtc': JsonConverters.toJson(registeredOnUtc,'DateTime',context!),
        'lastUsedOnUtc': JsonConverters.toJson(lastUsedOnUtc,'DateTime',context!),
        'isRevoked': isRevoked
    };

    getTypeName() => "PasskeyListItemDto";
    TypeContext? context = _ctx;
}

class TermMultiParentDto implements IConvertible
{
    // @DataMember
    String taxonomyId = "";

    // @DataMember
    String parentId = "";

    // @DataMember
    String? name;

    // @DataMember
    Map<String,String?>? names;

    TermMultiParentDto({this.taxonomyId="",this.parentId="",this.name,this.names});
    TermMultiParentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        taxonomyId = json['taxonomyId'] ?? "";
        parentId = json['parentId'] ?? "";
        name = json['name'];
        names = JsonConverters.toStringMap(json['names']);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'taxonomyId': taxonomyId,
        'parentId': parentId,
        'name': name,
        'names': names
    };

    getTypeName() => "TermMultiParentDto";
    TypeContext? context = _ctx;
}

class TermTreeDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String? taxonomyId;

    // @DataMember
    String? taxonomyName;

    // @DataMember
    String? parentId;

    // @DataMember
    int? order;

    // @DataMember
    String? name;

    // @DataMember
    Map<String,String?>? names;

    // @DataMember
    String? slug;

    // @DataMember
    String? description;

    // @DataMember
    Map<String,String?>? descriptions;

    // @DataMember
    List<TermMultiParentDto>? multiParents;

    // @DataMember
    dynamic? meta;

    // @DataMember
    List<TermTreeDto>? children;

    TermTreeDto({this.id="",this.taxonomyId,this.taxonomyName,this.parentId,this.order,this.name,this.names,this.slug,this.description,this.descriptions,this.multiParents,this.meta,this.children});
    TermTreeDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        taxonomyId = json['taxonomyId'];
        taxonomyName = json['taxonomyName'];
        parentId = json['parentId'];
        order = json['order'];
        name = json['name'];
        names = JsonConverters.toStringMap(json['names']);
        slug = json['slug'];
        description = json['description'];
        descriptions = JsonConverters.toStringMap(json['descriptions']);
        multiParents = JsonConverters.fromJson(json['multiParents'],'List<TermMultiParentDto>',context!);
        meta = JsonConverters.fromJson(json['meta'],'dynamic',context!);
        children = JsonConverters.fromJson(json['children'],'List<TermTreeDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'taxonomyId': taxonomyId,
        'taxonomyName': taxonomyName,
        'parentId': parentId,
        'order': order,
        'name': name,
        'names': names,
        'slug': slug,
        'description': description,
        'descriptions': descriptions,
        'multiParents': JsonConverters.toJson(multiParents,'List<TermMultiParentDto>',context!),
        'meta': JsonConverters.toJson(meta,'dynamic',context!),
        'children': JsonConverters.toJson(children,'List<TermTreeDto>',context!)
    };

    getTypeName() => "TermTreeDto";
    TypeContext? context = _ctx;
}

class TaxonomyTreeDto implements IConvertible
{
    // @DataMember
    String viewId = "";

    // @DataMember
    String taxonomyName = "";

    // @DataMember
    String taxonomySlug = "";

    // @DataMember
    String? parentId;

    // @DataMember
    List<TaxonomyTreeDto>? children;

    // @DataMember
    List<TermTreeDto>? terms;

    TaxonomyTreeDto({this.viewId="",this.taxonomyName="",this.taxonomySlug="",this.parentId,this.children,this.terms});
    TaxonomyTreeDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        viewId = json['viewId'] ?? "";
        taxonomyName = json['taxonomyName'] ?? "";
        taxonomySlug = json['taxonomySlug'] ?? "";
        parentId = json['parentId'];
        children = JsonConverters.fromJson(json['children'],'List<TaxonomyTreeDto>',context!);
        terms = JsonConverters.fromJson(json['terms'],'List<TermTreeDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'viewId': viewId,
        'taxonomyName': taxonomyName,
        'taxonomySlug': taxonomySlug,
        'parentId': parentId,
        'children': JsonConverters.toJson(children,'List<TaxonomyTreeDto>',context!),
        'terms': JsonConverters.toJson(terms,'List<TermTreeDto>',context!)
    };

    getTypeName() => "TaxonomyTreeDto";
    TypeContext? context = _ctx;
}

class TermDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String? taxonomyId;

    // @DataMember
    String? taxonomyName;

    // @DataMember
    String? parentId;

    // @DataMember
    int? order;

    // @DataMember
    String? name;

    // @DataMember
    Map<String,String?>? names;

    // @DataMember
    String? slug;

    // @DataMember
    String? description;

    // @DataMember
    Map<String,String?>? descriptions;

    // @DataMember
    List<TermMultiParentDto>? multiParents;

    // @DataMember
    dynamic? meta;

    // @DataMember
    String? origin;

    TermDto({this.id="",this.taxonomyId,this.taxonomyName,this.parentId,this.order,this.name,this.names,this.slug,this.description,this.descriptions,this.multiParents,this.meta,this.origin});
    TermDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        taxonomyId = json['taxonomyId'];
        taxonomyName = json['taxonomyName'];
        parentId = json['parentId'];
        order = json['order'];
        name = json['name'];
        names = JsonConverters.toStringMap(json['names']);
        slug = json['slug'];
        description = json['description'];
        descriptions = JsonConverters.toStringMap(json['descriptions']);
        multiParents = JsonConverters.fromJson(json['multiParents'],'List<TermMultiParentDto>',context!);
        meta = JsonConverters.fromJson(json['meta'],'dynamic',context!);
        origin = json['origin'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'taxonomyId': taxonomyId,
        'taxonomyName': taxonomyName,
        'parentId': parentId,
        'order': order,
        'name': name,
        'names': names,
        'slug': slug,
        'description': description,
        'descriptions': descriptions,
        'multiParents': JsonConverters.toJson(multiParents,'List<TermMultiParentDto>',context!),
        'meta': JsonConverters.toJson(meta,'dynamic',context!),
        'origin': origin
    };

    getTypeName() => "TermDto";
    TypeContext? context = _ctx;
}

class DataSchemaDto implements IConvertible
{
    // @DataMember
    String json = "";

    // @DataMember
    List<JsonSchemaFieldDto> fields = [];

    DataSchemaDto({this.json="",this.fields=const []});
    DataSchemaDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        json = json['json'] ?? "";
        fields = JsonConverters.fromJson(json['fields'],'List<JsonSchemaFieldDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'json': json,
        'fields': JsonConverters.toJson(fields,'List<JsonSchemaFieldDto>',context!)
    };

    getTypeName() => "DataSchemaDto";
    TypeContext? context = _ctx;
}

class VisualSchemaDto implements IConvertible
{
    // @DataMember
    String json = "";

    VisualSchemaDto({this.json=""});
    VisualSchemaDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        json = json['json'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'json': json
    };

    getTypeName() => "VisualSchemaDto";
    TypeContext? context = _ctx;
}

class SchemaUniqueIndexDto implements IConvertible
{
    // @DataMember
    List<String> fields = [];

    SchemaUniqueIndexDto({this.fields=const []});
    SchemaUniqueIndexDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        fields = JsonConverters.fromJson(json['fields'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'fields': JsonConverters.toJson(fields,'List<String>',context!)
    };

    getTypeName() => "SchemaUniqueIndexDto";
    TypeContext? context = _ctx;
}

class SchemaSettingsDto implements IConvertible
{
    // @DataMember
    bool? softDelete;

    // @DataMember
    bool? hasRecordOwner;

    // @DataMember
    String? description;

    // @DataMember
    List<SchemaUniqueIndexDto>? uniqueIndexes;

    // @DataMember
    bool? endUserOwnRecords;

    SchemaSettingsDto({this.softDelete,this.hasRecordOwner,this.description,this.uniqueIndexes,this.endUserOwnRecords});
    SchemaSettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        softDelete = json['softDelete'];
        hasRecordOwner = json['hasRecordOwner'];
        description = json['description'];
        uniqueIndexes = JsonConverters.fromJson(json['uniqueIndexes'],'List<SchemaUniqueIndexDto>',context!);
        endUserOwnRecords = json['endUserOwnRecords'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'softDelete': softDelete,
        'hasRecordOwner': hasRecordOwner,
        'description': description,
        'uniqueIndexes': JsonConverters.toJson(uniqueIndexes,'List<SchemaUniqueIndexDto>',context!),
        'endUserOwnRecords': endUserOwnRecords
    };

    getTypeName() => "SchemaSettingsDto";
    TypeContext? context = _ctx;
}

class SchemaEmbedSettingsDto implements IConvertible
{
    // @DataMember
    bool? enabled;

    // @DataMember
    List<String> fields = [];

    // @DataMember
    String? embeddingIntegrationId;

    // @DataMember
    bool? perUser;

    SchemaEmbedSettingsDto({this.enabled,this.fields=const [],this.embeddingIntegrationId,this.perUser});
    SchemaEmbedSettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        enabled = json['enabled'];
        fields = JsonConverters.fromJson(json['fields'],'List<String>',context!) ?? [];
        embeddingIntegrationId = json['embeddingIntegrationId'];
        perUser = json['perUser'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'fields': JsonConverters.toJson(fields,'List<String>',context!),
        'embeddingIntegrationId': embeddingIntegrationId,
        'perUser': perUser
    };

    getTypeName() => "SchemaEmbedSettingsDto";
    TypeContext? context = _ctx;
}

enum TriggerType
{
    Membership,
    Schema,
    Files,
    Payments,
    Ai,
}

enum TriggerActionType
{
    Code,
    Push,
    Sms,
    Email,
    WebhookCall,
    SseCall,
    Marketplace,
    Workflow,
}

// @DataContract
abstract class TriggerActionDto
{
    // @DataMember
    TriggerActionType? type;

    // @DataMember
    String? integrationId;

    TriggerActionDto({this.type,this.integrationId});
    TriggerActionDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        type = JsonConverters.fromJson(json['type'],'TriggerActionType',context!);
        integrationId = json['integrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'type': JsonConverters.toJson(type,'TriggerActionType',context!),
        'integrationId': integrationId
    };

    getTypeName() => "TriggerActionDto";
    TypeContext? context = _ctx;
}

// @DataContract
class ExecutionIdentitySummaryDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String name = "";

    // @DataMember
    bool? isDefault;

    // @DataMember
    String status = "";

    ExecutionIdentitySummaryDto({this.id="",this.name="",this.isDefault,this.status=""});
    ExecutionIdentitySummaryDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        name = json['name'] ?? "";
        isDefault = json['isDefault'];
        status = json['status'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'isDefault': isDefault,
        'status': status
    };

    getTypeName() => "ExecutionIdentitySummaryDto";
    TypeContext? context = _ctx;
}

// @DataContract
class TriggerDto implements IHasViewId, IQueuedTrigger, IConvertible
{
    // @DataMember
    TriggerType? type;

    // @DataMember
    String viewId = "";

    // @DataMember
    String name = "";

    // @DataMember
    TriggerActionDto? thenAction;

    // @DataMember
    String? description;

    // @DataMember
    bool? isEnabled;

    // @DataMember
    String? activationCode;

    // @DataMember
    int? order;

    // @DataMember
    bool? breakOnError;

    // @DataMember
    String? savedByAuthId;

    // @DataMember
    String? executionIdentityId;

    // @DataMember
    ExecutionIdentitySummaryDto? executionIdentity;

    TriggerDto({this.type,this.viewId="",this.name="",this.thenAction,this.description,this.isEnabled,this.activationCode,this.order,this.breakOnError,this.savedByAuthId,this.executionIdentityId,this.executionIdentity});
    TriggerDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        type = JsonConverters.fromJson(json['type'],'TriggerType',context!);
        viewId = json['viewId'] ?? "";
        name = json['name'] ?? "";
        thenAction = JsonConverters.fromJson(json['thenAction'],'TriggerActionDto',context!);
        description = json['description'];
        isEnabled = json['isEnabled'];
        activationCode = json['activationCode'];
        order = json['order'];
        breakOnError = json['breakOnError'];
        savedByAuthId = json['savedByAuthId'];
        executionIdentityId = json['executionIdentityId'];
        executionIdentity = JsonConverters.fromJson(json['executionIdentity'],'ExecutionIdentitySummaryDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'type': JsonConverters.toJson(type,'TriggerType',context!),
        'viewId': viewId,
        'name': name,
        'thenAction': JsonConverters.toJson(thenAction,'TriggerActionDto',context!),
        'description': description,
        'isEnabled': isEnabled,
        'activationCode': activationCode,
        'order': order,
        'breakOnError': breakOnError,
        'savedByAuthId': savedByAuthId,
        'executionIdentityId': executionIdentityId,
        'executionIdentity': JsonConverters.toJson(executionIdentity,'ExecutionIdentitySummaryDto',context!)
    };

    getTypeName() => "TriggerDto";
    TypeContext? context = _ctx;
}

class SchemaDto implements IHasViewId, IConvertible
{
    // @DataMember
    String viewId = "";

    // @DataMember
    String schemaName = "";

    // @DataMember
    String? schemaSlug;

    // @DataMember
    int version = 0;

    // @DataMember
    int metaSchemaVersion = 0;

    // @DataMember
    DataSchemaDto? dataSchema;

    // @DataMember
    VisualSchemaDto? visualSchema;

    // @DataMember
    DateTime? publishedAt;

    // @DataMember
    SchemaSettingsDto? settings;

    // @DataMember
    SchemaEmbedSettingsDto? embed;

    // @DataMember
    List<TriggerDto>? triggers;

    SchemaDto({this.viewId="",this.schemaName="",this.schemaSlug,this.version=0,this.metaSchemaVersion=0,this.dataSchema,this.visualSchema,this.publishedAt,this.settings,this.embed,this.triggers});
    SchemaDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        viewId = json['viewId'] ?? "";
        schemaName = json['schemaName'] ?? "";
        schemaSlug = json['schemaSlug'];
        version = json['version'] ?? 0;
        metaSchemaVersion = json['metaSchemaVersion'] ?? 0;
        dataSchema = JsonConverters.fromJson(json['dataSchema'],'DataSchemaDto',context!);
        visualSchema = JsonConverters.fromJson(json['visualSchema'],'VisualSchemaDto',context!);
        publishedAt = JsonConverters.fromJson(json['publishedAt'],'DateTime',context!) ?? DateTime(0);
        settings = JsonConverters.fromJson(json['settings'],'SchemaSettingsDto',context!);
        embed = JsonConverters.fromJson(json['embed'],'SchemaEmbedSettingsDto',context!);
        triggers = JsonConverters.fromJson(json['triggers'],'List<TriggerDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'viewId': viewId,
        'schemaName': schemaName,
        'schemaSlug': schemaSlug,
        'version': version,
        'metaSchemaVersion': metaSchemaVersion,
        'dataSchema': JsonConverters.toJson(dataSchema,'DataSchemaDto',context!),
        'visualSchema': JsonConverters.toJson(visualSchema,'VisualSchemaDto',context!),
        'publishedAt': JsonConverters.toJson(publishedAt,'DateTime',context!),
        'settings': JsonConverters.toJson(settings,'SchemaSettingsDto',context!),
        'embed': JsonConverters.toJson(embed,'SchemaEmbedSettingsDto',context!),
        'triggers': JsonConverters.toJson(triggers,'List<TriggerDto>',context!)
    };

    getTypeName() => "SchemaDto";
    TypeContext? context = _ctx;
}

class SchemaListProjection implements IHasViewId, IConvertible
{
    // @DataMember
    String viewId = "";

    // @DataMember
    String schemaName = "";

    // @DataMember
    String schemaTitle = "";

    // @DataMember
    int? latestVersion;

    // @DataMember
    bool? hasDraft;

    // @DataMember
    int metaSchemaVersion = 0;

    // @DataMember
    String? description;

    // @DataMember
    String? env;

    SchemaListProjection({this.viewId="",this.schemaName="",this.schemaTitle="",this.latestVersion,this.hasDraft,this.metaSchemaVersion=0,this.description,this.env});
    SchemaListProjection.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        viewId = json['viewId'] ?? "";
        schemaName = json['schemaName'] ?? "";
        schemaTitle = json['schemaTitle'] ?? "";
        latestVersion = json['latestVersion'];
        hasDraft = json['hasDraft'];
        metaSchemaVersion = json['metaSchemaVersion'] ?? 0;
        description = json['description'];
        env = json['env'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'viewId': viewId,
        'schemaName': schemaName,
        'schemaTitle': schemaTitle,
        'latestVersion': latestVersion,
        'hasDraft': hasDraft,
        'metaSchemaVersion': metaSchemaVersion,
        'description': description,
        'env': env
    };

    getTypeName() => "SchemaListProjection";
    TypeContext? context = _ctx;
}

// @DataContract
class PublicFolderDto implements IConvertible
{
    // @DataMember(Order=1)
    String path = "";

    // @DataMember(Order=2)
    String publicId = "";

    // @DataMember(Order=3)
    String? publicUrl;

    // @DataMember(Order=4)
    bool? inherited;

    PublicFolderDto({this.path="",this.publicId="",this.publicUrl,this.inherited});
    PublicFolderDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        path = json['path'] ?? "";
        publicId = json['publicId'] ?? "";
        publicUrl = json['publicUrl'];
        inherited = json['inherited'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'path': path,
        'publicId': publicId,
        'publicUrl': publicUrl,
        'inherited': inherited
    };

    getTypeName() => "PublicFolderDto";
    TypeContext? context = _ctx;
}

class RegisterFileResult implements IConvertible
{
    int index = 0;
    String? path;
    String? ownerUserId;
    String? status;
    String? fileId;
    bool? verified;
    String? warning;
    String? errorCode;
    int? errorStatus;
    String? error;

    RegisterFileResult({this.index=0,this.path,this.ownerUserId,this.status,this.fileId,this.verified,this.warning,this.errorCode,this.errorStatus,this.error});
    RegisterFileResult.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        index = json['index'] ?? 0;
        path = json['path'];
        ownerUserId = json['ownerUserId'];
        status = json['status'];
        fileId = json['fileId'];
        verified = json['verified'];
        warning = json['warning'];
        errorCode = json['errorCode'];
        errorStatus = json['errorStatus'];
        error = json['error'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'index': index,
        'path': path,
        'ownerUserId': ownerUserId,
        'status': status,
        'fileId': fileId,
        'verified': verified,
        'warning': warning,
        'errorCode': errorCode,
        'errorStatus': errorStatus,
        'error': error
    };

    getTypeName() => "RegisterFileResult";
    TypeContext? context = _ctx;
}

// @DataContract
class OwnPushDeviceDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String provider = "";

    // @DataMember
    String token = "";

    // @DataMember
    String? platform;

    // @DataMember
    String? osName;

    // @DataMember
    String? osVersion;

    // @DataMember
    String? appVersion;

    // @DataMember
    String? deviceName;

    // @DataMember
    String? modelName;

    // @DataMember
    String? brand;

    // @DataMember
    String? installationId;

    // @DataMember
    String? locale;

    // @DataMember
    String? timeZone;

    // @DataMember
    DateTime? updatedAtUtc;

    OwnPushDeviceDto({this.id="",this.provider="",this.token="",this.platform,this.osName,this.osVersion,this.appVersion,this.deviceName,this.modelName,this.brand,this.installationId,this.locale,this.timeZone,this.updatedAtUtc});
    OwnPushDeviceDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        provider = json['provider'] ?? "";
        token = json['token'] ?? "";
        platform = json['platform'];
        osName = json['osName'];
        osVersion = json['osVersion'];
        appVersion = json['appVersion'];
        deviceName = json['deviceName'];
        modelName = json['modelName'];
        brand = json['brand'];
        installationId = json['installationId'];
        locale = json['locale'];
        timeZone = json['timeZone'];
        updatedAtUtc = JsonConverters.fromJson(json['updatedAtUtc'],'DateTime',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'provider': provider,
        'token': token,
        'platform': platform,
        'osName': osName,
        'osVersion': osVersion,
        'appVersion': appVersion,
        'deviceName': deviceName,
        'modelName': modelName,
        'brand': brand,
        'installationId': installationId,
        'locale': locale,
        'timeZone': timeZone,
        'updatedAtUtc': JsonConverters.toJson(updatedAtUtc,'DateTime',context!)
    };

    getTypeName() => "OwnPushDeviceDto";
    TypeContext? context = _ctx;
}

// @DataContract
class OwnPushMessageDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String campaignId = "";

    // @DataMember
    String? title;

    // @DataMember
    String? body;

    // @DataMember
    DateTime? sentAtUtc;

    // @DataMember
    bool? isRead;

    // @DataMember
    DateTime? readAtUtc;

    OwnPushMessageDto({this.id="",this.campaignId="",this.title,this.body,this.sentAtUtc,this.isRead,this.readAtUtc});
    OwnPushMessageDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        campaignId = json['campaignId'] ?? "";
        title = json['title'];
        body = json['body'];
        sentAtUtc = JsonConverters.fromJson(json['sentAtUtc'],'DateTime',context!);
        isRead = json['isRead'];
        readAtUtc = JsonConverters.fromJson(json['readAtUtc'],'DateTime',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'campaignId': campaignId,
        'title': title,
        'body': body,
        'sentAtUtc': JsonConverters.toJson(sentAtUtc,'DateTime',context!),
        'isRead': isRead,
        'readAtUtc': JsonConverters.toJson(readAtUtc,'DateTime',context!)
    };

    getTypeName() => "OwnPushMessageDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PaymentOrderLineDto implements IConvertible
{
    // @DataMember
    String sku = "";

    // @DataMember
    String title = "";

    // @DataMember
    int quantity = 0;

    // @DataMember
    int unitAmountMinor = 0;

    // @DataMember
    int amountMinor = 0;

    PaymentOrderLineDto({this.sku="",this.title="",this.quantity=0,this.unitAmountMinor=0,this.amountMinor=0});
    PaymentOrderLineDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        sku = json['sku'] ?? "";
        title = json['title'] ?? "";
        quantity = json['quantity'] ?? 0;
        unitAmountMinor = json['unitAmountMinor'] ?? 0;
        amountMinor = json['amountMinor'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'sku': sku,
        'title': title,
        'quantity': quantity,
        'unitAmountMinor': unitAmountMinor,
        'amountMinor': amountMinor
    };

    getTypeName() => "PaymentOrderLineDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PaymentOrderCheckoutDto implements IConvertible
{
    // @DataMember
    int attempt = 0;

    // @DataMember
    String integrationId = "";

    // @DataMember
    String provider = "";

    // @DataMember
    String providerOrderId = "";

    // @DataMember
    String providerReference = "";

    // @DataMember
    String paymentUrl = "";

    // @DataMember
    String method = "";

    // @DataMember
    DateTime? startedOnUtc;

    // @DataMember
    DateTime? expiresAtUtc;

    PaymentOrderCheckoutDto({this.attempt=0,this.integrationId="",this.provider="",this.providerOrderId="",this.providerReference="",this.paymentUrl="",this.method="",this.startedOnUtc,this.expiresAtUtc});
    PaymentOrderCheckoutDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        attempt = json['attempt'] ?? 0;
        integrationId = json['integrationId'] ?? "";
        provider = json['provider'] ?? "";
        providerOrderId = json['providerOrderId'] ?? "";
        providerReference = json['providerReference'] ?? "";
        paymentUrl = json['paymentUrl'] ?? "";
        method = json['method'] ?? "";
        startedOnUtc = JsonConverters.fromJson(json['startedOnUtc'],'DateTime',context!) ?? DateTime(0);
        expiresAtUtc = JsonConverters.fromJson(json['expiresAtUtc'],'DateTime',context!) ?? DateTime(0);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'attempt': attempt,
        'integrationId': integrationId,
        'provider': provider,
        'providerOrderId': providerOrderId,
        'providerReference': providerReference,
        'paymentUrl': paymentUrl,
        'method': method,
        'startedOnUtc': JsonConverters.toJson(startedOnUtc,'DateTime',context!),
        'expiresAtUtc': JsonConverters.toJson(expiresAtUtc,'DateTime',context!)
    };

    getTypeName() => "PaymentOrderCheckoutDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PaymentOrderDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String env = "";

    // @DataMember
    String buyerUserId = "";

    // @DataMember
    String merchantReference = "";

    // @DataMember
    String currency = "";

    // @DataMember
    String priceVersion = "";

    // @DataMember
    List<PaymentOrderLineDto> lines = [];

    // @DataMember
    int totalMinor = 0;

    // @DataMember
    Map<String,String?> metadata = {};

    // @DataMember
    String status = "";

    // @DataMember
    DateTime? createdOnUtc;

    // @DataMember
    DateTime? updatedOnUtc;

    // @DataMember
    List<PaymentOrderCheckoutDto> checkouts = [];

    // @DataMember
    int? settledMinor;

    // @DataMember
    int refundedMinor = 0;

    // @DataMember
    DateTime? paidOnUtc;

    // @DataMember
    String? providerPaymentId;

    // @DataMember
    List<String> mismatches = [];

    PaymentOrderDto({this.id="",this.env="",this.buyerUserId="",this.merchantReference="",this.currency="",this.priceVersion="",this.lines=const [],this.totalMinor=0,this.metadata=const {},this.status="",this.createdOnUtc,this.updatedOnUtc,this.checkouts=const [],this.settledMinor,this.refundedMinor=0,this.paidOnUtc,this.providerPaymentId,this.mismatches=const []});
    PaymentOrderDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        env = json['env'] ?? "";
        buyerUserId = json['buyerUserId'] ?? "";
        merchantReference = json['merchantReference'] ?? "";
        currency = json['currency'] ?? "";
        priceVersion = json['priceVersion'] ?? "";
        lines = JsonConverters.fromJson(json['lines'],'List<PaymentOrderLineDto>',context!) ?? [];
        totalMinor = json['totalMinor'] ?? 0;
        metadata = JsonConverters.toStringMap(json['metadata']) ?? {};
        status = json['status'] ?? "";
        createdOnUtc = JsonConverters.fromJson(json['createdOnUtc'],'DateTime',context!) ?? DateTime(0);
        updatedOnUtc = JsonConverters.fromJson(json['updatedOnUtc'],'DateTime',context!) ?? DateTime(0);
        checkouts = JsonConverters.fromJson(json['checkouts'],'List<PaymentOrderCheckoutDto>',context!) ?? [];
        settledMinor = json['settledMinor'];
        refundedMinor = json['refundedMinor'] ?? 0;
        paidOnUtc = JsonConverters.fromJson(json['paidOnUtc'],'DateTime',context!);
        providerPaymentId = json['providerPaymentId'];
        mismatches = JsonConverters.fromJson(json['mismatches'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'env': env,
        'buyerUserId': buyerUserId,
        'merchantReference': merchantReference,
        'currency': currency,
        'priceVersion': priceVersion,
        'lines': JsonConverters.toJson(lines,'List<PaymentOrderLineDto>',context!),
        'totalMinor': totalMinor,
        'metadata': metadata,
        'status': status,
        'createdOnUtc': JsonConverters.toJson(createdOnUtc,'DateTime',context!),
        'updatedOnUtc': JsonConverters.toJson(updatedOnUtc,'DateTime',context!),
        'checkouts': JsonConverters.toJson(checkouts,'List<PaymentOrderCheckoutDto>',context!),
        'settledMinor': settledMinor,
        'refundedMinor': refundedMinor,
        'paidOnUtc': JsonConverters.toJson(paidOnUtc,'DateTime',context!),
        'providerPaymentId': providerPaymentId,
        'mismatches': JsonConverters.toJson(mismatches,'List<String>',context!)
    };

    getTypeName() => "PaymentOrderDto";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunActorDto implements IConvertible
{
    // @DataMember
    String? userId;

    // @DataMember
    String kind = "";

    WorkflowRunActorDto({this.userId,this.kind=""});
    WorkflowRunActorDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        userId = json['userId'];
        kind = json['kind'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'userId': userId,
        'kind': kind
    };

    getTypeName() => "WorkflowRunActorDto";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowWaitingOnDto implements IConvertible
{
    // @DataMember
    String stepId = "";

    // @DataMember
    String kind = "";

    // @DataMember
    DateTime? until;

    // @DataMember
    String? key;

    // @DataMember
    List<String>? assignees;

    WorkflowWaitingOnDto({this.stepId="",this.kind="",this.until,this.key,this.assignees});
    WorkflowWaitingOnDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        stepId = json['stepId'] ?? "";
        kind = json['kind'] ?? "";
        until = JsonConverters.fromJson(json['until'],'DateTime',context!);
        key = json['key'];
        assignees = JsonConverters.fromJson(json['assignees'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'stepId': stepId,
        'kind': kind,
        'until': JsonConverters.toJson(until,'DateTime',context!),
        'key': key,
        'assignees': JsonConverters.toJson(assignees,'List<String>',context!)
    };

    getTypeName() => "WorkflowWaitingOnDto";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunErrorDto implements IConvertible
{
    // @DataMember
    String? code;

    // @DataMember
    String? stepId;

    // @DataMember
    String? reason;

    // @DataMember
    String? message;

    WorkflowRunErrorDto({this.code,this.stepId,this.reason,this.message});
    WorkflowRunErrorDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        code = json['code'];
        stepId = json['stepId'];
        reason = json['reason'];
        message = json['message'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'code': code,
        'stepId': stepId,
        'reason': reason,
        'message': message
    };

    getTypeName() => "WorkflowRunErrorDto";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunListProjection implements IConvertible
{
    // @DataMember
    String runId = "";

    // @DataMember
    String workflowId = "";

    // @DataMember
    int? version;

    // @DataMember
    bool? isDraft;

    // @DataMember
    String status = "";

    // @DataMember
    String source = "";

    // @DataMember
    DateTime? startedAt;

    // @DataMember
    DateTime? finishedAt;

    // @DataMember
    int? durationMs;

    // @DataMember
    WorkflowRunActorDto? startedBy;

    // @DataMember
    String? executionIdentityId;

    // @DataMember
    String? executionIdentityName;

    // @DataMember
    bool? executionIdentityIsDefault;

    // @DataMember
    List<String> currentStepIds = [];

    // @DataMember
    List<WorkflowWaitingOnDto> waitingOn = [];

    // @DataMember
    WorkflowRunErrorDto? error;

    WorkflowRunListProjection({this.runId="",this.workflowId="",this.version,this.isDraft,this.status="",this.source="",this.startedAt,this.finishedAt,this.durationMs,this.startedBy,this.executionIdentityId,this.executionIdentityName,this.executionIdentityIsDefault,this.currentStepIds=const [],this.waitingOn=const [],this.error});
    WorkflowRunListProjection.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        runId = json['runId'] ?? "";
        workflowId = json['workflowId'] ?? "";
        version = json['version'];
        isDraft = json['isDraft'];
        status = json['status'] ?? "";
        source = json['source'] ?? "";
        startedAt = JsonConverters.fromJson(json['startedAt'],'DateTime',context!) ?? DateTime(0);
        finishedAt = JsonConverters.fromJson(json['finishedAt'],'DateTime',context!);
        durationMs = json['durationMs'];
        startedBy = JsonConverters.fromJson(json['startedBy'],'WorkflowRunActorDto',context!);
        executionIdentityId = json['executionIdentityId'];
        executionIdentityName = json['executionIdentityName'];
        executionIdentityIsDefault = json['executionIdentityIsDefault'];
        currentStepIds = JsonConverters.fromJson(json['currentStepIds'],'List<String>',context!) ?? [];
        waitingOn = JsonConverters.fromJson(json['waitingOn'],'List<WorkflowWaitingOnDto>',context!) ?? [];
        error = JsonConverters.fromJson(json['error'],'WorkflowRunErrorDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'runId': runId,
        'workflowId': workflowId,
        'version': version,
        'isDraft': isDraft,
        'status': status,
        'source': source,
        'startedAt': JsonConverters.toJson(startedAt,'DateTime',context!),
        'finishedAt': JsonConverters.toJson(finishedAt,'DateTime',context!),
        'durationMs': durationMs,
        'startedBy': JsonConverters.toJson(startedBy,'WorkflowRunActorDto',context!),
        'executionIdentityId': executionIdentityId,
        'executionIdentityName': executionIdentityName,
        'executionIdentityIsDefault': executionIdentityIsDefault,
        'currentStepIds': JsonConverters.toJson(currentStepIds,'List<String>',context!),
        'waitingOn': JsonConverters.toJson(waitingOn,'List<WorkflowWaitingOnDto>',context!),
        'error': JsonConverters.toJson(error,'WorkflowRunErrorDto',context!)
    };

    getTypeName() => "WorkflowRunListProjection";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunStepDto implements IConvertible
{
    // @DataMember
    String stepId = "";

    // @DataMember
    String kind = "";

    // @DataMember
    String? name;

    // @DataMember
    String status = "";

    // @DataMember
    int attempt = 0;

    // @DataMember
    int pass = 0;

    // @DataMember
    DateTime? startedAt;

    // @DataMember
    DateTime? finishedAt;

    // @DataMember
    int? durationMs;

    // @DataMember
    dynamic? input;

    // @DataMember
    bool? inputTruncated;

    // @DataMember
    dynamic? output;

    // @DataMember
    bool? outputTruncated;

    // @DataMember
    WorkflowRunErrorDto? error;

    // @DataMember
    WorkflowRunActorDto? resumedBy;

    // @DataMember
    String? decision;

    WorkflowRunStepDto({this.stepId="",this.kind="",this.name,this.status="",this.attempt=0,this.pass=0,this.startedAt,this.finishedAt,this.durationMs,this.input,this.inputTruncated,this.output,this.outputTruncated,this.error,this.resumedBy,this.decision});
    WorkflowRunStepDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        stepId = json['stepId'] ?? "";
        kind = json['kind'] ?? "";
        name = json['name'];
        status = json['status'] ?? "";
        attempt = json['attempt'] ?? 0;
        pass = json['pass'] ?? 0;
        startedAt = JsonConverters.fromJson(json['startedAt'],'DateTime',context!);
        finishedAt = JsonConverters.fromJson(json['finishedAt'],'DateTime',context!);
        durationMs = json['durationMs'];
        input = JsonConverters.fromJson(json['input'],'dynamic',context!);
        inputTruncated = json['inputTruncated'];
        output = JsonConverters.fromJson(json['output'],'dynamic',context!);
        outputTruncated = json['outputTruncated'];
        error = JsonConverters.fromJson(json['error'],'WorkflowRunErrorDto',context!);
        resumedBy = JsonConverters.fromJson(json['resumedBy'],'WorkflowRunActorDto',context!);
        decision = json['decision'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'stepId': stepId,
        'kind': kind,
        'name': name,
        'status': status,
        'attempt': attempt,
        'pass': pass,
        'startedAt': JsonConverters.toJson(startedAt,'DateTime',context!),
        'finishedAt': JsonConverters.toJson(finishedAt,'DateTime',context!),
        'durationMs': durationMs,
        'input': JsonConverters.toJson(input,'dynamic',context!),
        'inputTruncated': inputTruncated,
        'output': JsonConverters.toJson(output,'dynamic',context!),
        'outputTruncated': outputTruncated,
        'error': JsonConverters.toJson(error,'WorkflowRunErrorDto',context!),
        'resumedBy': JsonConverters.toJson(resumedBy,'WorkflowRunActorDto',context!),
        'decision': decision
    };

    getTypeName() => "WorkflowRunStepDto";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunDto implements IConvertible
{
    // @DataMember
    String runId = "";

    // @DataMember
    String workflowId = "";

    // @DataMember
    int? version;

    // @DataMember
    bool? isDraft;

    // @DataMember
    String status = "";

    // @DataMember
    String source = "";

    // @DataMember
    WorkflowRunActorDto? startedBy;

    // @DataMember
    String? triggerId;

    // @DataMember
    String? taskId;

    // @DataMember
    String? parentRunId;

    // @DataMember
    int depth = 0;

    // @DataMember
    String env = "";

    // @DataMember
    String? correlationId;

    // @DataMember
    String? executionIdentityId;

    // @DataMember
    String? executionIdentityName;

    // @DataMember
    bool? executionIdentityIsDefault;

    // @DataMember
    DateTime? startedAt;

    // @DataMember
    DateTime? finishedAt;

    // @DataMember
    int? durationMs;

    // @DataMember
    List<WorkflowWaitingOnDto> waitingOn = [];

    // @DataMember
    WorkflowRunErrorDto? error;

    // @DataMember
    dynamic? output;

    // @DataMember
    int stepRuns = 0;

    // @DataMember
    List<WorkflowRunStepDto> steps = [];

    // @DataMember
    Map<String,dynamic?>? request;

    // @DataMember
    Map<String,dynamic?>? trigger;

    WorkflowRunDto({this.runId="",this.workflowId="",this.version,this.isDraft,this.status="",this.source="",this.startedBy,this.triggerId,this.taskId,this.parentRunId,this.depth=0,this.env="",this.correlationId,this.executionIdentityId,this.executionIdentityName,this.executionIdentityIsDefault,this.startedAt,this.finishedAt,this.durationMs,this.waitingOn=const [],this.error,this.output,this.stepRuns=0,this.steps=const [],this.request,this.trigger});
    WorkflowRunDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        runId = json['runId'] ?? "";
        workflowId = json['workflowId'] ?? "";
        version = json['version'];
        isDraft = json['isDraft'];
        status = json['status'] ?? "";
        source = json['source'] ?? "";
        startedBy = JsonConverters.fromJson(json['startedBy'],'WorkflowRunActorDto',context!);
        triggerId = json['triggerId'];
        taskId = json['taskId'];
        parentRunId = json['parentRunId'];
        depth = json['depth'] ?? 0;
        env = json['env'] ?? "";
        correlationId = json['correlationId'];
        executionIdentityId = json['executionIdentityId'];
        executionIdentityName = json['executionIdentityName'];
        executionIdentityIsDefault = json['executionIdentityIsDefault'];
        startedAt = JsonConverters.fromJson(json['startedAt'],'DateTime',context!) ?? DateTime(0);
        finishedAt = JsonConverters.fromJson(json['finishedAt'],'DateTime',context!);
        durationMs = json['durationMs'];
        waitingOn = JsonConverters.fromJson(json['waitingOn'],'List<WorkflowWaitingOnDto>',context!) ?? [];
        error = JsonConverters.fromJson(json['error'],'WorkflowRunErrorDto',context!);
        output = JsonConverters.fromJson(json['output'],'dynamic',context!);
        stepRuns = json['stepRuns'] ?? 0;
        steps = JsonConverters.fromJson(json['steps'],'List<WorkflowRunStepDto>',context!) ?? [];
        request = JsonConverters.fromJson(json['request'],'Map<String,dynamic?>',context!);
        trigger = JsonConverters.fromJson(json['trigger'],'Map<String,dynamic?>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'runId': runId,
        'workflowId': workflowId,
        'version': version,
        'isDraft': isDraft,
        'status': status,
        'source': source,
        'startedBy': JsonConverters.toJson(startedBy,'WorkflowRunActorDto',context!),
        'triggerId': triggerId,
        'taskId': taskId,
        'parentRunId': parentRunId,
        'depth': depth,
        'env': env,
        'correlationId': correlationId,
        'executionIdentityId': executionIdentityId,
        'executionIdentityName': executionIdentityName,
        'executionIdentityIsDefault': executionIdentityIsDefault,
        'startedAt': JsonConverters.toJson(startedAt,'DateTime',context!),
        'finishedAt': JsonConverters.toJson(finishedAt,'DateTime',context!),
        'durationMs': durationMs,
        'waitingOn': JsonConverters.toJson(waitingOn,'List<WorkflowWaitingOnDto>',context!),
        'error': JsonConverters.toJson(error,'WorkflowRunErrorDto',context!),
        'output': JsonConverters.toJson(output,'dynamic',context!),
        'stepRuns': stepRuns,
        'steps': JsonConverters.toJson(steps,'List<WorkflowRunStepDto>',context!),
        'request': JsonConverters.toJson(request,'Map<String,dynamic?>',context!),
        'trigger': JsonConverters.toJson(trigger,'Map<String,dynamic?>',context!)
    };

    getTypeName() => "WorkflowRunDto";
    TypeContext? context = _ctx;
}

// @DataContract
class TenantLogEntryDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    DateTime? timestamp;

    // @DataMember
    String module = "";

    // @DataMember
    String level = "";

    // @DataMember
    String eventCode = "";

    // @DataMember
    String title = "";

    // @DataMember
    String message = "";

    // @DataMember
    String? correlationId;

    // @DataMember
    String? traceId;

    // @DataMember
    String? spanId;

    // @DataMember
    String env = "";

    // @DataMember
    String origin = "";

    // @DataMember
    IReadOnlyDictionary<String,String>? meta;

    TenantLogEntryDto({this.id="",this.timestamp,this.module="",this.level="",this.eventCode="",this.title="",this.message="",this.correlationId,this.traceId,this.spanId,this.env="",this.origin="",this.meta});
    TenantLogEntryDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        timestamp = JsonConverters.fromJson(json['timestamp'],'DateTime',context!) ?? DateTime(0);
        module = json['module'] ?? "";
        level = json['level'] ?? "";
        eventCode = json['eventCode'] ?? "";
        title = json['title'] ?? "";
        message = json['message'] ?? "";
        correlationId = json['correlationId'];
        traceId = json['traceId'];
        spanId = json['spanId'];
        env = json['env'] ?? "";
        origin = json['origin'] ?? "";
        meta = JsonConverters.fromJson(json['meta'],'IReadOnlyDictionary<String,String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'timestamp': JsonConverters.toJson(timestamp,'DateTime',context!),
        'module': module,
        'level': level,
        'eventCode': eventCode,
        'title': title,
        'message': message,
        'correlationId': correlationId,
        'traceId': traceId,
        'spanId': spanId,
        'env': env,
        'origin': origin,
        'meta': JsonConverters.toJson(meta,'IReadOnlyDictionary<String,String>',context!)
    };

    getTypeName() => "TenantLogEntryDto";
    TypeContext? context = _ctx;
}

class InAppNotificationDto implements IConvertible
{
    String id = "";
    String projectId = "";
    String userId = "";
    String channel = "";
    String eventName = "";
    String? payloadJson;
    bool? isRead;
    DateTime? seenAtUtc;
    DateTime? readAtUtc;
    DateTime? createdAtUtc;

    InAppNotificationDto({this.id="",this.projectId="",this.userId="",this.channel="",this.eventName="",this.payloadJson,this.isRead,this.seenAtUtc,this.readAtUtc,this.createdAtUtc});
    InAppNotificationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        projectId = json['projectId'] ?? "";
        userId = json['userId'] ?? "";
        channel = json['channel'] ?? "";
        eventName = json['eventName'] ?? "";
        payloadJson = json['payloadJson'];
        isRead = json['isRead'];
        seenAtUtc = JsonConverters.fromJson(json['seenAtUtc'],'DateTime',context!);
        readAtUtc = JsonConverters.fromJson(json['readAtUtc'],'DateTime',context!);
        createdAtUtc = JsonConverters.fromJson(json['createdAtUtc'],'DateTime',context!) ?? DateTime(0);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'projectId': projectId,
        'userId': userId,
        'channel': channel,
        'eventName': eventName,
        'payloadJson': payloadJson,
        'isRead': isRead,
        'seenAtUtc': JsonConverters.toJson(seenAtUtc,'DateTime',context!),
        'readAtUtc': JsonConverters.toJson(readAtUtc,'DateTime',context!),
        'createdAtUtc': JsonConverters.toJson(createdAtUtc,'DateTime',context!)
    };

    getTypeName() => "InAppNotificationDto";
    TypeContext? context = _ctx;
}

// @DataContract
class ChannelSubscriptionStateDto implements IConvertible
{
    // @DataMember
    bool? unsubscribed;

    // @DataMember
    Map<String,List<String>?> blockedTags = {};

    ChannelSubscriptionStateDto({this.unsubscribed,this.blockedTags=const {}});
    ChannelSubscriptionStateDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        unsubscribed = json['unsubscribed'];
        blockedTags = JsonConverters.fromJson(json['blockedTags'],'Map<String,List<String>?>',context!) ?? {};
        return this;
    }

    Map<String, dynamic> toJson() => {
        'unsubscribed': unsubscribed,
        'blockedTags': JsonConverters.toJson(blockedTags,'Map<String,List<String>?>',context!)
    };

    getTypeName() => "ChannelSubscriptionStateDto";
    TypeContext? context = _ctx;
}

// @DataContract
class UserDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    String projectId = "";

    // @DataMember
    String? primaryEmail;

    // @DataMember
    String? primaryPhone;

    // @DataMember
    String? displayName;

    // @DataMember
    String? firstName;

    // @DataMember
    String? lastName;

    // @DataMember
    String? fullName;

    // @DataMember
    String? company;

    // @DataMember
    String? locale;

    // @DataMember
    String? timeZone;

    // @DataMember
    String? gender;

    // @DataMember
    int? birthDate;

    // @DataMember
    String? addressLine1;

    // @DataMember
    String? addressLine2;

    // @DataMember
    String? country;

    // @DataMember
    String? city;

    // @DataMember
    String? state;

    // @DataMember
    String? postalCode;

    // @DataMember
    List<String>? tags;

    // @DataMember
    List<String>? roles;

    // @DataMember
    String lifecycle = "";

    // @DataMember
    String sourceOfCreation = "";

    // @DataMember
    String? mergedIntoContactId;

    // @DataMember
    DateTime? createdOn;

    // @DataMember
    DateTime? modifiedOn;

    // @DataMember
    List<AuthDto>? auths;

    // @DataMember
    Map<String,ChannelSubscriptionStateDto?>? marketingPreferences;

    UserDto({this.id="",this.projectId="",this.primaryEmail,this.primaryPhone,this.displayName,this.firstName,this.lastName,this.fullName,this.company,this.locale,this.timeZone,this.gender,this.birthDate,this.addressLine1,this.addressLine2,this.country,this.city,this.state,this.postalCode,this.tags,this.roles,this.lifecycle="",this.sourceOfCreation="",this.mergedIntoContactId,this.createdOn,this.modifiedOn,this.auths,this.marketingPreferences});
    UserDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        projectId = json['projectId'] ?? "";
        primaryEmail = json['primaryEmail'];
        primaryPhone = json['primaryPhone'];
        displayName = json['displayName'];
        firstName = json['firstName'];
        lastName = json['lastName'];
        fullName = json['fullName'];
        company = json['company'];
        locale = json['locale'];
        timeZone = json['timeZone'];
        gender = json['gender'];
        birthDate = json['birthDate'];
        addressLine1 = json['addressLine1'];
        addressLine2 = json['addressLine2'];
        country = json['country'];
        city = json['city'];
        state = json['state'];
        postalCode = json['postalCode'];
        tags = JsonConverters.fromJson(json['tags'],'List<String>',context!);
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!);
        lifecycle = json['lifecycle'] ?? "";
        sourceOfCreation = json['sourceOfCreation'] ?? "";
        mergedIntoContactId = json['mergedIntoContactId'];
        createdOn = JsonConverters.fromJson(json['createdOn'],'DateTime',context!) ?? DateTime(0);
        modifiedOn = JsonConverters.fromJson(json['modifiedOn'],'DateTime',context!) ?? DateTime(0);
        auths = JsonConverters.fromJson(json['auths'],'List<AuthDto>',context!);
        marketingPreferences = JsonConverters.fromJson(json['marketingPreferences'],'Map<String,ChannelSubscriptionStateDto?>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'projectId': projectId,
        'primaryEmail': primaryEmail,
        'primaryPhone': primaryPhone,
        'displayName': displayName,
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'company': company,
        'locale': locale,
        'timeZone': timeZone,
        'gender': gender,
        'birthDate': birthDate,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'country': country,
        'city': city,
        'state': state,
        'postalCode': postalCode,
        'tags': JsonConverters.toJson(tags,'List<String>',context!),
        'roles': JsonConverters.toJson(roles,'List<String>',context!),
        'lifecycle': lifecycle,
        'sourceOfCreation': sourceOfCreation,
        'mergedIntoContactId': mergedIntoContactId,
        'createdOn': JsonConverters.toJson(createdOn,'DateTime',context!),
        'modifiedOn': JsonConverters.toJson(modifiedOn,'DateTime',context!),
        'auths': JsonConverters.toJson(auths,'List<AuthDto>',context!),
        'marketingPreferences': JsonConverters.toJson(marketingPreferences,'Map<String,ChannelSubscriptionStateDto?>',context!)
    };

    getTypeName() => "UserDto";
    TypeContext? context = _ctx;
}

// @DataContract
class ContactRolesRepairDto implements IConvertible
{
    // @DataMember(Name="dryRun")
    bool? dryRun;

    // @DataMember(Name="contactsWithoutRoles")
    int contactsWithoutRoles = 0;

    // @DataMember(Name="contactsToRepair")
    int contactsToRepair = 0;

    // @DataMember(Name="contactsRepaired")
    int contactsRepaired = 0;

    // @DataMember(Name="contactsWithoutLoginRoleIds")
    int contactsWithoutLoginRoleIds = 0;

    // @DataMember(Name="legacyRoleNamesIgnored")
    int legacyRoleNamesIgnored = 0;

    ContactRolesRepairDto({this.dryRun,this.contactsWithoutRoles=0,this.contactsToRepair=0,this.contactsRepaired=0,this.contactsWithoutLoginRoleIds=0,this.legacyRoleNamesIgnored=0});
    ContactRolesRepairDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        dryRun = json['dryRun'];
        contactsWithoutRoles = json['contactsWithoutRoles'] ?? 0;
        contactsToRepair = json['contactsToRepair'] ?? 0;
        contactsRepaired = json['contactsRepaired'] ?? 0;
        contactsWithoutLoginRoleIds = json['contactsWithoutLoginRoleIds'] ?? 0;
        legacyRoleNamesIgnored = json['legacyRoleNamesIgnored'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'dryRun': dryRun,
        'contactsWithoutRoles': contactsWithoutRoles,
        'contactsToRepair': contactsToRepair,
        'contactsRepaired': contactsRepaired,
        'contactsWithoutLoginRoleIds': contactsWithoutLoginRoleIds,
        'legacyRoleNamesIgnored': legacyRoleNamesIgnored
    };

    getTypeName() => "ContactRolesRepairDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SchemaRefDto implements IConvertible
{
    // @DataMember(Order=1)
    String schemaId = "";

    // @DataMember(Order=2)
    String schemaName = "";

    // @DataMember(Order=3)
    String databaseIntegrationId = "";

    SchemaRefDto({this.schemaId="",this.schemaName="",this.databaseIntegrationId=""});
    SchemaRefDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        schemaId = json['schemaId'] ?? "";
        schemaName = json['schemaName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'schemaId': schemaId,
        'schemaName': schemaName,
        'databaseIntegrationId': databaseIntegrationId
    };

    getTypeName() => "SchemaRefDto";
    TypeContext? context = _ctx;
}

class CollectionImportDto implements IConvertible
{
    // @DataMember
    String id = "";

    // @DataMember
    SchemaRefDto? schema;

    // @DataMember
    FileResourceRefDto? file;

    // @DataMember
    FileResourceRefDto? errorFile;

    // @DataMember
    String delimiter = "";

    // @DataMember
    bool? hasHeader;

    // @DataMember
    String status = "";

    // @DataMember
    int totalRows = 0;

    // @DataMember
    int totalImported = 0;

    // @DataMember
    int totalErrors = 0;

    // @DataMember
    String? failureReason;

    // @DataMember
    List<ImportColumnMappingDto>? mapping;

    // @DataMember
    DateTime? createdOn;

    // @DataMember
    DateTime? startedOn;

    // @DataMember
    DateTime? completedOn;

    CollectionImportDto({this.id="",this.schema,this.file,this.errorFile,this.delimiter="",this.hasHeader,this.status="",this.totalRows=0,this.totalImported=0,this.totalErrors=0,this.failureReason,this.mapping,this.createdOn,this.startedOn,this.completedOn});
    CollectionImportDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        schema = JsonConverters.fromJson(json['schema'],'SchemaRefDto',context!);
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        errorFile = JsonConverters.fromJson(json['errorFile'],'FileResourceRefDto',context!);
        delimiter = json['delimiter'] ?? "";
        hasHeader = json['hasHeader'];
        status = json['status'] ?? "";
        totalRows = json['totalRows'] ?? 0;
        totalImported = json['totalImported'] ?? 0;
        totalErrors = json['totalErrors'] ?? 0;
        failureReason = json['failureReason'];
        mapping = JsonConverters.fromJson(json['mapping'],'List<ImportColumnMappingDto>',context!);
        createdOn = JsonConverters.fromJson(json['createdOn'],'DateTime',context!) ?? DateTime(0);
        startedOn = JsonConverters.fromJson(json['startedOn'],'DateTime',context!);
        completedOn = JsonConverters.fromJson(json['completedOn'],'DateTime',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'schema': JsonConverters.toJson(schema,'SchemaRefDto',context!),
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!),
        'errorFile': JsonConverters.toJson(errorFile,'FileResourceRefDto',context!),
        'delimiter': delimiter,
        'hasHeader': hasHeader,
        'status': status,
        'totalRows': totalRows,
        'totalImported': totalImported,
        'totalErrors': totalErrors,
        'failureReason': failureReason,
        'mapping': JsonConverters.toJson(mapping,'List<ImportColumnMappingDto>',context!),
        'createdOn': JsonConverters.toJson(createdOn,'DateTime',context!),
        'startedOn': JsonConverters.toJson(startedOn,'DateTime',context!),
        'completedOn': JsonConverters.toJson(completedOn,'DateTime',context!)
    };

    getTypeName() => "CollectionImportDto";
    TypeContext? context = _ctx;
}

class ImportUploadTargetDto implements IConvertible
{
    // @DataMember
    String url = "";

    // @DataMember
    String contentType = "";

    // @DataMember
    FileResourceRefDto? file;

    ImportUploadTargetDto({this.url="",this.contentType="",this.file});
    ImportUploadTargetDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        url = json['url'] ?? "";
        contentType = json['contentType'] ?? "";
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'url': url,
        'contentType': contentType,
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!)
    };

    getTypeName() => "ImportUploadTargetDto";
    TypeContext? context = _ctx;
}

class ImportFileColumnDto implements IConvertible
{
    // @DataMember
    int index = 0;

    // @DataMember
    String header = "";

    // @DataMember
    List<String> samples = [];

    // @DataMember
    String detectedType = "";

    ImportFileColumnDto({this.index=0,this.header="",this.samples=const [],this.detectedType=""});
    ImportFileColumnDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        index = json['index'] ?? 0;
        header = json['header'] ?? "";
        samples = JsonConverters.fromJson(json['samples'],'List<String>',context!) ?? [];
        detectedType = json['detectedType'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'index': index,
        'header': header,
        'samples': JsonConverters.toJson(samples,'List<String>',context!),
        'detectedType': detectedType
    };

    getTypeName() => "ImportFileColumnDto";
    TypeContext? context = _ctx;
}

class ImportFileAnalysisDto implements IConvertible
{
    // @DataMember
    FileResourceRefDto? file;

    // @DataMember
    List<ImportFileColumnDto> columns = [];

    // @DataMember
    int sampleRowCount = 0;

    ImportFileAnalysisDto({this.file,this.columns=const [],this.sampleRowCount=0});
    ImportFileAnalysisDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        columns = JsonConverters.fromJson(json['columns'],'List<ImportFileColumnDto>',context!) ?? [];
        sampleRowCount = json['sampleRowCount'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!),
        'columns': JsonConverters.toJson(columns,'List<ImportFileColumnDto>',context!),
        'sampleRowCount': sampleRowCount
    };

    getTypeName() => "ImportFileAnalysisDto";
    TypeContext? context = _ctx;
}

enum CampaignStatus
{
    Pending,
    Registered,
    Scheduled,
    Started,
    Stopped,
    Processing,
    Completed,
    Failed,
}

class CampaignStatusChangeEntryDto implements IConvertible
{
    DateTime? time;
    CampaignStatus? status;
    List<ErrorDto>? errors;

    CampaignStatusChangeEntryDto({this.time,this.status,this.errors});
    CampaignStatusChangeEntryDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        time = JsonConverters.fromJson(json['time'],'DateTime',context!) ?? DateTime(0);
        status = JsonConverters.fromJson(json['status'],'CampaignStatus',context!);
        errors = JsonConverters.fromJson(json['errors'],'List<ErrorDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'time': JsonConverters.toJson(time,'DateTime',context!),
        'status': JsonConverters.toJson(status,'CampaignStatus',context!),
        'errors': JsonConverters.toJson(errors,'List<ErrorDto>',context!)
    };

    getTypeName() => "CampaignStatusChangeEntryDto";
    TypeContext? context = _ctx;
}

// @DataContract
class CampaignOutcomeDto implements IConvertible
{
    // @DataMember
    int sent = 0;

    // @DataMember
    int failed = 0;

    // @DataMember
    int blocked = 0;

    // @DataMember
    int cancelled = 0;

    // @DataMember
    int removedRecipients = 0;

    // @DataMember
    String? blockedReason;

    CampaignOutcomeDto({this.sent=0,this.failed=0,this.blocked=0,this.cancelled=0,this.removedRecipients=0,this.blockedReason});
    CampaignOutcomeDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        sent = json['sent'] ?? 0;
        failed = json['failed'] ?? 0;
        blocked = json['blocked'] ?? 0;
        cancelled = json['cancelled'] ?? 0;
        removedRecipients = json['removedRecipients'] ?? 0;
        blockedReason = json['blockedReason'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'sent': sent,
        'failed': failed,
        'blocked': blocked,
        'cancelled': cancelled,
        'removedRecipients': removedRecipients,
        'blockedReason': blockedReason
    };

    getTypeName() => "CampaignOutcomeDto";
    TypeContext? context = _ctx;
}

// @DataContract
class CampaignDto implements IHasResponsibleUserId, IHasDatabaseId, IConvertible
{
    // @DataMember
    String viewId = "";

    // @DataMember
    DateTime? createdOn;

    // @DataMember
    String language = "";

    // @DataMember
    bool? forceCampaignLanguage;

    // @DataMember
    String? campaignProcessingIntegrationId;

    // @DataMember
    List<CampaignStatusChangeEntryDto> statusHistory = [];

    // @DataMember
    CampaignStatusChangeEntryDto? status;

    // @DataMember
    List<TokenMappingDto>? tokenMappingValues;

    // @DataMember
    String? notes;

    // @DataMember
    String? createdById;

    // @DataMember
    String? timeZoneId;

    // @DataMember
    String userId = "";

    // @DataMember
    String? triggerId;

    // @DataMember
    TriggerType? triggerType;

    // @DataMember
    CampaignOutcomeDto? outcome;

    // @DataMember
    String? id;

    CampaignDto({this.viewId="",this.createdOn,this.language="",this.forceCampaignLanguage,this.campaignProcessingIntegrationId,this.statusHistory=const [],this.status,this.tokenMappingValues,this.notes,this.createdById,this.timeZoneId,this.userId="",this.triggerId,this.triggerType,this.outcome,this.id});
    CampaignDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        viewId = json['viewId'] ?? "";
        createdOn = JsonConverters.fromJson(json['createdOn'],'DateTime',context!) ?? DateTime(0);
        language = json['language'] ?? "";
        forceCampaignLanguage = json['forceCampaignLanguage'];
        campaignProcessingIntegrationId = json['campaignProcessingIntegrationId'];
        statusHistory = JsonConverters.fromJson(json['statusHistory'],'List<CampaignStatusChangeEntryDto>',context!) ?? [];
        status = JsonConverters.fromJson(json['status'],'CampaignStatusChangeEntryDto',context!);
        tokenMappingValues = JsonConverters.fromJson(json['tokenMappingValues'],'List<TokenMappingDto>',context!);
        notes = json['notes'];
        createdById = json['createdById'];
        timeZoneId = json['timeZoneId'];
        userId = json['userId'] ?? "";
        triggerId = json['triggerId'];
        triggerType = JsonConverters.fromJson(json['triggerType'],'TriggerType',context!);
        outcome = JsonConverters.fromJson(json['outcome'],'CampaignOutcomeDto',context!);
        id = json['id'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'viewId': viewId,
        'createdOn': JsonConverters.toJson(createdOn,'DateTime',context!),
        'language': language,
        'forceCampaignLanguage': forceCampaignLanguage,
        'campaignProcessingIntegrationId': campaignProcessingIntegrationId,
        'statusHistory': JsonConverters.toJson(statusHistory,'List<CampaignStatusChangeEntryDto>',context!),
        'status': JsonConverters.toJson(status,'CampaignStatusChangeEntryDto',context!),
        'tokenMappingValues': JsonConverters.toJson(tokenMappingValues,'List<TokenMappingDto>',context!),
        'notes': notes,
        'createdById': createdById,
        'timeZoneId': timeZoneId,
        'userId': userId,
        'triggerId': triggerId,
        'triggerType': JsonConverters.toJson(triggerType,'TriggerType',context!),
        'outcome': JsonConverters.toJson(outcome,'CampaignOutcomeDto',context!),
        'id': id
    };

    getTypeName() => "CampaignDto";
    TypeContext? context = _ctx;
}

class EmailCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    EmailCampaignRecipientsSourceTypes? recipientsSourceType;

    // @DataMember
    List<TokenMappingDto>? mappedTokens;

    // @DataMember
    int? campaignTime;

    // @DataMember
    RespectTimeZoneSettings? respectTimeZoneSettings;

    EmailCampaignDeliverySettingsDto({this.recipientsSourceType,this.mappedTokens,this.campaignTime,this.respectTimeZoneSettings});
    EmailCampaignDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        recipientsSourceType = JsonConverters.fromJson(json['recipientsSourceType'],'EmailCampaignRecipientsSourceTypes',context!);
        mappedTokens = JsonConverters.fromJson(json['mappedTokens'],'List<TokenMappingDto>',context!);
        campaignTime = json['campaignTime'];
        respectTimeZoneSettings = JsonConverters.fromJson(json['respectTimeZoneSettings'],'RespectTimeZoneSettings',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'recipientsSourceType': JsonConverters.toJson(recipientsSourceType,'EmailCampaignRecipientsSourceTypes',context!),
        'mappedTokens': JsonConverters.toJson(mappedTokens,'List<TokenMappingDto>',context!),
        'campaignTime': campaignTime,
        'respectTimeZoneSettings': JsonConverters.toJson(respectTimeZoneSettings,'RespectTimeZoneSettings',context!)
    };

    getTypeName() => "EmailCampaignDeliverySettingsDto";
    TypeContext? context = _ctx;
}

enum CommunicationChannel
{
    Transactional,
    Marketing,
    System,
}

enum NotificationMedium
{
    Email,
    Sms,
    Push,
}

// @DataContract
class TemplateDto implements IHasViewId, IHasDatabaseId, IConvertible
{
    // @DataMember
    String? id;

    // @DataMember
    String viewId = "";

    // @DataMember
    String templateName = "";

    // @DataMember
    String? description;

    // @DataMember
    CommunicationChannel? communicationChannel;

    // @DataMember
    NotificationMedium? medium;

    // @DataMember
    bool? isActive;

    // @DataMember
    List<String>? tags;

    // @DataMember
    String? env;

    TemplateDto({this.id,this.viewId="",this.templateName="",this.description,this.communicationChannel,this.medium,this.isActive,this.tags,this.env});
    TemplateDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        viewId = json['viewId'] ?? "";
        templateName = json['templateName'] ?? "";
        description = json['description'];
        communicationChannel = JsonConverters.fromJson(json['communicationChannel'],'CommunicationChannel',context!);
        medium = JsonConverters.fromJson(json['medium'],'NotificationMedium',context!);
        isActive = json['isActive'];
        tags = JsonConverters.fromJson(json['tags'],'List<String>',context!);
        env = json['env'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id,
        'viewId': viewId,
        'templateName': templateName,
        'description': description,
        'communicationChannel': JsonConverters.toJson(communicationChannel,'CommunicationChannel',context!),
        'medium': JsonConverters.toJson(medium,'NotificationMedium',context!),
        'isActive': isActive,
        'tags': JsonConverters.toJson(tags,'List<String>',context!),
        'env': env
    };

    getTypeName() => "TemplateDto";
    TypeContext? context = _ctx;
}

enum EmailTemplateEngine
{
    NotSet,
    Handlebars,
    Mjml,
    Liquid,
    Razor,
    Mustache,
}

// @DataContract
class EmailBodyDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String? structure;

    // @DataMember
    String code = "";

    // @DataMember
    EmailTemplateEngine? templateEngine;

    EmailBodyDto({this.structure,this.code="",this.templateEngine});
    EmailBodyDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        structure = json['structure'];
        code = json['code'] ?? "";
        templateEngine = JsonConverters.fromJson(json['templateEngine'],'EmailTemplateEngine',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'structure': structure,
        'code': code,
        'templateEngine': JsonConverters.toJson(templateEngine,'EmailTemplateEngine',context!)
    };

    getTypeName() => "EmailBodyDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailMessageContentDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String subject = "";

    // @DataMember
    EmailBodyDto? body;

    // @DataMember
    List<FileResourceRefDto>? staticAttachments;

    EmailMessageContentDto({this.subject="",this.body,this.staticAttachments});
    EmailMessageContentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        subject = json['subject'] ?? "";
        body = JsonConverters.fromJson(json['body'],'EmailBodyDto',context!);
        staticAttachments = JsonConverters.fromJson(json['staticAttachments'],'List<FileResourceRefDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'subject': subject,
        'body': JsonConverters.toJson(body,'EmailBodyDto',context!),
        'staticAttachments': JsonConverters.toJson(staticAttachments,'List<FileResourceRefDto>',context!)
    };

    getTypeName() => "EmailMessageContentDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailMessageTranslationDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String language = "";

    // @DataMember
    EmailMessageContentDto? content;

    // @DataMember
    List<FileResourceRefDto>? staticAttachments;

    EmailMessageTranslationDto({this.language="",this.content,this.staticAttachments});
    EmailMessageTranslationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        language = json['language'] ?? "";
        content = JsonConverters.fromJson(json['content'],'EmailMessageContentDto',context!);
        staticAttachments = JsonConverters.fromJson(json['staticAttachments'],'List<FileResourceRefDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'language': language,
        'content': JsonConverters.toJson(content,'EmailMessageContentDto',context!),
        'staticAttachments': JsonConverters.toJson(staticAttachments,'List<FileResourceRefDto>',context!)
    };

    getTypeName() => "EmailMessageTranslationDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailTemplateDto extends TemplateDto implements IBindableContract, IConvertible
{
    // @DataMember
    List<EmailMessageTranslationDto> translations = [];

    // @DataMember
    List<FileResourceRefDto>? staticAttachments;

    EmailTemplateDto({this.translations=const [],this.staticAttachments});
    EmailTemplateDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        translations = JsonConverters.fromJson(json['translations'],'List<EmailMessageTranslationDto>',context!) ?? [];
        staticAttachments = JsonConverters.fromJson(json['staticAttachments'],'List<FileResourceRefDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'translations': JsonConverters.toJson(translations,'List<EmailMessageTranslationDto>',context!),
        'staticAttachments': JsonConverters.toJson(staticAttachments,'List<FileResourceRefDto>',context!)
    });

    getTypeName() => "EmailTemplateDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailCampaignDto extends CampaignDto implements IConvertible
{
    // @DataMember
    EmailCampaignDeliverySettingsDto? deliverySettings;

    // @DataMember
    EmailTemplateDto? template;

    // @DataMember
    String? validationIntegrationId;

    // @DataMember
    bool? templateIsSystem;

    EmailCampaignDto({this.deliverySettings,this.template,this.validationIntegrationId,this.templateIsSystem});
    EmailCampaignDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        deliverySettings = JsonConverters.fromJson(json['deliverySettings'],'EmailCampaignDeliverySettingsDto',context!);
        template = JsonConverters.fromJson(json['template'],'EmailTemplateDto',context!);
        validationIntegrationId = json['validationIntegrationId'];
        templateIsSystem = json['templateIsSystem'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'deliverySettings': JsonConverters.toJson(deliverySettings,'EmailCampaignDeliverySettingsDto',context!),
        'template': JsonConverters.toJson(template,'EmailTemplateDto',context!),
        'validationIntegrationId': validationIntegrationId,
        'templateIsSystem': templateIsSystem
    });

    getTypeName() => "EmailCampaignDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailCampaignListProjection implements IConvertible
{
    // @DataMember
    String viewId = "";

    // @DataMember
    String templateName = "";

    // @DataMember
    String templateId = "";

    // @DataMember
    String? integrationId;

    // @DataMember
    String language = "";

    // @DataMember
    String strategy = "";

    // @DataMember
    CampaignStatus? latestStatus;

    // @DataMember
    DateTime? createdOn;

    // @DataMember
    CampaignOutcomeDto? outcome;

    EmailCampaignListProjection({this.viewId="",this.templateName="",this.templateId="",this.integrationId,this.language="",this.strategy="",this.latestStatus,this.createdOn,this.outcome});
    EmailCampaignListProjection.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        viewId = json['viewId'] ?? "";
        templateName = json['templateName'] ?? "";
        templateId = json['templateId'] ?? "";
        integrationId = json['integrationId'];
        language = json['language'] ?? "";
        strategy = json['strategy'] ?? "";
        latestStatus = JsonConverters.fromJson(json['latestStatus'],'CampaignStatus',context!);
        createdOn = JsonConverters.fromJson(json['createdOn'],'DateTime',context!) ?? DateTime(0);
        outcome = JsonConverters.fromJson(json['outcome'],'CampaignOutcomeDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'viewId': viewId,
        'templateName': templateName,
        'templateId': templateId,
        'integrationId': integrationId,
        'language': language,
        'strategy': strategy,
        'latestStatus': JsonConverters.toJson(latestStatus,'CampaignStatus',context!),
        'createdOn': JsonConverters.toJson(createdOn,'DateTime',context!),
        'outcome': JsonConverters.toJson(outcome,'CampaignOutcomeDto',context!)
    };

    getTypeName() => "EmailCampaignListProjection";
    TypeContext? context = _ctx;
}

enum CampaignBatchStatus
{
    Registered,
    Processing,
    Completed,
    Failed,
}

class BatchStatusChangeEntryDto implements IConvertible
{
    DateTime? time;
    CampaignBatchStatus? status;
    List<ErrorDto>? errors;

    BatchStatusChangeEntryDto({this.time,this.status,this.errors});
    BatchStatusChangeEntryDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        time = JsonConverters.fromJson(json['time'],'DateTime',context!) ?? DateTime(0);
        status = JsonConverters.fromJson(json['status'],'CampaignBatchStatus',context!);
        errors = JsonConverters.fromJson(json['errors'],'List<ErrorDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'time': JsonConverters.toJson(time,'DateTime',context!),
        'status': JsonConverters.toJson(status,'CampaignBatchStatus',context!),
        'errors': JsonConverters.toJson(errors,'List<ErrorDto>',context!)
    };

    getTypeName() => "BatchStatusChangeEntryDto";
    TypeContext? context = _ctx;
}

// @DataContract
class CampaignBatchDto implements IHasDatabaseId, IConvertible
{
    // @DataMember
    String campaignId = "";

    // @DataMember
    String batchId = "";

    // @DataMember
    String? startAfter;

    // @DataMember
    List<BatchStatusChangeEntryDto> statusHistory = [];

    // @DataMember
    String id = "";

    CampaignBatchDto({this.campaignId="",this.batchId="",this.startAfter,this.statusHistory=const [],this.id=""});
    CampaignBatchDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        campaignId = json['campaignId'] ?? "";
        batchId = json['batchId'] ?? "";
        startAfter = json['startAfter'];
        statusHistory = JsonConverters.fromJson(json['statusHistory'],'List<BatchStatusChangeEntryDto>',context!) ?? [];
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'campaignId': campaignId,
        'batchId': batchId,
        'startAfter': startAfter,
        'statusHistory': JsonConverters.toJson(statusHistory,'List<BatchStatusChangeEntryDto>',context!),
        'id': id
    };

    getTypeName() => "CampaignBatchDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailRecipientDto implements IConvertible
{
    // @DataMember
    String emailAddress = "";

    // @DataMember
    String? language;

    // @DataMember
    String? timeZoneId;

    // @DataMember
    List<TokenMappingDto>? userTokenMappings;

    EmailRecipientDto({this.emailAddress="",this.language,this.timeZoneId,this.userTokenMappings});
    EmailRecipientDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        emailAddress = json['emailAddress'] ?? "";
        language = json['language'];
        timeZoneId = json['timeZoneId'];
        userTokenMappings = JsonConverters.fromJson(json['userTokenMappings'],'List<TokenMappingDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'emailAddress': emailAddress,
        'language': language,
        'timeZoneId': timeZoneId,
        'userTokenMappings': JsonConverters.toJson(userTokenMappings,'List<TokenMappingDto>',context!)
    };

    getTypeName() => "EmailRecipientDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailRecipientsDto implements IConvertible
{
    // @DataMember
    List<EmailRecipientDto>? to;

    // @DataMember
    List<EmailRecipientDto>? cc;

    // @DataMember
    List<EmailRecipientDto>? bcc;

    // @DataMember
    String? startingAfter;

    // @DataMember
    bool? hasMore;

    EmailRecipientsDto({this.to,this.cc,this.bcc,this.startingAfter,this.hasMore});
    EmailRecipientsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        to = JsonConverters.fromJson(json['to'],'List<EmailRecipientDto>',context!);
        cc = JsonConverters.fromJson(json['cc'],'List<EmailRecipientDto>',context!);
        bcc = JsonConverters.fromJson(json['bcc'],'List<EmailRecipientDto>',context!);
        startingAfter = json['startingAfter'];
        hasMore = json['hasMore'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'to': JsonConverters.toJson(to,'List<EmailRecipientDto>',context!),
        'cc': JsonConverters.toJson(cc,'List<EmailRecipientDto>',context!),
        'bcc': JsonConverters.toJson(bcc,'List<EmailRecipientDto>',context!),
        'startingAfter': startingAfter,
        'hasMore': hasMore
    };

    getTypeName() => "EmailRecipientsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailCampaignBatchDto extends CampaignBatchDto implements IConvertible
{
    // @DataMember
    EmailRecipientsDto? recipients;

    EmailCampaignBatchDto({this.recipients});
    EmailCampaignBatchDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'EmailRecipientsDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'EmailRecipientsDto',context!)
    });

    getTypeName() => "EmailCampaignBatchDto";
    TypeContext? context = _ctx;
}

enum CampaignNotificationStatus
{
    Completed,
    BlockedByUserPreferenceBlockAll,
    BlockedByUserPreferenceBlockByTag,
    Failed,
    Viewed,
    Clicked,
    BlockedByValidation,
}

class NotificationStatusChangeEntryDto implements IConvertible
{
    DateTime? time;
    CampaignNotificationStatus? status;
    String? sourceId;
    List<ErrorDto>? errors;
    List<String>? tags;

    NotificationStatusChangeEntryDto({this.time,this.status,this.sourceId,this.errors,this.tags});
    NotificationStatusChangeEntryDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        time = JsonConverters.fromJson(json['time'],'DateTime',context!) ?? DateTime(0);
        status = JsonConverters.fromJson(json['status'],'CampaignNotificationStatus',context!);
        sourceId = json['sourceId'];
        errors = JsonConverters.fromJson(json['errors'],'List<ErrorDto>',context!);
        tags = JsonConverters.fromJson(json['tags'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'time': JsonConverters.toJson(time,'DateTime',context!),
        'status': JsonConverters.toJson(status,'CampaignNotificationStatus',context!),
        'sourceId': sourceId,
        'errors': JsonConverters.toJson(errors,'List<ErrorDto>',context!),
        'tags': JsonConverters.toJson(tags,'List<String>',context!)
    };

    getTypeName() => "NotificationStatusChangeEntryDto";
    TypeContext? context = _ctx;
}

enum NotificationDeliveryState
{
    Pending,
    Sending,
    Retrying,
    Accepted,
    Failed,
    Blocked,
    Cancelled,
}

enum NotificationAttemptOutcome
{
    Accepted,
    Failed,
}

enum SendErrorCategory
{
    Unknown,
    Transient,
    Permanent,
    Ambiguous,
}

enum NotificationAttemptTrigger
{
    Initial,
    AutoRetry,
    ManualRetry,
}

// @DataContract
class NotificationAttemptDto implements IConvertible
{
    // @DataMember
    String attemptId = "";

    // @DataMember
    int number = 0;

    // @DataMember
    DateTime? startedAt;

    // @DataMember
    DateTime? finishedAt;

    // @DataMember
    NotificationAttemptOutcome? outcome;

    // @DataMember
    SendErrorCategory? category;

    // @DataMember
    int? statusCode;

    // @DataMember
    String? errorCode;

    // @DataMember
    String? message;

    // @DataMember
    String? providerRef;

    // @DataMember
    int? retryAfterSeconds;

    // @DataMember
    bool? exhausted;

    // @DataMember
    DateTime? nextRetryAt;

    // @DataMember
    String? correlationId;

    // @DataMember
    NotificationAttemptTrigger? trigger;

    // @DataMember
    String? retryRequestId;

    NotificationAttemptDto({this.attemptId="",this.number=0,this.startedAt,this.finishedAt,this.outcome,this.category,this.statusCode,this.errorCode,this.message,this.providerRef,this.retryAfterSeconds,this.exhausted,this.nextRetryAt,this.correlationId,this.trigger,this.retryRequestId});
    NotificationAttemptDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        attemptId = json['attemptId'] ?? "";
        number = json['number'] ?? 0;
        startedAt = JsonConverters.fromJson(json['startedAt'],'DateTime',context!) ?? DateTime(0);
        finishedAt = JsonConverters.fromJson(json['finishedAt'],'DateTime',context!);
        outcome = JsonConverters.fromJson(json['outcome'],'NotificationAttemptOutcome',context!);
        category = JsonConverters.fromJson(json['category'],'SendErrorCategory',context!);
        statusCode = json['statusCode'];
        errorCode = json['errorCode'];
        message = json['message'];
        providerRef = json['providerRef'];
        retryAfterSeconds = json['retryAfterSeconds'];
        exhausted = json['exhausted'];
        nextRetryAt = JsonConverters.fromJson(json['nextRetryAt'],'DateTime',context!);
        correlationId = json['correlationId'];
        trigger = JsonConverters.fromJson(json['trigger'],'NotificationAttemptTrigger',context!);
        retryRequestId = json['retryRequestId'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'attemptId': attemptId,
        'number': number,
        'startedAt': JsonConverters.toJson(startedAt,'DateTime',context!),
        'finishedAt': JsonConverters.toJson(finishedAt,'DateTime',context!),
        'outcome': JsonConverters.toJson(outcome,'NotificationAttemptOutcome',context!),
        'category': JsonConverters.toJson(category,'SendErrorCategory',context!),
        'statusCode': statusCode,
        'errorCode': errorCode,
        'message': message,
        'providerRef': providerRef,
        'retryAfterSeconds': retryAfterSeconds,
        'exhausted': exhausted,
        'nextRetryAt': JsonConverters.toJson(nextRetryAt,'DateTime',context!),
        'correlationId': correlationId,
        'trigger': JsonConverters.toJson(trigger,'NotificationAttemptTrigger',context!),
        'retryRequestId': retryRequestId
    };

    getTypeName() => "NotificationAttemptDto";
    TypeContext? context = _ctx;
}

enum DeliveryEventOutcome
{
    Delivered,
    Bounced,
    Complained,
    Rejected,
    Deferred,
}

// @DataContract
class NotificationDeliveryEventDto implements IConvertible
{
    // @DataMember
    String? eventId;

    // @DataMember
    DeliveryEventOutcome? outcome;

    // @DataMember
    DateTime? at;

    // @DataMember
    String provider = "";

    // @DataMember
    String? providerRef;

    // @DataMember
    String? reason;

    NotificationDeliveryEventDto({this.eventId,this.outcome,this.at,this.provider="",this.providerRef,this.reason});
    NotificationDeliveryEventDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        eventId = json['eventId'];
        outcome = JsonConverters.fromJson(json['outcome'],'DeliveryEventOutcome',context!);
        at = JsonConverters.fromJson(json['at'],'DateTime',context!) ?? DateTime(0);
        provider = json['provider'] ?? "";
        providerRef = json['providerRef'];
        reason = json['reason'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'eventId': eventId,
        'outcome': JsonConverters.toJson(outcome,'DeliveryEventOutcome',context!),
        'at': JsonConverters.toJson(at,'DateTime',context!),
        'provider': provider,
        'providerRef': providerRef,
        'reason': reason
    };

    getTypeName() => "NotificationDeliveryEventDto";
    TypeContext? context = _ctx;
}

// @DataContract
class CampaignBatchNotificationDto implements IHasDatabaseId, IConvertible
{
    // @DataMember
    String campaignId = "";

    // @DataMember
    String batchId = "";

    // @DataMember
    String notificationId = "";

    // @DataMember
    String? refNotificationId;

    // @DataMember
    String? body;

    // @DataMember
    Map<String,String?>? model;

    // @DataMember
    List<NotificationStatusChangeEntryDto> statusHistory = [];

    // @DataMember
    NotificationDeliveryState? state;

    // @DataMember
    DateTime? stateChangedAt;

    // @DataMember
    List<NotificationAttemptDto>? attempts;

    // @DataMember
    List<NotificationDeliveryEventDto>? deliveryEvents;

    // @DataMember
    DeliveryEventOutcome? deliveryOutcome;

    // @DataMember
    int? deliveryOutcomeRank;

    // @DataMember
    String id = "";

    CampaignBatchNotificationDto({this.campaignId="",this.batchId="",this.notificationId="",this.refNotificationId,this.body,this.model,this.statusHistory=const [],this.state,this.stateChangedAt,this.attempts,this.deliveryEvents,this.deliveryOutcome,this.deliveryOutcomeRank,this.id=""});
    CampaignBatchNotificationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        campaignId = json['campaignId'] ?? "";
        batchId = json['batchId'] ?? "";
        notificationId = json['notificationId'] ?? "";
        refNotificationId = json['refNotificationId'];
        body = json['body'];
        model = JsonConverters.toStringMap(json['model']);
        statusHistory = JsonConverters.fromJson(json['statusHistory'],'List<NotificationStatusChangeEntryDto>',context!) ?? [];
        state = JsonConverters.fromJson(json['state'],'NotificationDeliveryState',context!);
        stateChangedAt = JsonConverters.fromJson(json['stateChangedAt'],'DateTime',context!);
        attempts = JsonConverters.fromJson(json['attempts'],'List<NotificationAttemptDto>',context!);
        deliveryEvents = JsonConverters.fromJson(json['deliveryEvents'],'List<NotificationDeliveryEventDto>',context!);
        deliveryOutcome = JsonConverters.fromJson(json['deliveryOutcome'],'DeliveryEventOutcome',context!);
        deliveryOutcomeRank = json['deliveryOutcomeRank'];
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'campaignId': campaignId,
        'batchId': batchId,
        'notificationId': notificationId,
        'refNotificationId': refNotificationId,
        'body': body,
        'model': model,
        'statusHistory': JsonConverters.toJson(statusHistory,'List<NotificationStatusChangeEntryDto>',context!),
        'state': JsonConverters.toJson(state,'NotificationDeliveryState',context!),
        'stateChangedAt': JsonConverters.toJson(stateChangedAt,'DateTime',context!),
        'attempts': JsonConverters.toJson(attempts,'List<NotificationAttemptDto>',context!),
        'deliveryEvents': JsonConverters.toJson(deliveryEvents,'List<NotificationDeliveryEventDto>',context!),
        'deliveryOutcome': JsonConverters.toJson(deliveryOutcome,'DeliveryEventOutcome',context!),
        'deliveryOutcomeRank': deliveryOutcomeRank,
        'id': id
    };

    getTypeName() => "CampaignBatchNotificationDto";
    TypeContext? context = _ctx;
}

enum EmailRecipientField
{
    To,
    Cc,
    Bcc,
}

enum RecipientRemovalReason
{
    OptedOut,
    Compliance,
    Undeliverable,
}

// @DataContract
class RemovedRecipientDto implements IConvertible
{
    // @DataMember
    String address = "";

    // @DataMember
    EmailRecipientField? field;

    // @DataMember
    RecipientRemovalReason? reason;

    // @DataMember
    String? tag;

    RemovedRecipientDto({this.address="",this.field,this.reason,this.tag});
    RemovedRecipientDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        address = json['address'] ?? "";
        field = JsonConverters.fromJson(json['field'],'EmailRecipientField',context!);
        reason = JsonConverters.fromJson(json['reason'],'RecipientRemovalReason',context!);
        tag = json['tag'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'address': address,
        'field': JsonConverters.toJson(field,'EmailRecipientField',context!),
        'reason': JsonConverters.toJson(reason,'RecipientRemovalReason',context!),
        'tag': tag
    };

    getTypeName() => "RemovedRecipientDto";
    TypeContext? context = _ctx;
}

// @DataContract
class EmailCampaignBatchNotificationDto extends CampaignBatchNotificationDto implements IConvertible
{
    // @DataMember
    String? subject;

    // @DataMember
    EmailRecipientsDto? recipients;

    // @DataMember
    List<RemovedRecipientDto>? removedRecipients;

    // @DataMember
    EmailMessageContentDto? content;

    // @DataMember
    String? transactionalKind;

    EmailCampaignBatchNotificationDto({this.subject,this.recipients,this.removedRecipients,this.content,this.transactionalKind});
    EmailCampaignBatchNotificationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        subject = json['subject'];
        recipients = JsonConverters.fromJson(json['recipients'],'EmailRecipientsDto',context!);
        removedRecipients = JsonConverters.fromJson(json['removedRecipients'],'List<RemovedRecipientDto>',context!);
        content = JsonConverters.fromJson(json['content'],'EmailMessageContentDto',context!);
        transactionalKind = json['transactionalKind'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'subject': subject,
        'recipients': JsonConverters.toJson(recipients,'EmailRecipientsDto',context!),
        'removedRecipients': JsonConverters.toJson(removedRecipients,'List<RemovedRecipientDto>',context!),
        'content': JsonConverters.toJson(content,'EmailMessageContentDto',context!),
        'transactionalKind': transactionalKind
    });

    getTypeName() => "EmailCampaignBatchNotificationDto";
    TypeContext? context = _ctx;
}

// @DataContract
class CampaignStatsDto implements IConvertible
{
    // @DataMember
    int batches = 0;

    // @DataMember
    int sent = 0;

    // @DataMember
    int failed = 0;

    // @DataMember
    int failedRetryable = 0;

    // @DataMember
    int cancelled = 0;

    // @DataMember
    int blocked = 0;

    // @DataMember
    int inProgress = 0;

    // @DataMember
    int removedRecipients = 0;

    // @DataMember
    double successRate = 0;

    CampaignStatsDto({this.batches=0,this.sent=0,this.failed=0,this.failedRetryable=0,this.cancelled=0,this.blocked=0,this.inProgress=0,this.removedRecipients=0,this.successRate=0});
    CampaignStatsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        batches = json['batches'] ?? 0;
        sent = json['sent'] ?? 0;
        failed = json['failed'] ?? 0;
        failedRetryable = json['failedRetryable'] ?? 0;
        cancelled = json['cancelled'] ?? 0;
        blocked = json['blocked'] ?? 0;
        inProgress = json['inProgress'] ?? 0;
        removedRecipients = json['removedRecipients'] ?? 0;
        successRate = JsonConverters.toDouble(json['successRate']) ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'batches': batches,
        'sent': sent,
        'failed': failed,
        'failedRetryable': failedRetryable,
        'cancelled': cancelled,
        'blocked': blocked,
        'inProgress': inProgress,
        'removedRecipients': removedRecipients,
        'successRate': successRate
    };

    getTypeName() => "CampaignStatsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsMessageContentDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String body = "";

    SmsMessageContentDto({this.body=""});
    SmsMessageContentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        body = json['body'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'body': body
    };

    getTypeName() => "SmsMessageContentDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsMessageTranslationDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String language = "";

    // @DataMember
    SmsMessageContentDto? content;

    SmsMessageTranslationDto({this.language="",this.content});
    SmsMessageTranslationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        language = json['language'] ?? "";
        content = JsonConverters.fromJson(json['content'],'SmsMessageContentDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'language': language,
        'content': JsonConverters.toJson(content,'SmsMessageContentDto',context!)
    };

    getTypeName() => "SmsMessageTranslationDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsTemplateDto extends TemplateDto implements IHasRazorTemplateCode, IBindableContract, IConvertible
{
    // @DataMember
    List<SmsMessageTranslationDto> translations = [];

    SmsTemplateDto({this.translations=const []});
    SmsTemplateDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        translations = JsonConverters.fromJson(json['translations'],'List<SmsMessageTranslationDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'translations': JsonConverters.toJson(translations,'List<SmsMessageTranslationDto>',context!)
    });

    getTypeName() => "SmsTemplateDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsCampaignDto extends CampaignDto implements IConvertible
{
    // @DataMember
    SmsCampaignDeliverySettingsDto? recipients;

    // @DataMember
    SmsTemplateDto? template;

    SmsCampaignDto({this.recipients,this.template});
    SmsCampaignDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'SmsCampaignDeliverySettingsDto',context!);
        template = JsonConverters.fromJson(json['template'],'SmsTemplateDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'SmsCampaignDeliverySettingsDto',context!),
        'template': JsonConverters.toJson(template,'SmsTemplateDto',context!)
    });

    getTypeName() => "SmsCampaignDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsRecipientDto implements IConvertible
{
    // @DataMember
    String phoneNumber = "";

    // @DataMember
    String userId = "";

    // @DataMember
    String? language;

    // @DataMember
    List<TokenMappingDto>? userTokenMappings;

    // @DataMember
    String? timeZoneId;

    // @DataMember
    String? record;

    SmsRecipientDto({this.phoneNumber="",this.userId="",this.language,this.userTokenMappings,this.timeZoneId,this.record});
    SmsRecipientDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        phoneNumber = json['phoneNumber'] ?? "";
        userId = json['userId'] ?? "";
        language = json['language'];
        userTokenMappings = JsonConverters.fromJson(json['userTokenMappings'],'List<TokenMappingDto>',context!);
        timeZoneId = json['timeZoneId'];
        record = json['record'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'phoneNumber': phoneNumber,
        'userId': userId,
        'language': language,
        'userTokenMappings': JsonConverters.toJson(userTokenMappings,'List<TokenMappingDto>',context!),
        'timeZoneId': timeZoneId,
        'record': record
    };

    getTypeName() => "SmsRecipientDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsRecipientsDto implements IConvertible
{
    // @DataMember
    List<SmsRecipientDto>? to;

    // @DataMember
    String? startingAfter;

    // @DataMember
    bool? hasMore;

    SmsRecipientsDto({this.to,this.startingAfter,this.hasMore});
    SmsRecipientsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        to = JsonConverters.fromJson(json['to'],'List<SmsRecipientDto>',context!);
        startingAfter = json['startingAfter'];
        hasMore = json['hasMore'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'to': JsonConverters.toJson(to,'List<SmsRecipientDto>',context!),
        'startingAfter': startingAfter,
        'hasMore': hasMore
    };

    getTypeName() => "SmsRecipientsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsCampaignBatchDto extends CampaignBatchDto implements IConvertible
{
    // @DataMember
    SmsRecipientsDto? recipients;

    SmsCampaignBatchDto({this.recipients});
    SmsCampaignBatchDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'SmsRecipientsDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'SmsRecipientsDto',context!)
    });

    getTypeName() => "SmsCampaignBatchDto";
    TypeContext? context = _ctx;
}

// @DataContract
class SmsCampaignBatchNotificationDto extends CampaignBatchNotificationDto implements IConvertible
{
    // @DataMember
    SmsRecipientsDto? recipients;

    // @DataMember
    SmsMessageContentDto? content;

    SmsCampaignBatchNotificationDto({this.recipients,this.content});
    SmsCampaignBatchNotificationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'SmsRecipientsDto',context!);
        content = JsonConverters.fromJson(json['content'],'SmsMessageContentDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'SmsRecipientsDto',context!),
        'content': JsonConverters.toJson(content,'SmsMessageContentDto',context!)
    });

    getTypeName() => "SmsCampaignBatchNotificationDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushAudienceCountDto implements IConvertible
{
    // @DataMember
    int devices = 0;

    // @DataMember
    int recipients = 0;

    // @DataMember
    int skippedUserIds = 0;

    // @DataMember
    bool? isCapped;

    PushAudienceCountDto({this.devices=0,this.recipients=0,this.skippedUserIds=0,this.isCapped});
    PushAudienceCountDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        devices = json['devices'] ?? 0;
        recipients = json['recipients'] ?? 0;
        skippedUserIds = json['skippedUserIds'] ?? 0;
        isCapped = json['isCapped'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'devices': devices,
        'recipients': recipients,
        'skippedUserIds': skippedUserIds,
        'isCapped': isCapped
    };

    getTypeName() => "PushAudienceCountDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushCampaignDeliverySettingsDto implements IConvertible
{
    // @DataMember
    PushCampaignRecipientsSourceTypes? recipientsSourceType;

    // @DataMember
    List<TokenMappingDto>? mappedTokens;

    // @DataMember
    int? campaignTime;

    // @DataMember
    RespectTimeZoneSettings? respectTimeZoneSettings;

    PushCampaignDeliverySettingsDto({this.recipientsSourceType,this.mappedTokens,this.campaignTime,this.respectTimeZoneSettings});
    PushCampaignDeliverySettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        recipientsSourceType = JsonConverters.fromJson(json['recipientsSourceType'],'PushCampaignRecipientsSourceTypes',context!);
        mappedTokens = JsonConverters.fromJson(json['mappedTokens'],'List<TokenMappingDto>',context!);
        campaignTime = json['campaignTime'];
        respectTimeZoneSettings = JsonConverters.fromJson(json['respectTimeZoneSettings'],'RespectTimeZoneSettings',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'recipientsSourceType': JsonConverters.toJson(recipientsSourceType,'PushCampaignRecipientsSourceTypes',context!),
        'mappedTokens': JsonConverters.toJson(mappedTokens,'List<TokenMappingDto>',context!),
        'campaignTime': campaignTime,
        'respectTimeZoneSettings': JsonConverters.toJson(respectTimeZoneSettings,'RespectTimeZoneSettings',context!)
    };

    getTypeName() => "PushCampaignDeliverySettingsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushMessageContentDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String title = "";

    // @DataMember
    String body = "";

    PushMessageContentDto({this.title="",this.body=""});
    PushMessageContentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        title = json['title'] ?? "";
        body = json['body'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'title': title,
        'body': body
    };

    getTypeName() => "PushMessageContentDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushMessageTranslationDto implements IHasRazorTemplateCode, IConvertible
{
    // @DataMember
    String language = "";

    // @DataMember
    PushMessageContentDto? content;

    PushMessageTranslationDto({this.language="",this.content});
    PushMessageTranslationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        language = json['language'] ?? "";
        content = JsonConverters.fromJson(json['content'],'PushMessageContentDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'language': language,
        'content': JsonConverters.toJson(content,'PushMessageContentDto',context!)
    };

    getTypeName() => "PushMessageTranslationDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushTemplateDto extends TemplateDto implements IHasRazorTemplateCode, IBindableContract, IConvertible
{
    // @DataMember
    List<PushMessageTranslationDto> translations = [];

    PushTemplateDto({this.translations=const []});
    PushTemplateDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        translations = JsonConverters.fromJson(json['translations'],'List<PushMessageTranslationDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'translations': JsonConverters.toJson(translations,'List<PushMessageTranslationDto>',context!)
    });

    getTypeName() => "PushTemplateDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushCampaignDto extends CampaignDto implements IConvertible
{
    // @DataMember
    PushCampaignDeliverySettingsDto? recipients;

    // @DataMember
    PushTemplateDto? template;

    PushCampaignDto({this.recipients,this.template});
    PushCampaignDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'PushCampaignDeliverySettingsDto',context!);
        template = JsonConverters.fromJson(json['template'],'PushTemplateDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'PushCampaignDeliverySettingsDto',context!),
        'template': JsonConverters.toJson(template,'PushTemplateDto',context!)
    });

    getTypeName() => "PushCampaignDto";
    TypeContext? context = _ctx;
}

enum PushDeviceDeliveryFamily
{
    Ios,
    Android,
    Chrome,
    Safari,
    Expo,
}

// @DataContract
class PushDeviceDeliveryTokenDto implements IConvertible
{
    // @DataMember
    String pushDeviceToken = "";

    // @DataMember
    PushDeviceDeliveryFamily? deliveryFamily;

    PushDeviceDeliveryTokenDto({this.pushDeviceToken="",this.deliveryFamily});
    PushDeviceDeliveryTokenDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        pushDeviceToken = json['pushDeviceToken'] ?? "";
        deliveryFamily = JsonConverters.fromJson(json['deliveryFamily'],'PushDeviceDeliveryFamily',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'pushDeviceToken': pushDeviceToken,
        'deliveryFamily': JsonConverters.toJson(deliveryFamily,'PushDeviceDeliveryFamily',context!)
    };

    getTypeName() => "PushDeviceDeliveryTokenDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushRecipientDto implements IConvertible
{
    // @DataMember
    List<PushDeviceDeliveryTokenDto> deviceTokens = [];

    // @DataMember
    String userId = "";

    // @DataMember
    String? language;

    // @DataMember
    List<TokenMappingDto>? userTokenMappings;

    // @DataMember
    String? timeZoneId;

    // @DataMember
    String? record;

    PushRecipientDto({this.deviceTokens=const [],this.userId="",this.language,this.userTokenMappings,this.timeZoneId,this.record});
    PushRecipientDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        deviceTokens = JsonConverters.fromJson(json['deviceTokens'],'List<PushDeviceDeliveryTokenDto>',context!) ?? [];
        userId = json['userId'] ?? "";
        language = json['language'];
        userTokenMappings = JsonConverters.fromJson(json['userTokenMappings'],'List<TokenMappingDto>',context!);
        timeZoneId = json['timeZoneId'];
        record = json['record'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'deviceTokens': JsonConverters.toJson(deviceTokens,'List<PushDeviceDeliveryTokenDto>',context!),
        'userId': userId,
        'language': language,
        'userTokenMappings': JsonConverters.toJson(userTokenMappings,'List<TokenMappingDto>',context!),
        'timeZoneId': timeZoneId,
        'record': record
    };

    getTypeName() => "PushRecipientDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushRecipientsDto implements IConvertible
{
    // @DataMember
    List<PushRecipientDto>? to;

    // @DataMember
    String? startingAfter;

    // @DataMember
    bool? hasMore;

    PushRecipientsDto({this.to,this.startingAfter,this.hasMore});
    PushRecipientsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        to = JsonConverters.fromJson(json['to'],'List<PushRecipientDto>',context!);
        startingAfter = json['startingAfter'];
        hasMore = json['hasMore'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'to': JsonConverters.toJson(to,'List<PushRecipientDto>',context!),
        'startingAfter': startingAfter,
        'hasMore': hasMore
    };

    getTypeName() => "PushRecipientsDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushCampaignBatchDto extends CampaignBatchDto implements IConvertible
{
    // @DataMember
    PushRecipientsDto? recipients;

    PushCampaignBatchDto({this.recipients});
    PushCampaignBatchDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        recipients = JsonConverters.fromJson(json['recipients'],'PushRecipientsDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'recipients': JsonConverters.toJson(recipients,'PushRecipientsDto',context!)
    });

    getTypeName() => "PushCampaignBatchDto";
    TypeContext? context = _ctx;
}

// @DataContract
class NotificationReadMarkDto implements IConvertible
{
    // @DataMember
    String userId = "";

    // @DataMember
    DateTime? readAtUtc;

    NotificationReadMarkDto({this.userId="",this.readAtUtc});
    NotificationReadMarkDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        userId = json['userId'] ?? "";
        readAtUtc = JsonConverters.fromJson(json['readAtUtc'],'DateTime',context!) ?? DateTime(0);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'userId': userId,
        'readAtUtc': JsonConverters.toJson(readAtUtc,'DateTime',context!)
    };

    getTypeName() => "NotificationReadMarkDto";
    TypeContext? context = _ctx;
}

// @DataContract
class PushCampaignBatchNotificationDto extends CampaignBatchNotificationDto implements IConvertible
{
    // @DataMember
    String? subject;

    // @DataMember
    PushRecipientsDto? recipients;

    // @DataMember
    PushMessageContentDto? content;

    // @DataMember
    List<NotificationReadMarkDto>? readBy;

    PushCampaignBatchNotificationDto({this.subject,this.recipients,this.content,this.readBy});
    PushCampaignBatchNotificationDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        subject = json['subject'];
        recipients = JsonConverters.fromJson(json['recipients'],'PushRecipientsDto',context!);
        content = JsonConverters.fromJson(json['content'],'PushMessageContentDto',context!);
        readBy = JsonConverters.fromJson(json['readBy'],'List<NotificationReadMarkDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'subject': subject,
        'recipients': JsonConverters.toJson(recipients,'PushRecipientsDto',context!),
        'content': JsonConverters.toJson(content,'PushMessageContentDto',context!),
        'readBy': JsonConverters.toJson(readBy,'List<NotificationReadMarkDto>',context!)
    });

    getTypeName() => "PushCampaignBatchNotificationDto";
    TypeContext? context = _ctx;
}

abstract class IBindableContract
{
}

abstract class IHasViewId
{
    String viewId = "";
}

abstract class IHasResponsibleUserId
{
    String userId = "";
}

abstract class IHasDatabaseId
{
    String? id;
}

abstract class ICursorArgs
{
    String field = "";
    int order = 0;
}

abstract class IQueuedTrigger
{
    String viewId = "";
    String name = "";
    int? order;
    bool? breakOnError;
}

abstract class IHasRazorTemplateCode
{
}

class EchoResponse implements IConvertible
{
    CodeMashRelease? release;
    CodeMashRuntime? runtime;
    String managedServiceHubUrl = "";
    String managedServiceApiUrl = "";
    String hubUrl = "";
    String apiUrl = "";
    String apiVersion = "";
    String hubVersion = "";
    String? adminUrlTemplate;
    bool? emailServiceConfigured;
    String? rootBootstrapPasswordSource;
    List<EchoRegionDto>? regions;
    EchoAgentDto? agent;
    EchoHostingPlatformDto? hostingPlatform;
    EchoConnectDto? connect;
    EchoKeylessDto? keyless;

    EchoResponse({this.release,this.runtime,this.managedServiceHubUrl="",this.managedServiceApiUrl="",this.hubUrl="",this.apiUrl="",this.apiVersion="",this.hubVersion="",this.adminUrlTemplate,this.emailServiceConfigured,this.rootBootstrapPasswordSource,this.regions,this.agent,this.hostingPlatform,this.connect,this.keyless});
    EchoResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        release = JsonConverters.fromJson(json['release'],'CodeMashRelease',context!);
        runtime = JsonConverters.fromJson(json['runtime'],'CodeMashRuntime',context!);
        managedServiceHubUrl = json['managedServiceHubUrl'] ?? "";
        managedServiceApiUrl = json['managedServiceApiUrl'] ?? "";
        hubUrl = json['hubUrl'] ?? "";
        apiUrl = json['apiUrl'] ?? "";
        apiVersion = json['apiVersion'] ?? "";
        hubVersion = json['hubVersion'] ?? "";
        adminUrlTemplate = json['adminUrlTemplate'];
        emailServiceConfigured = json['emailServiceConfigured'];
        rootBootstrapPasswordSource = json['rootBootstrapPasswordSource'];
        regions = JsonConverters.fromJson(json['regions'],'List<EchoRegionDto>',context!);
        agent = JsonConverters.fromJson(json['agent'],'EchoAgentDto',context!);
        hostingPlatform = JsonConverters.fromJson(json['hostingPlatform'],'EchoHostingPlatformDto',context!);
        connect = JsonConverters.fromJson(json['connect'],'EchoConnectDto',context!);
        keyless = JsonConverters.fromJson(json['keyless'],'EchoKeylessDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'release': JsonConverters.toJson(release,'CodeMashRelease',context!),
        'runtime': JsonConverters.toJson(runtime,'CodeMashRuntime',context!),
        'managedServiceHubUrl': managedServiceHubUrl,
        'managedServiceApiUrl': managedServiceApiUrl,
        'hubUrl': hubUrl,
        'apiUrl': apiUrl,
        'apiVersion': apiVersion,
        'hubVersion': hubVersion,
        'adminUrlTemplate': adminUrlTemplate,
        'emailServiceConfigured': emailServiceConfigured,
        'rootBootstrapPasswordSource': rootBootstrapPasswordSource,
        'regions': JsonConverters.toJson(regions,'List<EchoRegionDto>',context!),
        'agent': JsonConverters.toJson(agent,'EchoAgentDto',context!),
        'hostingPlatform': JsonConverters.toJson(hostingPlatform,'EchoHostingPlatformDto',context!),
        'connect': JsonConverters.toJson(connect,'EchoConnectDto',context!),
        'keyless': JsonConverters.toJson(keyless,'EchoKeylessDto',context!)
    };

    getTypeName() => "EchoResponse";
    TypeContext? context = _ctx;
}

class PublicProjectConfigDto implements IConvertible
{
    String displayName = "";
    bool? adminPortalEnabled;
    PublicBrandDto? branding;
    PublicAuthDto? auth;
    PublicAiChatDto? aiChat;

    PublicProjectConfigDto({this.displayName="",this.adminPortalEnabled,this.branding,this.auth,this.aiChat});
    PublicProjectConfigDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        displayName = json['displayName'] ?? "";
        adminPortalEnabled = json['adminPortalEnabled'];
        branding = JsonConverters.fromJson(json['branding'],'PublicBrandDto',context!);
        auth = JsonConverters.fromJson(json['auth'],'PublicAuthDto',context!);
        aiChat = JsonConverters.fromJson(json['aiChat'],'PublicAiChatDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'adminPortalEnabled': adminPortalEnabled,
        'branding': JsonConverters.toJson(branding,'PublicBrandDto',context!),
        'auth': JsonConverters.toJson(auth,'PublicAuthDto',context!),
        'aiChat': JsonConverters.toJson(aiChat,'PublicAiChatDto',context!)
    };

    getTypeName() => "PublicProjectConfigDto";
    TypeContext? context = _ctx;
}

class PublicLegalDocumentDto implements IConvertible
{
    String kind = "";
    String? title;
    String body = "";
    bool? available;

    PublicLegalDocumentDto({this.kind="",this.title,this.body="",this.available});
    PublicLegalDocumentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        kind = json['kind'] ?? "";
        title = json['title'];
        body = json['body'] ?? "";
        available = json['available'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'kind': kind,
        'title': title,
        'body': body,
        'available': available
    };

    getTypeName() => "PublicLegalDocumentDto";
    TypeContext? context = _ctx;
}

class ListEndUserChatAttachmentsResponse extends ResponseBase implements IConvertible
{
    List<EndUserChatAttachment> attachments = [];

    ListEndUserChatAttachmentsResponse({this.attachments=const []});
    ListEndUserChatAttachmentsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        attachments = JsonConverters.fromJson(json['attachments'],'List<EndUserChatAttachment>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'attachments': JsonConverters.toJson(attachments,'List<EndUserChatAttachment>',context!)
    });

    getTypeName() => "ListEndUserChatAttachmentsResponse";
    TypeContext? context = _ctx;
}

class ListEndUserChatMemoryResponse extends ResponseBase implements IConvertible
{
    List<EndUserChatMemoryNote> notes = [];

    ListEndUserChatMemoryResponse({this.notes=const []});
    ListEndUserChatMemoryResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        notes = JsonConverters.fromJson(json['notes'],'List<EndUserChatMemoryNote>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'notes': JsonConverters.toJson(notes,'List<EndUserChatMemoryNote>',context!)
    });

    getTypeName() => "ListEndUserChatMemoryResponse";
    TypeContext? context = _ctx;
}

class GetEndUserChatAvailabilityResponse extends ResponseBase implements IConvertible
{
    bool? enabled;
    bool? available;
    String? reason;
    String? defaultAssistantId;
    List<EndUserChatAssistant> assistants = [];
    EndUserChatPlan? plan;

    GetEndUserChatAvailabilityResponse({this.enabled,this.available,this.reason,this.defaultAssistantId,this.assistants=const [],this.plan});
    GetEndUserChatAvailabilityResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        enabled = json['enabled'];
        available = json['available'];
        reason = json['reason'];
        defaultAssistantId = json['defaultAssistantId'];
        assistants = JsonConverters.fromJson(json['assistants'],'List<EndUserChatAssistant>',context!) ?? [];
        plan = JsonConverters.fromJson(json['plan'],'EndUserChatPlan',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'enabled': enabled,
        'available': available,
        'reason': reason,
        'defaultAssistantId': defaultAssistantId,
        'assistants': JsonConverters.toJson(assistants,'List<EndUserChatAssistant>',context!),
        'plan': JsonConverters.toJson(plan,'EndUserChatPlan',context!)
    });

    getTypeName() => "GetEndUserChatAvailabilityResponse";
    TypeContext? context = _ctx;
}

class ListEndUserChatSessionsResponse extends ResponseBase implements IConvertible
{
    List<EndUserChatSession> sessions = [];

    ListEndUserChatSessionsResponse({this.sessions=const []});
    ListEndUserChatSessionsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessions = JsonConverters.fromJson(json['sessions'],'List<EndUserChatSession>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessions': JsonConverters.toJson(sessions,'List<EndUserChatSession>',context!)
    });

    getTypeName() => "ListEndUserChatSessionsResponse";
    TypeContext? context = _ctx;
}

class GetEndUserChatSessionResponse extends ResponseBase implements IConvertible
{
    EndUserChatSession? session;

    GetEndUserChatSessionResponse({this.session});
    GetEndUserChatSessionResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        session = JsonConverters.fromJson(json['session'],'EndUserChatSession',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'session': JsonConverters.toJson(session,'EndUserChatSession',context!)
    });

    getTypeName() => "GetEndUserChatSessionResponse";
    TypeContext? context = _ctx;
}

class GetEndUserChatEntriesResponse extends ResponseBase implements IConvertible
{
    String? sessionId;
    List<AiChatEntryWireDto> entries = [];
    int lastSeq = 0;
    bool? hasMore;

    GetEndUserChatEntriesResponse({this.sessionId,this.entries=const [],this.lastSeq=0,this.hasMore});
    GetEndUserChatEntriesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'];
        entries = JsonConverters.fromJson(json['entries'],'List<AiChatEntryWireDto>',context!) ?? [];
        lastSeq = json['lastSeq'] ?? 0;
        hasMore = json['hasMore'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'entries': JsonConverters.toJson(entries,'List<AiChatEntryWireDto>',context!),
        'lastSeq': lastSeq,
        'hasMore': hasMore
    });

    getTypeName() => "GetEndUserChatEntriesResponse";
    TypeContext? context = _ctx;
}

class StartEndUserChatTurnResponse extends ResponseBase implements IConvertible
{
    String? turnId;
    String? sessionId;
    String? channel;

    StartEndUserChatTurnResponse({this.turnId,this.sessionId,this.channel});
    StartEndUserChatTurnResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        turnId = json['turnId'];
        sessionId = json['sessionId'];
        channel = json['channel'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'turnId': turnId,
        'sessionId': sessionId,
        'channel': channel
    });

    getTypeName() => "StartEndUserChatTurnResponse";
    TypeContext? context = _ctx;
}

class GetEndUserAiToolsResponse extends ResponseBase implements IConvertible
{
    List<EndUserAiTool>? tools;

    GetEndUserAiToolsResponse({this.tools});
    GetEndUserAiToolsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        tools = JsonConverters.fromJson(json['tools'],'List<EndUserAiTool>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'tools': JsonConverters.toJson(tools,'List<EndUserAiTool>',context!)
    });

    getTypeName() => "GetEndUserAiToolsResponse";
    TypeContext? context = _ctx;
}

class InvokeEndUserAiToolResponse extends ResponseBase implements IConvertible
{
    String? result;

    InvokeEndUserAiToolResponse({this.result});
    InvokeEndUserAiToolResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = json['result'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': result
    });

    getTypeName() => "InvokeEndUserAiToolResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class SaveGuestUserResponse extends IdResponse implements IConvertible
{
    // @DataMember
    String? userName;

    // @DataMember
    String? password;

    SaveGuestUserResponse({this.userName,this.password});
    SaveGuestUserResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        userName = json['userName'];
        password = json['password'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'userName': userName,
        'password': password
    });

    getTypeName() => "SaveGuestUserResponse";
    TypeContext? context = _ctx;
}

class GetUserResponse extends ResponseBase implements IConvertible
{
    AuthDto? user;

    GetUserResponse({this.user});
    GetUserResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        user = JsonConverters.fromJson(json['user'],'AuthDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'user': JsonConverters.toJson(user,'AuthDto',context!)
    });

    getTypeName() => "GetUserResponse";
    TypeContext? context = _ctx;
}

class GetUsersResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<AuthDto>? list;

    GetUsersResponse({this.list});
    GetUsersResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<AuthDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<AuthDto>',context!)
    });

    getTypeName() => "GetUsersResponse";
    TypeContext? context = _ctx;
}

class GetUserPreferencesResponse extends ResponseBase implements IConvertible
{
    UserMarketingPreferencesDto? preferences;

    GetUserPreferencesResponse({this.preferences});
    GetUserPreferencesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        preferences = JsonConverters.fromJson(json['preferences'],'UserMarketingPreferencesDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'preferences': JsonConverters.toJson(preferences,'UserMarketingPreferencesDto',context!)
    });

    getTypeName() => "GetUserPreferencesResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class CredentialChangedResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    String? authId;

    // @DataMember
    String? credentialVersion;

    CredentialChangedResponse({this.authId,this.credentialVersion});
    CredentialChangedResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        authId = json['authId'];
        credentialVersion = json['credentialVersion'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'authId': authId,
        'credentialVersion': credentialVersion
    });

    getTypeName() => "CredentialChangedResponse";
    TypeContext? context = _ctx;
}

class PasskeyOkResponse extends ResponseBase implements IConvertible
{
    PasskeyOkResponse();
    PasskeyOkResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "PasskeyOkResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class SendTestPasswordResetResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    bool? queued;

    // @DataMember
    String? reason;

    // @DataMember
    String env = "";

    // @DataMember
    String? correlationId;

    // @DataMember
    DateTime? expiresAtUtc;

    // @DataMember
    String? integrationId;

    // @DataMember
    String? integrationName;

    // @DataMember
    String? provider;

    // @DataMember
    String? integrationProblem;

    // @DataMember
    String? templateId;

    // @DataMember
    String? templateName;

    // @DataMember
    String? templateSource;

    // @DataMember
    String? language;

    // @DataMember
    String? languageRule;

    // @DataMember
    List<String>? templateLanguages;

    // @DataMember
    String? fallback;

    // @DataMember
    String? mjmlRenderer;

    SendTestPasswordResetResponse({this.queued,this.reason,this.env="",this.correlationId,this.expiresAtUtc,this.integrationId,this.integrationName,this.provider,this.integrationProblem,this.templateId,this.templateName,this.templateSource,this.language,this.languageRule,this.templateLanguages,this.fallback,this.mjmlRenderer});
    SendTestPasswordResetResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        queued = json['queued'];
        reason = json['reason'];
        env = json['env'] ?? "";
        correlationId = json['correlationId'];
        expiresAtUtc = JsonConverters.fromJson(json['expiresAtUtc'],'DateTime',context!);
        integrationId = json['integrationId'];
        integrationName = json['integrationName'];
        provider = json['provider'];
        integrationProblem = json['integrationProblem'];
        templateId = json['templateId'];
        templateName = json['templateName'];
        templateSource = json['templateSource'];
        language = json['language'];
        languageRule = json['languageRule'];
        templateLanguages = JsonConverters.fromJson(json['templateLanguages'],'List<String>',context!);
        fallback = json['fallback'];
        mjmlRenderer = json['mjmlRenderer'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'queued': queued,
        'reason': reason,
        'env': env,
        'correlationId': correlationId,
        'expiresAtUtc': JsonConverters.toJson(expiresAtUtc,'DateTime',context!),
        'integrationId': integrationId,
        'integrationName': integrationName,
        'provider': provider,
        'integrationProblem': integrationProblem,
        'templateId': templateId,
        'templateName': templateName,
        'templateSource': templateSource,
        'language': language,
        'languageRule': languageRule,
        'templateLanguages': JsonConverters.toJson(templateLanguages,'List<String>',context!),
        'fallback': fallback,
        'mjmlRenderer': mjmlRenderer
    });

    getTypeName() => "SendTestPasswordResetResponse";
    TypeContext? context = _ctx;
}

class PasskeyCeremonyOptionsResponse extends ResponseBase implements IConvertible
{
    String ceremonyId = "";
    String optionsJson = "";

    PasskeyCeremonyOptionsResponse({this.ceremonyId="",this.optionsJson=""});
    PasskeyCeremonyOptionsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        ceremonyId = json['ceremonyId'] ?? "";
        optionsJson = json['optionsJson'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'ceremonyId': ceremonyId,
        'optionsJson': optionsJson
    });

    getTypeName() => "PasskeyCeremonyOptionsResponse";
    TypeContext? context = _ctx;
}

class PasskeyAuthTokensResponse extends ResponseBase implements IConvertible
{
    String accessToken = "";
    String refreshToken = "";
    int expiresInSeconds = 0;
    List<String>? recoveryCodes;

    PasskeyAuthTokensResponse({this.accessToken="",this.refreshToken="",this.expiresInSeconds=0,this.recoveryCodes});
    PasskeyAuthTokensResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        accessToken = json['accessToken'] ?? "";
        refreshToken = json['refreshToken'] ?? "";
        expiresInSeconds = json['expiresInSeconds'] ?? 0;
        recoveryCodes = JsonConverters.fromJson(json['recoveryCodes'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresInSeconds': expiresInSeconds,
        'recoveryCodes': JsonConverters.toJson(recoveryCodes,'List<String>',context!)
    });

    getTypeName() => "PasskeyAuthTokensResponse";
    TypeContext? context = _ctx;
}

class PasskeyListResponse extends ResponseBase implements IConvertible
{
    List<PasskeyListItemDto> passkeys = [];

    PasskeyListResponse({this.passkeys=const []});
    PasskeyListResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        passkeys = JsonConverters.fromJson(json['passkeys'],'List<PasskeyListItemDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'passkeys': JsonConverters.toJson(passkeys,'List<PasskeyListItemDto>',context!)
    });

    getTypeName() => "PasskeyListResponse";
    TypeContext? context = _ctx;
}

class PasskeyRecoveryResponse extends ResponseBase implements IConvertible
{
    String accessToken = "";
    String refreshToken = "";
    int expiresInSeconds = 0;
    int remainingCodes = 0;

    PasskeyRecoveryResponse({this.accessToken="",this.refreshToken="",this.expiresInSeconds=0,this.remainingCodes=0});
    PasskeyRecoveryResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        accessToken = json['accessToken'] ?? "";
        refreshToken = json['refreshToken'] ?? "";
        expiresInSeconds = json['expiresInSeconds'] ?? 0;
        remainingCodes = json['remainingCodes'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresInSeconds': expiresInSeconds,
        'remainingCodes': remainingCodes
    });

    getTypeName() => "PasskeyRecoveryResponse";
    TypeContext? context = _ctx;
}

class PasskeyVerificationTokenResponse extends ResponseBase implements IConvertible
{
    String verificationToken = "";

    PasskeyVerificationTokenResponse({this.verificationToken=""});
    PasskeyVerificationTokenResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        verificationToken = json['verificationToken'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'verificationToken': verificationToken
    });

    getTypeName() => "PasskeyVerificationTokenResponse";
    TypeContext? context = _ctx;
}

class FindMergedTermTreeResponse extends ResponseBase implements IConvertible
{
    List<TermTreeDto>? tree;

    FindMergedTermTreeResponse({this.tree});
    FindMergedTermTreeResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        tree = JsonConverters.fromJson(json['tree'],'List<TermTreeDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'tree': JsonConverters.toJson(tree,'List<TermTreeDto>',context!)
    });

    getTypeName() => "FindMergedTermTreeResponse";
    TypeContext? context = _ctx;
}

class FindTaxonomyTreeResponse extends ResponseBase implements IConvertible
{
    List<TaxonomyTreeDto>? tree;

    FindTaxonomyTreeResponse({this.tree});
    FindTaxonomyTreeResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        tree = JsonConverters.fromJson(json['tree'],'List<TaxonomyTreeDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'tree': JsonConverters.toJson(tree,'List<TaxonomyTreeDto>',context!)
    });

    getTypeName() => "FindTaxonomyTreeResponse";
    TypeContext? context = _ctx;
}

class FindTermsResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<TermDto>? list;

    FindTermsResponse({this.list});
    FindTermsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<TermDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<TermDto>',context!)
    });

    getTypeName() => "FindTermsResponse";
    TypeContext? context = _ctx;
}

class FindTermsChildrenResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<TermDto>? list;

    FindTermsChildrenResponse({this.list});
    FindTermsChildrenResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<TermDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<TermDto>',context!)
    });

    getTypeName() => "FindTermsChildrenResponse";
    TypeContext? context = _ctx;
}

class FindTermTreeResponse extends ResponseBase implements IConvertible
{
    List<TermTreeDto>? tree;

    FindTermTreeResponse({this.tree});
    FindTermTreeResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        tree = JsonConverters.fromJson(json['tree'],'List<TermTreeDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'tree': JsonConverters.toJson(tree,'List<TermTreeDto>',context!)
    });

    getTypeName() => "FindTermTreeResponse";
    TypeContext? context = _ctx;
}

class GetDatabaseSchemaResponse extends ResponseBase implements IConvertible
{
    SchemaDto? item;

    GetDatabaseSchemaResponse({this.item});
    GetDatabaseSchemaResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        item = JsonConverters.fromJson(json['item'],'SchemaDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'item': JsonConverters.toJson(item,'SchemaDto',context!)
    });

    getTypeName() => "GetDatabaseSchemaResponse";
    TypeContext? context = _ctx;
}

class GetDatabaseSchemasResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<SchemaListProjection>? list;

    GetDatabaseSchemasResponse({this.list});
    GetDatabaseSchemasResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<SchemaListProjection>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<SchemaListProjection>',context!)
    });

    getTypeName() => "GetDatabaseSchemasResponse";
    TypeContext? context = _ctx;
}

class AggregateResponse extends ResponseBase implements IConvertible
{
    List<dynamic>? result;

    AggregateResponse({this.result});
    AggregateResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'List<dynamic>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'List<dynamic>',context!)
    });

    getTypeName() => "AggregateResponse";
    TypeContext? context = _ctx;
}

class CountResponse extends ResponseBase implements IConvertible
{
    int count = 0;

    CountResponse({this.count=0});
    CountResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        count = json['count'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'count': count
    });

    getTypeName() => "CountResponse";
    TypeContext? context = _ctx;
}

class DistinctResponse extends ResponseBase implements IConvertible
{
    List<dynamic>? values;

    DistinctResponse({this.values});
    DistinctResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        values = JsonConverters.fromJson(json['values'],'List<dynamic>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'values': JsonConverters.toJson(values,'List<dynamic>',context!)
    });

    getTypeName() => "DistinctResponse";
    TypeContext? context = _ctx;
}

class ExecuteAggregateResponse extends ResponseBase implements IConvertible
{
    List<dynamic>? result;

    ExecuteAggregateResponse({this.result});
    ExecuteAggregateResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'List<dynamic>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'List<dynamic>',context!)
    });

    getTypeName() => "ExecuteAggregateResponse";
    TypeContext? context = _ctx;
}

class FindResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<dynamic>? list;

    FindResponse({this.list});
    FindResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<dynamic>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<dynamic>',context!)
    });

    getTypeName() => "FindResponse";
    TypeContext? context = _ctx;
}

class FindOneResponse extends ResponseBase implements IConvertible
{
    dynamic? result;

    FindOneResponse({this.result});
    FindOneResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'dynamic',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'dynamic',context!)
    });

    getTypeName() => "FindOneResponse";
    TypeContext? context = _ctx;
}

class GetFileByIdResponse extends ResponseBase implements IConvertible
{
    FileResourceRefDto? file;
    bool? isPublic;
    String? publicUrl;

    GetFileByIdResponse({this.file,this.isPublic,this.publicUrl});
    GetFileByIdResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        isPublic = json['isPublic'];
        publicUrl = json['publicUrl'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!),
        'isPublic': isPublic,
        'publicUrl': publicUrl
    });

    getTypeName() => "GetFileByIdResponse";
    TypeContext? context = _ctx;
}

class GetFileInfoResponse extends ResponseBase implements IConvertible
{
    FileResourceRefDto? file;
    bool? isPublic;
    String? publicUrl;

    GetFileInfoResponse({this.file,this.isPublic,this.publicUrl});
    GetFileInfoResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        isPublic = json['isPublic'];
        publicUrl = json['publicUrl'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!),
        'isPublic': isPublic,
        'publicUrl': publicUrl
    });

    getTypeName() => "GetFileInfoResponse";
    TypeContext? context = _ctx;
}

class GetSignedUrlResponse extends ResponseBase implements IConvertible
{
    String? url;

    GetSignedUrlResponse({this.url});
    GetSignedUrlResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        url = json['url'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'url': url
    });

    getTypeName() => "GetSignedUrlResponse";
    TypeContext? context = _ctx;
}

class ListFilesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<FileResourceRefDto>? list;
    List<String>? folders;
    List<PublicFolderDto>? publicFolders;

    ListFilesResponse({this.list,this.folders,this.publicFolders});
    ListFilesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<FileResourceRefDto>',context!);
        folders = JsonConverters.fromJson(json['folders'],'List<String>',context!);
        publicFolders = JsonConverters.fromJson(json['publicFolders'],'List<PublicFolderDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<FileResourceRefDto>',context!),
        'folders': JsonConverters.toJson(folders,'List<String>',context!),
        'publicFolders': JsonConverters.toJson(publicFolders,'List<PublicFolderDto>',context!)
    });

    getTypeName() => "ListFilesResponse";
    TypeContext? context = _ctx;
}

class RegisterFilesResponse extends ResponseBase implements IConvertible
{
    bool? dryRun;
    int registered = 0;
    int unchanged = 0;
    int failed = 0;
    List<RegisterFileResult>? items;

    RegisterFilesResponse({this.dryRun,this.registered=0,this.unchanged=0,this.failed=0,this.items});
    RegisterFilesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        dryRun = json['dryRun'];
        registered = json['registered'] ?? 0;
        unchanged = json['unchanged'] ?? 0;
        failed = json['failed'] ?? 0;
        items = JsonConverters.fromJson(json['items'],'List<RegisterFileResult>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'dryRun': dryRun,
        'registered': registered,
        'unchanged': unchanged,
        'failed': failed,
        'items': JsonConverters.toJson(items,'List<RegisterFileResult>',context!)
    });

    getTypeName() => "RegisterFilesResponse";
    TypeContext? context = _ctx;
}

class RequestUploadUrlResponse extends ResponseBase implements IConvertible
{
    String? url;

    RequestUploadUrlResponse({this.url});
    RequestUploadUrlResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        url = json['url'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'url': url
    });

    getTypeName() => "RequestUploadUrlResponse";
    TypeContext? context = _ctx;
}

class GetOwnPushDevicesResponse extends ResponseBase implements IConvertible
{
    List<OwnPushDeviceDto> items = [];

    GetOwnPushDevicesResponse({this.items=const []});
    GetOwnPushDevicesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        items = JsonConverters.fromJson(json['items'],'List<OwnPushDeviceDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'items': JsonConverters.toJson(items,'List<OwnPushDeviceDto>',context!)
    });

    getTypeName() => "GetOwnPushDevicesResponse";
    TypeContext? context = _ctx;
}

class GetOwnPushMessagesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<OwnPushMessageDto>? list;

    GetOwnPushMessagesResponse({this.list});
    GetOwnPushMessagesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<OwnPushMessageDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<OwnPushMessageDto>',context!)
    });

    getTypeName() => "GetOwnPushMessagesResponse";
    TypeContext? context = _ctx;
}

class WriteLogsResponse extends ResponseBase implements IConvertible
{
    int accepted = 0;

    WriteLogsResponse({this.accepted=0});
    WriteLogsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        accepted = json['accepted'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'accepted': accepted
    });

    getTypeName() => "WriteLogsResponse";
    TypeContext? context = _ctx;
}

class GetPaymentOrderResponse extends ResponseBase implements IConvertible
{
    PaymentOrderDto? item;

    GetPaymentOrderResponse({this.item});
    GetPaymentOrderResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        item = JsonConverters.fromJson(json['item'],'PaymentOrderDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'item': JsonConverters.toJson(item,'PaymentOrderDto',context!)
    });

    getTypeName() => "GetPaymentOrderResponse";
    TypeContext? context = _ctx;
}

class GetPaymentOrdersResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<PaymentOrderDto>? list;

    GetPaymentOrdersResponse({this.list});
    GetPaymentOrdersResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<PaymentOrderDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<PaymentOrderDto>',context!)
    });

    getTypeName() => "GetPaymentOrdersResponse";
    TypeContext? context = _ctx;
}

class StartPaymentCheckoutResponse extends ResponseBase implements IConvertible
{
    PaymentOrderCheckoutDto? checkout;
    bool? reused;
    PaymentOrderDto? order;

    StartPaymentCheckoutResponse({this.checkout,this.reused,this.order});
    StartPaymentCheckoutResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        checkout = JsonConverters.fromJson(json['checkout'],'PaymentOrderCheckoutDto',context!);
        reused = json['reused'];
        order = JsonConverters.fromJson(json['order'],'PaymentOrderDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'checkout': JsonConverters.toJson(checkout,'PaymentOrderCheckoutDto',context!),
        'reused': reused,
        'order': JsonConverters.toJson(order,'PaymentOrderDto',context!)
    });

    getTypeName() => "StartPaymentCheckoutResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunsResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    PaginatedResponse<WorkflowRunListProjection>? list;

    WorkflowRunsResponse({this.list});
    WorkflowRunsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<WorkflowRunListProjection>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<WorkflowRunListProjection>',context!)
    });

    getTypeName() => "WorkflowRunsResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    WorkflowRunDto? run;

    WorkflowRunResponse({this.run});
    WorkflowRunResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        run = JsonConverters.fromJson(json['run'],'WorkflowRunDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'run': JsonConverters.toJson(run,'WorkflowRunDto',context!)
    });

    getTypeName() => "WorkflowRunResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class CodeWorkflowResumeLinkResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    String? runId;

    // @DataMember
    String? workflowId;

    // @DataMember
    String? workflowName;

    // @DataMember
    String? stepId;

    // @DataMember
    String? stepName;

    // @DataMember
    String? mode;

    // @DataMember
    String? decision;

    // @DataMember
    String? key;

    // @DataMember
    String? assigneeUserId;

    // @DataMember
    DateTime? expiresAt;

    CodeWorkflowResumeLinkResponse({this.runId,this.workflowId,this.workflowName,this.stepId,this.stepName,this.mode,this.decision,this.key,this.assigneeUserId,this.expiresAt});
    CodeWorkflowResumeLinkResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        runId = json['runId'];
        workflowId = json['workflowId'];
        workflowName = json['workflowName'];
        stepId = json['stepId'];
        stepName = json['stepName'];
        mode = json['mode'];
        decision = json['decision'];
        key = json['key'];
        assigneeUserId = json['assigneeUserId'];
        expiresAt = JsonConverters.fromJson(json['expiresAt'],'DateTime',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'runId': runId,
        'workflowId': workflowId,
        'workflowName': workflowName,
        'stepId': stepId,
        'stepName': stepName,
        'mode': mode,
        'decision': decision,
        'key': key,
        'assigneeUserId': assigneeUserId,
        'expiresAt': JsonConverters.toJson(expiresAt,'DateTime',context!)
    });

    getTypeName() => "CodeWorkflowResumeLinkResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class WorkflowRunLogsResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    PaginatedResponse<TenantLogEntryDto>? list;

    WorkflowRunLogsResponse({this.list});
    WorkflowRunLogsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<TenantLogEntryDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<TenantLogEntryDto>',context!)
    });

    getTypeName() => "WorkflowRunLogsResponse";
    TypeContext? context = _ctx;
}

class GetNotificationInboxResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<InAppNotificationDto>? list;

    GetNotificationInboxResponse({this.list});
    GetNotificationInboxResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<InAppNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<InAppNotificationDto>',context!)
    });

    getTypeName() => "GetNotificationInboxResponse";
    TypeContext? context = _ctx;
}

class GetUnreadCountResponse extends ResponseBase implements IConvertible
{
    int count = 0;

    GetUnreadCountResponse({this.count=0});
    GetUnreadCountResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        count = json['count'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'count': count
    });

    getTypeName() => "GetUnreadCountResponse";
    TypeContext? context = _ctx;
}

class MarkNotificationReadResponse extends ResponseBase implements IConvertible
{
    MarkNotificationReadResponse();
    MarkNotificationReadResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "MarkNotificationReadResponse";
    TypeContext? context = _ctx;
}

class MarkAllNotificationsReadResponse extends ResponseBase implements IConvertible
{
    MarkAllNotificationsReadResponse();
    MarkAllNotificationsReadResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "MarkAllNotificationsReadResponse";
    TypeContext? context = _ctx;
}

class GetContactResponse extends ResponseBase implements IConvertible
{
    UserDto? item;

    GetContactResponse({this.item});
    GetContactResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        item = JsonConverters.fromJson(json['item'],'UserDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'item': JsonConverters.toJson(item,'UserDto',context!)
    });

    getTypeName() => "GetContactResponse";
    TypeContext? context = _ctx;
}

class GetAllContactsResponse extends ResponseBase implements IConvertible
{
    IReadOnlyList<UserDto>? items;
    String? nextCursor;

    GetAllContactsResponse({this.items,this.nextCursor});
    GetAllContactsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        items = JsonConverters.fromJson(json['items'],'IReadOnlyList<UserDto>',context!);
        nextCursor = json['nextCursor'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'items': JsonConverters.toJson(items,'IReadOnlyList<UserDto>',context!),
        'nextCursor': nextCursor
    });

    getTypeName() => "GetAllContactsResponse";
    TypeContext? context = _ctx;
}

class RepairContactRolesResponse extends ResponseBase implements IConvertible
{
    ContactRolesRepairDto? result;

    RepairContactRolesResponse({this.result});
    RepairContactRolesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'ContactRolesRepairDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'ContactRolesRepairDto',context!)
    });

    getTypeName() => "RepairContactRolesResponse";
    TypeContext? context = _ctx;
}

class GetFolderFilesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<FileResourceRefDto>? list;
    List<String>? folders;
    List<PublicFolderDto>? publicFolders;

    GetFolderFilesResponse({this.list,this.folders,this.publicFolders});
    GetFolderFilesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<FileResourceRefDto>',context!);
        folders = JsonConverters.fromJson(json['folders'],'List<String>',context!);
        publicFolders = JsonConverters.fromJson(json['publicFolders'],'List<PublicFolderDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<FileResourceRefDto>',context!),
        'folders': JsonConverters.toJson(folders,'List<String>',context!),
        'publicFolders': JsonConverters.toJson(publicFolders,'List<PublicFolderDto>',context!)
    });

    getTypeName() => "GetFolderFilesResponse";
    TypeContext? context = _ctx;
}

class GetCollectionImportResponse extends ResponseBase implements IConvertible
{
    CollectionImportDto? result;

    GetCollectionImportResponse({this.result});
    GetCollectionImportResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'CollectionImportDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'CollectionImportDto',context!)
    });

    getTypeName() => "GetCollectionImportResponse";
    TypeContext? context = _ctx;
}

class GetCollectionImportsResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<CollectionImportDto>? result;

    GetCollectionImportsResponse({this.result});
    GetCollectionImportsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'PaginatedResponse<CollectionImportDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'PaginatedResponse<CollectionImportDto>',context!)
    });

    getTypeName() => "GetCollectionImportsResponse";
    TypeContext? context = _ctx;
}

class RequestImportUploadUrlResponse extends ResponseBase implements IConvertible
{
    ImportUploadTargetDto? result;

    RequestImportUploadUrlResponse({this.result});
    RequestImportUploadUrlResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'ImportUploadTargetDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'ImportUploadTargetDto',context!)
    });

    getTypeName() => "RequestImportUploadUrlResponse";
    TypeContext? context = _ctx;
}

class AnalyzeImportFileResponse extends ResponseBase implements IConvertible
{
    ImportFileAnalysisDto? result;

    AnalyzeImportFileResponse({this.result});
    AnalyzeImportFileResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'ImportFileAnalysisDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'ImportFileAnalysisDto',context!)
    });

    getTypeName() => "AnalyzeImportFileResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignResponse extends ResponseBase implements IConvertible
{
    EmailCampaignDto? item;

    GetEmailCampaignResponse({this.item});
    GetEmailCampaignResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        item = JsonConverters.fromJson(json['item'],'EmailCampaignDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'item': JsonConverters.toJson(item,'EmailCampaignDto',context!)
    });

    getTypeName() => "GetEmailCampaignResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignsResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<EmailCampaignListProjection>? list;

    GetEmailCampaignsResponse({this.list});
    GetEmailCampaignsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<EmailCampaignListProjection>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<EmailCampaignListProjection>',context!)
    });

    getTypeName() => "GetEmailCampaignsResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignBatchesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<EmailCampaignBatchDto>? list;

    GetEmailCampaignBatchesResponse({this.list});
    GetEmailCampaignBatchesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<EmailCampaignBatchDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<EmailCampaignBatchDto>',context!)
    });

    getTypeName() => "GetEmailCampaignBatchesResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignBatchNotificationResponse extends ResponseBase implements IConvertible
{
    EmailCampaignBatchNotificationDto? campaignNotification;

    GetEmailCampaignBatchNotificationResponse({this.campaignNotification});
    GetEmailCampaignBatchNotificationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaignNotification = JsonConverters.fromJson(json['campaignNotification'],'EmailCampaignBatchNotificationDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaignNotification': JsonConverters.toJson(campaignNotification,'EmailCampaignBatchNotificationDto',context!)
    });

    getTypeName() => "GetEmailCampaignBatchNotificationResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignBatchNotificationsResponse extends ResponseBase implements IConvertible
{
    List<BatchStatusChangeEntryDto>? batchStatusHistory;
    PaginatedResponse<EmailCampaignBatchNotificationDto>? list;

    GetEmailCampaignBatchNotificationsResponse({this.batchStatusHistory,this.list});
    GetEmailCampaignBatchNotificationsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        batchStatusHistory = JsonConverters.fromJson(json['batchStatusHistory'],'List<BatchStatusChangeEntryDto>',context!);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<EmailCampaignBatchNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'batchStatusHistory': JsonConverters.toJson(batchStatusHistory,'List<BatchStatusChangeEntryDto>',context!),
        'list': JsonConverters.toJson(list,'PaginatedResponse<EmailCampaignBatchNotificationDto>',context!)
    });

    getTypeName() => "GetEmailCampaignBatchNotificationsResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignStatisticsResponse extends ResponseBase implements IConvertible
{
    CampaignStatsDto? stats;

    GetEmailCampaignStatisticsResponse({this.stats});
    GetEmailCampaignStatisticsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        stats = JsonConverters.fromJson(json['stats'],'CampaignStatsDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'stats': JsonConverters.toJson(stats,'CampaignStatsDto',context!)
    });

    getTypeName() => "GetEmailCampaignStatisticsResponse";
    TypeContext? context = _ctx;
}

class PreviewEmailNotificationResponse extends ResponseBase implements IConvertible
{
    String? subject;
    String? body;

    PreviewEmailNotificationResponse({this.subject,this.body});
    PreviewEmailNotificationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        subject = json['subject'];
        body = json['body'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'subject': subject,
        'body': body
    });

    getTypeName() => "PreviewEmailNotificationResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class RetryFailedEmailNotificationsResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    String? retryRequestId;

    // @DataMember
    int selected = 0;

    // @DataMember
    Map<String,int?>? skipped;

    // @DataMember
    bool? replayed;

    // @DataMember
    String? warning;

    RetryFailedEmailNotificationsResponse({this.retryRequestId,this.selected=0,this.skipped,this.replayed,this.warning});
    RetryFailedEmailNotificationsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        retryRequestId = json['retryRequestId'];
        selected = json['selected'] ?? 0;
        skipped = JsonConverters.fromJson(json['skipped'],'Map<String,int?>',context!);
        replayed = json['replayed'];
        warning = json['warning'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'retryRequestId': retryRequestId,
        'selected': selected,
        'skipped': JsonConverters.toJson(skipped,'Map<String,int?>',context!),
        'replayed': replayed,
        'warning': warning
    });

    getTypeName() => "RetryFailedEmailNotificationsResponse";
    TypeContext? context = _ctx;
}

class GetEmailCampaignMessagesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<EmailCampaignBatchNotificationDto>? list;

    GetEmailCampaignMessagesResponse({this.list});
    GetEmailCampaignMessagesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<EmailCampaignBatchNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<EmailCampaignBatchNotificationDto>',context!)
    });

    getTypeName() => "GetEmailCampaignMessagesResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignResponse extends ResponseBase implements IConvertible
{
    SmsCampaignDto? smsCampaign;

    GetSmsCampaignResponse({this.smsCampaign});
    GetSmsCampaignResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        smsCampaign = JsonConverters.fromJson(json['smsCampaign'],'SmsCampaignDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'smsCampaign': JsonConverters.toJson(smsCampaign,'SmsCampaignDto',context!)
    });

    getTypeName() => "GetSmsCampaignResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignsResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<SmsCampaignDto>? list;

    GetSmsCampaignsResponse({this.list});
    GetSmsCampaignsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<SmsCampaignDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<SmsCampaignDto>',context!)
    });

    getTypeName() => "GetSmsCampaignsResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignBatchesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<SmsCampaignBatchDto>? list;

    GetSmsCampaignBatchesResponse({this.list});
    GetSmsCampaignBatchesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<SmsCampaignBatchDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<SmsCampaignBatchDto>',context!)
    });

    getTypeName() => "GetSmsCampaignBatchesResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignBatchNotificationResponse extends ResponseBase implements IConvertible
{
    SmsCampaignBatchNotificationDto? campaignNotification;

    GetSmsCampaignBatchNotificationResponse({this.campaignNotification});
    GetSmsCampaignBatchNotificationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaignNotification = JsonConverters.fromJson(json['campaignNotification'],'SmsCampaignBatchNotificationDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaignNotification': JsonConverters.toJson(campaignNotification,'SmsCampaignBatchNotificationDto',context!)
    });

    getTypeName() => "GetSmsCampaignBatchNotificationResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignBatchNotificationsResponse extends ResponseBase implements IConvertible
{
    List<BatchStatusChangeEntryDto>? batchStatusHistory;
    PaginatedResponse<SmsCampaignBatchNotificationDto>? list;

    GetSmsCampaignBatchNotificationsResponse({this.batchStatusHistory,this.list});
    GetSmsCampaignBatchNotificationsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        batchStatusHistory = JsonConverters.fromJson(json['batchStatusHistory'],'List<BatchStatusChangeEntryDto>',context!);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<SmsCampaignBatchNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'batchStatusHistory': JsonConverters.toJson(batchStatusHistory,'List<BatchStatusChangeEntryDto>',context!),
        'list': JsonConverters.toJson(list,'PaginatedResponse<SmsCampaignBatchNotificationDto>',context!)
    });

    getTypeName() => "GetSmsCampaignBatchNotificationsResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignStatisticsResponse extends ResponseBase implements IConvertible
{
    CampaignStatsDto? stats;

    GetSmsCampaignStatisticsResponse({this.stats});
    GetSmsCampaignStatisticsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        stats = JsonConverters.fromJson(json['stats'],'CampaignStatsDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'stats': JsonConverters.toJson(stats,'CampaignStatsDto',context!)
    });

    getTypeName() => "GetSmsCampaignStatisticsResponse";
    TypeContext? context = _ctx;
}

class PreviewSmsNotificationResponse extends ResponseBase implements IConvertible
{
    String? body;

    PreviewSmsNotificationResponse({this.body});
    PreviewSmsNotificationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        body = json['body'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'body': body
    });

    getTypeName() => "PreviewSmsNotificationResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class RetryFailedSmsNotificationsResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    String? retryRequestId;

    // @DataMember
    int selected = 0;

    // @DataMember
    Map<String,int?>? skipped;

    // @DataMember
    bool? replayed;

    // @DataMember
    String? warning;

    RetryFailedSmsNotificationsResponse({this.retryRequestId,this.selected=0,this.skipped,this.replayed,this.warning});
    RetryFailedSmsNotificationsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        retryRequestId = json['retryRequestId'];
        selected = json['selected'] ?? 0;
        skipped = JsonConverters.fromJson(json['skipped'],'Map<String,int?>',context!);
        replayed = json['replayed'];
        warning = json['warning'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'retryRequestId': retryRequestId,
        'selected': selected,
        'skipped': JsonConverters.toJson(skipped,'Map<String,int?>',context!),
        'replayed': replayed,
        'warning': warning
    });

    getTypeName() => "RetryFailedSmsNotificationsResponse";
    TypeContext? context = _ctx;
}

class GetSmsCampaignMessagesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<SmsCampaignBatchNotificationDto>? list;

    GetSmsCampaignMessagesResponse({this.list});
    GetSmsCampaignMessagesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<SmsCampaignBatchNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<SmsCampaignBatchNotificationDto>',context!)
    });

    getTypeName() => "GetSmsCampaignMessagesResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignAudienceCountResponse extends ResponseBase implements IConvertible
{
    PushAudienceCountDto? result;

    GetPushCampaignAudienceCountResponse({this.result});
    GetPushCampaignAudienceCountResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = JsonConverters.fromJson(json['result'],'PushAudienceCountDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': JsonConverters.toJson(result,'PushAudienceCountDto',context!)
    });

    getTypeName() => "GetPushCampaignAudienceCountResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignResponse extends ResponseBase implements IConvertible
{
    PushCampaignDto? item;

    GetPushCampaignResponse({this.item});
    GetPushCampaignResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        item = JsonConverters.fromJson(json['item'],'PushCampaignDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'item': JsonConverters.toJson(item,'PushCampaignDto',context!)
    });

    getTypeName() => "GetPushCampaignResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignsResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<PushCampaignDto>? list;

    GetPushCampaignsResponse({this.list});
    GetPushCampaignsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<PushCampaignDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<PushCampaignDto>',context!)
    });

    getTypeName() => "GetPushCampaignsResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignBatchesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<PushCampaignBatchDto>? list;

    GetPushCampaignBatchesResponse({this.list});
    GetPushCampaignBatchesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<PushCampaignBatchDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<PushCampaignBatchDto>',context!)
    });

    getTypeName() => "GetPushCampaignBatchesResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignBatchNotificationResponse extends ResponseBase implements IConvertible
{
    PushCampaignBatchNotificationDto? campaignNotification;

    GetPushCampaignBatchNotificationResponse({this.campaignNotification});
    GetPushCampaignBatchNotificationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaignNotification = JsonConverters.fromJson(json['campaignNotification'],'PushCampaignBatchNotificationDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaignNotification': JsonConverters.toJson(campaignNotification,'PushCampaignBatchNotificationDto',context!)
    });

    getTypeName() => "GetPushCampaignBatchNotificationResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignBatchNotificationsResponse extends ResponseBase implements IConvertible
{
    List<BatchStatusChangeEntryDto>? batchStatusHistory;
    PaginatedResponse<PushCampaignBatchNotificationDto>? list;

    GetPushCampaignBatchNotificationsResponse({this.batchStatusHistory,this.list});
    GetPushCampaignBatchNotificationsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        batchStatusHistory = JsonConverters.fromJson(json['batchStatusHistory'],'List<BatchStatusChangeEntryDto>',context!);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<PushCampaignBatchNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'batchStatusHistory': JsonConverters.toJson(batchStatusHistory,'List<BatchStatusChangeEntryDto>',context!),
        'list': JsonConverters.toJson(list,'PaginatedResponse<PushCampaignBatchNotificationDto>',context!)
    });

    getTypeName() => "GetPushCampaignBatchNotificationsResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignStatisticsResponse extends ResponseBase implements IConvertible
{
    CampaignStatsDto? stats;

    GetPushCampaignStatisticsResponse({this.stats});
    GetPushCampaignStatisticsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        stats = JsonConverters.fromJson(json['stats'],'CampaignStatsDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'stats': JsonConverters.toJson(stats,'CampaignStatsDto',context!)
    });

    getTypeName() => "GetPushCampaignStatisticsResponse";
    TypeContext? context = _ctx;
}

class PreviewPushNotificationResponse extends ResponseBase implements IConvertible
{
    String? title;
    String? body;
    String? subtitle;

    PreviewPushNotificationResponse({this.title,this.body,this.subtitle});
    PreviewPushNotificationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        title = json['title'];
        body = json['body'];
        subtitle = json['subtitle'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'title': title,
        'body': body,
        'subtitle': subtitle
    });

    getTypeName() => "PreviewPushNotificationResponse";
    TypeContext? context = _ctx;
}

// @DataContract
class RetryFailedPushNotificationsResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    String? retryRequestId;

    // @DataMember
    int selected = 0;

    // @DataMember
    Map<String,int?>? skipped;

    // @DataMember
    bool? replayed;

    // @DataMember
    String? warning;

    RetryFailedPushNotificationsResponse({this.retryRequestId,this.selected=0,this.skipped,this.replayed,this.warning});
    RetryFailedPushNotificationsResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        retryRequestId = json['retryRequestId'];
        selected = json['selected'] ?? 0;
        skipped = JsonConverters.fromJson(json['skipped'],'Map<String,int?>',context!);
        replayed = json['replayed'];
        warning = json['warning'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'retryRequestId': retryRequestId,
        'selected': selected,
        'skipped': JsonConverters.toJson(skipped,'Map<String,int?>',context!),
        'replayed': replayed,
        'warning': warning
    });

    getTypeName() => "RetryFailedPushNotificationsResponse";
    TypeContext? context = _ctx;
}

class GetPushCampaignMessagesResponse extends ResponseBase implements IConvertible
{
    PaginatedResponse<PushCampaignBatchNotificationDto>? list;

    GetPushCampaignMessagesResponse({this.list});
    GetPushCampaignMessagesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<PushCampaignBatchNotificationDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<PushCampaignBatchNotificationDto>',context!)
    });

    getTypeName() => "GetPushCampaignMessagesResponse";
    TypeContext? context = _ctx;
}

class SharedTypeGen implements IConvertible, IPost
{
    StringFieldDto? typegen_StringFieldDto;
    DecimalFieldDto? typegen_DecimalFieldDto;
    CurrencyFieldDto? typegen_CurrencyFieldDto;
    BooleanFieldDto? typegen_BooleanFieldDto;
    DateFieldDto? typegen_DateFieldDto;
    IntegerFieldDto? typegen_IntegerFieldDto;
    GeolocationFieldDto? typegen_GeolocationFieldDto;
    TagsFieldDto? typegen_TagsFieldDto;
    FileFieldDto? typegen_FileFieldDto;
    TaxonomySelectionFieldDto? typegen_TaxonomySelectionFieldDto;
    CollectionSelectionFieldDto? typegen_CollectionSelectionFieldDto;
    UserSelectionFieldDto? typegen_UserSelectionFieldDto;
    RoleSelectionFieldDto? typegen_RoleSelectionFieldDto;
    EnumSelectionFieldDto? typegen_EnumSelectionFieldDto;
    ObjectFieldDto? typegen_ObjectFieldDto;
    ArrayFieldDto? typegen_ArrayFieldDto;
    JsonFieldDto? typegen_JsonFieldDto;

    SharedTypeGen({this.typegen_StringFieldDto,this.typegen_DecimalFieldDto,this.typegen_CurrencyFieldDto,this.typegen_BooleanFieldDto,this.typegen_DateFieldDto,this.typegen_IntegerFieldDto,this.typegen_GeolocationFieldDto,this.typegen_TagsFieldDto,this.typegen_FileFieldDto,this.typegen_TaxonomySelectionFieldDto,this.typegen_CollectionSelectionFieldDto,this.typegen_UserSelectionFieldDto,this.typegen_RoleSelectionFieldDto,this.typegen_EnumSelectionFieldDto,this.typegen_ObjectFieldDto,this.typegen_ArrayFieldDto,this.typegen_JsonFieldDto});
    SharedTypeGen.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        typegen_StringFieldDto = JsonConverters.fromJson(json['typegen_StringFieldDto'],'StringFieldDto',context!);
        typegen_DecimalFieldDto = JsonConverters.fromJson(json['typegen_DecimalFieldDto'],'DecimalFieldDto',context!);
        typegen_CurrencyFieldDto = JsonConverters.fromJson(json['typegen_CurrencyFieldDto'],'CurrencyFieldDto',context!);
        typegen_BooleanFieldDto = JsonConverters.fromJson(json['typegen_BooleanFieldDto'],'BooleanFieldDto',context!);
        typegen_DateFieldDto = JsonConverters.fromJson(json['typegen_DateFieldDto'],'DateFieldDto',context!);
        typegen_IntegerFieldDto = JsonConverters.fromJson(json['typegen_IntegerFieldDto'],'IntegerFieldDto',context!);
        typegen_GeolocationFieldDto = JsonConverters.fromJson(json['typegen_GeolocationFieldDto'],'GeolocationFieldDto',context!);
        typegen_TagsFieldDto = JsonConverters.fromJson(json['typegen_TagsFieldDto'],'TagsFieldDto',context!);
        typegen_FileFieldDto = JsonConverters.fromJson(json['typegen_FileFieldDto'],'FileFieldDto',context!);
        typegen_TaxonomySelectionFieldDto = JsonConverters.fromJson(json['typegen_TaxonomySelectionFieldDto'],'TaxonomySelectionFieldDto',context!);
        typegen_CollectionSelectionFieldDto = JsonConverters.fromJson(json['typegen_CollectionSelectionFieldDto'],'CollectionSelectionFieldDto',context!);
        typegen_UserSelectionFieldDto = JsonConverters.fromJson(json['typegen_UserSelectionFieldDto'],'UserSelectionFieldDto',context!);
        typegen_RoleSelectionFieldDto = JsonConverters.fromJson(json['typegen_RoleSelectionFieldDto'],'RoleSelectionFieldDto',context!);
        typegen_EnumSelectionFieldDto = JsonConverters.fromJson(json['typegen_EnumSelectionFieldDto'],'EnumSelectionFieldDto',context!);
        typegen_ObjectFieldDto = JsonConverters.fromJson(json['typegen_ObjectFieldDto'],'ObjectFieldDto',context!);
        typegen_ArrayFieldDto = JsonConverters.fromJson(json['typegen_ArrayFieldDto'],'ArrayFieldDto',context!);
        typegen_JsonFieldDto = JsonConverters.fromJson(json['typegen_JsonFieldDto'],'JsonFieldDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'typegen_StringFieldDto': JsonConverters.toJson(typegen_StringFieldDto,'StringFieldDto',context!),
        'typegen_DecimalFieldDto': JsonConverters.toJson(typegen_DecimalFieldDto,'DecimalFieldDto',context!),
        'typegen_CurrencyFieldDto': JsonConverters.toJson(typegen_CurrencyFieldDto,'CurrencyFieldDto',context!),
        'typegen_BooleanFieldDto': JsonConverters.toJson(typegen_BooleanFieldDto,'BooleanFieldDto',context!),
        'typegen_DateFieldDto': JsonConverters.toJson(typegen_DateFieldDto,'DateFieldDto',context!),
        'typegen_IntegerFieldDto': JsonConverters.toJson(typegen_IntegerFieldDto,'IntegerFieldDto',context!),
        'typegen_GeolocationFieldDto': JsonConverters.toJson(typegen_GeolocationFieldDto,'GeolocationFieldDto',context!),
        'typegen_TagsFieldDto': JsonConverters.toJson(typegen_TagsFieldDto,'TagsFieldDto',context!),
        'typegen_FileFieldDto': JsonConverters.toJson(typegen_FileFieldDto,'FileFieldDto',context!),
        'typegen_TaxonomySelectionFieldDto': JsonConverters.toJson(typegen_TaxonomySelectionFieldDto,'TaxonomySelectionFieldDto',context!),
        'typegen_CollectionSelectionFieldDto': JsonConverters.toJson(typegen_CollectionSelectionFieldDto,'CollectionSelectionFieldDto',context!),
        'typegen_UserSelectionFieldDto': JsonConverters.toJson(typegen_UserSelectionFieldDto,'UserSelectionFieldDto',context!),
        'typegen_RoleSelectionFieldDto': JsonConverters.toJson(typegen_RoleSelectionFieldDto,'RoleSelectionFieldDto',context!),
        'typegen_EnumSelectionFieldDto': JsonConverters.toJson(typegen_EnumSelectionFieldDto,'EnumSelectionFieldDto',context!),
        'typegen_ObjectFieldDto': JsonConverters.toJson(typegen_ObjectFieldDto,'ObjectFieldDto',context!),
        'typegen_ArrayFieldDto': JsonConverters.toJson(typegen_ArrayFieldDto,'ArrayFieldDto',context!),
        'typegen_JsonFieldDto': JsonConverters.toJson(typegen_JsonFieldDto,'JsonFieldDto',context!)
    };

    getTypeName() => "SharedTypeGen";
    TypeContext? context = _ctx;
}

// @Route("/{version}/echo", "GET")
class Echo extends RequestBase implements IReturn<EchoResponse>, IConvertible, IGet
{
    Echo();
    Echo.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => EchoResponse();
    getResponseTypeName() => "EchoResponse";
    getTypeName() => "Echo";
    TypeContext? context = _ctx;
}

// @Route("/{version}/public/projects/{ProjectId}/brand/{Kind}", "GET")
class GetPublicProjectBrandAsset extends RequestBase implements IReturn<Uint8List>, IConvertible, IGet
{
    String? projectId;
    String? kind;
    String? v;

    GetPublicProjectBrandAsset({this.projectId,this.kind,this.v});
    GetPublicProjectBrandAsset.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        projectId = json['projectId'];
        kind = json['kind'];
        v = json['v'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'projectId': projectId,
        'kind': kind,
        'v': v
    });

    createResponse() => Uint8List(0);
    getResponseTypeName() => "Uint8List";
    getTypeName() => "GetPublicProjectBrandAsset";
    TypeContext? context = _ctx;
}

// @Route("/{version}/public/projects/{ProjectId}/config", "GET")
class GetPublicProjectConfig extends RequestBase implements IReturn<PublicProjectConfigDto>, IConvertible, IGet
{
    String? projectId;

    GetPublicProjectConfig({this.projectId});
    GetPublicProjectConfig.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        projectId = json['projectId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'projectId': projectId
    });

    createResponse() => PublicProjectConfigDto();
    getResponseTypeName() => "PublicProjectConfigDto";
    getTypeName() => "GetPublicProjectConfig";
    TypeContext? context = _ctx;
}

// @Route("/{version}/public/projects/{ProjectId}/legal/{Kind}", "GET")
class GetPublicProjectLegal extends RequestBase implements IReturn<PublicLegalDocumentDto>, IConvertible, IGet
{
    String? projectId;
    String? kind;

    GetPublicProjectLegal({this.projectId,this.kind});
    GetPublicProjectLegal.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        projectId = json['projectId'];
        kind = json['kind'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'projectId': projectId,
        'kind': kind
    });

    createResponse() => PublicLegalDocumentDto();
    getResponseTypeName() => "PublicLegalDocumentDto";
    getTypeName() => "GetPublicProjectLegal";
    TypeContext? context = _ctx;
}

/**
* Adds a file to one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/attachments", "POST")
// @Api(Description="Adds a file to one of the caller's own AI chats.")
class UploadEndUserChatAttachmentRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    String sessionId = "";
    String fileName = "";
    String contentType = "";
    String base64Content = "";

    UploadEndUserChatAttachmentRequest({this.sessionId="",this.fileName="",this.contentType="",this.base64Content=""});
    UploadEndUserChatAttachmentRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        fileName = json['fileName'] ?? "";
        contentType = json['contentType'] ?? "";
        base64Content = json['base64Content'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'fileName': fileName,
        'contentType': contentType,
        'base64Content': base64Content
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "UploadEndUserChatAttachmentRequest";
    TypeContext? context = _ctx;
}

/**
* Lists the files in one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/attachments", "GET")
// @Api(Description="Lists the files in one of the caller's own AI chats.")
class ListEndUserChatAttachmentsRequest extends CodeMashRequestBase implements IReturn<ListEndUserChatAttachmentsResponse>, IConvertible, IGet
{
    String sessionId = "";

    ListEndUserChatAttachmentsRequest({this.sessionId=""});
    ListEndUserChatAttachmentsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId
    });

    createResponse() => ListEndUserChatAttachmentsResponse();
    getResponseTypeName() => "ListEndUserChatAttachmentsResponse";
    getTypeName() => "ListEndUserChatAttachmentsRequest";
    TypeContext? context = _ctx;
}

/**
* Removes a file from one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/attachments/{AttachmentId}", "DELETE")
// @Api(Description="Removes a file from one of the caller's own AI chats.")
class DeleteEndUserChatAttachmentRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    String attachmentId = "";

    DeleteEndUserChatAttachmentRequest({this.attachmentId=""});
    DeleteEndUserChatAttachmentRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        attachmentId = json['attachmentId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'attachmentId': attachmentId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteEndUserChatAttachmentRequest";
    TypeContext? context = _ctx;
}

/**
* Likes, dislikes or clears one message of the caller's own AI chat.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/entries/{EntryId}/feedback", "PUT")
// @Api(Description="Likes, dislikes or clears one message of the caller's own AI chat.")
class SetEndUserChatEntryFeedbackRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    String sessionId = "";
    String entryId = "";
    String? feedback;

    SetEndUserChatEntryFeedbackRequest({this.sessionId="",this.entryId="",this.feedback});
    SetEndUserChatEntryFeedbackRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        entryId = json['entryId'] ?? "";
        feedback = json['feedback'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'entryId': entryId,
        'feedback': feedback
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "SetEndUserChatEntryFeedbackRequest";
    TypeContext? context = _ctx;
}

/**
* Lists what the AI chat remembers about the caller.
*/
// @Route("/{version}/ai/chat/memory", "GET")
// @Api(Description="Lists what the AI chat remembers about the caller.")
class ListEndUserChatMemoryRequest extends CodeMashRequestBase implements IReturn<ListEndUserChatMemoryResponse>, IConvertible, IGet
{
    int? take;

    ListEndUserChatMemoryRequest({this.take});
    ListEndUserChatMemoryRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        take = json['take'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'take': take
    });

    createResponse() => ListEndUserChatMemoryResponse();
    getResponseTypeName() => "ListEndUserChatMemoryResponse";
    getTypeName() => "ListEndUserChatMemoryRequest";
    TypeContext? context = _ctx;
}

/**
* Forgets one thing the AI chat remembers about the caller.
*/
// @Route("/{version}/ai/chat/memory/{NoteId}", "DELETE")
// @Api(Description="Forgets one thing the AI chat remembers about the caller.")
class ForgetEndUserChatMemoryRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    String noteId = "";

    ForgetEndUserChatMemoryRequest({this.noteId=""});
    ForgetEndUserChatMemoryRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        noteId = json['noteId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'noteId': noteId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "ForgetEndUserChatMemoryRequest";
    TypeContext? context = _ctx;
}

/**
* Whether the AI chat can run for the caller, and which assistants it offers.
*/
// @Route("/{version}/ai/chat/availability", "GET")
// @Api(Description="Whether the AI chat can run for the caller, and which assistants it offers.")
class GetEndUserChatAvailabilityRequest extends CodeMashRequestBase implements IReturn<GetEndUserChatAvailabilityResponse>, IConvertible, IGet
{
    GetEndUserChatAvailabilityRequest();
    GetEndUserChatAvailabilityRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => GetEndUserChatAvailabilityResponse();
    getResponseTypeName() => "GetEndUserChatAvailabilityResponse";
    getTypeName() => "GetEndUserChatAvailabilityRequest";
    TypeContext? context = _ctx;
}

/**
* Lists the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions", "GET")
// @Api(Description="Lists the caller's own AI chats.")
class ListEndUserChatSessionsRequest extends CodeMashRequestBase implements IReturn<ListEndUserChatSessionsResponse>, IConvertible, IGet
{
    int? take;
    bool? includeArchived;

    ListEndUserChatSessionsRequest({this.take,this.includeArchived});
    ListEndUserChatSessionsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        take = json['take'];
        includeArchived = json['includeArchived'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'take': take,
        'includeArchived': includeArchived
    });

    createResponse() => ListEndUserChatSessionsResponse();
    getResponseTypeName() => "ListEndUserChatSessionsResponse";
    getTypeName() => "ListEndUserChatSessionsRequest";
    TypeContext? context = _ctx;
}

/**
* Opens a new AI chat for the caller.
*/
// @Route("/{version}/ai/chat/sessions", "POST")
// @Api(Description="Opens a new AI chat for the caller.")
class CreateEndUserChatSessionRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    String? assistantId;
    String? title;

    CreateEndUserChatSessionRequest({this.assistantId,this.title});
    CreateEndUserChatSessionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        assistantId = json['assistantId'];
        title = json['title'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'assistantId': assistantId,
        'title': title
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "CreateEndUserChatSessionRequest";
    TypeContext? context = _ctx;
}

/**
* Returns one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}", "GET")
// @Api(Description="Returns one of the caller's own AI chats.")
class GetEndUserChatSessionRequest extends CodeMashRequestBase implements IReturn<GetEndUserChatSessionResponse>, IConvertible, IGet
{
    String sessionId = "";

    GetEndUserChatSessionRequest({this.sessionId=""});
    GetEndUserChatSessionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId
    });

    createResponse() => GetEndUserChatSessionResponse();
    getResponseTypeName() => "GetEndUserChatSessionResponse";
    getTypeName() => "GetEndUserChatSessionRequest";
    TypeContext? context = _ctx;
}

/**
* Renames one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}", "PATCH")
// @Api(Description="Renames one of the caller's own AI chats.")
class RenameEndUserChatSessionRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPatch
{
    String sessionId = "";
    String? title;

    RenameEndUserChatSessionRequest({this.sessionId="",this.title});
    RenameEndUserChatSessionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        title = json['title'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'title': title
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "RenameEndUserChatSessionRequest";
    TypeContext? context = _ctx;
}

/**
* Pins or unpins one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/pin", "PUT")
// @Api(Description="Pins or unpins one of the caller's own AI chats.")
class PinEndUserChatSessionRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    String sessionId = "";
    bool? pinned;

    PinEndUserChatSessionRequest({this.sessionId="",this.pinned});
    PinEndUserChatSessionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        pinned = json['pinned'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'pinned': pinned
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "PinEndUserChatSessionRequest";
    TypeContext? context = _ctx;
}

/**
* Archives or unarchives one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/archive", "PUT")
// @Api(Description="Archives or unarchives one of the caller's own AI chats.")
class ArchiveEndUserChatSessionRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    String sessionId = "";
    bool? archived;

    ArchiveEndUserChatSessionRequest({this.sessionId="",this.archived});
    ArchiveEndUserChatSessionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        archived = json['archived'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'archived': archived
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "ArchiveEndUserChatSessionRequest";
    TypeContext? context = _ctx;
}

/**
* Deletes one of the caller's own AI chats.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}", "DELETE")
// @Api(Description="Deletes one of the caller's own AI chats.")
class DeleteEndUserChatSessionRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    String sessionId = "";

    DeleteEndUserChatSessionRequest({this.sessionId=""});
    DeleteEndUserChatSessionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteEndUserChatSessionRequest";
    TypeContext? context = _ctx;
}

/**
* Returns a page of one of the caller's own AI chat transcripts.
*/
// @Route("/{version}/ai/chat/sessions/{SessionId}/entries", "GET")
// @Api(Description="Returns a page of one of the caller's own AI chat transcripts.")
class GetEndUserChatEntriesRequest extends CodeMashRequestBase implements IReturn<GetEndUserChatEntriesResponse>, IConvertible, IGet
{
    String sessionId = "";
    int? afterSeq;
    int? take;

    GetEndUserChatEntriesRequest({this.sessionId="",this.afterSeq,this.take});
    GetEndUserChatEntriesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'] ?? "";
        afterSeq = json['afterSeq'];
        take = json['take'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'afterSeq': afterSeq,
        'take': take
    });

    createResponse() => GetEndUserChatEntriesResponse();
    getResponseTypeName() => "GetEndUserChatEntriesResponse";
    getTypeName() => "GetEndUserChatEntriesRequest";
    TypeContext? context = _ctx;
}

/**
* Sends a message to the AI chat; the answer streams on the caller's channel.
*/
// @Route("/{version}/ai/chat/turn", "POST")
// @Api(Description="Sends a message to the AI chat; the answer streams on the caller's channel.")
class StartEndUserChatTurnRequest extends CodeMashRequestBase implements IReturn<StartEndUserChatTurnResponse>, IConvertible, IPost
{
    String? sessionId;
    String? assistantId;
    String message = "";

    StartEndUserChatTurnRequest({this.sessionId,this.assistantId,this.message=""});
    StartEndUserChatTurnRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        sessionId = json['sessionId'];
        assistantId = json['assistantId'];
        message = json['message'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'sessionId': sessionId,
        'assistantId': assistantId,
        'message': message
    });

    createResponse() => StartEndUserChatTurnResponse();
    getResponseTypeName() => "StartEndUserChatTurnResponse";
    getTypeName() => "StartEndUserChatTurnRequest";
    TypeContext? context = _ctx;
}

/**
* Lists the AI tools a project user may use: only their own data (own:* toolsets).
*/
// @Route("/{version}/ai/tools", "GET")
// @Api(Description="Lists the AI tools a project user may use: only their own data (own:* toolsets).")
class GetEndUserAiToolsRequest extends RequestBase implements IReturn<GetEndUserAiToolsResponse>, IConvertible, IGet
{
    GetEndUserAiToolsRequest();
    GetEndUserAiToolsRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => GetEndUserAiToolsResponse();
    getResponseTypeName() => "GetEndUserAiToolsResponse";
    getTypeName() => "GetEndUserAiToolsRequest";
    TypeContext? context = _ctx;
}

/**
* Invokes one own-scope AI tool as the calling project user.
*/
// @Route("/{version}/ai/tools/{ToolName}", "POST")
// @Api(Description="Invokes one own-scope AI tool as the calling project user.")
class InvokeEndUserAiToolRequest extends RequestBase implements IReturn<InvokeEndUserAiToolResponse>, IConvertible, IPost
{
    String toolName = "";
    String? argumentsJson;

    InvokeEndUserAiToolRequest({this.toolName="",this.argumentsJson});
    InvokeEndUserAiToolRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        toolName = json['toolName'] ?? "";
        argumentsJson = json['argumentsJson'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'toolName': toolName,
        'argumentsJson': argumentsJson
    });

    createResponse() => InvokeEndUserAiToolResponse();
    getResponseTypeName() => "InvokeEndUserAiToolResponse";
    getTypeName() => "InvokeEndUserAiToolRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/block", "PATCH")
// @Api(Description="Membership")
// @DataContract
class BlockUserRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPatch
{
    /**
    * Id of the user to block, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to block, from get_users.", IsRequired=true)
    String id = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    BlockUserRequest({this.id="",this.databaseIntegrationId});
    BlockUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "BlockUserRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/service", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveSystemUserWithPermissions extends SaveUserWithRolesBase implements IReturn<IdResponse>, IConvertible, IPost
{
    SaveSystemUserWithPermissions();
    SaveSystemUserWithPermissions.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SaveSystemUserWithPermissions";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/guest", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveGuestUser extends SaveUser implements IReturn<SaveGuestUserResponse>, IConvertible, IPost
{
    SaveGuestUser();
    SaveGuestUser.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => SaveGuestUserResponse();
    getResponseTypeName() => "SaveGuestUserResponse";
    getTypeName() => "SaveGuestUser";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/phone", "POST")
// @Api(Description="Membership")
// @DataContract
class SavePhoneUser extends SaveUser implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * Phone number for the new user, in E.164 format.
    */
    // @DataMember
    // @ApiMember(Description="Phone number for the new user, in E.164 format.", IsRequired=true)
    String phone = "";

    SavePhoneUser({this.phone=""});
    SavePhoneUser.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        phone = json['phone'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'phone': phone
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SavePhoneUser";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/user-name", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveUserNameUser extends SaveUser implements IReturn<IdResponse>, IPublicRegistrationRequest, IConvertible, IPost
{
    // @DataMember
    String password = "";

    // @DataMember
    String userName = "";

    /**
    * Optional roles from the project's "Permitted user registration roles". Empty = the default registration role.
    */
    // @DataMember
    // @ApiMember(Description="Optional roles from the project's \"Permitted user registration roles\". Empty = the default registration role.")
    List<String>? roles;

    SaveUserNameUser({this.password="",this.userName="",this.roles});
    SaveUserNameUser.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        password = json['password'] ?? "";
        userName = json['userName'] ?? "";
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'password': password,
        'userName': userName,
        'roles': JsonConverters.toJson(roles,'List<String>',context!)
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SaveUserNameUser";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/email", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveEmailUser extends SaveUser implements IReturn<IdResponse>, IPublicRegistrationRequest, IConvertible, IPost
{
    // @DataMember
    String password = "";

    // @DataMember
    String email = "";

    /**
    * Optional roles from the project's "Permitted user registration roles". Empty = the default registration role.
    */
    // @DataMember
    // @ApiMember(Description="Optional roles from the project's \"Permitted user registration roles\". Empty = the default registration role.")
    List<String>? roles;

    SaveEmailUser({this.password="",this.email="",this.roles});
    SaveEmailUser.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        password = json['password'] ?? "";
        email = json['email'] ?? "";
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'password': password,
        'email': email,
        'roles': JsonConverters.toJson(roles,'List<String>',context!)
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SaveEmailUser";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/phone-with-permissions", "POST")
// @Api(Description="Membership")
// @DataContract
class SavePhoneUserNameWithPermissions extends SaveUserWithRolesBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String phone = "";

    SavePhoneUserNameWithPermissions({this.phone=""});
    SavePhoneUserNameWithPermissions.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        phone = json['phone'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'phone': phone
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SavePhoneUserNameWithPermissions";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/email-with-permissions", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveEmailUserNameWithPermissions extends SaveUserWithRolesBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String password = "";

    // @DataMember
    String email = "";

    SaveEmailUserNameWithPermissions({this.password="",this.email=""});
    SaveEmailUserNameWithPermissions.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        password = json['password'] ?? "";
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'password': password,
        'email': email
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SaveEmailUserNameWithPermissions";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/user-name-with-permissions", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveUserNameWithPermissions extends SaveUserWithRolesBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String password = "";

    // @DataMember
    String userName = "";

    SaveUserNameWithPermissions({this.password="",this.userName=""});
    SaveUserNameWithPermissions.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        password = json['password'] ?? "";
        userName = json['userName'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'password': password,
        'userName': userName
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SaveUserNameWithPermissions";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth", "DELETE")
// @Api(Description="Membership")
// @DataContract
class DeleteUserRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * Id of the user to delete, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to delete, from get_users.", IsRequired=true)
    String id = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    DeleteUserRequest({this.id="",this.databaseIntegrationId});
    DeleteUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteUserRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{id}", "GET")
// @Api(Description="Membership")
// @DataContract
class GetUserRequest extends CodeMashRequestBase implements IReturn<GetUserResponse>, IConvertible, IGet
{
    /**
    * Id of the user to fetch, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to fetch, from get_users.", IsRequired=true)
    String id = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    GetUserRequest({this.id="",this.databaseIntegrationId});
    GetUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetUserResponse();
    getResponseTypeName() => "GetUserResponse";
    getTypeName() => "GetUserRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth", "GET")
// @Api(Description="Membership")
// @DataContract
class GetUsersRequest extends CodeMashListPaginationRequestBase implements IReturn<GetUsersResponse>, IConvertible, IGet
{
    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    /**
    * Include each user's effective permissions in the result.
    */
    // @DataMember
    // @ApiMember(Description="Include each user's effective permissions in the result.")
    bool? includePermissions;

    /**
    * Only return users that have a registered push device.
    */
    // @DataMember
    // @ApiMember(Description="Only return users that have a registered push device.")
    bool? userShouldHavePushDevice;

    /**
    * Only return users that have an email address.
    */
    // @DataMember
    // @ApiMember(Description="Only return users that have an email address.")
    bool? userShouldHaveEmail;

    /**
    * Include each user's metadata in the result.
    */
    // @DataMember
    // @ApiMember(Description="Include each user's metadata in the result.")
    bool? includeMeta;

    /**
    * Filter to users that have any of these role names.
    */
    // @DataMember
    // @ApiMember(Description="Filter to users that have any of these role names.")
    List<String>? roleNames;

    /**
    * Filter to these specific user ids.
    */
    // @DataMember
    // @ApiMember(Description="Filter to these specific user ids.")
    List<String>? userIds;

    /**
    * Free text, case-insensitive: matches email, user name, display / first / last name or phone.
    */
    // @DataMember
    // @ApiMember(Description="Free text, case-insensitive: matches email, user name, display / first / last name or phone.")
    String? search;

    /**
    * Case-insensitive part of the email.
    */
    // @DataMember
    // @ApiMember(Description="Case-insensitive part of the email.")
    String? email;

    /**
    * Case-insensitive part of the user name.
    */
    // @DataMember
    // @ApiMember(Description="Case-insensitive part of the user name.")
    String? userName;

    /**
    * Status names, any of: Registered, PendingValidation, Active, Unregistered, Suspended, InActive, Blocked.
    */
    // @DataMember
    // @ApiMember(Description="Status names, any of: Registered, PendingValidation, Active, Unregistered, Suspended, InActive, Blocked.")
    List<String>? statuses;

    /**
    * Login type names, any of: Service, Email, UserName, Phone, Guest, Social.
    */
    // @DataMember
    // @ApiMember(Description="Login type names, any of: Service, Email, UserName, Phone, Guest, Social.")
    List<String>? types;

    GetUsersRequest({this.databaseIntegrationId,this.includePermissions,this.userShouldHavePushDevice,this.userShouldHaveEmail,this.includeMeta,this.roleNames,this.userIds,this.search,this.email,this.userName,this.statuses,this.types});
    GetUsersRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        databaseIntegrationId = json['databaseIntegrationId'];
        includePermissions = json['includePermissions'];
        userShouldHavePushDevice = json['userShouldHavePushDevice'];
        userShouldHaveEmail = json['userShouldHaveEmail'];
        includeMeta = json['includeMeta'];
        roleNames = JsonConverters.fromJson(json['roleNames'],'List<String>',context!);
        userIds = JsonConverters.fromJson(json['userIds'],'List<String>',context!);
        search = json['search'];
        email = json['email'];
        userName = json['userName'];
        statuses = JsonConverters.fromJson(json['statuses'],'List<String>',context!);
        types = JsonConverters.fromJson(json['types'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId,
        'includePermissions': includePermissions,
        'userShouldHavePushDevice': userShouldHavePushDevice,
        'userShouldHaveEmail': userShouldHaveEmail,
        'includeMeta': includeMeta,
        'roleNames': JsonConverters.toJson(roleNames,'List<String>',context!),
        'userIds': JsonConverters.toJson(userIds,'List<String>',context!),
        'search': search,
        'email': email,
        'userName': userName,
        'statuses': JsonConverters.toJson(statuses,'List<String>',context!),
        'types': JsonConverters.toJson(types,'List<String>',context!)
    });

    createResponse() => GetUsersResponse();
    getResponseTypeName() => "GetUsersResponse";
    getTypeName() => "GetUsersRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{id}/preferences", "GET")
// @Api(Description="Membership")
// @DataContract
class GetUserPreferencesRequest extends CodeMashRequestBase implements IReturn<GetUserPreferencesResponse>, IConvertible, IGet
{
    /**
    * Id of the user whose preferences to fetch, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user whose preferences to fetch, from get_users.", IsRequired=true)
    String id = "";

    /**
    * Database integration id. Optional — defaults to the project's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the project's default integration.")
    String? databaseIntegrationId;

    GetUserPreferencesRequest({this.id="",this.databaseIntegrationId});
    GetUserPreferencesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetUserPreferencesResponse();
    getResponseTypeName() => "GetUserPreferencesResponse";
    getTypeName() => "GetUserPreferencesRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/membership/users/{contactId}/marketing-state/{channel}/consent", "POST")
class GrantContactConsentRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * Id of the user (contact) to grant consent for.
    */
    // @ApiMember(Description="Id of the user (contact) to grant consent for.", IsRequired=true)
    String contactId = "";

    /**
    * Delivery channel to grant consent on: Email, Sms, or Push.
    */
    // @ApiMember(Description="Delivery channel to grant consent on: Email, Sms, or Push.", IsRequired=true)
    String channel = "";

    /**
    * Lawful basis for the consent, e.g. Consent. Defaults to Consent.
    */
    // @ApiMember(Description="Lawful basis for the consent, e.g. Consent. Defaults to Consent.")
    String lawfulBasis = "";

    /**
    * Source of the consent, e.g. UserOptIn. Defaults to UserOptIn.
    */
    // @ApiMember(Description="Source of the consent, e.g. UserOptIn. Defaults to UserOptIn.")
    String source = "";

    /**
    * Optional free-text reference to evidence of consent (e.g. a form submission id).
    */
    // @ApiMember(Description="Optional free-text reference to evidence of consent (e.g. a form submission id).")
    String? evidenceRef;

    GrantContactConsentRequest({this.contactId="",this.channel="",this.lawfulBasis="",this.source="",this.evidenceRef});
    GrantContactConsentRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        channel = json['channel'] ?? "";
        lawfulBasis = json['lawfulBasis'] ?? "";
        source = json['source'] ?? "";
        evidenceRef = json['evidenceRef'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'channel': channel,
        'lawfulBasis': lawfulBasis,
        'source': source,
        'evidenceRef': evidenceRef
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "GrantContactConsentRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/invite", "POST")
// @Api(Description="Membership")
// @DataContract
class InviteUserRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * Email address the invitation is sent to. It cannot be changed later.
    */
    // @DataMember
    // @ApiMember(Description="Email address the invitation is sent to. It cannot be changed later.", IsRequired=true)
    String email = "";

    /**
    * The invited person's full name, e.g. "Rūta Petraitė". Stored as the full name, first name (first word) and last name (the rest). The user may change it when finishing.
    */
    // @DataMember
    // @ApiMember(Description="The invited person's full name, e.g. \"Rūta Petraitė\". Stored as the full name, first name (first word) and last name (the rest). The user may change it when finishing.")
    String? fullName;

    /**
    * Optional. How e-mails greet the person ("Hi {salutation},"), e.g. "Rūta". Stored as the display name. When empty the full name is used. The user may change it when finishing.
    */
    // @DataMember
    // @ApiMember(Description="Optional. How e-mails greet the person (\"Hi {salutation},\"), e.g. \"Rūta\". Stored as the display name. When empty the full name is used. The user may change it when finishing.")
    String? salutation;

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    InviteUserRequest({this.email="",this.fullName,this.salutation,this.databaseIntegrationId});
    InviteUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        fullName = json['fullName'];
        salutation = json['salutation'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email,
        'fullName': fullName,
        'salutation': salutation,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "InviteUserRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/invitation/finish", "POST")
// @Api(Description="Membership")
// @DataContract
class FinishInvitationRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * One-time invitation token from the e-mail link (the #token= fragment).
    */
    // @DataMember
    // @ApiMember(Description="One-time invitation token from the e-mail link (the #token= fragment).", IsRequired=true)
    String token = "";

    /**
    * The user's password. Validated against the project's complexity policy.
    */
    // @DataMember
    // @ApiMember(Description="The user's password. Validated against the project's complexity policy.", IsRequired=true)
    String password = "";

    /**
    * Optional. The user's full name; replaces the one the admin entered (full name, first name = first word, last name = the rest). Empty = keep the admin's.
    */
    // @DataMember
    // @ApiMember(Description="Optional. The user's full name; replaces the one the admin entered (full name, first name = first word, last name = the rest). Empty = keep the admin's.")
    String? fullName;

    /**
    * Optional. How e-mails greet the user (stored as the display name). Empty = keep the admin's, or the full name when the admin gave none.
    */
    // @DataMember
    // @ApiMember(Description="Optional. How e-mails greet the user (stored as the display name). Empty = keep the admin's, or the full name when the admin gave none.")
    String? salutation;

    /**
    * Optional. Older form of Salutation (the display name); Salutation wins when both are sent.
    */
    // @DataMember
    // @ApiMember(Description="Optional. Older form of Salutation (the display name); Salutation wins when both are sent.")
    String? displayName;

    /**
    * Optional first name; wins over the one taken from FullName.
    */
    // @DataMember
    // @ApiMember(Description="Optional first name; wins over the one taken from FullName.")
    String? firstName;

    /**
    * Optional last name; wins over the one taken from FullName.
    */
    // @DataMember
    // @ApiMember(Description="Optional last name; wins over the one taken from FullName.")
    String? lastName;

    FinishInvitationRequest({this.token="",this.password="",this.fullName,this.salutation,this.displayName,this.firstName,this.lastName});
    FinishInvitationRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        token = json['token'] ?? "";
        password = json['password'] ?? "";
        fullName = json['fullName'];
        salutation = json['salutation'];
        displayName = json['displayName'];
        firstName = json['firstName'];
        lastName = json['lastName'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'token': token,
        'password': password,
        'fullName': fullName,
        'salutation': salutation,
        'displayName': displayName,
        'firstName': firstName,
        'lastName': lastName
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "FinishInvitationRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{userId}/link-identity", "POST")
// @Api(Description="Membership")
// @DataContract
class LinkIdentityRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    // @DataMember
    String userId = "";

    // @DataMember
    String provider = "";

    // @DataMember
    String providerToken = "";

    // @DataMember
    String? emailToVerify;

    // @DataMember
    String? databaseIntegrationId;

    LinkIdentityRequest({this.userId="",this.provider="",this.providerToken="",this.emailToVerify,this.databaseIntegrationId});
    LinkIdentityRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        userId = json['userId'] ?? "";
        provider = json['provider'] ?? "";
        providerToken = json['providerToken'] ?? "";
        emailToVerify = json['emailToVerify'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'userId': userId,
        'provider': provider,
        'providerToken': providerToken,
        'emailToVerify': emailToVerify,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "LinkIdentityRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/users/{userId}/map-auth", "POST")
// @Api(Description="Membership")
class MapAuthToUserRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    String userId = "";
    String authId = "";
    String? databaseIntegrationId;

    MapAuthToUserRequest({this.userId="",this.authId="",this.databaseIntegrationId});
    MapAuthToUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        userId = json['userId'] ?? "";
        authId = json['authId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'userId': userId,
        'authId': authId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "MapAuthToUserRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/assign-roles", "PUT")
// @Api(Description="Membership")
// @DataContract
class AssignRolePermissionsRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    /**
    * Id of the user login to assign roles to, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user login to assign roles to, from get_users.", IsRequired=true)
    String id = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    /**
    * The complete new list of role names (full replacement), from get_roles.
    */
    // @DataMember
    // @ApiMember(Description="The complete new list of role names (full replacement), from get_roles.")
    List<String>? roles;

    AssignRolePermissionsRequest({this.id="",this.databaseIntegrationId,this.roles});
    AssignRolePermissionsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'roles': JsonConverters.toJson(roles,'List<String>',context!)
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "AssignRolePermissionsRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/users/{userId}/roles", "PUT")
// @Api(Description="Membership")
// @DataContract
class SetContactRolesRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    /**
    * Id of the human user to assign roles to.
    */
    // @DataMember
    // @ApiMember(Description="Id of the human user to assign roles to.", IsRequired=true)
    String userId = "";

    /**
    * The complete new list of role ids (full replacement), from get_roles. Empty/omitted clears all roles.
    */
    // @DataMember
    // @ApiMember(Description="The complete new list of role ids (full replacement), from get_roles. Empty/omitted clears all roles.")
    List<String>? roles;

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    SetContactRolesRequest({this.userId="",this.roles,this.databaseIntegrationId});
    SetContactRolesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        userId = json['userId'] ?? "";
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!);
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'userId': userId,
        'roles': JsonConverters.toJson(roles,'List<String>',context!),
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "SetContactRolesRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/membership/users/{contactId}/marketing-state/{commChannel}/{channel}/tags/{tag}", "PUT")
class SetContactTagSubscriptionRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    /**
    * Id of the user (contact) to update.
    */
    // @ApiMember(Description="Id of the user (contact) to update.", IsRequired=true)
    String contactId = "";

    /**
    * Communication channel type: Marketing or Transactional.
    */
    // @ApiMember(Description="Communication channel type: Marketing or Transactional.", IsRequired=true)
    String commChannel = "";

    /**
    * Delivery channel: Email, Sms, or Push.
    */
    // @ApiMember(Description="Delivery channel: Email, Sms, or Push.", IsRequired=true)
    String channel = "";

    /**
    * The tag name; must already exist for the communication channel.
    */
    // @ApiMember(Description="The tag name; must already exist for the communication channel.", IsRequired=true)
    String tag = "";

    /**
    * True to subscribe (unblock) the tag, false to block it.
    */
    // @ApiMember(Description="True to subscribe (unblock) the tag, false to block it.")
    bool? subscribed;

    SetContactTagSubscriptionRequest({this.contactId="",this.commChannel="",this.channel="",this.tag="",this.subscribed});
    SetContactTagSubscriptionRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        commChannel = json['commChannel'] ?? "";
        channel = json['channel'] ?? "";
        tag = json['tag'] ?? "";
        subscribed = json['subscribed'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'commChannel': commChannel,
        'channel': channel,
        'tag': tag,
        'subscribed': subscribed
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "SetContactTagSubscriptionRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/unblock", "PATCH")
// @Api(Description="Membership")
// @DataContract
class UnblockUserRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPatch
{
    /**
    * Id of the user to unblock, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to unblock, from get_users.", IsRequired=true)
    String id = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    UnblockUserRequest({this.id="",this.databaseIntegrationId});
    UnblockUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "UnblockUserRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/membership/users/{contactId}/marketing-state/{channel}/unsubscribe", "POST")
class UnsubscribeContactRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * Id of the user (contact) to unsubscribe.
    */
    // @ApiMember(Description="Id of the user (contact) to unsubscribe.", IsRequired=true)
    String contactId = "";

    /**
    * Delivery channel to unsubscribe from: Email, Sms, or Push.
    */
    // @ApiMember(Description="Delivery channel to unsubscribe from: Email, Sms, or Push.", IsRequired=true)
    String channel = "";

    /**
    * Optional suppression reason name explaining why consent was revoked.
    */
    // @ApiMember(Description="Optional suppression reason name explaining why consent was revoked.")
    String? reason;

    UnsubscribeContactRequest({this.contactId="",this.channel="",this.reason});
    UnsubscribeContactRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        channel = json['channel'] ?? "";
        reason = json['reason'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'channel': channel,
        'reason': reason
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "UnsubscribeContactRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth", "PUT")
// @Api(Description="Membership")
// @DataContract
class UpdateUserRequest extends SaveUser implements IReturn<IdResponse>, IConvertible, IPut
{
    /**
    * Id of the user to update, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to update, from get_users.", IsRequired=true)
    String id = "";

    UpdateUserRequest({this.id=""});
    UpdateUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "UpdateUserRequest";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/{id}/preferences", "PUT")
// @Api(Description="Membership")
// @DataContract
class UpdateUserPreferencesRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    /**
    * Id of the user to update, from get_users.
    */
    // @DataMember
    // @ApiMember(Description="Id of the user to update, from get_users.", IsRequired=true)
    String id = "";

    /**
    * When true, blocks all marketing messages to this user.
    */
    // @DataMember
    // @ApiMember(Description="When true, blocks all marketing messages to this user.")
    bool? blockAllMarketingMessages;

    /**
    * Per communication channel, the set of tags blocked for this user. Full replacement.
    */
    // @DataMember
    // @ApiMember(Description="Per communication channel, the set of tags blocked for this user. Full replacement.")
    Map<String,Set<String>?>? blockedTags;

    /**
    * Database integration id. Optional — defaults to the project's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the project's default integration.")
    String? databaseIntegrationId;

    UpdateUserPreferencesRequest({this.id="",this.blockAllMarketingMessages,this.blockedTags,this.databaseIntegrationId});
    UpdateUserPreferencesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        blockAllMarketingMessages = json['blockAllMarketingMessages'];
        blockedTags = JsonConverters.fromJson(json['blockedTags'],'Map<String,Set<String>?>',context!);
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'blockAllMarketingMessages': blockAllMarketingMessages,
        'blockedTags': JsonConverters.toJson(blockedTags,'Map<String,Set<String>?>',context!),
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "UpdateUserPreferencesRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/change", "POST")
// @Api(Description="Membership · Password")
// @DataContract
class ChangePasswordRequest extends CodeMashRequestBase implements IReturn<CredentialChangedResponse>, IConvertible, IPost
{
    /**
    * The member's current password.
    */
    // @DataMember
    // @ApiMember(Description="The member's current password.", IsRequired=true)
    String currentPassword = "";

    /**
    * The new password. Validated against the project's complexity policy.
    */
    // @DataMember
    // @ApiMember(Description="The new password. Validated against the project's complexity policy.", IsRequired=true)
    String newPassword = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    ChangePasswordRequest({this.currentPassword="",this.newPassword="",this.databaseIntegrationId});
    ChangePasswordRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        currentPassword = json['currentPassword'] ?? "";
        newPassword = json['newPassword'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => CredentialChangedResponse();
    getResponseTypeName() => "CredentialChangedResponse";
    getTypeName() => "ChangePasswordRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/reset/request", "POST")
// @Api(Description="Membership · Password")
// @DataContract
class RequestPasswordResetRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    /**
    * Email address to send the reset link to.
    */
    // @DataMember
    // @ApiMember(Description="Email address to send the reset link to.", IsRequired=true)
    String email = "";

    RequestPasswordResetRequest({this.email=""});
    RequestPasswordResetRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "RequestPasswordResetRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/reset/confirm", "POST")
// @Api(Description="Membership · Password")
// @DataContract
class ConfirmPasswordResetRequest extends CodeMashRequestBase implements IReturn<CredentialChangedResponse>, IConvertible, IPost
{
    /**
    * One-time reset token from the email link.
    */
    // @DataMember
    // @ApiMember(Description="One-time reset token from the email link.", IsRequired=true)
    String token = "";

    /**
    * The new password. Validated against the project's complexity policy.
    */
    // @DataMember
    // @ApiMember(Description="The new password. Validated against the project's complexity policy.", IsRequired=true)
    String newPassword = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    ConfirmPasswordResetRequest({this.token="",this.newPassword="",this.databaseIntegrationId});
    ConfirmPasswordResetRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        token = json['token'] ?? "";
        newPassword = json['newPassword'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'token': token,
        'newPassword': newPassword,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => CredentialChangedResponse();
    getResponseTypeName() => "CredentialChangedResponse";
    getTypeName() => "ConfirmPasswordResetRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Password
*/
// @Route("/{version}/membership/userauth/password/reset/test", "POST")
// @Api(Description="Membership · Password")
// @DataContract
class SendTestPasswordResetRequest extends CodeMashRequestBase implements IReturn<SendTestPasswordResetResponse>, IConvertible, IPost
{
    /**
    * Email address of the project user (a login in the request environment).
    */
    // @DataMember
    // @ApiMember(Description="Email address of the project user (a login in the request environment).", IsRequired=true)
    String email = "";

    SendTestPasswordResetRequest({this.email=""});
    SendTestPasswordResetRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email
    });

    createResponse() => SendTestPasswordResetResponse();
    getResponseTypeName() => "SendTestPasswordResetResponse";
    getTypeName() => "SendTestPasswordResetRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/authentication-options", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class PasskeyAuthenticationOptionsRequest extends CodeMashRequestBase implements IReturn<PasskeyCeremonyOptionsResponse>, IPasskeyCeremonyRequest, IConvertible, IPost
{
    // @DataMember
    String email = "";

    PasskeyAuthenticationOptionsRequest({this.email=""});
    PasskeyAuthenticationOptionsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email
    });

    createResponse() => PasskeyCeremonyOptionsResponse();
    getResponseTypeName() => "PasskeyCeremonyOptionsResponse";
    getTypeName() => "PasskeyAuthenticationOptionsRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/verify-authentication", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class VerifyPasskeyAuthenticationRequest extends CodeMashRequestBase implements IReturn<PasskeyAuthTokensResponse>, IPasskeyCeremonyRequest, IConvertible, IPost
{
    // @DataMember
    String ceremonyId = "";

    // @DataMember
    String assertionResponse = "";

    VerifyPasskeyAuthenticationRequest({this.ceremonyId="",this.assertionResponse=""});
    VerifyPasskeyAuthenticationRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        ceremonyId = json['ceremonyId'] ?? "";
        assertionResponse = json['assertionResponse'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'ceremonyId': ceremonyId,
        'assertionResponse': assertionResponse
    });

    createResponse() => PasskeyAuthTokensResponse();
    getResponseTypeName() => "PasskeyAuthTokensResponse";
    getTypeName() => "VerifyPasskeyAuthenticationRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkeys", "GET")
// @Api(Description="Membership · Passkey")
// @DataContract
class ListPasskeysRequest extends CodeMashRequestBase implements IReturn<PasskeyListResponse>, IConvertible, IGet
{
    ListPasskeysRequest();
    ListPasskeysRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => PasskeyListResponse();
    getResponseTypeName() => "PasskeyListResponse";
    getTypeName() => "ListPasskeysRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkeys/{CredentialId}/rename", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class RenamePasskeyRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    /**
    * Base64 credential id of the passkey to rename, from list_passkeys.
    */
    // @DataMember
    // @ApiMember(Description="Base64 credential id of the passkey to rename, from list_passkeys.", IsRequired=true)
    String credentialId = "";

    /**
    * The new friendly name for the passkey.
    */
    // @DataMember
    // @ApiMember(Description="The new friendly name for the passkey.", IsRequired=true)
    String friendlyName = "";

    RenamePasskeyRequest({this.credentialId="",this.friendlyName=""});
    RenamePasskeyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        credentialId = json['credentialId'] ?? "";
        friendlyName = json['friendlyName'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'credentialId': credentialId,
        'friendlyName': friendlyName
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "RenamePasskeyRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkeys/{CredentialId}/revoke", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class RevokePasskeyRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    /**
    * Base64 credential id of the passkey to revoke, from list_passkeys.
    */
    // @DataMember
    // @ApiMember(Description="Base64 credential id of the passkey to revoke, from list_passkeys.", IsRequired=true)
    String credentialId = "";

    RevokePasskeyRequest({this.credentialId=""});
    RevokePasskeyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        credentialId = json['credentialId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'credentialId': credentialId
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "RevokePasskeyRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/recovery/use-code", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class UseRecoveryCodeRequest extends CodeMashRequestBase implements IReturn<PasskeyRecoveryResponse>, IConvertible, IPost
{
    // @DataMember
    String email = "";

    // @DataMember
    String recoveryCode = "";

    UseRecoveryCodeRequest({this.email="",this.recoveryCode=""});
    UseRecoveryCodeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        recoveryCode = json['recoveryCode'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email,
        'recoveryCode': recoveryCode
    });

    createResponse() => PasskeyRecoveryResponse();
    getResponseTypeName() => "PasskeyRecoveryResponse";
    getTypeName() => "UseRecoveryCodeRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/recovery/magic-link/request", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class RequestMagicLinkRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    // @DataMember
    String email = "";

    RequestMagicLinkRequest({this.email=""});
    RequestMagicLinkRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "RequestMagicLinkRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/recovery/magic-link/consume", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class ConsumeMagicLinkRequest extends CodeMashRequestBase implements IReturn<PasskeyRecoveryResponse>, IConvertible, IPost
{
    // @DataMember
    String token = "";

    ConsumeMagicLinkRequest({this.token=""});
    ConsumeMagicLinkRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        token = json['token'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'token': token
    });

    createResponse() => PasskeyRecoveryResponse();
    getResponseTypeName() => "PasskeyRecoveryResponse";
    getTypeName() => "ConsumeMagicLinkRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/has-passkey", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class HasPasskeyRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    // @DataMember
    String email = "";

    HasPasskeyRequest({this.email=""});
    HasPasskeyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "HasPasskeyRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/email/start-verification", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class StartEmailVerificationRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    // @DataMember
    String email = "";

    StartEmailVerificationRequest({this.email=""});
    StartEmailVerificationRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "StartEmailVerificationRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/email/confirm-verification", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class ConfirmEmailVerificationRequest extends CodeMashRequestBase implements IReturn<PasskeyVerificationTokenResponse>, IConvertible, IPost
{
    // @DataMember
    String email = "";

    // @DataMember
    String code = "";

    ConfirmEmailVerificationRequest({this.email="",this.code=""});
    ConfirmEmailVerificationRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        code = json['code'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email,
        'code': code
    });

    createResponse() => PasskeyVerificationTokenResponse();
    getResponseTypeName() => "PasskeyVerificationTokenResponse";
    getTypeName() => "ConfirmEmailVerificationRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/registration-options", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class PasskeyRegistrationOptionsRequest extends CodeMashRequestBase implements IReturn<PasskeyCeremonyOptionsResponse>, IPasskeyCeremonyRequest, IConvertible, IPost
{
    // @DataMember
    String verificationToken = "";

    PasskeyRegistrationOptionsRequest({this.verificationToken=""});
    PasskeyRegistrationOptionsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        verificationToken = json['verificationToken'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'verificationToken': verificationToken
    });

    createResponse() => PasskeyCeremonyOptionsResponse();
    getResponseTypeName() => "PasskeyCeremonyOptionsResponse";
    getTypeName() => "PasskeyRegistrationOptionsRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/passkey/verify-registration", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class VerifyPasskeyRegistrationRequest extends CodeMashRequestBase implements IReturn<PasskeyAuthTokensResponse>, IPasskeyCeremonyRequest, IConvertible, IPost
{
    // @DataMember
    String verificationToken = "";

    // @DataMember
    String ceremonyId = "";

    // @DataMember
    String attestationResponse = "";

    // @DataMember
    String? friendlyName;

    VerifyPasskeyRegistrationRequest({this.verificationToken="",this.ceremonyId="",this.attestationResponse="",this.friendlyName});
    VerifyPasskeyRegistrationRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        verificationToken = json['verificationToken'] ?? "";
        ceremonyId = json['ceremonyId'] ?? "";
        attestationResponse = json['attestationResponse'] ?? "";
        friendlyName = json['friendlyName'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'verificationToken': verificationToken,
        'ceremonyId': ceremonyId,
        'attestationResponse': attestationResponse,
        'friendlyName': friendlyName
    });

    createResponse() => PasskeyAuthTokensResponse();
    getResponseTypeName() => "PasskeyAuthTokensResponse";
    getTypeName() => "VerifyPasskeyRegistrationRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/token/refresh", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class RefreshPasskeyTokenRequest extends CodeMashRequestBase implements IReturn<PasskeyAuthTokensResponse>, IConvertible, IPost
{
    // @DataMember
    String? refreshToken;

    RefreshPasskeyTokenRequest({this.refreshToken});
    RefreshPasskeyTokenRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        refreshToken = json['refreshToken'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'refreshToken': refreshToken
    });

    createResponse() => PasskeyAuthTokensResponse();
    getResponseTypeName() => "PasskeyAuthTokensResponse";
    getTypeName() => "RefreshPasskeyTokenRequest";
    TypeContext? context = _ctx;
}

/**
* Membership · Passkey
*/
// @Route("/{version}/membership/userauth/logout", "POST")
// @Api(Description="Membership · Passkey")
// @DataContract
class PasskeyLogoutRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
{
    // @DataMember
    String? refreshToken;

    PasskeyLogoutRequest({this.refreshToken});
    PasskeyLogoutRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        refreshToken = json['refreshToken'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'refreshToken': refreshToken
    });

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "PasskeyLogoutRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/merged-tree", "GET")
// @Api(Description="Database")
// @DataContract
class FindMergedTermTreeRequest extends CodeMashRequestBase implements IReturn<FindMergedTermTreeResponse>, IConvertible, IGet
{
    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    bool? allLanguages;

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    String taxonomyName = "";

    // @DataMember
    String? databaseIntegrationId;

    FindMergedTermTreeRequest({this.allLanguages,this.taxonomyName="",this.databaseIntegrationId});
    FindMergedTermTreeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allLanguages = json['allLanguages'];
        taxonomyName = json['taxonomyName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allLanguages': allLanguages,
        'taxonomyName': taxonomyName,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => FindMergedTermTreeResponse();
    getResponseTypeName() => "FindMergedTermTreeResponse";
    getTypeName() => "FindMergedTermTreeRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/tree", "GET")
// @Api(Description="Database")
// @DataContract
class FindTaxonomyTreeRequest extends CodeMashRequestBase implements IReturn<FindTaxonomyTreeResponse>, IConvertible, IGet
{
    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    bool? allLanguages;

    // @DataMember
    bool? includeTerms;

    // @DataMember
    String? databaseIntegrationId;

    FindTaxonomyTreeRequest({this.allLanguages,this.includeTerms,this.databaseIntegrationId});
    FindTaxonomyTreeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allLanguages = json['allLanguages'];
        includeTerms = json['includeTerms'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allLanguages': allLanguages,
        'includeTerms': includeTerms,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => FindTaxonomyTreeResponse();
    getResponseTypeName() => "FindTaxonomyTreeResponse";
    getTypeName() => "FindTaxonomyTreeRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms", "GET")
// @Api(Description="Database")
// @DataContract
class FindTermsRequest extends CodeMashListPaginationRequestBase implements IReturn<FindTermsResponse>, IConvertible, IGet
{
    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    bool? allLanguages;

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    String taxonomyName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    bool? sortDescending;

    // @DataMember
    PagingArgs? pagingArgs;

    FindTermsRequest({this.allLanguages,this.taxonomyName="",this.databaseIntegrationId,this.filter,this.sortDescending,this.pagingArgs});
    FindTermsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allLanguages = json['allLanguages'];
        taxonomyName = json['taxonomyName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        sortDescending = json['sortDescending'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allLanguages': allLanguages,
        'taxonomyName': taxonomyName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'sortDescending': sortDescending,
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!)
    });

    createResponse() => FindTermsResponse();
    getResponseTypeName() => "FindTermsResponse";
    getTypeName() => "FindTermsRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms/{parentId}/children", "GET")
// @Api(Description="Database")
// @DataContract
class FindTermsChildrenRequest extends CodeMashListPaginationRequestBase implements IReturn<FindTermsChildrenResponse>, IConvertible, IGet
{
    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    bool? allLanguages;

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    String taxonomyName = "";

    // @DataMember
    String parentId = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    PagingArgs? pagingArgs;

    FindTermsChildrenRequest({this.allLanguages,this.taxonomyName="",this.parentId="",this.databaseIntegrationId,this.filter,this.pagingArgs});
    FindTermsChildrenRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allLanguages = json['allLanguages'];
        taxonomyName = json['taxonomyName'] ?? "";
        parentId = json['parentId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allLanguages': allLanguages,
        'taxonomyName': taxonomyName,
        'parentId': parentId,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!)
    });

    createResponse() => FindTermsChildrenResponse();
    getResponseTypeName() => "FindTermsChildrenResponse";
    getTypeName() => "FindTermsChildrenRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/taxonomies/{taxonomyName}/terms/tree", "GET")
// @Api(Description="Database")
// @DataContract
class FindTermTreeRequest extends CodeMashRequestBase implements IReturn<FindTermTreeResponse>, IConvertible, IGet
{
    /**
    * Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.
    */
    // @DataMember
    // @ApiMember(Description="Set true to keep name / description as stored even when Accept-Language is sent (editors). The full translations are always in names / descriptions.")
    bool? allLanguages;

    /**
    * The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).
    */
    // @DataMember
    // @ApiMember(Description="The taxonomy: its name (slug or title; URL-encode spaces) or its id (txn_…).", IsRequired=true)
    String taxonomyName = "";

    // @DataMember
    String? rootTermId;

    // @DataMember
    int? depth;

    // @DataMember
    String? databaseIntegrationId;

    FindTermTreeRequest({this.allLanguages,this.taxonomyName="",this.rootTermId,this.depth,this.databaseIntegrationId});
    FindTermTreeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allLanguages = json['allLanguages'];
        taxonomyName = json['taxonomyName'] ?? "";
        rootTermId = json['rootTermId'];
        depth = json['depth'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allLanguages': allLanguages,
        'taxonomyName': taxonomyName,
        'rootTermId': rootTermId,
        'depth': depth,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => FindTermTreeResponse();
    getResponseTypeName() => "FindTermTreeResponse";
    getTypeName() => "FindTermTreeRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/schemas/{id}", "GET")
// @Api(Description="Database")
// @DataContract
class GetDatabaseSchemaRequest extends CodeMashRequestBase implements IReturn<GetDatabaseSchemaResponse>, IConvertible, IGet
{
    // @DataMember
    String id = "";

    GetDatabaseSchemaRequest({this.id=""});
    GetDatabaseSchemaRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id
    });

    createResponse() => GetDatabaseSchemaResponse();
    getResponseTypeName() => "GetDatabaseSchemaResponse";
    getTypeName() => "GetDatabaseSchemaRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/schemas", "GET")
// @Api(Description="Database")
// @DataContract
class GetDatabaseSchemasRequest extends CodeMashListPaginationRequestBase implements IReturn<GetDatabaseSchemasResponse>, IConvertible, IGet
{
    // @DataMember
    PagingArgs? pagingArgs;

    GetDatabaseSchemasRequest({this.pagingArgs});
    GetDatabaseSchemasRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!)
    });

    createResponse() => GetDatabaseSchemasResponse();
    getResponseTypeName() => "GetDatabaseSchemasResponse";
    getTypeName() => "GetDatabaseSchemasRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/aggregate", "POST")
// @Api(Description="Database")
// @DataContract
class AggregateRequest extends CodeMashRequestBase implements IReturn<AggregateResponse>, IConvertible, IPost
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String pipeline = "";

    AggregateRequest({this.collectionName="",this.databaseIntegrationId,this.pipeline=""});
    AggregateRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        pipeline = json['pipeline'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'pipeline': pipeline
    });

    createResponse() => AggregateResponse();
    getResponseTypeName() => "AggregateResponse";
    getTypeName() => "AggregateRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}/responsibility", "PUT")
// @Api(Description="Database")
// @DataContract
class ChangeResponsibilityRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String id = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String newResponsibleUserId = "";

    ChangeResponsibilityRequest({this.collectionName="",this.id="",this.databaseIntegrationId,this.newResponsibleUserId=""});
    ChangeResponsibilityRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        newResponsibleUserId = json['newResponsibleUserId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'newResponsibleUserId': newResponsibleUserId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "ChangeResponsibilityRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/count", "GET")
// @Api(Description="Database")
// @DataContract
class CountRequest extends CodeMashRequestBase implements IReturn<CountResponse>, IConvertible, IGet
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    int? schemaVersion;

    CountRequest({this.collectionName="",this.databaseIntegrationId,this.filter,this.schemaVersion});
    CountRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        schemaVersion = json['schemaVersion'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'schemaVersion': schemaVersion
    });

    createResponse() => CountResponse();
    getResponseTypeName() => "CountResponse";
    getTypeName() => "CountRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/many", "DELETE")
// @Api(Description="Database")
// @DataContract
class DeleteManyRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String filter = "";

    // @DataMember
    bool? allRecords;

    DeleteManyRequest({this.collectionName="",this.databaseIntegrationId,this.filter="",this.allRecords});
    DeleteManyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'] ?? "";
        allRecords = json['allRecords'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'allRecords': allRecords
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteManyRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}", "DELETE")
// @Api(Description="Database")
// @DataContract
class DeleteOneRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String id = "";

    // @DataMember
    String? databaseIntegrationId;

    DeleteOneRequest({this.collectionName="",this.id="",this.databaseIntegrationId});
    DeleteOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteOneRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/distinct", "GET")
// @Api(Description="Database")
// @DataContract
class DistinctRequest extends CodeMashRequestBase implements IReturn<DistinctResponse>, IConvertible, IGet
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String field = "";

    // @DataMember
    String? filter;

    // @DataMember
    int? schemaVersion;

    DistinctRequest({this.collectionName="",this.databaseIntegrationId,this.field="",this.filter,this.schemaVersion});
    DistinctRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        field = json['field'] ?? "";
        filter = json['filter'];
        schemaVersion = json['schemaVersion'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'field': field,
        'filter': filter,
        'schemaVersion': schemaVersion
    });

    createResponse() => DistinctResponse();
    getResponseTypeName() => "DistinctResponse";
    getTypeName() => "DistinctRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/aggregates/{aggregateId}/execute", "POST")
// @Api(Description="Database")
// @DataContract
class ExecuteAggregateRequest extends CodeMashRequestBase implements IReturn<ExecuteAggregateResponse>, IConvertible, IPost
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String aggregateId = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    Map<String,String?>? tokens;

    ExecuteAggregateRequest({this.collectionName="",this.aggregateId="",this.databaseIntegrationId,this.tokens});
    ExecuteAggregateRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        aggregateId = json['aggregateId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        tokens = JsonConverters.toStringMap(json['tokens']);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'aggregateId': aggregateId,
        'databaseIntegrationId': databaseIntegrationId,
        'tokens': tokens
    });

    createResponse() => ExecuteAggregateResponse();
    getResponseTypeName() => "ExecuteAggregateResponse";
    getTypeName() => "ExecuteAggregateRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}", "GET")
// @Api(Description="Database")
// @DataContract
class FindRequest extends CodeMashListPaginationRequestBase implements IReturn<FindResponse>, IConvertible, IGet
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    int? schemaVersion;

    // @DataMember
    PagingArgs? pagingArgs;

    // @DataMember
    String? sortBy;

    // @DataMember
    int? sortOrder;

    // @DataMember
    bool? expandReferences;

    // @DataMember
    bool? allLanguages;

    FindRequest({this.collectionName="",this.databaseIntegrationId,this.filter,this.schemaVersion,this.pagingArgs,this.sortBy,this.sortOrder,this.expandReferences,this.allLanguages});
    FindRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        schemaVersion = json['schemaVersion'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        sortBy = json['sortBy'];
        sortOrder = json['sortOrder'];
        expandReferences = json['expandReferences'];
        allLanguages = json['allLanguages'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'schemaVersion': schemaVersion,
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!),
        'sortBy': sortBy,
        'sortOrder': sortOrder,
        'expandReferences': expandReferences,
        'allLanguages': allLanguages
    });

    createResponse() => FindResponse();
    getResponseTypeName() => "FindResponse";
    getTypeName() => "FindRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}", "GET")
// @Api(Description="Database")
// @DataContract
class FindOneRequest extends CodeMashRequestBase implements IReturn<FindOneResponse>, IConvertible, IGet
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String id = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    bool? expandReferences;

    // @DataMember
    bool? allLanguages;

    FindOneRequest({this.collectionName="",this.id="",this.databaseIntegrationId,this.expandReferences,this.allLanguages});
    FindOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        expandReferences = json['expandReferences'];
        allLanguages = json['allLanguages'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'expandReferences': expandReferences,
        'allLanguages': allLanguages
    });

    createResponse() => FindOneResponse();
    getResponseTypeName() => "FindOneResponse";
    getTypeName() => "FindOneRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/own", "GET")
// @Api(Description="Database")
// @DataContract
class FindOwnRequest extends CodeMashListPaginationRequestBase implements IReturn<FindResponse>, IConvertible, IGet
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    int? schemaVersion;

    // @DataMember
    PagingArgs? pagingArgs;

    /**
    * Set true to get every reference value as { id, display } (display = the target's displayField per the schema; null when the target is gone). Needs read permission on every source the schema links to (users, roles, taxonomy, collection, files) — otherwise the read is refused with CM-ERRORS-DATABASE-056 naming the source. Default false returns the stored ids.
    */
    // @DataMember
    // @ApiMember(Description="Set true to get every reference value as { id, display } (display = the target's displayField per the schema; null when the target is gone). Needs read permission on every source the schema links to (users, roles, taxonomy, collection, files) — otherwise the read is refused with CM-ERRORS-DATABASE-056 naming the source. Default false returns the stored ids.")
    bool? expandReferences;

    // @DataMember
    bool? allLanguages;

    FindOwnRequest({this.collectionName="",this.databaseIntegrationId,this.filter,this.schemaVersion,this.pagingArgs,this.expandReferences,this.allLanguages});
    FindOwnRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        schemaVersion = json['schemaVersion'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        expandReferences = json['expandReferences'];
        allLanguages = json['allLanguages'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'schemaVersion': schemaVersion,
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!),
        'expandReferences': expandReferences,
        'allLanguages': allLanguages
    });

    createResponse() => FindResponse();
    getResponseTypeName() => "FindResponse";
    getTypeName() => "FindOwnRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/many", "POST")
// @Api(Description="Database")
// @DataContract
class InsertManyRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String documents = "";

    InsertManyRequest({this.collectionName="",this.databaseIntegrationId,this.documents=""});
    InsertManyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        documents = json['documents'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'documents': documents
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "InsertManyRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}", "POST")
// @Api(Description="Database")
// @DataContract
class InsertOneRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String document = "";

    InsertOneRequest({this.collectionName="",this.databaseIntegrationId,this.document=""});
    InsertOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        document = json['document'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'document': document
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "InsertOneRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}/replace", "PUT")
// @Api(Description="Database")
// @DataContract
class ReplaceOneRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String id = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String replacement = "";

    ReplaceOneRequest({this.collectionName="",this.id="",this.databaseIntegrationId,this.replacement=""});
    ReplaceOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        replacement = json['replacement'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'replacement': replacement
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "ReplaceOneRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/many", "PUT")
// @Api(Description="Database")
// @DataContract
class UpdateManyRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String filter = "";

    // @DataMember
    bool? allRecords;

    // @DataMember
    String update = "";

    // @DataMember
    String? arrayFilters;

    UpdateManyRequest({this.collectionName="",this.databaseIntegrationId,this.filter="",this.allRecords,this.update="",this.arrayFilters});
    UpdateManyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'] ?? "";
        allRecords = json['allRecords'];
        update = json['update'] ?? "";
        arrayFilters = json['arrayFilters'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'allRecords': allRecords,
        'update': update,
        'arrayFilters': arrayFilters
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "UpdateManyRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/collections/{collectionName}/{id}", "PUT")
// @Api(Description="Database")
// @DataContract
class UpdateOneRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    // @DataMember
    String collectionName = "";

    // @DataMember
    String id = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String update = "";

    // @DataMember
    String? arrayFilters;

    UpdateOneRequest({this.collectionName="",this.id="",this.databaseIntegrationId,this.update="",this.arrayFilters});
    UpdateOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        update = json['update'] ?? "";
        arrayFilters = json['arrayFilters'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'update': update,
        'arrayFilters': arrayFilters
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "UpdateOneRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/commit", "POST")
// @Api(Description="Files")
// @DataContract
class CommitUploadRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    // @DataMember
    String? contentType;

    // @DataMember
    int? sizeBytes;

    // @DataMember
    String? fileName;

    // @DataMember
    String? ownerUserId;

    // @DataMember
    bool? reassignOwner;

    CommitUploadRequest({this.filesIntegrationId="",this.path="",this.contentType,this.sizeBytes,this.fileName,this.ownerUserId,this.reassignOwner});
    CommitUploadRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        contentType = json['contentType'];
        sizeBytes = json['sizeBytes'];
        fileName = json['fileName'];
        ownerUserId = json['ownerUserId'];
        reassignOwner = json['reassignOwner'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'contentType': contentType,
        'sizeBytes': sizeBytes,
        'fileName': fileName,
        'ownerUserId': ownerUserId,
        'reassignOwner': reassignOwner
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "CommitUploadRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/content", "GET")
// @Api(Description="Files")
// @DataContract
class GetFileContentRequest extends RequestBase implements IReturn<Uint8List>, IConvertible, IGet
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    // @DataMember
    String? token;

    GetFileContentRequest({this.filesIntegrationId="",this.path="",this.token});
    GetFileContentRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        token = json['token'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'token': token
    });

    createResponse() => Uint8List(0);
    getResponseTypeName() => "Uint8List";
    getTypeName() => "GetFileContentRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/content", "PUT")
// @Api(Description="Files")
// @DataContract
class PutFileContentRequest extends RequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    // @DataMember
    String? token;

    PutFileContentRequest({this.filesIntegrationId="",this.path="",this.token});
    PutFileContentRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        token = json['token'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'token': token
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "PutFileContentRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}", "DELETE")
// @Api(Description="Files")
// @DataContract
class DeleteFileApiRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    DeleteFileApiRequest({this.filesIntegrationId="",this.path=""});
    DeleteFileApiRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteFileApiRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/bulk", "DELETE")
// @Api(Description="Files")
// @DataContract
class DeleteManyFilesApiRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember(Name="paths[]")
    List<String> paths__ = [];

    DeleteManyFilesApiRequest({this.filesIntegrationId="",this.paths__=const []});
    DeleteManyFilesApiRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        paths__ = JsonConverters.fromJson(json['paths'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'paths__': JsonConverters.toJson(paths__,'List<String>',context!)
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteManyFilesApiRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/download", "GET")
// @Api(Description="Files")
// @DataContract
class DownloadFileApiRequest extends CodeMashRequestBase implements IReturn<Uint8List>, IConvertible, IGet
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    DownloadFileApiRequest({this.filesIntegrationId="",this.path=""});
    DownloadFileApiRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => Uint8List(0);
    getResponseTypeName() => "Uint8List";
    getTypeName() => "DownloadFileApiRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/by-id/{id}", "GET")
// @Api(Description="Files")
// @DataContract
class GetFileByIdRequest extends CodeMashRequestBase implements IReturn<GetFileByIdResponse>, IConvertible, IGet
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String id = "";

    GetFileByIdRequest({this.filesIntegrationId="",this.id=""});
    GetFileByIdRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'id': id
    });

    createResponse() => GetFileByIdResponse();
    getResponseTypeName() => "GetFileByIdResponse";
    getTypeName() => "GetFileByIdRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/info", "GET")
// @Api(Description="Files")
// @DataContract
class GetFileInfoRequest extends CodeMashRequestBase implements IReturn<GetFileInfoResponse>, IConvertible, IGet
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    GetFileInfoRequest({this.filesIntegrationId="",this.path=""});
    GetFileInfoRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => GetFileInfoResponse();
    getResponseTypeName() => "GetFileInfoResponse";
    getTypeName() => "GetFileInfoRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/sign", "GET")
// @Api(Description="Files")
// @DataContract
class GetSignedUrlRequest extends CodeMashRequestBase implements IReturn<GetSignedUrlResponse>, IConvertible, IGet
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    // @DataMember
    int? expirationSeconds;

    GetSignedUrlRequest({this.filesIntegrationId="",this.path="",this.expirationSeconds});
    GetSignedUrlRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        expirationSeconds = json['expirationSeconds'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'expirationSeconds': expirationSeconds
    });

    createResponse() => GetSignedUrlResponse();
    getResponseTypeName() => "GetSignedUrlResponse";
    getTypeName() => "GetSignedUrlRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}", "GET")
// @Api(Description="Files")
// @DataContract
class ListFilesRequest extends CodeMashListPaginationRequestBase implements IReturn<ListFilesResponse>, IConvertible, IGet
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String? path;

    ListFilesRequest({this.filesIntegrationId="",this.path});
    ListFilesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => ListFilesResponse();
    getResponseTypeName() => "ListFilesResponse";
    getTypeName() => "ListFilesRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/public/{PublicId}/{Name*}", "GET")
// @Api(Description="Files")
// @DataContract
class GetPublicFileRequest extends RequestBase implements IReturn<Uint8List>, IConvertible, IGet
{
    // @DataMember
    String? publicId;

    // @DataMember
    String? name;

    GetPublicFileRequest({this.publicId,this.name});
    GetPublicFileRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        publicId = json['publicId'];
        name = json['name'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'publicId': publicId,
        'name': name
    });

    createResponse() => Uint8List(0);
    getResponseTypeName() => "Uint8List";
    getTypeName() => "GetPublicFileRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/register", "POST")
// @Api(Description="Files")
// @DataContract
class RegisterFilesRequest extends CodeMashRequestBase implements IReturn<RegisterFilesResponse>, IConvertible, IPost
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    List<RegisterFileItem>? items;

    // @DataMember
    bool? reassignOwner;

    // @DataMember
    bool? dryRun;

    RegisterFilesRequest({this.filesIntegrationId="",this.items,this.reassignOwner,this.dryRun});
    RegisterFilesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        items = JsonConverters.fromJson(json['items'],'List<RegisterFileItem>',context!);
        reassignOwner = json['reassignOwner'];
        dryRun = json['dryRun'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'items': JsonConverters.toJson(items,'List<RegisterFileItem>',context!),
        'reassignOwner': reassignOwner,
        'dryRun': dryRun
    });

    createResponse() => RegisterFilesResponse();
    getResponseTypeName() => "RegisterFilesResponse";
    getTypeName() => "RegisterFilesRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/upload-url", "POST")
// @Api(Description="Files")
// @DataContract
class RequestUploadUrlRequest extends CodeMashRequestBase implements IReturn<RequestUploadUrlResponse>, IConvertible, IPost
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    // @DataMember
    String contentType = "";

    // @DataMember
    int? expirationSeconds;

    // @DataMember
    String? ownerUserId;

    // @DataMember
    bool? reassignOwner;

    RequestUploadUrlRequest({this.filesIntegrationId="",this.path="",this.contentType="",this.expirationSeconds,this.ownerUserId,this.reassignOwner});
    RequestUploadUrlRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        contentType = json['contentType'] ?? "";
        expirationSeconds = json['expirationSeconds'];
        ownerUserId = json['ownerUserId'];
        reassignOwner = json['reassignOwner'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'contentType': contentType,
        'expirationSeconds': expirationSeconds,
        'ownerUserId': ownerUserId,
        'reassignOwner': reassignOwner
    });

    createResponse() => RequestUploadUrlResponse();
    getResponseTypeName() => "RequestUploadUrlResponse";
    getTypeName() => "RequestUploadUrlRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/use", "POST")
// @Api(Description="Files")
// @DataContract
class UseFileRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String filesIntegrationId = "";

    // @DataMember
    String path = "";

    // @DataMember
    String? ownerUserId;

    // @DataMember
    bool? reassignOwner;

    UseFileRequest({this.filesIntegrationId="",this.path="",this.ownerUserId,this.reassignOwner});
    UseFileRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        ownerUserId = json['ownerUserId'];
        reassignOwner = json['reassignOwner'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'ownerUserId': ownerUserId,
        'reassignOwner': reassignOwner
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "UseFileRequest";
    TypeContext? context = _ctx;
}

/**
* Registers or refreshes a push device for the signed-in user.
*/
// @Route("/{version}/notifications/push/devices", "POST")
// @Api(Description="Registers or refreshes a push device for the signed-in user.")
class RegisterOwnPushDeviceRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * Who issued the token: fcm (Android / Firebase) or apns (iOS). The NATIVE device token — in an Expo app use getDevicePushTokenAsync(). Expo push tokens (provider 'expo') are refused.
    */
    // @ApiMember(Description="Who issued the token: fcm (Android / Firebase) or apns (iOS). The NATIVE device token — in an Expo app use getDevicePushTokenAsync(). Expo push tokens (provider 'expo') are refused.", IsRequired=true)
    String provider = "";

    /**
    * The push token, exactly as the provider gave it.
    */
    // @ApiMember(Description="The push token, exactly as the provider gave it.", IsRequired=true)
    String token = "";

    /**
    * The app's platform: ios, android or web.
    */
    // @ApiMember(Description="The app's platform: ios, android or web.")
    String? platform;

    /**
    * Operating system name, e.g. iOS.
    */
    // @ApiMember(Description="Operating system name, e.g. iOS.")
    String? osName;

    /**
    * Operating system version, e.g. 18.1.
    */
    // @ApiMember(Description="Operating system version, e.g. 18.1.")
    String? osVersion;

    /**
    * The app version, e.g. 2.4.1.
    */
    // @ApiMember(Description="The app version, e.g. 2.4.1.")
    String? appVersion;

    /**
    * The device name the user sees, e.g. Anna's iPhone.
    */
    // @ApiMember(Description="The device name the user sees, e.g. Anna's iPhone.")
    String? deviceName;

    /**
    * The device model, e.g. iPhone 15.
    */
    // @ApiMember(Description="The device model, e.g. iPhone 15.")
    String? modelName;

    String? brand;
    String? manufacturer;
    /**
    * A stable id the app keeps for this installation (not the token).
    */
    // @ApiMember(Description="A stable id the app keeps for this installation (not the token).")
    String? installationId;

    /**
    * The device locale, e.g. lt-LT.
    */
    // @ApiMember(Description="The device locale, e.g. lt-LT.")
    String? locale;

    /**
    * The device time zone (IANA), e.g. Europe/Vilnius.
    */
    // @ApiMember(Description="The device time zone (IANA), e.g. Europe/Vilnius.")
    String? timeZone;

    RegisterOwnPushDeviceRequest({this.provider="",this.token="",this.platform,this.osName,this.osVersion,this.appVersion,this.deviceName,this.modelName,this.brand,this.manufacturer,this.installationId,this.locale,this.timeZone});
    RegisterOwnPushDeviceRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        provider = json['provider'] ?? "";
        token = json['token'] ?? "";
        platform = json['platform'];
        osName = json['osName'];
        osVersion = json['osVersion'];
        appVersion = json['appVersion'];
        deviceName = json['deviceName'];
        modelName = json['modelName'];
        brand = json['brand'];
        manufacturer = json['manufacturer'];
        installationId = json['installationId'];
        locale = json['locale'];
        timeZone = json['timeZone'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'provider': provider,
        'token': token,
        'platform': platform,
        'osName': osName,
        'osVersion': osVersion,
        'appVersion': appVersion,
        'deviceName': deviceName,
        'modelName': modelName,
        'brand': brand,
        'manufacturer': manufacturer,
        'installationId': installationId,
        'locale': locale,
        'timeZone': timeZone
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "RegisterOwnPushDeviceRequest";
    TypeContext? context = _ctx;
}

/**
* Lists the signed-in user's own push devices.
*/
// @Route("/{version}/notifications/push/devices", "GET")
// @Api(Description="Lists the signed-in user's own push devices.")
class GetOwnPushDevicesRequest extends CodeMashRequestBase implements IReturn<GetOwnPushDevicesResponse>, IConvertible, IGet
{
    GetOwnPushDevicesRequest();
    GetOwnPushDevicesRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => GetOwnPushDevicesResponse();
    getResponseTypeName() => "GetOwnPushDevicesResponse";
    getTypeName() => "GetOwnPushDevicesRequest";
    TypeContext? context = _ctx;
}

/**
* Removes one of the signed-in user's own push devices by id.
*/
// @Route("/{version}/notifications/push/devices/{Id}", "DELETE")
// @Api(Description="Removes one of the signed-in user's own push devices by id.")
class DeleteOwnPushDeviceRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The device id (pnd_…) from the devices list or the register answer.
    */
    // @ApiMember(Description="The device id (pnd_…) from the devices list or the register answer.", IsRequired=true)
    String id = "";

    DeleteOwnPushDeviceRequest({this.id=""});
    DeleteOwnPushDeviceRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteOwnPushDeviceRequest";
    TypeContext? context = _ctx;
}

/**
* Removes the signed-in user's push device registered with a token (sign-out).
*/
// @Route("/{version}/notifications/push/devices", "DELETE")
// @Api(Description="Removes the signed-in user's push device registered with a token (sign-out).")
class DeleteOwnPushDeviceByTokenRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The push token the device was registered with.
    */
    // @ApiMember(Description="The push token the device was registered with.", IsRequired=true)
    String token = "";

    DeleteOwnPushDeviceByTokenRequest({this.token=""});
    DeleteOwnPushDeviceByTokenRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        token = json['token'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'token': token
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteOwnPushDeviceByTokenRequest";
    TypeContext? context = _ctx;
}

/**
* Lists the push messages sent to the signed-in user.
*/
// @Route("/{version}/notifications/push/messages", "GET")
// @Api(Description="Lists the push messages sent to the signed-in user.")
class GetOwnPushMessagesRequest extends CodeMashListPaginationRequestBase implements IReturn<GetOwnPushMessagesResponse>, IConvertible, IGet
{
    /**
    * Only messages the caller has not marked read.
    */
    // @ApiMember(Description="Only messages the caller has not marked read.")
    bool? unreadOnly;

    GetOwnPushMessagesRequest({this.unreadOnly});
    GetOwnPushMessagesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        unreadOnly = json['unreadOnly'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'unreadOnly': unreadOnly
    });

    createResponse() => GetOwnPushMessagesResponse();
    getResponseTypeName() => "GetOwnPushMessagesResponse";
    getTypeName() => "GetOwnPushMessagesRequest";
    TypeContext? context = _ctx;
}

/**
* Marks one push message sent to the signed-in user read.
*/
// @Route("/{version}/notifications/push/messages/{Id}/read", "POST")
// @Api(Description="Marks one push message sent to the signed-in user read.")
class MarkOwnPushMessageReadRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The message id (ntf_…) from the messages list.
    */
    // @ApiMember(Description="The message id (ntf_…) from the messages list.", IsRequired=true)
    String id = "";

    MarkOwnPushMessageReadRequest({this.id=""});
    MarkOwnPushMessageReadRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "MarkOwnPushMessageReadRequest";
    TypeContext? context = _ctx;
}

/**
* Marks every push message sent to the signed-in user read.
*/
// @Route("/{version}/notifications/push/messages/read", "POST")
// @Api(Description="Marks every push message sent to the signed-in user read.")
class MarkAllOwnPushMessagesReadRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    MarkAllOwnPushMessagesReadRequest();
    MarkAllOwnPushMessagesReadRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "MarkAllOwnPushMessagesReadRequest";
    TypeContext? context = _ctx;
}

/**
* Send your app's own log entries to the project's logs.
*/
// @Route("/{version}/logs", "POST")
// @Api(Description="Send your app's own log entries to the project's logs.")
class WriteLogs extends CodeMashRequestBase implements IReturn<WriteLogsResponse>, IConvertible, IPost
{
    /**
    * 1–100 entries.
    */
    // @ApiMember(Description="1–100 entries.", IsRequired=true)
    List<WriteLogEntry> entries = [];

    WriteLogs({this.entries=const []});
    WriteLogs.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        entries = JsonConverters.fromJson(json['entries'],'List<WriteLogEntry>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'entries': JsonConverters.toJson(entries,'List<WriteLogEntry>',context!)
    });

    createResponse() => WriteLogsResponse();
    getResponseTypeName() => "WriteLogsResponse";
    getTypeName() => "WriteLogs";
    TypeContext? context = _ctx;
}

/**
* Stores a payment order with a fixed price for one of the project's users. Server only (service user API key).
*/
// @Route("/{version}/payments/orders", "POST")
// @Api(Description="Stores a payment order with a fixed price for one of the project's users. Server only (service user API key).")
class CreatePaymentOrderRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * The user the order is for (usr_…).
    */
    // @ApiMember(Description="The user the order is for (usr_…).", IsRequired=true)
    String buyerUserId = "";

    /**
    * The project's own order reference, unique per project and environment (1–64 of A–Z a–z 0–9 . _ : -).
    */
    // @ApiMember(Description="The project's own order reference, unique per project and environment (1–64 of A–Z a–z 0–9 . _ : -).", IsRequired=true)
    String merchantReference = "";

    /**
    * 8–128 characters. Same key + same body = the stored order; same key + other body = 409. May be sent as the Idempotency-Key header instead.
    */
    // @ApiMember(Description="8–128 characters. Same key + same body = the stored order; same key + other body = 409. May be sent as the Idempotency-Key header instead.")
    String? idempotencyKey;

    /**
    * EUR.
    */
    // @ApiMember(Description="EUR.", IsRequired=true)
    String currency = "";

    /**
    * The version of the price list the server priced the lines with.
    */
    // @ApiMember(Description="The version of the price list the server priced the lines with.", IsRequired=true)
    String priceVersion = "";

    /**
    * 1–50 lines: sku, title, quantity, unitAmountMinor (cents). Norbix computes the amounts and the total.
    */
    // @ApiMember(Description="1–50 lines: sku, title, quantity, unitAmountMinor (cents). Norbix computes the amounts and the total.", IsRequired=true)
    List<PaymentOrderLineInput> lines = [];

    /**
    * Up to 20 project values (e.g. adId). No personal or billing data.
    */
    // @ApiMember(Description="Up to 20 project values (e.g. adId). No personal or billing data.")
    Map<String,String?>? metadata;

    CreatePaymentOrderRequest({this.buyerUserId="",this.merchantReference="",this.idempotencyKey,this.currency="",this.priceVersion="",this.lines=const [],this.metadata});
    CreatePaymentOrderRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        buyerUserId = json['buyerUserId'] ?? "";
        merchantReference = json['merchantReference'] ?? "";
        idempotencyKey = json['idempotencyKey'];
        currency = json['currency'] ?? "";
        priceVersion = json['priceVersion'] ?? "";
        lines = JsonConverters.fromJson(json['lines'],'List<PaymentOrderLineInput>',context!) ?? [];
        metadata = JsonConverters.toStringMap(json['metadata']);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'buyerUserId': buyerUserId,
        'merchantReference': merchantReference,
        'idempotencyKey': idempotencyKey,
        'currency': currency,
        'priceVersion': priceVersion,
        'lines': JsonConverters.toJson(lines,'List<PaymentOrderLineInput>',context!),
        'metadata': metadata
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "CreatePaymentOrderRequest";
    TypeContext? context = _ctx;
}

/**
* Reads one payment order. A buyer reads only their own orders.
*/
// @Route("/{version}/payments/orders/{Id}", "GET")
// @Api(Description="Reads one payment order. A buyer reads only their own orders.")
class GetPaymentOrderRequest extends CodeMashRequestBase implements IReturn<GetPaymentOrderResponse>, IConvertible, IGet
{
    /**
    * The order id (ord_…).
    */
    // @ApiMember(Description="The order id (ord_…).", IsRequired=true)
    String id = "";

    GetPaymentOrderRequest({this.id=""});
    GetPaymentOrderRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id
    });

    createResponse() => GetPaymentOrderResponse();
    getResponseTypeName() => "GetPaymentOrderResponse";
    getTypeName() => "GetPaymentOrderRequest";
    TypeContext? context = _ctx;
}

/**
* Lists payment orders, newest first. A buyer gets only their own orders.
*/
// @Route("/{version}/payments/orders", "GET")
// @Api(Description="Lists payment orders, newest first. A buyer gets only their own orders.")
class GetPaymentOrdersRequest extends CodeMashListPaginationRequestBase implements IReturn<GetPaymentOrdersResponse>, IConvertible, IGet
{
    /**
    * Server only: one buyer's orders (usr_…). A buyer always gets their own.
    */
    // @ApiMember(Description="Server only: one buyer's orders (usr_…). A buyer always gets their own.")
    String? buyerUserId;

    /**
    * Only the order with this merchant reference.
    */
    // @ApiMember(Description="Only the order with this merchant reference.")
    String? merchantReference;

    /**
    * Only orders in this status (Created, CheckoutStarted, Paid, …).
    */
    // @ApiMember(Description="Only orders in this status (Created, CheckoutStarted, Paid, …).")
    String? status;

    GetPaymentOrdersRequest({this.buyerUserId,this.merchantReference,this.status});
    GetPaymentOrdersRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        buyerUserId = json['buyerUserId'];
        merchantReference = json['merchantReference'];
        status = json['status'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'buyerUserId': buyerUserId,
        'merchantReference': merchantReference,
        'status': status
    });

    createResponse() => GetPaymentOrdersResponse();
    getResponseTypeName() => "GetPaymentOrdersResponse";
    getTypeName() => "GetPaymentOrdersRequest";
    TypeContext? context = _ctx;
}

/**
* Opens a provider checkout (Montonio or Neopay) for a stored order and answers where the buyer pays. The buyer (own order) or the server.
*/
// @Route("/{version}/payments/orders/{Id}/checkout", "POST")
// @Api(Description="Opens a provider checkout (Montonio or Neopay) for a stored order and answers where the buyer pays. The buyer (own order) or the server.")
class StartPaymentCheckoutRequest extends CodeMashRequestBase implements IReturn<StartPaymentCheckoutResponse>, IConvertible, IPost
{
    /**
    * The order id (ord_…).
    */
    // @ApiMember(Description="The order id (ord_…).", IsRequired=true)
    String id = "";

    /**
    * The checkout integration (int_…, Montonio or Neopay) of the project in the request's environment.
    */
    // @ApiMember(Description="The checkout integration (int_…, Montonio or Neopay) of the project in the request's environment.", IsRequired=true)
    String integrationId = "";

    /**
    * bankLink (default), card, applePay or googlePay (the wallets: Montonio only).
    */
    // @ApiMember(Description="bankLink (default), card, applePay or googlePay (the wallets: Montonio only).")
    String? method;

    /**
    * Where the buyer comes back after paying; its origin must be one of the project's allowed origins.
    */
    // @ApiMember(Description="Where the buyer comes back after paying; its origin must be one of the project's allowed origins.", IsRequired=true)
    String returnUrl = "";

    /**
    * Bank links only: the country whose banks are shown first (default LT).
    */
    // @ApiMember(Description="Bank links only: the country whose banks are shown first (default LT).")
    String? preferredCountry;

    /**
    * Bank links only: one bank to open directly (the provider's bank code).
    */
    // @ApiMember(Description="Bank links only: one bank to open directly (the provider's bank code).")
    String? preferredProvider;

    StartPaymentCheckoutRequest({this.id="",this.integrationId="",this.method,this.returnUrl="",this.preferredCountry,this.preferredProvider});
    StartPaymentCheckoutRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        integrationId = json['integrationId'] ?? "";
        method = json['method'];
        returnUrl = json['returnUrl'] ?? "";
        preferredCountry = json['preferredCountry'];
        preferredProvider = json['preferredProvider'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'integrationId': integrationId,
        'method': method,
        'returnUrl': returnUrl,
        'preferredCountry': preferredCountry,
        'preferredProvider': preferredProvider
    });

    createResponse() => StartPaymentCheckoutResponse();
    getResponseTypeName() => "StartPaymentCheckoutResponse";
    getTypeName() => "StartPaymentCheckoutRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/runs", "GET")
// @DataContract
class GetCodeWorkflowWaitingRuns extends CodeMashListPaginationRequestBase implements IReturn<WorkflowRunsResponse>, IConvertible, IGet
{
    /**
    * running | waiting (default) | succeeded | failed | cancelled
    */
    // @DataMember
    // @ApiMember(Description="running | waiting (default) | succeeded | failed | cancelled")
    String? status;

    /**
    * approval | event | delay
    */
    // @DataMember
    // @ApiMember(Description="approval | event | delay")
    String? waitingKind;

    /**
    * "me" or a usr_… id: only approvals assigned to that user. Without code:read only "me" (the default then).
    */
    // @DataMember
    // @ApiMember(Description="\"me\" or a usr_… id: only approvals assigned to that user. Without code:read only \"me\" (the default then).")
    String? assignee;

    /**
    * Only runs of this workflow (wf_…).
    */
    // @DataMember
    // @ApiMember(Description="Only runs of this workflow (wf_…).")
    String? workflowId;

    /**
    * The wait's rendered key, exact match.
    */
    // @DataMember
    // @ApiMember(Description="The wait's rendered key, exact match.")
    String? key;

    GetCodeWorkflowWaitingRuns({this.status,this.waitingKind,this.assignee,this.workflowId,this.key});
    GetCodeWorkflowWaitingRuns.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        status = json['status'];
        waitingKind = json['waitingKind'];
        assignee = json['assignee'];
        workflowId = json['workflowId'];
        key = json['key'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'status': status,
        'waitingKind': waitingKind,
        'assignee': assignee,
        'workflowId': workflowId,
        'key': key
    });

    createResponse() => WorkflowRunsResponse();
    getResponseTypeName() => "WorkflowRunsResponse";
    getTypeName() => "GetCodeWorkflowWaitingRuns";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/runs/{RunId}/resume", "POST")
// @DataContract
class ResumeCodeWorkflowRun extends CodeMashRequestBase implements IReturn<WorkflowRunResponse>, IConvertible, IPost
{
    /**
    * wfr_…
    */
    // @DataMember
    // @ApiMember(Description="wfr_…", IsRequired=true)
    String runId = "";

    /**
    * Required when several steps wait.
    */
    // @DataMember
    // @ApiMember(Description="Required when several steps wait.")
    String? stepId;

    /**
    * approved | rejected — required for an approval wait.
    */
    // @DataMember
    // @ApiMember(Description="approved | rejected — required for an approval wait.")
    String? decision;

    // @DataMember
    Map<String,dynamic?>? payload;

    ResumeCodeWorkflowRun({this.runId="",this.stepId,this.decision,this.payload});
    ResumeCodeWorkflowRun.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        runId = json['runId'] ?? "";
        stepId = json['stepId'];
        decision = json['decision'];
        payload = JsonConverters.fromJson(json['payload'],'Map<String,dynamic?>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'runId': runId,
        'stepId': stepId,
        'decision': decision,
        'payload': JsonConverters.toJson(payload,'Map<String,dynamic?>',context!)
    });

    createResponse() => WorkflowRunResponse();
    getResponseTypeName() => "WorkflowRunResponse";
    getTypeName() => "ResumeCodeWorkflowRun";
    TypeContext? context = _ctx;
}

/**
* Beta: what a workflow's one-click link will do — no sign-in, nothing changes. POST the same URL to answer.
*/
// @Route("/{version}/code/workflows/resume/{Token}", "GET")
// @Api(Description="Beta: what a workflow's one-click link will do — no sign-in, nothing changes. POST the same URL to answer.")
// @DataContract
class OpenCodeWorkflowResumeLink extends RequestBase implements IReturn<CodeWorkflowResumeLinkResponse>, IConvertible, IGet
{
    /**
    * The signed link token from the wait's notification (@Model.Wait.ApproveUrl / RejectUrl / ResumeUrl).
    */
    // @DataMember
    // @ApiMember(Description="The signed link token from the wait's notification (@Model.Wait.ApproveUrl / RejectUrl / ResumeUrl).", IsRequired=true)
    String token = "";

    OpenCodeWorkflowResumeLink({this.token=""});
    OpenCodeWorkflowResumeLink.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        token = json['token'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'token': token
    });

    createResponse() => CodeWorkflowResumeLinkResponse();
    getResponseTypeName() => "CodeWorkflowResumeLinkResponse";
    getTypeName() => "OpenCodeWorkflowResumeLink";
    TypeContext? context = _ctx;
}

/**
* Beta: answers a workflow's waiting step with a one-click link — no sign-in; the run goes on as the workflow's execution identity.
*/
// @Route("/{version}/code/workflows/resume/{Token}", "POST")
// @Api(Description="Beta: answers a workflow's waiting step with a one-click link — no sign-in; the run goes on as the workflow's execution identity.")
// @DataContract
class UseCodeWorkflowResumeLink extends RequestBase implements IReturn<WorkflowRunResponse>, IConvertible, IPost
{
    /**
    * The signed link token.
    */
    // @DataMember
    // @ApiMember(Description="The signed link token.", IsRequired=true)
    String token = "";

    UseCodeWorkflowResumeLink({this.token=""});
    UseCodeWorkflowResumeLink.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        token = json['token'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'token': token
    });

    createResponse() => WorkflowRunResponse();
    getResponseTypeName() => "WorkflowRunResponse";
    getTypeName() => "UseCodeWorkflowResumeLink";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/{Id}/runs", "GET")
// @DataContract
class GetCodeWorkflowRuns extends CodeMashListPaginationRequestBase implements IReturn<WorkflowRunsResponse>, IConvertible, IGet
{
    /**
    * wf_…
    */
    // @DataMember
    // @ApiMember(Description="wf_…", IsRequired=true)
    String id = "";

    /**
    * running | waiting | succeeded | failed | cancelled
    */
    // @DataMember
    // @ApiMember(Description="running | waiting | succeeded | failed | cancelled")
    String? status;

    // @DataMember
    DateTime? from;

    // @DataMember
    DateTime? to;

    GetCodeWorkflowRuns({this.id="",this.status,this.from,this.to});
    GetCodeWorkflowRuns.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        status = json['status'];
        from = JsonConverters.fromJson(json['from'],'DateTime',context!);
        to = JsonConverters.fromJson(json['to'],'DateTime',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'status': status,
        'from': JsonConverters.toJson(from,'DateTime',context!),
        'to': JsonConverters.toJson(to,'DateTime',context!)
    });

    createResponse() => WorkflowRunsResponse();
    getResponseTypeName() => "WorkflowRunsResponse";
    getTypeName() => "GetCodeWorkflowRuns";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/runs/{RunId}", "GET")
// @DataContract
class GetCodeWorkflowRun extends CodeMashRequestBase implements IReturn<WorkflowRunResponse>, IConvertible, IGet
{
    /**
    * wfr_…
    */
    // @DataMember
    // @ApiMember(Description="wfr_…", IsRequired=true)
    String runId = "";

    GetCodeWorkflowRun({this.runId=""});
    GetCodeWorkflowRun.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        runId = json['runId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'runId': runId
    });

    createResponse() => WorkflowRunResponse();
    getResponseTypeName() => "WorkflowRunResponse";
    getTypeName() => "GetCodeWorkflowRun";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/runs/{RunId}/logs", "GET")
// @DataContract
class GetCodeWorkflowRunLogs extends CodeMashListPaginationRequestBase implements IReturn<WorkflowRunLogsResponse>, IConvertible, IGet
{
    /**
    * wfr_…
    */
    // @DataMember
    // @ApiMember(Description="wfr_…", IsRequired=true)
    String runId = "";

    /**
    * Only this step's lines.
    */
    // @DataMember
    // @ApiMember(Description="Only this step's lines.")
    String? stepId;

    /**
    * Information | Warning | Error
    */
    // @DataMember
    // @ApiMember(Description="Information | Warning | Error")
    String? level;

    GetCodeWorkflowRunLogs({this.runId="",this.stepId,this.level});
    GetCodeWorkflowRunLogs.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        runId = json['runId'] ?? "";
        stepId = json['stepId'];
        level = json['level'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'runId': runId,
        'stepId': stepId,
        'level': level
    });

    createResponse() => WorkflowRunLogsResponse();
    getResponseTypeName() => "WorkflowRunLogsResponse";
    getTypeName() => "GetCodeWorkflowRunLogs";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/{Id}/resume", "POST")
// @DataContract
class ResumeCodeWorkflowRunByKey extends CodeMashRequestBase implements IReturn<WorkflowRunResponse>, IConvertible, IPost
{
    /**
    * wf_…
    */
    // @DataMember
    // @ApiMember(Description="wf_…", IsRequired=true)
    String id = "";

    /**
    * The wait's rendered key.
    */
    // @DataMember
    // @ApiMember(Description="The wait's rendered key.", IsRequired=true)
    String key = "";

    // @DataMember
    String? stepId;

    /**
    * approved | rejected — required for an approval wait.
    */
    // @DataMember
    // @ApiMember(Description="approved | rejected — required for an approval wait.")
    String? decision;

    // @DataMember
    Map<String,dynamic?>? payload;

    ResumeCodeWorkflowRunByKey({this.id="",this.key="",this.stepId,this.decision,this.payload});
    ResumeCodeWorkflowRunByKey.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        key = json['key'] ?? "";
        stepId = json['stepId'];
        decision = json['decision'];
        payload = JsonConverters.fromJson(json['payload'],'Map<String,dynamic?>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'key': key,
        'stepId': stepId,
        'decision': decision,
        'payload': JsonConverters.toJson(payload,'Map<String,dynamic?>',context!)
    });

    createResponse() => WorkflowRunResponse();
    getResponseTypeName() => "WorkflowRunResponse";
    getTypeName() => "ResumeCodeWorkflowRunByKey";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/runs/{RunId}/retry", "POST")
// @DataContract
class RetryCodeWorkflowRunStep extends CodeMashRequestBase implements IReturn<WorkflowRunResponse>, IConvertible, IPost
{
    /**
    * wfr_…
    */
    // @DataMember
    // @ApiMember(Description="wfr_…", IsRequired=true)
    String runId = "";

    /**
    * The failed step; default = the step named in the run's error.
    */
    // @DataMember
    // @ApiMember(Description="The failed step; default = the step named in the run's error.")
    String? stepId;

    RetryCodeWorkflowRunStep({this.runId="",this.stepId});
    RetryCodeWorkflowRunStep.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        runId = json['runId'] ?? "";
        stepId = json['stepId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'runId': runId,
        'stepId': stepId
    });

    createResponse() => WorkflowRunResponse();
    getResponseTypeName() => "WorkflowRunResponse";
    getTypeName() => "RetryCodeWorkflowRunStep";
    TypeContext? context = _ctx;
}

// @Route("/{version}/code/workflows/runs/{RunId}/cancel", "POST")
// @DataContract
class CancelCodeWorkflowRun extends CodeMashRequestBase implements IReturn<WorkflowRunResponse>, IConvertible, IPost
{
    /**
    * wfr_…
    */
    // @DataMember
    // @ApiMember(Description="wfr_…", IsRequired=true)
    String runId = "";

    // @DataMember
    String? reason;

    CancelCodeWorkflowRun({this.runId="",this.reason});
    CancelCodeWorkflowRun.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        runId = json['runId'] ?? "";
        reason = json['reason'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'runId': runId,
        'reason': reason
    });

    createResponse() => WorkflowRunResponse();
    getResponseTypeName() => "WorkflowRunResponse";
    getTypeName() => "CancelCodeWorkflowRun";
    TypeContext? context = _ctx;
}

// @Route("/{version}/notifications/inbox", "GET")
class GetNotificationInboxRequest extends CodeMashListPaginationRequestBase implements IReturn<GetNotificationInboxResponse>, IConvertible, IGet
{
    bool? unreadOnly;
    String? channel;

    GetNotificationInboxRequest({this.unreadOnly,this.channel});
    GetNotificationInboxRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        unreadOnly = json['unreadOnly'];
        channel = json['channel'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'unreadOnly': unreadOnly,
        'channel': channel
    });

    createResponse() => GetNotificationInboxResponse();
    getResponseTypeName() => "GetNotificationInboxResponse";
    getTypeName() => "GetNotificationInboxRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/notifications/inbox/unread-count", "GET")
class GetUnreadCountRequest extends CodeMashRequestBase implements IReturn<GetUnreadCountResponse>, IConvertible, IGet
{
    GetUnreadCountRequest();
    GetUnreadCountRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => GetUnreadCountResponse();
    getResponseTypeName() => "GetUnreadCountResponse";
    getTypeName() => "GetUnreadCountRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/notifications/inbox/{notificationId}/read", "POST")
class MarkNotificationReadRequest extends CodeMashRequestBase implements IReturn<MarkNotificationReadResponse>, IConvertible, IPost
{
    String notificationId = "";

    MarkNotificationReadRequest({this.notificationId=""});
    MarkNotificationReadRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        notificationId = json['notificationId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'notificationId': notificationId
    });

    createResponse() => MarkNotificationReadResponse();
    getResponseTypeName() => "MarkNotificationReadResponse";
    getTypeName() => "MarkNotificationReadRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/notifications/inbox/read-all", "POST")
class MarkAllNotificationsReadRequest extends CodeMashRequestBase implements IReturn<MarkAllNotificationsReadResponse>, IConvertible, IPost
{
    MarkAllNotificationsReadRequest();
    MarkAllNotificationsReadRequest.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => MarkAllNotificationsReadResponse();
    getResponseTypeName() => "MarkAllNotificationsReadResponse";
    getTypeName() => "MarkAllNotificationsReadRequest";
    TypeContext? context = _ctx;
}

/**
* Sets or removes one user's own end-user AI plan
*/
// @Route("/{version}/membership/users/{userId}/ai-plan", "PUT")
// @Api(Description="Sets or removes one user's own end-user AI plan")
class SetUserAiPlan extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPut
{
    /**
    * The human user id (ct_…).
    */
    // @ApiMember(Description="The human user id (ct_…).", IsRequired=true)
    String userId = "";

    /**
    * The plan id (aip_…). Empty removes the user's own plan.
    */
    // @ApiMember(Description="The plan id (aip_…). Empty removes the user's own plan.")
    String? planId;

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    SetUserAiPlan({this.userId="",this.planId,this.databaseIntegrationId});
    SetUserAiPlan.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        userId = json['userId'] ?? "";
        planId = json['planId'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'userId': userId,
        'planId': planId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "SetUserAiPlan";
    TypeContext? context = _ctx;
}

/**
* Create a contact
*/
// @Route("/{version}/membership/users", "POST")
// @Api(Description="Create a contact")
class CreateContactRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * Primary email address of the contact (optional if a phone is given).
    */
    // @ApiMember(Description="Primary email address of the contact (optional if a phone is given).")
    String? primaryEmail;

    /**
    * Primary phone number in international format, e.g. +14155550123 (optional if an email is given).
    */
    // @ApiMember(Description="Primary phone number in international format, e.g. +14155550123 (optional if an email is given).")
    String? primaryPhone;

    /**
    * Display name shown in the dashboard (optional).
    */
    // @ApiMember(Description="Display name shown in the dashboard (optional).")
    String? displayName;

    /**
    * Contact's first name (optional).
    */
    // @ApiMember(Description="Contact's first name (optional).")
    String? firstName;

    /**
    * Contact's last name (optional).
    */
    // @ApiMember(Description="Contact's last name (optional).")
    String? lastName;

    /**
    * Tags to put on the new contact — free labels campaigns and segments select by, normalised like any tag.
    */
    // @ApiMember(Description="Tags to put on the new contact — free labels campaigns and segments select by, normalised like any tag.")
    List<String>? tags;

    CreateContactRequest({this.primaryEmail,this.primaryPhone,this.displayName,this.firstName,this.lastName,this.tags});
    CreateContactRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        primaryEmail = json['primaryEmail'];
        primaryPhone = json['primaryPhone'];
        displayName = json['displayName'];
        firstName = json['firstName'];
        lastName = json['lastName'];
        tags = JsonConverters.fromJson(json['tags'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'primaryEmail': primaryEmail,
        'primaryPhone': primaryPhone,
        'displayName': displayName,
        'firstName': firstName,
        'lastName': lastName,
        'tags': JsonConverters.toJson(tags,'List<String>',context!)
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "CreateContactRequest";
    TypeContext? context = _ctx;
}

/**
* Archive a contact
*/
// @Route("/{version}/membership/users/{contactId}", "DELETE")
// @Api(Description="Archive a contact")
class DeleteContact extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The contact id (ct_…) to archive. Get it from get_all_contacts.
    */
    // @ApiMember(Description="The contact id (ct_…) to archive. Get it from get_all_contacts.", IsRequired=true)
    String contactId = "";

    DeleteContact({this.contactId=""});
    DeleteContact.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteContact";
    TypeContext? context = _ctx;
}

/**
* Get a contact
*/
// @Route("/{version}/membership/users/{contactId}", "GET")
// @Api(Description="Get a contact")
class GetContact extends CodeMashRequestBase implements IReturn<GetContactResponse>, IConvertible, IGet
{
    /**
    * The contact id (ct_…) to fetch, or a login id (usr_…) — then the contact that owns that login is returned. Get it from get_all_contacts.
    */
    // @ApiMember(Description="The contact id (ct_…) to fetch, or a login id (usr_…) — then the contact that owns that login is returned. Get it from get_all_contacts.", IsRequired=true)
    String contactId = "";

    GetContact({this.contactId=""});
    GetContact.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId
    });

    createResponse() => GetContactResponse();
    getResponseTypeName() => "GetContactResponse";
    getTypeName() => "GetContact";
    TypeContext? context = _ctx;
}

/**
* List contacts
*/
// @Route("/{version}/membership/users", "GET")
// @Api(Description="List contacts")
class GetAllContacts extends CodeMashRequestBase implements IReturn<GetAllContactsResponse>, IConvertible, IGet
{
    /**
    * Cursor for the next page: pass the nextCursor from the previous call. Omit for the first page.
    */
    // @ApiMember(Description="Cursor for the next page: pass the nextCursor from the previous call. Omit for the first page.")
    String? startingAfter;

    /**
    * How many contacts to return per page (default 50).
    */
    // @ApiMember(Description="How many contacts to return per page (default 50).")
    int? pageSize;

    /**
    * Free text, case-insensitive: matches the email, phone, display / first / last / full name, or any login's user name or email.
    */
    // @ApiMember(Description="Free text, case-insensitive: matches the email, phone, display / first / last / full name, or any login's user name or email.")
    String? search;

    /**
    * Case-insensitive part of the email (primary email or any login's email).
    */
    // @ApiMember(Description="Case-insensitive part of the email (primary email or any login's email).")
    String? email;

    /**
    * Case-insensitive part of any login's user name.
    */
    // @ApiMember(Description="Case-insensitive part of any login's user name.")
    String? userName;

    /**
    * Login status names, any of: Registered, PendingValidation, Active, Unregistered, Suspended, InActive, Blocked.
    */
    // @ApiMember(Description="Login status names, any of: Registered, PendingValidation, Active, Unregistered, Suspended, InActive, Blocked.")
    List<String>? statuses;

    /**
    * Login type names, any of: Service, Email, UserName, Phone, Guest, Social.
    */
    // @ApiMember(Description="Login type names, any of: Service, Email, UserName, Phone, Guest, Social.")
    List<String>? types;

    /**
    * Composite project-role ids (pr_{project}_nr_{role}); the contact holds any of them.
    */
    // @ApiMember(Description="Composite project-role ids (pr_{project}_nr_{role}); the contact holds any of them.")
    List<String>? roleNames;

    GetAllContacts({this.startingAfter,this.pageSize,this.search,this.email,this.userName,this.statuses,this.types,this.roleNames});
    GetAllContacts.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        startingAfter = json['startingAfter'];
        pageSize = json['pageSize'];
        search = json['search'];
        email = json['email'];
        userName = json['userName'];
        statuses = JsonConverters.fromJson(json['statuses'],'List<String>',context!);
        types = JsonConverters.fromJson(json['types'],'List<String>',context!);
        roleNames = JsonConverters.fromJson(json['roleNames'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'startingAfter': startingAfter,
        'pageSize': pageSize,
        'search': search,
        'email': email,
        'userName': userName,
        'statuses': JsonConverters.toJson(statuses,'List<String>',context!),
        'types': JsonConverters.toJson(types,'List<String>',context!),
        'roleNames': JsonConverters.toJson(roleNames,'List<String>',context!)
    });

    createResponse() => GetAllContactsResponse();
    getResponseTypeName() => "GetAllContactsResponse";
    getTypeName() => "GetAllContacts";
    TypeContext? context = _ctx;
}

/**
* Merge contacts
*/
// @Route("/{version}/membership/users/merge", "POST")
// @Api(Description="Merge contacts")
class MergeContactsRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The contact id (ct_…) that will remain after the merge (the survivor).
    */
    // @ApiMember(Description="The contact id (ct_…) that will remain after the merge (the survivor).", IsRequired=true)
    String survivorId = "";

    /**
    * The contact ids (ct_…) to merge into the survivor and archive. At least one.
    */
    // @ApiMember(Description="The contact ids (ct_…) to merge into the survivor and archive. At least one.", IsRequired=true)
    List<String> mergedIds = [];

    MergeContactsRequest({this.survivorId="",this.mergedIds=const []});
    MergeContactsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        survivorId = json['survivorId'] ?? "";
        mergedIds = JsonConverters.fromJson(json['mergedIds'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'survivorId': survivorId,
        'mergedIds': JsonConverters.toJson(mergedIds,'List<String>',context!)
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "MergeContactsRequest";
    TypeContext? context = _ctx;
}

/**
* Repair contact roles from their logins
*/
// @Route("/{version}/membership/users/repair-roles", "POST")
// @Api(Description="Repair contact roles from their logins")
class RepairContactRolesRequest extends CodeMashRequestBase implements IReturn<RepairContactRolesResponse>, IConvertible, IPost
{
    /**
    * True = only count what would change. False = write. Empty = true (only count).
    */
    // @ApiMember(Description="True = only count what would change. False = write. Empty = true (only count).")
    bool? dryRun;

    RepairContactRolesRequest({this.dryRun});
    RepairContactRolesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        dryRun = json['dryRun'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'dryRun': dryRun
    });

    createResponse() => RepairContactRolesResponse();
    getResponseTypeName() => "RepairContactRolesResponse";
    getTypeName() => "RepairContactRolesRequest";
    TypeContext? context = _ctx;
}

/**
* Update a contact
*/
// @Route("/{version}/membership/users/{contactId}", "PATCH")
// @Api(Description="Update a contact")
class UpdateContactRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPatch
{
    /**
    * The contact id (ct_…) to update. Get it from get_all_contacts.
    */
    // @ApiMember(Description="The contact id (ct_…) to update. Get it from get_all_contacts.", IsRequired=true)
    String contactId = "";

    /**
    * Display name shown in the dashboard.
    */
    // @ApiMember(Description="Display name shown in the dashboard.")
    String? displayName;

    /**
    * First name.
    */
    // @ApiMember(Description="First name.")
    String? firstName;

    /**
    * Last name.
    */
    // @ApiMember(Description="Last name.")
    String? lastName;

    /**
    * Full name (overrides first/last when set).
    */
    // @ApiMember(Description="Full name (overrides first/last when set).")
    String? fullName;

    /**
    * Company or organisation name.
    */
    // @ApiMember(Description="Company or organisation name.")
    String? company;

    /**
    * Free-text internal notes about the contact.
    */
    // @ApiMember(Description="Free-text internal notes about the contact.")
    String? notes;

    /**
    * Gender: Male, Female or Other.
    */
    // @ApiMember(Description="Gender: Male, Female or Other.")
    String? gender;

    /**
    * Birth date as a unix timestamp in MILLISECONDS (UTC).
    */
    // @ApiMember(Description="Birth date as a unix timestamp in MILLISECONDS (UTC).")
    int? birthDate;

    /**
    * IANA time zone id, e.g. Europe/Vilnius.
    */
    // @ApiMember(Description="IANA time zone id, e.g. Europe/Vilnius.")
    String? timeZone;

    /**
    * Preferred language/locale code, e.g. en or en-US.
    */
    // @ApiMember(Description="Preferred language/locale code, e.g. en or en-US.")
    String? language;

    /**
    * Address line 1 (street).
    */
    // @ApiMember(Description="Address line 1 (street).")
    String? addressLine1;

    /**
    * Address line 2 (apartment, suite, etc.).
    */
    // @ApiMember(Description="Address line 2 (apartment, suite, etc.).")
    String? addressLine2;

    /**
    * Country name or code.
    */
    // @ApiMember(Description="Country name or code.")
    String? country;

    /**
    * City.
    */
    // @ApiMember(Description="City.")
    String? city;

    /**
    * State, region or province.
    */
    // @ApiMember(Description="State, region or province.")
    String? state;

    /**
    * Postal or ZIP code.
    */
    // @ApiMember(Description="Postal or ZIP code.")
    String? postalCode;

    UpdateContactRequest({this.contactId="",this.displayName,this.firstName,this.lastName,this.fullName,this.company,this.notes,this.gender,this.birthDate,this.timeZone,this.language,this.addressLine1,this.addressLine2,this.country,this.city,this.state,this.postalCode});
    UpdateContactRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        displayName = json['displayName'];
        firstName = json['firstName'];
        lastName = json['lastName'];
        fullName = json['fullName'];
        company = json['company'];
        notes = json['notes'];
        gender = json['gender'];
        birthDate = json['birthDate'];
        timeZone = json['timeZone'];
        language = json['language'];
        addressLine1 = json['addressLine1'];
        addressLine2 = json['addressLine2'];
        country = json['country'];
        city = json['city'];
        state = json['state'];
        postalCode = json['postalCode'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'displayName': displayName,
        'firstName': firstName,
        'lastName': lastName,
        'fullName': fullName,
        'company': company,
        'notes': notes,
        'gender': gender,
        'birthDate': birthDate,
        'timeZone': timeZone,
        'language': language,
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'country': country,
        'city': city,
        'state': state,
        'postalCode': postalCode
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "UpdateContactRequest";
    TypeContext? context = _ctx;
}

/**
* Link a login to a contact
*/
// @Route("/{version}/membership/users/{contactId}/identities", "POST")
// @Api(Description="Link a login to a contact")
class AddContactIdentityRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The contact id (ct_…) to link the login to.
    */
    // @ApiMember(Description="The contact id (ct_…) to link the login to.", IsRequired=true)
    String contactId = "";

    /**
    * The login (identity) id (usr_…) to link to the contact.
    */
    // @ApiMember(Description="The login (identity) id (usr_…) to link to the contact.", IsRequired=true)
    String authId = "";

    AddContactIdentityRequest({this.contactId="",this.authId=""});
    AddContactIdentityRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        authId = json['authId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'authId': authId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "AddContactIdentityRequest";
    TypeContext? context = _ctx;
}

/**
* Make a login the contact's primary
*/
// @Route("/{version}/membership/users/{contactId}/identities/{authId}/promote", "POST")
// @Api(Description="Make a login the contact's primary")
class PromoteContactIdentityRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The contact id (ct_…) whose login is being promoted.
    */
    // @ApiMember(Description="The contact id (ct_…) whose login is being promoted.", IsRequired=true)
    String contactId = "";

    /**
    * The linked login (identity) id (usr_…) to make primary.
    */
    // @ApiMember(Description="The linked login (identity) id (usr_…) to make primary.", IsRequired=true)
    String authId = "";

    PromoteContactIdentityRequest({this.contactId="",this.authId=""});
    PromoteContactIdentityRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        authId = json['authId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'authId': authId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "PromoteContactIdentityRequest";
    TypeContext? context = _ctx;
}

/**
* Unlink a login from a contact
*/
// @Route("/{version}/membership/users/{contactId}/identities/{authId}", "DELETE")
// @Api(Description="Unlink a login from a contact")
class RemoveContactIdentityRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The contact id (ct_…) to unlink the login from.
    */
    // @ApiMember(Description="The contact id (ct_…) to unlink the login from.", IsRequired=true)
    String contactId = "";

    /**
    * The login (identity) id (usr_…) to unlink from the contact.
    */
    // @ApiMember(Description="The login (identity) id (usr_…) to unlink from the contact.", IsRequired=true)
    String authId = "";

    RemoveContactIdentityRequest({this.contactId="",this.authId=""});
    RemoveContactIdentityRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        contactId = json['contactId'] ?? "";
        authId = json['authId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'contactId': contactId,
        'authId': authId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "RemoveContactIdentityRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/files/item/private", "POST")
class MakeFilePrivateRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The files integration the file lives on.
    */
    // @ApiMember(Description="The files integration the file lives on.", IsRequired=true)
    String filesIntegrationId = "";

    /**
    * Path of the file, relative to the integration.
    */
    // @ApiMember(Description="Path of the file, relative to the integration.", IsRequired=true)
    String path = "";

    MakeFilePrivateRequest({this.filesIntegrationId="",this.path=""});
    MakeFilePrivateRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "MakeFilePrivateRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/files/item/public", "POST")
class MakeFilePublicRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * The files integration the file lives on.
    */
    // @ApiMember(Description="The files integration the file lives on.", IsRequired=true)
    String filesIntegrationId = "";

    /**
    * Path of the file to publish, relative to the integration.
    */
    // @ApiMember(Description="Path of the file to publish, relative to the integration.", IsRequired=true)
    String path = "";

    MakeFilePublicRequest({this.filesIntegrationId="",this.path=""});
    MakeFilePublicRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "MakeFilePublicRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/files/folder/private", "POST")
class MakeFolderPrivateRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The files integration the folder lives on.
    */
    // @ApiMember(Description="The files integration the folder lives on.", IsRequired=true)
    String filesIntegrationId = "";

    /**
    * Folder prefix, relative to the integration.
    */
    // @ApiMember(Description="Folder prefix, relative to the integration.", IsRequired=true)
    String path = "";

    MakeFolderPrivateRequest({this.filesIntegrationId="",this.path=""});
    MakeFolderPrivateRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "MakeFolderPrivateRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/files/folder/public", "POST")
class MakeFolderPublicRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * The files integration the folder lives on.
    */
    // @ApiMember(Description="The files integration the folder lives on.", IsRequired=true)
    String filesIntegrationId = "";

    /**
    * Folder prefix to publish, relative to the integration.
    */
    // @ApiMember(Description="Folder prefix to publish, relative to the integration.", IsRequired=true)
    String path = "";

    MakeFolderPublicRequest({this.filesIntegrationId="",this.path=""});
    MakeFolderPublicRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "MakeFolderPublicRequest";
    TypeContext? context = _ctx;
}

// @Route("/{version}/files/folder", "GET")
class GetFolderFiles extends CodeMashListPaginationRequestBase implements IReturn<GetFolderFilesResponse>, IConvertible, IGet
{
    /**
    * The files integration id to list from, from get_files_integrations.
    */
    // @ApiMember(Description="The files integration id to list from, from get_files_integrations.", IsRequired=true)
    String filesIntegrationId = "";

    /**
    * Path prefix to list. Empty / null lists the root.
    */
    // @ApiMember(Description="Path prefix to list. Empty / null lists the root.")
    String? path;

    GetFolderFiles({this.filesIntegrationId="",this.path});
    GetFolderFiles.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path
    });

    createResponse() => GetFolderFilesResponse();
    getResponseTypeName() => "GetFolderFilesResponse";
    getTypeName() => "GetFolderFiles";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/imports", "POST")
// @Api(Description="Database")
class CreateCollectionImport extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * The uploaded CSV's file ref, from the upload call.
    */
    // @ApiMember(Description="The uploaded CSV's file ref, from the upload call.", IsRequired=true)
    FileResourceRefDto? file;

    /**
    * The target schema id.
    */
    // @ApiMember(Description="The target schema id.", IsRequired=true)
    String schemaId = "";

    /**
    * The target collection (schema) name.
    */
    // @ApiMember(Description="The target collection (schema) name.", IsRequired=true)
    String collectionName = "";

    String? databaseIntegrationId;
    /**
    * The CSV delimiter used at upload time.
    */
    // @ApiMember(Description="The CSV delimiter used at upload time.", IsRequired=true)
    String delimiter = "";

    bool? hasHeader;
    /**
    * Column → property mapping, frozen for this import.
    */
    // @ApiMember(Description="Column → property mapping, frozen for this import.", IsRequired=true)
    List<ImportColumnMappingDto> mapping = [];

    CreateCollectionImport({this.file,this.schemaId="",this.collectionName="",this.databaseIntegrationId,this.delimiter="",this.hasHeader,this.mapping=const []});
    CreateCollectionImport.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        schemaId = json['schemaId'] ?? "";
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        delimiter = json['delimiter'] ?? "";
        hasHeader = json['hasHeader'];
        mapping = JsonConverters.fromJson(json['mapping'],'List<ImportColumnMappingDto>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!),
        'schemaId': schemaId,
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'delimiter': delimiter,
        'hasHeader': hasHeader,
        'mapping': JsonConverters.toJson(mapping,'List<ImportColumnMappingDto>',context!)
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "CreateCollectionImport";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/imports/{Id}", "DELETE")
// @Api(Description="Database")
class DeleteCollectionImportRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The import id (imp_…).
    */
    // @ApiMember(Description="The import id (imp_…).", IsRequired=true)
    String id = "";

    String? databaseIntegrationId;

    DeleteCollectionImportRequest({this.id="",this.databaseIntegrationId});
    DeleteCollectionImportRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteCollectionImportRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/imports/{Id}", "GET")
// @Api(Description="Database")
class GetCollectionImport extends CodeMashRequestBase implements IReturn<GetCollectionImportResponse>, IConvertible, IGet
{
    /**
    * The import id (imp_…).
    */
    // @ApiMember(Description="The import id (imp_…).", IsRequired=true)
    String id = "";

    String? databaseIntegrationId;

    GetCollectionImport({this.id="",this.databaseIntegrationId});
    GetCollectionImport.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetCollectionImportResponse();
    getResponseTypeName() => "GetCollectionImportResponse";
    getTypeName() => "GetCollectionImport";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/imports", "GET")
// @Api(Description="Database")
class GetCollectionImports extends CodeMashListPaginationRequestBase implements IReturn<GetCollectionImportsResponse>, IConvertible, IGet
{
    String? databaseIntegrationId;

    GetCollectionImports({this.databaseIntegrationId});
    GetCollectionImports.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetCollectionImportsResponse();
    getResponseTypeName() => "GetCollectionImportsResponse";
    getTypeName() => "GetCollectionImports";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/imports/upload-url", "POST")
// @Api(Description="Database")
class RequestImportUploadUrlRequest extends CodeMashRequestBase implements IReturn<RequestImportUploadUrlResponse>, IConvertible, IPost
{
    String? fileAccountId;
    /**
    * The original CSV file name, e.g. people.csv.
    */
    // @ApiMember(Description="The original CSV file name, e.g. people.csv.", IsRequired=true)
    String fileName = "";

    RequestImportUploadUrlRequest({this.fileAccountId,this.fileName=""});
    RequestImportUploadUrlRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        fileAccountId = json['fileAccountId'];
        fileName = json['fileName'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'fileAccountId': fileAccountId,
        'fileName': fileName
    });

    createResponse() => RequestImportUploadUrlResponse();
    getResponseTypeName() => "RequestImportUploadUrlResponse";
    getTypeName() => "RequestImportUploadUrlRequest";
    TypeContext? context = _ctx;
}

/**
* Database
*/
// @Route("/{version}/database/imports/analyze", "POST")
// @Api(Description="Database")
class AnalyzeImportFileRequest extends CodeMashRequestBase implements IReturn<AnalyzeImportFileResponse>, IConvertible, IPost
{
    /**
    * The uploaded CSV's file ref, from the upload-url call.
    */
    // @ApiMember(Description="The uploaded CSV's file ref, from the upload-url call.", IsRequired=true)
    FileResourceRefDto? file;

    /**
    * The CSV delimiter, e.g. "," or ";".
    */
    // @ApiMember(Description="The CSV delimiter, e.g. \",\" or \";\".", IsRequired=true)
    String delimiter = "";

    /**
    * Whether the first row is a header row.
    */
    // @ApiMember(Description="Whether the first row is a header row.")
    bool? hasHeader;

    AnalyzeImportFileRequest({this.file,this.delimiter="",this.hasHeader});
    AnalyzeImportFileRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        file = JsonConverters.fromJson(json['file'],'FileResourceRefDto',context!);
        delimiter = json['delimiter'] ?? "";
        hasHeader = json['hasHeader'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'file': JsonConverters.toJson(file,'FileResourceRefDto',context!),
        'delimiter': delimiter,
        'hasHeader': hasHeader
    });

    createResponse() => AnalyzeImportFileResponse();
    getResponseTypeName() => "AnalyzeImportFileResponse";
    getTypeName() => "AnalyzeImportFileRequest";
    TypeContext? context = _ctx;
}

/**
* Create email campaign
*/
// @Route("/{version}/notifications/email/campaigns", "POST")
// @Api(Description="Create email campaign")
// @DataContract
class CreateEmailCampaignRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    EmailCampaignRequest? campaign;

    // @DataMember
    String? databaseIntegrationId;

    /**
    * Optional. true sends the campaign now (or at a campaignTime sooner than the review window). Without it, a campaign created by an AI tool must be scheduled at least 24 hours ahead for role-based / all-users / collection audiences and at least 1 hour ahead for direct recipient lists, or it is rejected with CM-ERRORS-CAMPAIGNS-017. Set it only when the user explicitly asked to send now.
    */
    // @DataMember
    // @ApiMember(Description="Optional. true sends the campaign now (or at a campaignTime sooner than the review window). Without it, a campaign created by an AI tool must be scheduled at least 24 hours ahead for role-based / all-users / collection audiences and at least 1 hour ahead for direct recipient lists, or it is rejected with CM-ERRORS-CAMPAIGNS-017. Set it only when the user explicitly asked to send now.")
    bool? sendNow;

    CreateEmailCampaignRequest({this.campaign,this.databaseIntegrationId,this.sendNow});
    CreateEmailCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaign = JsonConverters.fromJson(json['campaign'],'EmailCampaignRequest',context!);
        databaseIntegrationId = json['databaseIntegrationId'];
        sendNow = json['sendNow'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaign': JsonConverters.toJson(campaign,'EmailCampaignRequest',context!),
        'databaseIntegrationId': databaseIntegrationId,
        'sendNow': sendNow
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "CreateEmailCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Deletes emails campaign from queue
*/
// @Route("/{version}/notifications/email/campaigns/{Id}", "DELETE")
// @Api(Description="Deletes emails campaign from queue")
// @DataContract
class DeleteEmailCampaignRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    // @DataMember
    String id = "";

    // @DataMember
    String? databaseIntegrationId;

    DeleteEmailCampaignRequest({this.id="",this.databaseIntegrationId});
    DeleteEmailCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteEmailCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Gets email campaign by id
*/
// @Route("/{version}/notifications/email/campaigns/{id}", "GET")
// @Api(Description="Gets email campaign by id")
class GetEmailCampaign extends CodeMashRequestBase implements IReturn<GetEmailCampaignResponse>, IConvertible, IGet
{
    /**
    * The campaign id.
    */
    // @ApiMember(Description="The campaign id.")
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetEmailCampaign({this.id="",this.databaseIntegrationId});
    GetEmailCampaign.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetEmailCampaignResponse();
    getResponseTypeName() => "GetEmailCampaignResponse";
    getTypeName() => "GetEmailCampaign";
    TypeContext? context = _ctx;
}

/**
* Gets email campaigns
*/
// @Route("/{version}/notifications/email/campaigns", "GET")
// @Api(Description="Gets email campaigns")
class GetEmailCampaigns extends CodeMashListPaginationRequestBase implements IReturn<GetEmailCampaignsResponse>, IConvertible, IGet
{
    /**
    * Optional. When omitted, the project's default database integration is used (resolved server-side from the project state).
    */
    // @ApiMember(Description="Optional. When omitted, the project's default database integration is used (resolved server-side from the project state).")
    String? databaseIntegrationId;

    /**
    * Optional: return only the campaign with this id.
    */
    // @ApiMember(Description="Optional: return only the campaign with this id.")
    String? campaignId;

    /**
    * Optional: only campaigns that targeted this email address.
    */
    // @ApiMember(Description="Optional: only campaigns that targeted this email address.")
    String? emailAddress;

    /**
    * Optional: only campaigns built on this email template id.
    */
    // @ApiMember(Description="Optional: only campaigns built on this email template id.")
    String? templateId;

    /**
    * Optional lower bound for the campaign time, unix timestamp in seconds (UTC).
    */
    // @ApiMember(Description="Optional lower bound for the campaign time, unix timestamp in seconds (UTC).")
    int? from;

    /**
    * Optional upper bound for the campaign time, unix timestamp in seconds (UTC).
    */
    // @ApiMember(Description="Optional upper bound for the campaign time, unix timestamp in seconds (UTC).")
    int? to;

    GetEmailCampaigns({this.databaseIntegrationId,this.campaignId,this.emailAddress,this.templateId,this.from,this.to});
    GetEmailCampaigns.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        databaseIntegrationId = json['databaseIntegrationId'];
        campaignId = json['campaignId'];
        emailAddress = json['emailAddress'];
        templateId = json['templateId'];
        from = json['from'];
        to = json['to'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId,
        'campaignId': campaignId,
        'emailAddress': emailAddress,
        'templateId': templateId,
        'from': from,
        'to': to
    });

    createResponse() => GetEmailCampaignsResponse();
    getResponseTypeName() => "GetEmailCampaignsResponse";
    getTypeName() => "GetEmailCampaigns";
    TypeContext? context = _ctx;
}

/**
* Get email campaign batches
*/
// @Route("/{version}/notifications/email/campaigns/{id}/batches", "GET")
// @Api(Description="Get email campaign batches")
class GetEmailCampaignBatches extends CodeMashListPaginationRequestBase implements IReturn<GetEmailCampaignBatchesResponse>, IConvertible, IGet
{
    /**
    * The email campaign id to list batches for. Get it from get_email_campaigns.
    */
    // @ApiMember(Description="The email campaign id to list batches for. Get it from get_email_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    /**
    * Optional batch id to filter to a single batch. Get it from a prior call to this tool.
    */
    // @ApiMember(Description="Optional batch id to filter to a single batch. Get it from a prior call to this tool.")
    String? batchId;

    /**
    * Optional recipient email address to filter batches by.
    */
    // @ApiMember(Description="Optional recipient email address to filter batches by.")
    String? emailAddress;

    GetEmailCampaignBatches({this.id="",this.databaseIntegrationId,this.batchId,this.emailAddress});
    GetEmailCampaignBatches.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        batchId = json['batchId'];
        emailAddress = json['emailAddress'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'batchId': batchId,
        'emailAddress': emailAddress
    });

    createResponse() => GetEmailCampaignBatchesResponse();
    getResponseTypeName() => "GetEmailCampaignBatchesResponse";
    getTypeName() => "GetEmailCampaignBatches";
    TypeContext? context = _ctx;
}

/**
* Get an email campaign batch notification
*/
// @Route("/{version}/notifications/email/campaigns/{id}/batches/{batchId}/{notificationId}", "GET")
// @Api(Description="Get an email campaign batch notification")
class GetEmailCampaignBatchNotification extends CodeMashListPaginationRequestBase implements IReturn<GetEmailCampaignBatchNotificationResponse>, IConvertible, IGet
{
    /**
    * The email campaign id. Get it from get_email_campaigns.
    */
    // @ApiMember(Description="The email campaign id. Get it from get_email_campaigns.", IsRequired=true)
    String id = "";

    /**
    * The campaign batch id. Get it from get_email_campaign_batches.
    */
    // @ApiMember(Description="The campaign batch id. Get it from get_email_campaign_batches.", IsRequired=true)
    String batchId = "";

    /**
    * The notification id within the batch. Get it from get_email_campaign_batch_notifications.
    */
    // @ApiMember(Description="The notification id within the batch. Get it from get_email_campaign_batch_notifications.", IsRequired=true)
    String notificationId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetEmailCampaignBatchNotification({this.id="",this.batchId="",this.notificationId="",this.databaseIntegrationId});
    GetEmailCampaignBatchNotification.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        batchId = json['batchId'] ?? "";
        notificationId = json['notificationId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'batchId': batchId,
        'notificationId': notificationId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetEmailCampaignBatchNotificationResponse();
    getResponseTypeName() => "GetEmailCampaignBatchNotificationResponse";
    getTypeName() => "GetEmailCampaignBatchNotification";
    TypeContext? context = _ctx;
}

/**
* Get email campaign batch notifications
*/
// @Route("/{version}/notifications/email/campaigns/{id}/batches/{batchId}", "GET")
// @Api(Description="Get email campaign batch notifications")
class GetEmailCampaignBatchNotifications extends CodeMashListPaginationRequestBase implements IReturn<GetEmailCampaignBatchNotificationsResponse>, IConvertible, IGet
{
    /**
    * The email campaign id. Get it from get_email_campaigns.
    */
    // @ApiMember(Description="The email campaign id. Get it from get_email_campaigns.", IsRequired=true)
    String id = "";

    /**
    * The campaign batch id to list notifications for. Get it from get_email_campaign_batches.
    */
    // @ApiMember(Description="The campaign batch id to list notifications for. Get it from get_email_campaign_batches.", IsRequired=true)
    String batchId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetEmailCampaignBatchNotifications({this.id="",this.batchId="",this.databaseIntegrationId});
    GetEmailCampaignBatchNotifications.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        batchId = json['batchId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'batchId': batchId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetEmailCampaignBatchNotificationsResponse();
    getResponseTypeName() => "GetEmailCampaignBatchNotificationsResponse";
    getTypeName() => "GetEmailCampaignBatchNotifications";
    TypeContext? context = _ctx;
}

/**
* Get email campaign statistics
*/
// @Route("/{version}/notifications/email/campaigns/{id}/stats", "GET")
// @Api(Description="Get email campaign statistics")
class GetEmailCampaignStatistics extends CodeMashRequestBase implements IReturn<GetEmailCampaignStatisticsResponse>, IConvertible, IGet
{
    /**
    * The email campaign id to get statistics for. Get it from get_email_campaigns.
    */
    // @ApiMember(Description="The email campaign id to get statistics for. Get it from get_email_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetEmailCampaignStatistics({this.id="",this.databaseIntegrationId});
    GetEmailCampaignStatistics.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetEmailCampaignStatisticsResponse();
    getResponseTypeName() => "GetEmailCampaignStatisticsResponse";
    getTypeName() => "GetEmailCampaignStatistics";
    TypeContext? context = _ctx;
}

/**
* Preview an email notification
*/
// @Route("/{version}/notifications/email/preview", "GET")
// @Api(Description="Preview an email notification")
class PreviewEmailNotification extends RequestBase implements IReturn<PreviewEmailNotificationResponse>, IConvertible, IGet
{
    /**
    * The signed preview link hash. With it the preview opens without sign-in: exactly one notification, until the link expires (30 days after sending).
    */
    // @ApiMember(Description="The signed preview link hash. With it the preview opens without sign-in: exactly one notification, until the link expires (30 days after sending).")
    String hash = "";

    /**
    * Signed-in preview by id: the project id. With a hash it must match the hash.
    */
    // @ApiMember(Description="Signed-in preview by id: the project id. With a hash it must match the hash.")
    String? projectId;

    /**
    * Signed-in preview by id: the notification id (needs email:read). With a hash it must match the hash.
    */
    // @ApiMember(Description="Signed-in preview by id: the notification id (needs email:read). With a hash it must match the hash.")
    String? notificationId;

    PreviewEmailNotification({this.hash="",this.projectId,this.notificationId});
    PreviewEmailNotification.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        hash = json['hash'] ?? "";
        projectId = json['projectId'];
        notificationId = json['notificationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'hash': hash,
        'projectId': projectId,
        'notificationId': notificationId
    });

    createResponse() => PreviewEmailNotificationResponse();
    getResponseTypeName() => "PreviewEmailNotificationResponse";
    getTypeName() => "PreviewEmailNotification";
    TypeContext? context = _ctx;
}

/**
* Retries the failed recipients of an email campaign
*/
// @Route("/{version}/notifications/email/campaigns/{Id}/retry-failed", "POST")
// @Api(Description="Retries the failed recipients of an email campaign")
// @DataContract
class RetryFailedEmailNotificationsRequest extends CodeMashRequestBase implements IReturn<RetryFailedEmailNotificationsResponse>, IConvertible, IPost
{
    /**
    * The campaign id. Get it from get_email_campaigns.
    */
    // @DataMember
    // @ApiMember(Description="The campaign id. Get it from get_email_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    /**
    * Your key for this request, at most 64 characters. The same key again returns the first answer and sends nothing; the same key with another body is refused (409).
    */
    // @DataMember
    // @ApiMember(Description="Your key for this request, at most 64 characters. The same key again returns the first answer and sends nothing; the same key with another body is refused (409).", IsRequired=true)
    String idempotencyKey = "";

    /**
    * Optional. Only these notification ids. Default: every failed recipient of the campaign.
    */
    // @DataMember
    // @ApiMember(Description="Optional. Only these notification ids. Default: every failed recipient of the campaign.")
    List<String>? notificationIds;

    /**
    * Optional, default false. Also retry recipients whose failure is Ambiguous (a timeout after the request was sent) — this MAY SEND A DUPLICATE.
    */
    // @DataMember
    // @ApiMember(Description="Optional, default false. Also retry recipients whose failure is Ambiguous (a timeout after the request was sent) — this MAY SEND A DUPLICATE.")
    bool? includeAmbiguous;

    /**
    * Optional. Only these failure classes: Transient, Permanent, Unknown. Default: all three (Ambiguous only through includeAmbiguous).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Only these failure classes: Transient, Permanent, Unknown. Default: all three (Ambiguous only through includeAmbiguous).")
    List<String>? categories;

    RetryFailedEmailNotificationsRequest({this.id="",this.databaseIntegrationId,this.idempotencyKey="",this.notificationIds,this.includeAmbiguous,this.categories});
    RetryFailedEmailNotificationsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        idempotencyKey = json['idempotencyKey'] ?? "";
        notificationIds = JsonConverters.fromJson(json['notificationIds'],'List<String>',context!);
        includeAmbiguous = json['includeAmbiguous'];
        categories = JsonConverters.fromJson(json['categories'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'idempotencyKey': idempotencyKey,
        'notificationIds': JsonConverters.toJson(notificationIds,'List<String>',context!),
        'includeAmbiguous': includeAmbiguous,
        'categories': JsonConverters.toJson(categories,'List<String>',context!)
    });

    createResponse() => RetryFailedEmailNotificationsResponse();
    getResponseTypeName() => "RetryFailedEmailNotificationsResponse";
    getTypeName() => "RetryFailedEmailNotificationsRequest";
    TypeContext? context = _ctx;
}

/**
* Stops a running email campaign
*/
// @Route("/{version}/notifications/email/campaigns/{Id}/stop", "POST")
// @Api(Description="Stops a running email campaign")
// @DataContract
class StopEmailCampaignRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The campaign id to stop.
    */
    // @DataMember
    // @ApiMember(Description="The campaign id to stop.")
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    StopEmailCampaignRequest({this.id="",this.databaseIntegrationId});
    StopEmailCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "StopEmailCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Get email campaign messages
*/
// @Route("/{version}/notifications/emails/campaigns/{campaignId}/messages", "GET")
// @Api(Description="Get email campaign messages")
class GetEmailCampaignMessagesRequest extends CodeMashListPaginationRequestBase implements IReturn<GetEmailCampaignMessagesResponse>, IConvertible, IGet
{
    /**
    * The email campaign id. Get it from get_email_campaigns.
    */
    // @ApiMember(Description="The email campaign id. Get it from get_email_campaigns.", IsRequired=true)
    String campaignId = "";

    /**
    * The campaign batch id to list messages for. Get it from get_email_campaign_batches.
    */
    // @ApiMember(Description="The campaign batch id to list messages for. Get it from get_email_campaign_batches.", IsRequired=true)
    String campaignBatchId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetEmailCampaignMessagesRequest({this.campaignId="",this.campaignBatchId="",this.databaseIntegrationId});
    GetEmailCampaignMessagesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaignId = json['campaignId'] ?? "";
        campaignBatchId = json['campaignBatchId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaignId': campaignId,
        'campaignBatchId': campaignBatchId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetEmailCampaignMessagesResponse();
    getResponseTypeName() => "GetEmailCampaignMessagesResponse";
    getTypeName() => "GetEmailCampaignMessagesRequest";
    TypeContext? context = _ctx;
}

/**
* Create SMS campaign
*/
// @Route("/{version}/notifications/sms/campaigns", "POST")
// @Api(Description="Create SMS campaign")
// @DataContract
class CreateSmsCampaignRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    /**
    * SMS template id to send — pick one with get_sms_templates. Never invent it.
    */
    // @DataMember
    // @ApiMember(Description="SMS template id to send — pick one with get_sms_templates. Never invent it.")
    String templateId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    /**
    * SMS provider integration id the campaign sends through — pick one with get_sms_integrations (the project default unless the user named another). Required; never invent it.
    */
    // @DataMember
    // @ApiMember(Description="SMS provider integration id the campaign sends through — pick one with get_sms_integrations (the project default unless the user named another). Required; never invent it.", IsRequired=true)
    String integrationId = "";

    /**
    * Optional language code forcing one template translation for every recipient.
    */
    // @DataMember
    // @ApiMember(Description="Optional language code forcing one template translation for every recipient.")
    String? language;

    // @DataMember
    String? initiatorId;

    /**
    * Audience type: 'AllUsers' (every project member subscribed to the SMS channel — role-based delivery can address MILLIONS of contacts), 'SpecifiedUsers' (exact member ids), or 'PhoneNumbers' (raw phone numbers). Fill EXACTLY the settings object matching this value. 'Collection' delivery is not available from chat.
    */
    // @DataMember
    // @ApiMember(Description="Audience type: 'AllUsers' (every project member subscribed to the SMS channel — role-based delivery can address MILLIONS of contacts), 'SpecifiedUsers' (exact member ids), or 'PhoneNumbers' (raw phone numbers). Fill EXACTLY the settings object matching this value. 'Collection' delivery is not available from chat.")
    SmsCampaignRecipientsSourceTypes? deliveryType;

    /**
    * For deliveryType 'AllUsers'. JSON object: {"recipientsSourceType":"AllUsers","rolesNames":["authenticated"],"userTags":[],"campaignTime":<unix seconds UTC>}. rolesNames/userTags are optional narrowing filters — verify exact role names with get_roles.
    */
    // @DataMember
    // @ApiMember(Description="For deliveryType 'AllUsers'. JSON object: {\"recipientsSourceType\":\"AllUsers\",\"rolesNames\":[\"authenticated\"],\"userTags\":[],\"campaignTime\":<unix seconds UTC>}. rolesNames/userTags are optional narrowing filters — verify exact role names with get_roles.")
    SmsToAllUsersDeliverySettingsDto? allUsers;

    /**
    * For deliveryType 'SpecifiedUsers'. JSON object: {"recipientsSourceType":"SpecifiedUsers","recipients":[<member ids>],"campaignTime":<unix seconds UTC>}.
    */
    // @DataMember
    // @ApiMember(Description="For deliveryType 'SpecifiedUsers'. JSON object: {\"recipientsSourceType\":\"SpecifiedUsers\",\"recipients\":[<member ids>],\"campaignTime\":<unix seconds UTC>}.")
    SmsToUsersDeliverySettingsDto? specifiedUsers;

    /**
    * For deliveryType 'AccountUsers'. JSON object: {"recipientsSourceType":"AccountUsers","recipients":[<account owner / team member ids>],"campaignTime":<unix seconds UTC>}. Members without a phone number are skipped.
    */
    // @DataMember
    // @ApiMember(Description="For deliveryType 'AccountUsers'. JSON object: {\"recipientsSourceType\":\"AccountUsers\",\"recipients\":[<account owner / team member ids>],\"campaignTime\":<unix seconds UTC>}. Members without a phone number are skipped.")
    SmsToAccountUsersDeliverySettingsDto? accountUsers;

    // @DataMember
    SmsToCollectionRecordsDeliverySettingsDto? collection;

    /**
    * For deliveryType 'PhoneNumbers'. JSON object: {"recipientsSourceType":"PhoneNumbers","phoneNumbers":["+37060000000"],"campaignTime":<unix seconds UTC>}. Numbers in international format.
    */
    // @DataMember
    // @ApiMember(Description="For deliveryType 'PhoneNumbers'. JSON object: {\"recipientsSourceType\":\"PhoneNumbers\",\"phoneNumbers\":[\"+37060000000\"],\"campaignTime\":<unix seconds UTC>}. Numbers in international format.")
    SmsToPhoneNumbersDeliverySettingsDto? phoneNumbers;

    /**
    * Optional. true sends the campaign now (or at a campaignTime sooner than the review window). Without it, a campaign created by an AI tool must be scheduled at least 24 hours ahead for role-based / all-users / collection audiences and at least 1 hour ahead for direct recipient lists, or it is rejected with CM-ERRORS-CAMPAIGNS-017. Set it only when the user explicitly asked to send now.
    */
    // @DataMember
    // @ApiMember(Description="Optional. true sends the campaign now (or at a campaignTime sooner than the review window). Without it, a campaign created by an AI tool must be scheduled at least 24 hours ahead for role-based / all-users / collection audiences and at least 1 hour ahead for direct recipient lists, or it is rejected with CM-ERRORS-CAMPAIGNS-017. Set it only when the user explicitly asked to send now.")
    bool? sendNow;

    CreateSmsCampaignRequest({this.templateId="",this.databaseIntegrationId,this.integrationId="",this.language,this.initiatorId,this.deliveryType,this.allUsers,this.specifiedUsers,this.accountUsers,this.collection,this.phoneNumbers,this.sendNow});
    CreateSmsCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        templateId = json['templateId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        integrationId = json['integrationId'] ?? "";
        language = json['language'];
        initiatorId = json['initiatorId'];
        deliveryType = JsonConverters.fromJson(json['deliveryType'],'SmsCampaignRecipientsSourceTypes',context!);
        allUsers = JsonConverters.fromJson(json['allUsers'],'SmsToAllUsersDeliverySettingsDto',context!);
        specifiedUsers = JsonConverters.fromJson(json['specifiedUsers'],'SmsToUsersDeliverySettingsDto',context!);
        accountUsers = JsonConverters.fromJson(json['accountUsers'],'SmsToAccountUsersDeliverySettingsDto',context!);
        collection = JsonConverters.fromJson(json['collection'],'SmsToCollectionRecordsDeliverySettingsDto',context!);
        phoneNumbers = JsonConverters.fromJson(json['phoneNumbers'],'SmsToPhoneNumbersDeliverySettingsDto',context!);
        sendNow = json['sendNow'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'templateId': templateId,
        'databaseIntegrationId': databaseIntegrationId,
        'integrationId': integrationId,
        'language': language,
        'initiatorId': initiatorId,
        'deliveryType': JsonConverters.toJson(deliveryType,'SmsCampaignRecipientsSourceTypes',context!),
        'allUsers': JsonConverters.toJson(allUsers,'SmsToAllUsersDeliverySettingsDto',context!),
        'specifiedUsers': JsonConverters.toJson(specifiedUsers,'SmsToUsersDeliverySettingsDto',context!),
        'accountUsers': JsonConverters.toJson(accountUsers,'SmsToAccountUsersDeliverySettingsDto',context!),
        'collection': JsonConverters.toJson(collection,'SmsToCollectionRecordsDeliverySettingsDto',context!),
        'phoneNumbers': JsonConverters.toJson(phoneNumbers,'SmsToPhoneNumbersDeliverySettingsDto',context!),
        'sendNow': sendNow
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "CreateSmsCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Deletes sms campaign from queue
*/
// @Route("/{version}/notifications/sms/campaigns/{id}", "DELETE")
// @Api(Description="Deletes sms campaign from queue")
class DeleteSmsCampaign extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The campaign id to delete. Get it from get_sms_campaigns.
    */
    // @ApiMember(Description="The campaign id to delete. Get it from get_sms_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    DeleteSmsCampaign({this.id="",this.databaseIntegrationId});
    DeleteSmsCampaign.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeleteSmsCampaign";
    TypeContext? context = _ctx;
}

/**
* Get sms campaign by id
*/
// @Route("/{version}/notifications/sms/campaigns/{id}", "GET")
// @Api(Description="Get sms campaign by id")
class GetSmsCampaign extends CodeMashRequestBase implements IReturn<GetSmsCampaignResponse>, IConvertible, IGet
{
    /**
    * The campaign id.
    */
    // @ApiMember(Description="The campaign id.")
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetSmsCampaign({this.id="",this.databaseIntegrationId});
    GetSmsCampaign.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetSmsCampaignResponse();
    getResponseTypeName() => "GetSmsCampaignResponse";
    getTypeName() => "GetSmsCampaign";
    TypeContext? context = _ctx;
}

/**
* Gets sms campaigns
*/
// @Route("/{version}/notifications/sms/campaigns", "GET")
// @Api(Description="Gets sms campaigns")
class GetSmsCampaigns extends CodeMashListPaginationRequestBase implements IReturn<GetSmsCampaignsResponse>, IConvertible, IGet
{
    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    /**
    * Optional: return only the campaign with this id.
    */
    // @ApiMember(Description="Optional: return only the campaign with this id.")
    String? campaignId;

    /**
    * Optional: only campaigns built on this SMS template id.
    */
    // @ApiMember(Description="Optional: only campaigns built on this SMS template id.")
    String? templateId;

    /**
    * Optional lower bound for the campaign time, unix timestamp in seconds (UTC).
    */
    // @ApiMember(Description="Optional lower bound for the campaign time, unix timestamp in seconds (UTC).")
    int? from;

    /**
    * Optional upper bound for the campaign time, unix timestamp in seconds (UTC).
    */
    // @ApiMember(Description="Optional upper bound for the campaign time, unix timestamp in seconds (UTC).")
    int? to;

    GetSmsCampaigns({this.databaseIntegrationId,this.campaignId,this.templateId,this.from,this.to});
    GetSmsCampaigns.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        databaseIntegrationId = json['databaseIntegrationId'];
        campaignId = json['campaignId'];
        templateId = json['templateId'];
        from = json['from'];
        to = json['to'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId,
        'campaignId': campaignId,
        'templateId': templateId,
        'from': from,
        'to': to
    });

    createResponse() => GetSmsCampaignsResponse();
    getResponseTypeName() => "GetSmsCampaignsResponse";
    getTypeName() => "GetSmsCampaigns";
    TypeContext? context = _ctx;
}

/**
* Gets sms campaign batches
*/
// @Route("/{version}/notifications/sms/campaigns/{id}/batches", "GET")
// @Api(Description="Gets sms campaign batches")
class GetSmsCampaignBatches extends CodeMashListPaginationRequestBase implements IReturn<GetSmsCampaignBatchesResponse>, IConvertible, IGet
{
    /**
    * The campaign id. Get it from get_sms_campaigns.
    */
    // @ApiMember(Description="The campaign id. Get it from get_sms_campaigns.")
    String? id;

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetSmsCampaignBatches({this.id,this.databaseIntegrationId});
    GetSmsCampaignBatches.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetSmsCampaignBatchesResponse();
    getResponseTypeName() => "GetSmsCampaignBatchesResponse";
    getTypeName() => "GetSmsCampaignBatches";
    TypeContext? context = _ctx;
}

/**
* Gets sms campaign batch notification
*/
// @Route("/{version}/notifications/sms/campaigns/{id}/batches/{batchId}/{notificationId}", "GET")
// @Api(Description="Gets sms campaign batch notification")
class GetSmsCampaignBatchNotification extends CodeMashListPaginationRequestBase implements IReturn<GetSmsCampaignBatchNotificationResponse>, IConvertible, IGet
{
    /**
    * The campaign id. Get it from get_sms_campaigns.
    */
    // @ApiMember(Description="The campaign id. Get it from get_sms_campaigns.", IsRequired=true)
    String id = "";

    /**
    * The campaign batch id. Get it from get_sms_campaign_batches.
    */
    // @ApiMember(Description="The campaign batch id. Get it from get_sms_campaign_batches.", IsRequired=true)
    String batchId = "";

    /**
    * The notification id. Get it from get_sms_campaign_batch_notifications.
    */
    // @ApiMember(Description="The notification id. Get it from get_sms_campaign_batch_notifications.", IsRequired=true)
    String notificationId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetSmsCampaignBatchNotification({this.id="",this.batchId="",this.notificationId="",this.databaseIntegrationId});
    GetSmsCampaignBatchNotification.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        batchId = json['batchId'] ?? "";
        notificationId = json['notificationId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'batchId': batchId,
        'notificationId': notificationId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetSmsCampaignBatchNotificationResponse();
    getResponseTypeName() => "GetSmsCampaignBatchNotificationResponse";
    getTypeName() => "GetSmsCampaignBatchNotification";
    TypeContext? context = _ctx;
}

/**
* Gets sms campaign batch notifications
*/
// @Route("/{version}/notifications/sms/campaigns/{id}/batches/{batchId}", "GET")
// @Api(Description="Gets sms campaign batch notifications")
class GetSmsCampaignBatchNotifications extends CodeMashListPaginationRequestBase implements IReturn<GetSmsCampaignBatchNotificationsResponse>, IConvertible, IGet
{
    /**
    * The campaign id. Get it from get_sms_campaigns.
    */
    // @ApiMember(Description="The campaign id. Get it from get_sms_campaigns.", IsRequired=true)
    String id = "";

    /**
    * The campaign batch id. Get it from get_sms_campaign_batches.
    */
    // @ApiMember(Description="The campaign batch id. Get it from get_sms_campaign_batches.", IsRequired=true)
    String batchId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetSmsCampaignBatchNotifications({this.id="",this.batchId="",this.databaseIntegrationId});
    GetSmsCampaignBatchNotifications.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        batchId = json['batchId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'batchId': batchId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetSmsCampaignBatchNotificationsResponse();
    getResponseTypeName() => "GetSmsCampaignBatchNotificationsResponse";
    getTypeName() => "GetSmsCampaignBatchNotifications";
    TypeContext? context = _ctx;
}

/**
* Get sms campaign statistics
*/
// @Route("/{version}/notifications/sms/campaigns/{id}/stats", "GET")
// @Api(Description="Get sms campaign statistics")
class GetSmsCampaignStatistics extends CodeMashRequestBase implements IReturn<GetSmsCampaignStatisticsResponse>, IConvertible, IGet
{
    /**
    * The campaign id. Get it from get_sms_campaigns.
    */
    // @ApiMember(Description="The campaign id. Get it from get_sms_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetSmsCampaignStatistics({this.id="",this.databaseIntegrationId});
    GetSmsCampaignStatistics.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetSmsCampaignStatisticsResponse();
    getResponseTypeName() => "GetSmsCampaignStatisticsResponse";
    getTypeName() => "GetSmsCampaignStatistics";
    TypeContext? context = _ctx;
}

/**
* Returns SMS preview notification body
*/
// @Route("/{version}/notifications/sms/preview", "GET")
// @Api(Description="Returns SMS preview notification body")
class PreviewSmsNotification extends RequestBase implements IReturn<PreviewSmsNotificationResponse>, IConvertible, IGet
{
    /**
    * The signed preview link hash. With it the preview opens without sign-in: exactly one notification, until the link expires (30 days after sending).
    */
    // @ApiMember(Description="The signed preview link hash. With it the preview opens without sign-in: exactly one notification, until the link expires (30 days after sending).")
    String hash = "";

    /**
    * Signed-in preview by id: the project id. With a hash it must match the hash.
    */
    // @ApiMember(Description="Signed-in preview by id: the project id. With a hash it must match the hash.")
    String? projectId;

    /**
    * Signed-in preview by id: the notification id (needs sms:read). With a hash it must match the hash.
    */
    // @ApiMember(Description="Signed-in preview by id: the notification id (needs sms:read). With a hash it must match the hash.")
    String? notificationId;

    PreviewSmsNotification({this.hash="",this.projectId,this.notificationId});
    PreviewSmsNotification.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        hash = json['hash'] ?? "";
        projectId = json['projectId'];
        notificationId = json['notificationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'hash': hash,
        'projectId': projectId,
        'notificationId': notificationId
    });

    createResponse() => PreviewSmsNotificationResponse();
    getResponseTypeName() => "PreviewSmsNotificationResponse";
    getTypeName() => "PreviewSmsNotification";
    TypeContext? context = _ctx;
}

/**
* Retries the failed recipients of an SMS campaign
*/
// @Route("/{version}/notifications/sms/campaigns/{Id}/retry-failed", "POST")
// @Api(Description="Retries the failed recipients of an SMS campaign")
// @DataContract
class RetryFailedSmsNotificationsRequest extends CodeMashRequestBase implements IReturn<RetryFailedSmsNotificationsResponse>, IConvertible, IPost
{
    /**
    * The campaign id. Get it from get_sms_campaigns.
    */
    // @DataMember
    // @ApiMember(Description="The campaign id. Get it from get_sms_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    /**
    * Your key for this request, at most 64 characters. The same key again returns the first answer and sends nothing; the same key with another body is refused (409).
    */
    // @DataMember
    // @ApiMember(Description="Your key for this request, at most 64 characters. The same key again returns the first answer and sends nothing; the same key with another body is refused (409).", IsRequired=true)
    String idempotencyKey = "";

    /**
    * Optional. Only these notification ids. Default: every failed recipient of the campaign.
    */
    // @DataMember
    // @ApiMember(Description="Optional. Only these notification ids. Default: every failed recipient of the campaign.")
    List<String>? notificationIds;

    /**
    * Optional, default false. Also retry recipients whose failure is Ambiguous (a timeout after the request was sent) — this MAY SEND A DUPLICATE.
    */
    // @DataMember
    // @ApiMember(Description="Optional, default false. Also retry recipients whose failure is Ambiguous (a timeout after the request was sent) — this MAY SEND A DUPLICATE.")
    bool? includeAmbiguous;

    /**
    * Optional. Only these failure classes: Transient, Permanent, Unknown. Default: all three (Ambiguous only through includeAmbiguous).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Only these failure classes: Transient, Permanent, Unknown. Default: all three (Ambiguous only through includeAmbiguous).")
    List<String>? categories;

    RetryFailedSmsNotificationsRequest({this.id="",this.databaseIntegrationId,this.idempotencyKey="",this.notificationIds,this.includeAmbiguous,this.categories});
    RetryFailedSmsNotificationsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        idempotencyKey = json['idempotencyKey'] ?? "";
        notificationIds = JsonConverters.fromJson(json['notificationIds'],'List<String>',context!);
        includeAmbiguous = json['includeAmbiguous'];
        categories = JsonConverters.fromJson(json['categories'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'idempotencyKey': idempotencyKey,
        'notificationIds': JsonConverters.toJson(notificationIds,'List<String>',context!),
        'includeAmbiguous': includeAmbiguous,
        'categories': JsonConverters.toJson(categories,'List<String>',context!)
    });

    createResponse() => RetryFailedSmsNotificationsResponse();
    getResponseTypeName() => "RetryFailedSmsNotificationsResponse";
    getTypeName() => "RetryFailedSmsNotificationsRequest";
    TypeContext? context = _ctx;
}

/**
* Stops a running SMS campaign
*/
// @Route("/{version}/notifications/sms/campaigns/{Id}/stop", "POST")
// @Api(Description="Stops a running SMS campaign")
class StopSmsCampaignRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The campaign id to stop.
    */
    // @ApiMember(Description="The campaign id to stop.")
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    StopSmsCampaignRequest({this.id="",this.databaseIntegrationId});
    StopSmsCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "StopSmsCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Gets the sms notifications
*/
// @Route("/{version}/notifications/sms/campaigns/{campaignId}/messages", "GET")
// @Api(Description="Gets the sms notifications")
class GetSmsCampaignMessagesRequest extends CodeMashListPaginationRequestBase implements IReturn<GetSmsCampaignMessagesResponse>, IConvertible, IGet
{
    /**
    * The campaign id. Get it from get_sms_campaigns.
    */
    // @ApiMember(Description="The campaign id. Get it from get_sms_campaigns.", IsRequired=true)
    String campaignId = "";

    /**
    * The campaign batch id. Get it from get_sms_campaign_batches.
    */
    // @ApiMember(Description="The campaign batch id. Get it from get_sms_campaign_batches.", IsRequired=true)
    String campaignBatchId = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    GetSmsCampaignMessagesRequest({this.campaignId="",this.campaignBatchId="",this.databaseIntegrationId});
    GetSmsCampaignMessagesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaignId = json['campaignId'] ?? "";
        campaignBatchId = json['campaignBatchId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaignId': campaignId,
        'campaignBatchId': campaignBatchId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetSmsCampaignMessagesResponse();
    getResponseTypeName() => "GetSmsCampaignMessagesResponse";
    getTypeName() => "GetSmsCampaignMessagesRequest";
    TypeContext? context = _ctx;
}

/**
* Count the devices a push campaign audience would reach
*/
// @Route("/{version}/notifications/push/campaigns/audience-count", "POST")
// @Api(Description="Count the devices a push campaign audience would reach")
// @DataContract
class GetPushCampaignAudienceCountRequest extends CodeMashRequestBase implements IReturn<GetPushCampaignAudienceCountResponse>, IConvertible, IPost
{
    /**
    * The audience, in the same shape as CreatePushCampaignRequest.campaign. Template and send options are ignored.
    */
    // @DataMember
    // @ApiMember(Description="The audience, in the same shape as CreatePushCampaignRequest.campaign. Template and send options are ignored.")
    PushCampaignRequest? campaign;

    /**
    * Optional. When omitted, the default database integration for the request's environment is used.
    */
    // @DataMember
    // @ApiMember(Description="Optional. When omitted, the default database integration for the request's environment is used.")
    String? databaseIntegrationId;

    GetPushCampaignAudienceCountRequest({this.campaign,this.databaseIntegrationId});
    GetPushCampaignAudienceCountRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaign = JsonConverters.fromJson(json['campaign'],'PushCampaignRequest',context!);
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaign': JsonConverters.toJson(campaign,'PushCampaignRequest',context!),
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetPushCampaignAudienceCountResponse();
    getResponseTypeName() => "GetPushCampaignAudienceCountResponse";
    getTypeName() => "GetPushCampaignAudienceCountRequest";
    TypeContext? context = _ctx;
}

/**
* Create push campaign
*/
// @Route("/{version}/notifications/push/campaigns", "POST")
// @Api(Description="Create push campaign")
// @DataContract
class CreatePushCampaignRequest extends CodeMashRequestBase implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    PushCampaignRequest? campaign;

    // @DataMember
    String? databaseIntegrationId;

    /**
    * Optional. true sends the campaign now (or at a campaignTime sooner than the review window). Without it, a campaign created by an AI tool must be scheduled at least 24 hours ahead for role-based / all-users / collection audiences and at least 1 hour ahead for direct recipient lists, or it is rejected with CM-ERRORS-CAMPAIGNS-017. Set it only when the user explicitly asked to send now.
    */
    // @DataMember
    // @ApiMember(Description="Optional. true sends the campaign now (or at a campaignTime sooner than the review window). Without it, a campaign created by an AI tool must be scheduled at least 24 hours ahead for role-based / all-users / collection audiences and at least 1 hour ahead for direct recipient lists, or it is rejected with CM-ERRORS-CAMPAIGNS-017. Set it only when the user explicitly asked to send now.")
    bool? sendNow;

    CreatePushCampaignRequest({this.campaign,this.databaseIntegrationId,this.sendNow});
    CreatePushCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaign = JsonConverters.fromJson(json['campaign'],'PushCampaignRequest',context!);
        databaseIntegrationId = json['databaseIntegrationId'];
        sendNow = json['sendNow'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaign': JsonConverters.toJson(campaign,'PushCampaignRequest',context!),
        'databaseIntegrationId': databaseIntegrationId,
        'sendNow': sendNow
    });

    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "CreatePushCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Deletes push campaign from queue
*/
// @Route("/{version}/notifications/push/campaigns/{Id}", "DELETE")
// @Api(Description="Deletes push campaign from queue")
// @DataContract
class DeletePushCampaignRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IDelete
{
    /**
    * The push campaign id to delete. Get it from get_push_campaigns.
    */
    // @DataMember
    // @ApiMember(Description="The push campaign id to delete. Get it from get_push_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @DataMember
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    DeletePushCampaignRequest({this.id="",this.databaseIntegrationId});
    DeletePushCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "DeletePushCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Gets push campaign by id
*/
// @Route("/{version}/notifications/push/campaigns/{id}", "GET")
// @Api(Description="Gets push campaign by id")
class GetPushCampaign extends CodeMashRequestBase implements IReturn<GetPushCampaignResponse>, IConvertible, IGet
{
    /**
    * The campaign id.
    */
    // @ApiMember(Description="The campaign id.")
    String id = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    GetPushCampaign({this.id="",this.databaseIntegrationId});
    GetPushCampaign.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetPushCampaignResponse();
    getResponseTypeName() => "GetPushCampaignResponse";
    getTypeName() => "GetPushCampaign";
    TypeContext? context = _ctx;
}

/**
* Gets push campaigns
*/
// @Route("/{version}/notifications/push/campaigns", "GET")
// @Api(Description="Gets push campaigns")
class GetPushCampaigns extends CodeMashListPaginationRequestBase implements IReturn<GetPushCampaignsResponse>, IConvertible, IGet
{
    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    /**
    * Optional: only campaigns built on this push template id.
    */
    // @ApiMember(Description="Optional: only campaigns built on this push template id.")
    String? templateId;

    /**
    * Optional lower bound for the campaign time, unix timestamp in seconds (UTC).
    */
    // @ApiMember(Description="Optional lower bound for the campaign time, unix timestamp in seconds (UTC).")
    int? from;

    /**
    * Optional upper bound for the campaign time, unix timestamp in seconds (UTC).
    */
    // @ApiMember(Description="Optional upper bound for the campaign time, unix timestamp in seconds (UTC).")
    int? to;

    GetPushCampaigns({this.databaseIntegrationId,this.templateId,this.from,this.to});
    GetPushCampaigns.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        databaseIntegrationId = json['databaseIntegrationId'];
        templateId = json['templateId'];
        from = json['from'];
        to = json['to'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId,
        'templateId': templateId,
        'from': from,
        'to': to
    });

    createResponse() => GetPushCampaignsResponse();
    getResponseTypeName() => "GetPushCampaignsResponse";
    getTypeName() => "GetPushCampaigns";
    TypeContext? context = _ctx;
}

/**
* Gets push campaign batches
*/
// @Route("/{version}/notifications/push/campaigns/{id}/batches", "GET")
// @Api(Description="Gets push campaign batches")
class GetPushCampaignBatches extends CodeMashListPaginationRequestBase implements IReturn<GetPushCampaignBatchesResponse>, IConvertible, IGet
{
    /**
    * The push campaign id to list batches for. Get it from get_push_campaigns.
    */
    // @ApiMember(Description="The push campaign id to list batches for. Get it from get_push_campaigns.")
    String id = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    /**
    * Optional: only return the batch with this id.
    */
    // @ApiMember(Description="Optional: only return the batch with this id.")
    String? batchId;

    GetPushCampaignBatches({this.id="",this.databaseIntegrationId,this.batchId});
    GetPushCampaignBatches.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        batchId = json['batchId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'batchId': batchId
    });

    createResponse() => GetPushCampaignBatchesResponse();
    getResponseTypeName() => "GetPushCampaignBatchesResponse";
    getTypeName() => "GetPushCampaignBatches";
    TypeContext? context = _ctx;
}

/**
* Gets a push campaign batch notification
*/
// @Route("/{version}/notifications/push/campaigns/{id}/batches/{batchId}/{notificationId}", "GET")
// @Api(Description="Gets a push campaign batch notification")
class GetPushCampaignBatchNotification extends CodeMashListPaginationRequestBase implements IReturn<GetPushCampaignBatchNotificationResponse>, IConvertible, IGet
{
    /**
    * The push campaign id. Get it from get_push_campaigns.
    */
    // @ApiMember(Description="The push campaign id. Get it from get_push_campaigns.")
    String id = "";

    /**
    * The batch id. Get it from get_push_campaign_batches.
    */
    // @ApiMember(Description="The batch id. Get it from get_push_campaign_batches.")
    String batchId = "";

    /**
    * The notification id within the batch.
    */
    // @ApiMember(Description="The notification id within the batch.")
    String notificationId = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    GetPushCampaignBatchNotification({this.id="",this.batchId="",this.notificationId="",this.databaseIntegrationId});
    GetPushCampaignBatchNotification.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        batchId = json['batchId'] ?? "";
        notificationId = json['notificationId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'batchId': batchId,
        'notificationId': notificationId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetPushCampaignBatchNotificationResponse();
    getResponseTypeName() => "GetPushCampaignBatchNotificationResponse";
    getTypeName() => "GetPushCampaignBatchNotification";
    TypeContext? context = _ctx;
}

/**
* Gets push campaign batch notifications
*/
// @Route("/{version}/notifications/push/campaigns/{id}/batches/{batchId}", "GET")
// @Api(Description="Gets push campaign batch notifications")
class GetPushCampaignBatchNotifications extends CodeMashListPaginationRequestBase implements IReturn<GetPushCampaignBatchNotificationsResponse>, IConvertible, IGet
{
    /**
    * The push campaign id. Get it from get_push_campaigns.
    */
    // @ApiMember(Description="The push campaign id. Get it from get_push_campaigns.")
    String id = "";

    /**
    * The batch id to list notifications for. Get it from get_push_campaign_batches.
    */
    // @ApiMember(Description="The batch id to list notifications for. Get it from get_push_campaign_batches.")
    String batchId = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    GetPushCampaignBatchNotifications({this.id="",this.batchId="",this.databaseIntegrationId});
    GetPushCampaignBatchNotifications.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        batchId = json['batchId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'batchId': batchId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetPushCampaignBatchNotificationsResponse();
    getResponseTypeName() => "GetPushCampaignBatchNotificationsResponse";
    getTypeName() => "GetPushCampaignBatchNotifications";
    TypeContext? context = _ctx;
}

/**
* Get push campaign statistics
*/
// @Route("/{version}/notifications/push/campaigns/{id}/stats", "GET")
// @Api(Description="Get push campaign statistics")
class GetPushCampaignStatistics extends CodeMashRequestBase implements IReturn<GetPushCampaignStatisticsResponse>, IConvertible, IGet
{
    /**
    * The push campaign id to get statistics for. Get it from get_push_campaigns.
    */
    // @ApiMember(Description="The push campaign id to get statistics for. Get it from get_push_campaigns.")
    String id = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    GetPushCampaignStatistics({this.id="",this.databaseIntegrationId});
    GetPushCampaignStatistics.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetPushCampaignStatisticsResponse();
    getResponseTypeName() => "GetPushCampaignStatisticsResponse";
    getTypeName() => "GetPushCampaignStatistics";
    TypeContext? context = _ctx;
}

/**
* Returns push preview notification
*/
// @Route("/{version}/notifications/push/preview", "GET")
// @Api(Description="Returns push preview notification")
class PreviewPushNotification extends RequestBase implements IReturn<PreviewPushNotificationResponse>, IConvertible, IGet
{
    /**
    * The signed preview link hash. With it the preview opens without sign-in: exactly one notification, until the link expires (30 days after sending).
    */
    // @ApiMember(Description="The signed preview link hash. With it the preview opens without sign-in: exactly one notification, until the link expires (30 days after sending).")
    String hash = "";

    /**
    * Signed-in preview by id: the project id. With a hash it must match the hash.
    */
    // @ApiMember(Description="Signed-in preview by id: the project id. With a hash it must match the hash.")
    String? projectId;

    /**
    * Signed-in preview by id: the notification id (needs push:read). With a hash it must match the hash.
    */
    // @ApiMember(Description="Signed-in preview by id: the notification id (needs push:read). With a hash it must match the hash.")
    String? notificationId;

    PreviewPushNotification({this.hash="",this.projectId,this.notificationId});
    PreviewPushNotification.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        hash = json['hash'] ?? "";
        projectId = json['projectId'];
        notificationId = json['notificationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'hash': hash,
        'projectId': projectId,
        'notificationId': notificationId
    });

    createResponse() => PreviewPushNotificationResponse();
    getResponseTypeName() => "PreviewPushNotificationResponse";
    getTypeName() => "PreviewPushNotification";
    TypeContext? context = _ctx;
}

/**
* Retries the failed recipients of a push campaign
*/
// @Route("/{version}/notifications/push/campaigns/{Id}/retry-failed", "POST")
// @Api(Description="Retries the failed recipients of a push campaign")
// @DataContract
class RetryFailedPushNotificationsRequest extends CodeMashRequestBase implements IReturn<RetryFailedPushNotificationsResponse>, IConvertible, IPost
{
    /**
    * The campaign id. Get it from get_push_campaigns.
    */
    // @DataMember
    // @ApiMember(Description="The campaign id. Get it from get_push_campaigns.", IsRequired=true)
    String id = "";

    /**
    * Optional. Omit to use the project default database integration (resolved per environment).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Omit to use the project default database integration (resolved per environment).")
    String? databaseIntegrationId;

    /**
    * Your key for this request, at most 64 characters. The same key again returns the first answer and sends nothing; the same key with another body is refused (409).
    */
    // @DataMember
    // @ApiMember(Description="Your key for this request, at most 64 characters. The same key again returns the first answer and sends nothing; the same key with another body is refused (409).", IsRequired=true)
    String idempotencyKey = "";

    /**
    * Optional. Only these notification ids. Default: every failed recipient of the campaign.
    */
    // @DataMember
    // @ApiMember(Description="Optional. Only these notification ids. Default: every failed recipient of the campaign.")
    List<String>? notificationIds;

    /**
    * Optional, default false. Also retry recipients whose failure is Ambiguous (a timeout after the request was sent) — this MAY SEND A DUPLICATE.
    */
    // @DataMember
    // @ApiMember(Description="Optional, default false. Also retry recipients whose failure is Ambiguous (a timeout after the request was sent) — this MAY SEND A DUPLICATE.")
    bool? includeAmbiguous;

    /**
    * Optional. Only these failure classes: Transient, Permanent, Unknown. Default: all three (Ambiguous only through includeAmbiguous).
    */
    // @DataMember
    // @ApiMember(Description="Optional. Only these failure classes: Transient, Permanent, Unknown. Default: all three (Ambiguous only through includeAmbiguous).")
    List<String>? categories;

    RetryFailedPushNotificationsRequest({this.id="",this.databaseIntegrationId,this.idempotencyKey="",this.notificationIds,this.includeAmbiguous,this.categories});
    RetryFailedPushNotificationsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        idempotencyKey = json['idempotencyKey'] ?? "";
        notificationIds = JsonConverters.fromJson(json['notificationIds'],'List<String>',context!);
        includeAmbiguous = json['includeAmbiguous'];
        categories = JsonConverters.fromJson(json['categories'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'idempotencyKey': idempotencyKey,
        'notificationIds': JsonConverters.toJson(notificationIds,'List<String>',context!),
        'includeAmbiguous': includeAmbiguous,
        'categories': JsonConverters.toJson(categories,'List<String>',context!)
    });

    createResponse() => RetryFailedPushNotificationsResponse();
    getResponseTypeName() => "RetryFailedPushNotificationsResponse";
    getTypeName() => "RetryFailedPushNotificationsRequest";
    TypeContext? context = _ctx;
}

/**
* Stops a running push campaign
*/
// @Route("/{version}/notifications/push/campaigns/{Id}/stop", "POST")
// @Api(Description="Stops a running push campaign")
// @DataContract
class StopPushCampaignRequest extends CodeMashRequestBase implements IReturn<EmptyResponse>, IConvertible, IPost
{
    /**
    * The campaign id to stop.
    */
    // @DataMember
    // @ApiMember(Description="The campaign id to stop.")
    String id = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @DataMember
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    StopPushCampaignRequest({this.id="",this.databaseIntegrationId});
    StopPushCampaignRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'id': id,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => EmptyResponse();
    getResponseTypeName() => "EmptyResponse";
    getTypeName() => "StopPushCampaignRequest";
    TypeContext? context = _ctx;
}

/**
* Gets push campaign messages
*/
// @Route("/{version}/notifications/push/campaigns/{campaignId}/messages", "GET")
// @Api(Description="Gets push campaign messages")
class GetPushCampaignMessagesRequest extends CodeMashListPaginationRequestBase implements IReturn<GetPushCampaignMessagesResponse>, IConvertible, IGet
{
    /**
    * The push campaign id. Get it from get_push_campaigns.
    */
    // @ApiMember(Description="The push campaign id. Get it from get_push_campaigns.")
    String campaignId = "";

    /**
    * Optional: restrict results to this batch id. Get it from get_push_campaign_batches.
    */
    // @ApiMember(Description="Optional: restrict results to this batch id. Get it from get_push_campaign_batches.")
    String campaignBatchId = "";

    /**
    * Optional database integration id; omit to use the project's default.
    */
    // @ApiMember(Description="Optional database integration id; omit to use the project's default.")
    String? databaseIntegrationId;

    GetPushCampaignMessagesRequest({this.campaignId="",this.campaignBatchId="",this.databaseIntegrationId});
    GetPushCampaignMessagesRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        campaignId = json['campaignId'] ?? "";
        campaignBatchId = json['campaignBatchId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'campaignId': campaignId,
        'campaignBatchId': campaignBatchId,
        'databaseIntegrationId': databaseIntegrationId
    });

    createResponse() => GetPushCampaignMessagesResponse();
    getResponseTypeName() => "GetPushCampaignMessagesResponse";
    getTypeName() => "GetPushCampaignMessagesRequest";
    TypeContext? context = _ctx;
}

TypeContext _ctx = TypeContext(library: 'localhost', types: <String, TypeInfo> {
    'JsonSchemaFieldDto': TypeInfo(TypeOf.AbstractClass),
    'StringFieldDto': TypeInfo(TypeOf.Class, create:() => StringFieldDto()),
    'IReadOnlyDictionary<String,String>': TypeInfo(TypeOf.Class, create:() => IReadOnlyDictionary<String,String>()),
    'DecimalFieldDto': TypeInfo(TypeOf.Class, create:() => DecimalFieldDto()),
    'CurrencyDefaultDto': TypeInfo(TypeOf.Class, create:() => CurrencyDefaultDto()),
    'CurrencyFieldDto': TypeInfo(TypeOf.Class, create:() => CurrencyFieldDto()),
    'IReadOnlyList<String>': TypeInfo(TypeOf.Class, create:() => IReadOnlyList<String>()),
    'BooleanFieldDto': TypeInfo(TypeOf.Class, create:() => BooleanFieldDto()),
    'DateFieldDto': TypeInfo(TypeOf.Class, create:() => DateFieldDto()),
    'IntegerFieldDto': TypeInfo(TypeOf.Class, create:() => IntegerFieldDto()),
    'GeolocationFieldDto': TypeInfo(TypeOf.Class, create:() => GeolocationFieldDto()),
    'TagsFieldDto': TypeInfo(TypeOf.Class, create:() => TagsFieldDto()),
    'FileFieldDto': TypeInfo(TypeOf.Class, create:() => FileFieldDto()),
    'TaxonomySelectionFieldDto': TypeInfo(TypeOf.Class, create:() => TaxonomySelectionFieldDto()),
    'CollectionSelectionFieldDto': TypeInfo(TypeOf.Class, create:() => CollectionSelectionFieldDto()),
    'UserSelectionFieldDto': TypeInfo(TypeOf.Class, create:() => UserSelectionFieldDto()),
    'RoleSelectionFieldDto': TypeInfo(TypeOf.Class, create:() => RoleSelectionFieldDto()),
    'EnumSelectionFieldDto': TypeInfo(TypeOf.Class, create:() => EnumSelectionFieldDto()),
    'ObjectFieldDto': TypeInfo(TypeOf.Class, create:() => ObjectFieldDto()),
    'IReadOnlyList<JsonSchemaFieldDto>': TypeInfo(TypeOf.Class, create:() => IReadOnlyList<JsonSchemaFieldDto>()),
    'ArrayFieldDto': TypeInfo(TypeOf.Class, create:() => ArrayFieldDto()),
    'JsonFieldDto': TypeInfo(TypeOf.Class, create:() => JsonFieldDto()),
    'RequestBase': TypeInfo(TypeOf.Class, create:() => RequestBase()),
    'IVersionBasedRequest': TypeInfo(TypeOf.Interface),
    'IHasCorrelationIdRequest': TypeInfo(TypeOf.Interface),
    'CodeMashRequestBase': TypeInfo(TypeOf.Class, create:() => CodeMashRequestBase()),
    'IHasProjectId': TypeInfo(TypeOf.Interface),
    'IHasEnv': TypeInfo(TypeOf.Interface),
    'Gender': TypeInfo(TypeOf.Enum, enumValues:Gender.values),
    'MarketingBlockReason': TypeInfo(TypeOf.Enum, enumValues:MarketingBlockReason.values),
    'UserGeneralInfoDto': TypeInfo(TypeOf.Class, create:() => UserGeneralInfoDto()),
    'Map<String,Set<String>?>': TypeInfo(TypeOf.Class, create:() => Map<String,Set<String>?>()),
    'Set<String>': TypeInfo(TypeOf.Class, create:() => Set<String>()),
    'List<MarketingBlockReason>': TypeInfo(TypeOf.Class, create:() => <MarketingBlockReason>[]),
    'SaveUser': TypeInfo(TypeOf.AbstractClass),
    'SaveUserWithRolesBase': TypeInfo(TypeOf.AbstractClass),
    'IPublicRegistrationRequest': TypeInfo(TypeOf.Interface),
    'CodeMashListPaginationRequestBase': TypeInfo(TypeOf.Class, create:() => CodeMashListPaginationRequestBase()),
    'IPasskeyCeremonyRequest': TypeInfo(TypeOf.Interface),
    'CursorArgs': TypeInfo(TypeOf.Class, create:() => CursorArgs()),
    'PagingArgs': TypeInfo(TypeOf.Class, create:() => PagingArgs()),
    'RegisterFileItem': TypeInfo(TypeOf.Class, create:() => RegisterFileItem()),
    'WriteLogEntry': TypeInfo(TypeOf.Class, create:() => WriteLogEntry()),
    'PaymentOrderLineInput': TypeInfo(TypeOf.Class, create:() => PaymentOrderLineInput()),
    'FileChecksumDto': TypeInfo(TypeOf.Class, create:() => FileChecksumDto()),
    'FileResourceDto': TypeInfo(TypeOf.Class, create:() => FileResourceDto()),
    'FileProvider': TypeInfo(TypeOf.Enum, enumValues:FileProvider.values),
    'FileResourceRefDto': TypeInfo(TypeOf.Class, create:() => FileResourceRefDto()),
    'ImportColumnMappingDto': TypeInfo(TypeOf.Class, create:() => ImportColumnMappingDto()),
    'EmailCampaignRecipientsSourceTypes': TypeInfo(TypeOf.Enum, enumValues:EmailCampaignRecipientsSourceTypes.values),
    'TokenMappingResolverType': TypeInfo(TypeOf.Enum, enumValues:TokenMappingResolverType.values),
    'SecretValueFormat': TypeInfo(TypeOf.Enum, enumValues:SecretValueFormat.values),
    'TokenMappingDto': TypeInfo(TypeOf.Class, create:() => TokenMappingDto()),
    'EmailCampaignRequest': TypeInfo(TypeOf.AbstractClass),
    'List<TokenMappingDto>': TypeInfo(TypeOf.Class, create:() => <TokenMappingDto>[]),
    'SmsCampaignRecipientsSourceTypes': TypeInfo(TypeOf.Enum, enumValues:SmsCampaignRecipientsSourceTypes.values),
    'RespectTimeZoneSettings': TypeInfo(TypeOf.Enum, enumValues:RespectTimeZoneSettings.values),
    'SmsCampaignDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => SmsCampaignDeliverySettingsDto()),
    'SmsToAllUsersDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => SmsToAllUsersDeliverySettingsDto()),
    'SmsToUsersDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => SmsToUsersDeliverySettingsDto()),
    'SmsToAccountUsersDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => SmsToAccountUsersDeliverySettingsDto()),
    'CollectionEmailCampaignRecipientField': TypeInfo(TypeOf.Enum, enumValues:CollectionEmailCampaignRecipientField.values),
    'SmsToCollectionRecordsDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => SmsToCollectionRecordsDeliverySettingsDto()),
    'SmsToPhoneNumbersDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => SmsToPhoneNumbersDeliverySettingsDto()),
    'PushCampaignRecipientsSourceTypes': TypeInfo(TypeOf.Enum, enumValues:PushCampaignRecipientsSourceTypes.values),
    'PushCampaignRequest': TypeInfo(TypeOf.AbstractClass),
    'CodeMashRelease': TypeInfo(TypeOf.Enum, enumValues:CodeMashRelease.values),
    'CodeMashRuntime': TypeInfo(TypeOf.Enum, enumValues:CodeMashRuntime.values),
    'EchoRegionDto': TypeInfo(TypeOf.Class, create:() => EchoRegionDto()),
    'EchoAgentSnippetDto': TypeInfo(TypeOf.Class, create:() => EchoAgentSnippetDto()),
    'EchoAgentDto': TypeInfo(TypeOf.Class, create:() => EchoAgentDto()),
    'List<EchoAgentSnippetDto>': TypeInfo(TypeOf.Class, create:() => <EchoAgentSnippetDto>[]),
    'EchoHostingPlatformDto': TypeInfo(TypeOf.Class, create:() => EchoHostingPlatformDto()),
    'QuickConnectProviderDto': TypeInfo(TypeOf.Class, create:() => QuickConnectProviderDto()),
    'EchoConnectDto': TypeInfo(TypeOf.Class, create:() => EchoConnectDto()),
    'List<QuickConnectProviderDto>': TypeInfo(TypeOf.Class, create:() => <QuickConnectProviderDto>[]),
    'EchoKeylessDto': TypeInfo(TypeOf.Class, create:() => EchoKeylessDto()),
    'PublicBrandDto': TypeInfo(TypeOf.Class, create:() => PublicBrandDto()),
    'PublicPasswordPolicyDto': TypeInfo(TypeOf.Class, create:() => PublicPasswordPolicyDto()),
    'PublicAuthDto': TypeInfo(TypeOf.Class, create:() => PublicAuthDto()),
    'PublicAiAssistantDto': TypeInfo(TypeOf.Class, create:() => PublicAiAssistantDto()),
    'PublicAiChatDto': TypeInfo(TypeOf.Class, create:() => PublicAiChatDto()),
    'List<PublicAiAssistantDto>': TypeInfo(TypeOf.Class, create:() => <PublicAiAssistantDto>[]),
    'ErrorDto': TypeInfo(TypeOf.Class, create:() => ErrorDto()),
    'List<ErrorDto>': TypeInfo(TypeOf.Class, create:() => <ErrorDto>[]),
    'CodeMashResponseStatus': TypeInfo(TypeOf.Class, create:() => CodeMashResponseStatus()),
    'ResponseBase': TypeInfo(TypeOf.Class, create:() => ResponseBase()),
    'EndUserChatAttachment': TypeInfo(TypeOf.Class, create:() => EndUserChatAttachment()),
    'EndUserChatMemoryNote': TypeInfo(TypeOf.Class, create:() => EndUserChatMemoryNote()),
    'EndUserChatAssistant': TypeInfo(TypeOf.Class, create:() => EndUserChatAssistant()),
    'EndUserChatPlan': TypeInfo(TypeOf.Class, create:() => EndUserChatPlan()),
    'EndUserChatSession': TypeInfo(TypeOf.Class, create:() => EndUserChatSession()),
    'AiChatEntryWireDto': TypeInfo(TypeOf.AbstractClass),
    'EndUserAiToolParameter': TypeInfo(TypeOf.Class, create:() => EndUserAiToolParameter()),
    'EndUserAiTool': TypeInfo(TypeOf.Class, create:() => EndUserAiTool()),
    'List<EndUserAiToolParameter>': TypeInfo(TypeOf.Class, create:() => <EndUserAiToolParameter>[]),
    'AuthType': TypeInfo(TypeOf.Enum, enumValues:AuthType.values),
    'AccessInformationDto': TypeInfo(TypeOf.Class, create:() => AccessInformationDto()),
    'RegistrationDto': TypeInfo(TypeOf.Class, create:() => RegistrationDto()),
    'LoginDto': TypeInfo(TypeOf.Class, create:() => LoginDto()),
    'AuthStatus': TypeInfo(TypeOf.Enum, enumValues:AuthStatus.values),
    'AuthDto': TypeInfo(TypeOf.Class, create:() => AuthDto()),
    'PaginatedResponse<TViewModelProjection>': TypeInfo(TypeOf.GenericDef,create:() => PaginatedResponse()),
    'UserMarketingPreferencesDto': TypeInfo(TypeOf.Class, create:() => UserMarketingPreferencesDto()),
    'PasskeyListItemDto': TypeInfo(TypeOf.Class, create:() => PasskeyListItemDto()),
    'TermMultiParentDto': TypeInfo(TypeOf.Class, create:() => TermMultiParentDto()),
    'TermTreeDto': TypeInfo(TypeOf.Class, create:() => TermTreeDto()),
    'List<TermMultiParentDto>': TypeInfo(TypeOf.Class, create:() => <TermMultiParentDto>[]),
    'List<TermTreeDto>': TypeInfo(TypeOf.Class, create:() => <TermTreeDto>[]),
    'TaxonomyTreeDto': TypeInfo(TypeOf.Class, create:() => TaxonomyTreeDto()),
    'List<TaxonomyTreeDto>': TypeInfo(TypeOf.Class, create:() => <TaxonomyTreeDto>[]),
    'TermDto': TypeInfo(TypeOf.Class, create:() => TermDto()),
    'DataSchemaDto': TypeInfo(TypeOf.Class, create:() => DataSchemaDto()),
    'List<JsonSchemaFieldDto>': TypeInfo(TypeOf.Class, create:() => <JsonSchemaFieldDto>[]),
    'VisualSchemaDto': TypeInfo(TypeOf.Class, create:() => VisualSchemaDto()),
    'SchemaUniqueIndexDto': TypeInfo(TypeOf.Class, create:() => SchemaUniqueIndexDto()),
    'SchemaSettingsDto': TypeInfo(TypeOf.Class, create:() => SchemaSettingsDto()),
    'List<SchemaUniqueIndexDto>': TypeInfo(TypeOf.Class, create:() => <SchemaUniqueIndexDto>[]),
    'SchemaEmbedSettingsDto': TypeInfo(TypeOf.Class, create:() => SchemaEmbedSettingsDto()),
    'TriggerType': TypeInfo(TypeOf.Enum, enumValues:TriggerType.values),
    'TriggerActionType': TypeInfo(TypeOf.Enum, enumValues:TriggerActionType.values),
    'TriggerActionDto': TypeInfo(TypeOf.AbstractClass),
    'ExecutionIdentitySummaryDto': TypeInfo(TypeOf.Class, create:() => ExecutionIdentitySummaryDto()),
    'TriggerDto': TypeInfo(TypeOf.Class, create:() => TriggerDto()),
    'SchemaDto': TypeInfo(TypeOf.Class, create:() => SchemaDto()),
    'List<TriggerDto>': TypeInfo(TypeOf.Class, create:() => <TriggerDto>[]),
    'SchemaListProjection': TypeInfo(TypeOf.Class, create:() => SchemaListProjection()),
    'PublicFolderDto': TypeInfo(TypeOf.Class, create:() => PublicFolderDto()),
    'RegisterFileResult': TypeInfo(TypeOf.Class, create:() => RegisterFileResult()),
    'OwnPushDeviceDto': TypeInfo(TypeOf.Class, create:() => OwnPushDeviceDto()),
    'OwnPushMessageDto': TypeInfo(TypeOf.Class, create:() => OwnPushMessageDto()),
    'PaymentOrderLineDto': TypeInfo(TypeOf.Class, create:() => PaymentOrderLineDto()),
    'PaymentOrderCheckoutDto': TypeInfo(TypeOf.Class, create:() => PaymentOrderCheckoutDto()),
    'PaymentOrderDto': TypeInfo(TypeOf.Class, create:() => PaymentOrderDto()),
    'List<PaymentOrderLineDto>': TypeInfo(TypeOf.Class, create:() => <PaymentOrderLineDto>[]),
    'List<PaymentOrderCheckoutDto>': TypeInfo(TypeOf.Class, create:() => <PaymentOrderCheckoutDto>[]),
    'WorkflowRunActorDto': TypeInfo(TypeOf.Class, create:() => WorkflowRunActorDto()),
    'WorkflowWaitingOnDto': TypeInfo(TypeOf.Class, create:() => WorkflowWaitingOnDto()),
    'WorkflowRunErrorDto': TypeInfo(TypeOf.Class, create:() => WorkflowRunErrorDto()),
    'WorkflowRunListProjection': TypeInfo(TypeOf.Class, create:() => WorkflowRunListProjection()),
    'List<WorkflowWaitingOnDto>': TypeInfo(TypeOf.Class, create:() => <WorkflowWaitingOnDto>[]),
    'WorkflowRunStepDto': TypeInfo(TypeOf.Class, create:() => WorkflowRunStepDto()),
    'WorkflowRunDto': TypeInfo(TypeOf.Class, create:() => WorkflowRunDto()),
    'List<WorkflowRunStepDto>': TypeInfo(TypeOf.Class, create:() => <WorkflowRunStepDto>[]),
    'Map<String,dynamic?>': TypeInfo(TypeOf.Class, create:() => Map<String,dynamic?>()),
    'TenantLogEntryDto': TypeInfo(TypeOf.Class, create:() => TenantLogEntryDto()),
    'InAppNotificationDto': TypeInfo(TypeOf.Class, create:() => InAppNotificationDto()),
    'ChannelSubscriptionStateDto': TypeInfo(TypeOf.Class, create:() => ChannelSubscriptionStateDto()),
    'Map<String,List<String>?>': TypeInfo(TypeOf.Class, create:() => Map<String,List<String>?>()),
    'UserDto': TypeInfo(TypeOf.Class, create:() => UserDto()),
    'List<AuthDto>': TypeInfo(TypeOf.Class, create:() => <AuthDto>[]),
    'Map<String,ChannelSubscriptionStateDto?>': TypeInfo(TypeOf.Class, create:() => Map<String,ChannelSubscriptionStateDto?>()),
    'ContactRolesRepairDto': TypeInfo(TypeOf.Class, create:() => ContactRolesRepairDto()),
    'SchemaRefDto': TypeInfo(TypeOf.Class, create:() => SchemaRefDto()),
    'CollectionImportDto': TypeInfo(TypeOf.Class, create:() => CollectionImportDto()),
    'List<ImportColumnMappingDto>': TypeInfo(TypeOf.Class, create:() => <ImportColumnMappingDto>[]),
    'ImportUploadTargetDto': TypeInfo(TypeOf.Class, create:() => ImportUploadTargetDto()),
    'ImportFileColumnDto': TypeInfo(TypeOf.Class, create:() => ImportFileColumnDto()),
    'ImportFileAnalysisDto': TypeInfo(TypeOf.Class, create:() => ImportFileAnalysisDto()),
    'List<ImportFileColumnDto>': TypeInfo(TypeOf.Class, create:() => <ImportFileColumnDto>[]),
    'CampaignStatus': TypeInfo(TypeOf.Enum, enumValues:CampaignStatus.values),
    'CampaignStatusChangeEntryDto': TypeInfo(TypeOf.Class, create:() => CampaignStatusChangeEntryDto()),
    'CampaignOutcomeDto': TypeInfo(TypeOf.Class, create:() => CampaignOutcomeDto()),
    'CampaignDto': TypeInfo(TypeOf.Class, create:() => CampaignDto()),
    'List<CampaignStatusChangeEntryDto>': TypeInfo(TypeOf.Class, create:() => <CampaignStatusChangeEntryDto>[]),
    'EmailCampaignDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => EmailCampaignDeliverySettingsDto()),
    'CommunicationChannel': TypeInfo(TypeOf.Enum, enumValues:CommunicationChannel.values),
    'NotificationMedium': TypeInfo(TypeOf.Enum, enumValues:NotificationMedium.values),
    'TemplateDto': TypeInfo(TypeOf.Class, create:() => TemplateDto()),
    'EmailTemplateEngine': TypeInfo(TypeOf.Enum, enumValues:EmailTemplateEngine.values),
    'EmailBodyDto': TypeInfo(TypeOf.Class, create:() => EmailBodyDto()),
    'EmailMessageContentDto': TypeInfo(TypeOf.Class, create:() => EmailMessageContentDto()),
    'List<FileResourceRefDto>': TypeInfo(TypeOf.Class, create:() => <FileResourceRefDto>[]),
    'EmailMessageTranslationDto': TypeInfo(TypeOf.Class, create:() => EmailMessageTranslationDto()),
    'EmailTemplateDto': TypeInfo(TypeOf.Class, create:() => EmailTemplateDto()),
    'List<EmailMessageTranslationDto>': TypeInfo(TypeOf.Class, create:() => <EmailMessageTranslationDto>[]),
    'EmailCampaignDto': TypeInfo(TypeOf.Class, create:() => EmailCampaignDto()),
    'EmailCampaignListProjection': TypeInfo(TypeOf.Class, create:() => EmailCampaignListProjection()),
    'CampaignBatchStatus': TypeInfo(TypeOf.Enum, enumValues:CampaignBatchStatus.values),
    'BatchStatusChangeEntryDto': TypeInfo(TypeOf.Class, create:() => BatchStatusChangeEntryDto()),
    'CampaignBatchDto': TypeInfo(TypeOf.Class, create:() => CampaignBatchDto()),
    'List<BatchStatusChangeEntryDto>': TypeInfo(TypeOf.Class, create:() => <BatchStatusChangeEntryDto>[]),
    'EmailRecipientDto': TypeInfo(TypeOf.Class, create:() => EmailRecipientDto()),
    'EmailRecipientsDto': TypeInfo(TypeOf.Class, create:() => EmailRecipientsDto()),
    'List<EmailRecipientDto>': TypeInfo(TypeOf.Class, create:() => <EmailRecipientDto>[]),
    'EmailCampaignBatchDto': TypeInfo(TypeOf.Class, create:() => EmailCampaignBatchDto()),
    'CampaignNotificationStatus': TypeInfo(TypeOf.Enum, enumValues:CampaignNotificationStatus.values),
    'NotificationStatusChangeEntryDto': TypeInfo(TypeOf.Class, create:() => NotificationStatusChangeEntryDto()),
    'NotificationDeliveryState': TypeInfo(TypeOf.Enum, enumValues:NotificationDeliveryState.values),
    'NotificationAttemptOutcome': TypeInfo(TypeOf.Enum, enumValues:NotificationAttemptOutcome.values),
    'SendErrorCategory': TypeInfo(TypeOf.Enum, enumValues:SendErrorCategory.values),
    'NotificationAttemptTrigger': TypeInfo(TypeOf.Enum, enumValues:NotificationAttemptTrigger.values),
    'NotificationAttemptDto': TypeInfo(TypeOf.Class, create:() => NotificationAttemptDto()),
    'DeliveryEventOutcome': TypeInfo(TypeOf.Enum, enumValues:DeliveryEventOutcome.values),
    'NotificationDeliveryEventDto': TypeInfo(TypeOf.Class, create:() => NotificationDeliveryEventDto()),
    'CampaignBatchNotificationDto': TypeInfo(TypeOf.Class, create:() => CampaignBatchNotificationDto()),
    'List<NotificationStatusChangeEntryDto>': TypeInfo(TypeOf.Class, create:() => <NotificationStatusChangeEntryDto>[]),
    'List<NotificationAttemptDto>': TypeInfo(TypeOf.Class, create:() => <NotificationAttemptDto>[]),
    'List<NotificationDeliveryEventDto>': TypeInfo(TypeOf.Class, create:() => <NotificationDeliveryEventDto>[]),
    'EmailRecipientField': TypeInfo(TypeOf.Enum, enumValues:EmailRecipientField.values),
    'RecipientRemovalReason': TypeInfo(TypeOf.Enum, enumValues:RecipientRemovalReason.values),
    'RemovedRecipientDto': TypeInfo(TypeOf.Class, create:() => RemovedRecipientDto()),
    'EmailCampaignBatchNotificationDto': TypeInfo(TypeOf.Class, create:() => EmailCampaignBatchNotificationDto()),
    'List<RemovedRecipientDto>': TypeInfo(TypeOf.Class, create:() => <RemovedRecipientDto>[]),
    'CampaignStatsDto': TypeInfo(TypeOf.Class, create:() => CampaignStatsDto()),
    'SmsMessageContentDto': TypeInfo(TypeOf.Class, create:() => SmsMessageContentDto()),
    'SmsMessageTranslationDto': TypeInfo(TypeOf.Class, create:() => SmsMessageTranslationDto()),
    'SmsTemplateDto': TypeInfo(TypeOf.Class, create:() => SmsTemplateDto()),
    'List<SmsMessageTranslationDto>': TypeInfo(TypeOf.Class, create:() => <SmsMessageTranslationDto>[]),
    'SmsCampaignDto': TypeInfo(TypeOf.Class, create:() => SmsCampaignDto()),
    'SmsRecipientDto': TypeInfo(TypeOf.Class, create:() => SmsRecipientDto()),
    'SmsRecipientsDto': TypeInfo(TypeOf.Class, create:() => SmsRecipientsDto()),
    'List<SmsRecipientDto>': TypeInfo(TypeOf.Class, create:() => <SmsRecipientDto>[]),
    'SmsCampaignBatchDto': TypeInfo(TypeOf.Class, create:() => SmsCampaignBatchDto()),
    'SmsCampaignBatchNotificationDto': TypeInfo(TypeOf.Class, create:() => SmsCampaignBatchNotificationDto()),
    'PushAudienceCountDto': TypeInfo(TypeOf.Class, create:() => PushAudienceCountDto()),
    'PushCampaignDeliverySettingsDto': TypeInfo(TypeOf.Class, create:() => PushCampaignDeliverySettingsDto()),
    'PushMessageContentDto': TypeInfo(TypeOf.Class, create:() => PushMessageContentDto()),
    'PushMessageTranslationDto': TypeInfo(TypeOf.Class, create:() => PushMessageTranslationDto()),
    'PushTemplateDto': TypeInfo(TypeOf.Class, create:() => PushTemplateDto()),
    'List<PushMessageTranslationDto>': TypeInfo(TypeOf.Class, create:() => <PushMessageTranslationDto>[]),
    'PushCampaignDto': TypeInfo(TypeOf.Class, create:() => PushCampaignDto()),
    'PushDeviceDeliveryFamily': TypeInfo(TypeOf.Enum, enumValues:PushDeviceDeliveryFamily.values),
    'PushDeviceDeliveryTokenDto': TypeInfo(TypeOf.Class, create:() => PushDeviceDeliveryTokenDto()),
    'PushRecipientDto': TypeInfo(TypeOf.Class, create:() => PushRecipientDto()),
    'List<PushDeviceDeliveryTokenDto>': TypeInfo(TypeOf.Class, create:() => <PushDeviceDeliveryTokenDto>[]),
    'PushRecipientsDto': TypeInfo(TypeOf.Class, create:() => PushRecipientsDto()),
    'List<PushRecipientDto>': TypeInfo(TypeOf.Class, create:() => <PushRecipientDto>[]),
    'PushCampaignBatchDto': TypeInfo(TypeOf.Class, create:() => PushCampaignBatchDto()),
    'NotificationReadMarkDto': TypeInfo(TypeOf.Class, create:() => NotificationReadMarkDto()),
    'PushCampaignBatchNotificationDto': TypeInfo(TypeOf.Class, create:() => PushCampaignBatchNotificationDto()),
    'List<NotificationReadMarkDto>': TypeInfo(TypeOf.Class, create:() => <NotificationReadMarkDto>[]),
    'IBindableContract': TypeInfo(TypeOf.Interface),
    'IHasViewId': TypeInfo(TypeOf.Interface),
    'IHasResponsibleUserId': TypeInfo(TypeOf.Interface),
    'IHasDatabaseId': TypeInfo(TypeOf.Interface),
    'ICursorArgs': TypeInfo(TypeOf.Interface),
    'IQueuedTrigger': TypeInfo(TypeOf.Interface),
    'IHasRazorTemplateCode': TypeInfo(TypeOf.Interface),
    'EchoResponse': TypeInfo(TypeOf.Class, create:() => EchoResponse()),
    'List<EchoRegionDto>': TypeInfo(TypeOf.Class, create:() => <EchoRegionDto>[]),
    'PublicProjectConfigDto': TypeInfo(TypeOf.Class, create:() => PublicProjectConfigDto()),
    'PublicLegalDocumentDto': TypeInfo(TypeOf.Class, create:() => PublicLegalDocumentDto()),
    'ListEndUserChatAttachmentsResponse': TypeInfo(TypeOf.Class, create:() => ListEndUserChatAttachmentsResponse()),
    'List<EndUserChatAttachment>': TypeInfo(TypeOf.Class, create:() => <EndUserChatAttachment>[]),
    'ListEndUserChatMemoryResponse': TypeInfo(TypeOf.Class, create:() => ListEndUserChatMemoryResponse()),
    'List<EndUserChatMemoryNote>': TypeInfo(TypeOf.Class, create:() => <EndUserChatMemoryNote>[]),
    'GetEndUserChatAvailabilityResponse': TypeInfo(TypeOf.Class, create:() => GetEndUserChatAvailabilityResponse()),
    'List<EndUserChatAssistant>': TypeInfo(TypeOf.Class, create:() => <EndUserChatAssistant>[]),
    'ListEndUserChatSessionsResponse': TypeInfo(TypeOf.Class, create:() => ListEndUserChatSessionsResponse()),
    'List<EndUserChatSession>': TypeInfo(TypeOf.Class, create:() => <EndUserChatSession>[]),
    'GetEndUserChatSessionResponse': TypeInfo(TypeOf.Class, create:() => GetEndUserChatSessionResponse()),
    'GetEndUserChatEntriesResponse': TypeInfo(TypeOf.Class, create:() => GetEndUserChatEntriesResponse()),
    'List<AiChatEntryWireDto>': TypeInfo(TypeOf.Class, create:() => <AiChatEntryWireDto>[]),
    'StartEndUserChatTurnResponse': TypeInfo(TypeOf.Class, create:() => StartEndUserChatTurnResponse()),
    'GetEndUserAiToolsResponse': TypeInfo(TypeOf.Class, create:() => GetEndUserAiToolsResponse()),
    'List<EndUserAiTool>': TypeInfo(TypeOf.Class, create:() => <EndUserAiTool>[]),
    'InvokeEndUserAiToolResponse': TypeInfo(TypeOf.Class, create:() => InvokeEndUserAiToolResponse()),
    'SaveGuestUserResponse': TypeInfo(TypeOf.Class, create:() => SaveGuestUserResponse()),
    'GetUserResponse': TypeInfo(TypeOf.Class, create:() => GetUserResponse()),
    'GetUsersResponse': TypeInfo(TypeOf.Class, create:() => GetUsersResponse()),
    'PaginatedResponse<AuthDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<AuthDto>()),
    'GetUserPreferencesResponse': TypeInfo(TypeOf.Class, create:() => GetUserPreferencesResponse()),
    'CredentialChangedResponse': TypeInfo(TypeOf.Class, create:() => CredentialChangedResponse()),
    'PasskeyOkResponse': TypeInfo(TypeOf.Class, create:() => PasskeyOkResponse()),
    'SendTestPasswordResetResponse': TypeInfo(TypeOf.Class, create:() => SendTestPasswordResetResponse()),
    'PasskeyCeremonyOptionsResponse': TypeInfo(TypeOf.Class, create:() => PasskeyCeremonyOptionsResponse()),
    'PasskeyAuthTokensResponse': TypeInfo(TypeOf.Class, create:() => PasskeyAuthTokensResponse()),
    'PasskeyListResponse': TypeInfo(TypeOf.Class, create:() => PasskeyListResponse()),
    'List<PasskeyListItemDto>': TypeInfo(TypeOf.Class, create:() => <PasskeyListItemDto>[]),
    'PasskeyRecoveryResponse': TypeInfo(TypeOf.Class, create:() => PasskeyRecoveryResponse()),
    'PasskeyVerificationTokenResponse': TypeInfo(TypeOf.Class, create:() => PasskeyVerificationTokenResponse()),
    'FindMergedTermTreeResponse': TypeInfo(TypeOf.Class, create:() => FindMergedTermTreeResponse()),
    'FindTaxonomyTreeResponse': TypeInfo(TypeOf.Class, create:() => FindTaxonomyTreeResponse()),
    'FindTermsResponse': TypeInfo(TypeOf.Class, create:() => FindTermsResponse()),
    'PaginatedResponse<TermDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<TermDto>()),
    'FindTermsChildrenResponse': TypeInfo(TypeOf.Class, create:() => FindTermsChildrenResponse()),
    'FindTermTreeResponse': TypeInfo(TypeOf.Class, create:() => FindTermTreeResponse()),
    'GetDatabaseSchemaResponse': TypeInfo(TypeOf.Class, create:() => GetDatabaseSchemaResponse()),
    'GetDatabaseSchemasResponse': TypeInfo(TypeOf.Class, create:() => GetDatabaseSchemasResponse()),
    'PaginatedResponse<SchemaListProjection>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<SchemaListProjection>()),
    'AggregateResponse': TypeInfo(TypeOf.Class, create:() => AggregateResponse()),
    'List<dynamic>': TypeInfo(TypeOf.Class, create:() => <dynamic>[]),
    'CountResponse': TypeInfo(TypeOf.Class, create:() => CountResponse()),
    'DistinctResponse': TypeInfo(TypeOf.Class, create:() => DistinctResponse()),
    'ExecuteAggregateResponse': TypeInfo(TypeOf.Class, create:() => ExecuteAggregateResponse()),
    'FindResponse': TypeInfo(TypeOf.Class, create:() => FindResponse()),
    'PaginatedResponse<dynamic>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<dynamic>()),
    'FindOneResponse': TypeInfo(TypeOf.Class, create:() => FindOneResponse()),
    'GetFileByIdResponse': TypeInfo(TypeOf.Class, create:() => GetFileByIdResponse()),
    'GetFileInfoResponse': TypeInfo(TypeOf.Class, create:() => GetFileInfoResponse()),
    'GetSignedUrlResponse': TypeInfo(TypeOf.Class, create:() => GetSignedUrlResponse()),
    'ListFilesResponse': TypeInfo(TypeOf.Class, create:() => ListFilesResponse()),
    'PaginatedResponse<FileResourceRefDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<FileResourceRefDto>()),
    'List<PublicFolderDto>': TypeInfo(TypeOf.Class, create:() => <PublicFolderDto>[]),
    'RegisterFilesResponse': TypeInfo(TypeOf.Class, create:() => RegisterFilesResponse()),
    'List<RegisterFileResult>': TypeInfo(TypeOf.Class, create:() => <RegisterFileResult>[]),
    'RequestUploadUrlResponse': TypeInfo(TypeOf.Class, create:() => RequestUploadUrlResponse()),
    'GetOwnPushDevicesResponse': TypeInfo(TypeOf.Class, create:() => GetOwnPushDevicesResponse()),
    'List<OwnPushDeviceDto>': TypeInfo(TypeOf.Class, create:() => <OwnPushDeviceDto>[]),
    'GetOwnPushMessagesResponse': TypeInfo(TypeOf.Class, create:() => GetOwnPushMessagesResponse()),
    'PaginatedResponse<OwnPushMessageDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<OwnPushMessageDto>()),
    'WriteLogsResponse': TypeInfo(TypeOf.Class, create:() => WriteLogsResponse()),
    'GetPaymentOrderResponse': TypeInfo(TypeOf.Class, create:() => GetPaymentOrderResponse()),
    'GetPaymentOrdersResponse': TypeInfo(TypeOf.Class, create:() => GetPaymentOrdersResponse()),
    'PaginatedResponse<PaymentOrderDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<PaymentOrderDto>()),
    'StartPaymentCheckoutResponse': TypeInfo(TypeOf.Class, create:() => StartPaymentCheckoutResponse()),
    'WorkflowRunsResponse': TypeInfo(TypeOf.Class, create:() => WorkflowRunsResponse()),
    'PaginatedResponse<WorkflowRunListProjection>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<WorkflowRunListProjection>()),
    'WorkflowRunResponse': TypeInfo(TypeOf.Class, create:() => WorkflowRunResponse()),
    'CodeWorkflowResumeLinkResponse': TypeInfo(TypeOf.Class, create:() => CodeWorkflowResumeLinkResponse()),
    'WorkflowRunLogsResponse': TypeInfo(TypeOf.Class, create:() => WorkflowRunLogsResponse()),
    'PaginatedResponse<TenantLogEntryDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<TenantLogEntryDto>()),
    'GetNotificationInboxResponse': TypeInfo(TypeOf.Class, create:() => GetNotificationInboxResponse()),
    'PaginatedResponse<InAppNotificationDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<InAppNotificationDto>()),
    'GetUnreadCountResponse': TypeInfo(TypeOf.Class, create:() => GetUnreadCountResponse()),
    'MarkNotificationReadResponse': TypeInfo(TypeOf.Class, create:() => MarkNotificationReadResponse()),
    'MarkAllNotificationsReadResponse': TypeInfo(TypeOf.Class, create:() => MarkAllNotificationsReadResponse()),
    'GetContactResponse': TypeInfo(TypeOf.Class, create:() => GetContactResponse()),
    'GetAllContactsResponse': TypeInfo(TypeOf.Class, create:() => GetAllContactsResponse()),
    'IReadOnlyList<UserDto>': TypeInfo(TypeOf.Class, create:() => IReadOnlyList<UserDto>()),
    'RepairContactRolesResponse': TypeInfo(TypeOf.Class, create:() => RepairContactRolesResponse()),
    'GetFolderFilesResponse': TypeInfo(TypeOf.Class, create:() => GetFolderFilesResponse()),
    'GetCollectionImportResponse': TypeInfo(TypeOf.Class, create:() => GetCollectionImportResponse()),
    'GetCollectionImportsResponse': TypeInfo(TypeOf.Class, create:() => GetCollectionImportsResponse()),
    'PaginatedResponse<CollectionImportDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<CollectionImportDto>()),
    'RequestImportUploadUrlResponse': TypeInfo(TypeOf.Class, create:() => RequestImportUploadUrlResponse()),
    'AnalyzeImportFileResponse': TypeInfo(TypeOf.Class, create:() => AnalyzeImportFileResponse()),
    'GetEmailCampaignResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignResponse()),
    'GetEmailCampaignsResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignsResponse()),
    'PaginatedResponse<EmailCampaignListProjection>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<EmailCampaignListProjection>()),
    'GetEmailCampaignBatchesResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignBatchesResponse()),
    'PaginatedResponse<EmailCampaignBatchDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<EmailCampaignBatchDto>()),
    'GetEmailCampaignBatchNotificationResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignBatchNotificationResponse()),
    'GetEmailCampaignBatchNotificationsResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignBatchNotificationsResponse()),
    'PaginatedResponse<EmailCampaignBatchNotificationDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<EmailCampaignBatchNotificationDto>()),
    'GetEmailCampaignStatisticsResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignStatisticsResponse()),
    'PreviewEmailNotificationResponse': TypeInfo(TypeOf.Class, create:() => PreviewEmailNotificationResponse()),
    'RetryFailedEmailNotificationsResponse': TypeInfo(TypeOf.Class, create:() => RetryFailedEmailNotificationsResponse()),
    'Map<String,int?>': TypeInfo(TypeOf.Class, create:() => Map<String,int?>()),
    'GetEmailCampaignMessagesResponse': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignMessagesResponse()),
    'GetSmsCampaignResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignResponse()),
    'GetSmsCampaignsResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignsResponse()),
    'PaginatedResponse<SmsCampaignDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<SmsCampaignDto>()),
    'GetSmsCampaignBatchesResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignBatchesResponse()),
    'PaginatedResponse<SmsCampaignBatchDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<SmsCampaignBatchDto>()),
    'GetSmsCampaignBatchNotificationResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignBatchNotificationResponse()),
    'GetSmsCampaignBatchNotificationsResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignBatchNotificationsResponse()),
    'PaginatedResponse<SmsCampaignBatchNotificationDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<SmsCampaignBatchNotificationDto>()),
    'GetSmsCampaignStatisticsResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignStatisticsResponse()),
    'PreviewSmsNotificationResponse': TypeInfo(TypeOf.Class, create:() => PreviewSmsNotificationResponse()),
    'RetryFailedSmsNotificationsResponse': TypeInfo(TypeOf.Class, create:() => RetryFailedSmsNotificationsResponse()),
    'GetSmsCampaignMessagesResponse': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignMessagesResponse()),
    'GetPushCampaignAudienceCountResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignAudienceCountResponse()),
    'GetPushCampaignResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignResponse()),
    'GetPushCampaignsResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignsResponse()),
    'PaginatedResponse<PushCampaignDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<PushCampaignDto>()),
    'GetPushCampaignBatchesResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignBatchesResponse()),
    'PaginatedResponse<PushCampaignBatchDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<PushCampaignBatchDto>()),
    'GetPushCampaignBatchNotificationResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignBatchNotificationResponse()),
    'GetPushCampaignBatchNotificationsResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignBatchNotificationsResponse()),
    'PaginatedResponse<PushCampaignBatchNotificationDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<PushCampaignBatchNotificationDto>()),
    'GetPushCampaignStatisticsResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignStatisticsResponse()),
    'PreviewPushNotificationResponse': TypeInfo(TypeOf.Class, create:() => PreviewPushNotificationResponse()),
    'RetryFailedPushNotificationsResponse': TypeInfo(TypeOf.Class, create:() => RetryFailedPushNotificationsResponse()),
    'GetPushCampaignMessagesResponse': TypeInfo(TypeOf.Class, create:() => GetPushCampaignMessagesResponse()),
    'SharedTypeGen': TypeInfo(TypeOf.Class, create:() => SharedTypeGen()),
    'Echo': TypeInfo(TypeOf.Class, create:() => Echo()),
    'GetPublicProjectBrandAsset': TypeInfo(TypeOf.Class, create:() => GetPublicProjectBrandAsset()),
    'GetPublicProjectConfig': TypeInfo(TypeOf.Class, create:() => GetPublicProjectConfig()),
    'GetPublicProjectLegal': TypeInfo(TypeOf.Class, create:() => GetPublicProjectLegal()),
    'UploadEndUserChatAttachmentRequest': TypeInfo(TypeOf.Class, create:() => UploadEndUserChatAttachmentRequest()),
    'ListEndUserChatAttachmentsRequest': TypeInfo(TypeOf.Class, create:() => ListEndUserChatAttachmentsRequest()),
    'DeleteEndUserChatAttachmentRequest': TypeInfo(TypeOf.Class, create:() => DeleteEndUserChatAttachmentRequest()),
    'SetEndUserChatEntryFeedbackRequest': TypeInfo(TypeOf.Class, create:() => SetEndUserChatEntryFeedbackRequest()),
    'ListEndUserChatMemoryRequest': TypeInfo(TypeOf.Class, create:() => ListEndUserChatMemoryRequest()),
    'ForgetEndUserChatMemoryRequest': TypeInfo(TypeOf.Class, create:() => ForgetEndUserChatMemoryRequest()),
    'GetEndUserChatAvailabilityRequest': TypeInfo(TypeOf.Class, create:() => GetEndUserChatAvailabilityRequest()),
    'ListEndUserChatSessionsRequest': TypeInfo(TypeOf.Class, create:() => ListEndUserChatSessionsRequest()),
    'CreateEndUserChatSessionRequest': TypeInfo(TypeOf.Class, create:() => CreateEndUserChatSessionRequest()),
    'GetEndUserChatSessionRequest': TypeInfo(TypeOf.Class, create:() => GetEndUserChatSessionRequest()),
    'RenameEndUserChatSessionRequest': TypeInfo(TypeOf.Class, create:() => RenameEndUserChatSessionRequest()),
    'PinEndUserChatSessionRequest': TypeInfo(TypeOf.Class, create:() => PinEndUserChatSessionRequest()),
    'ArchiveEndUserChatSessionRequest': TypeInfo(TypeOf.Class, create:() => ArchiveEndUserChatSessionRequest()),
    'DeleteEndUserChatSessionRequest': TypeInfo(TypeOf.Class, create:() => DeleteEndUserChatSessionRequest()),
    'GetEndUserChatEntriesRequest': TypeInfo(TypeOf.Class, create:() => GetEndUserChatEntriesRequest()),
    'StartEndUserChatTurnRequest': TypeInfo(TypeOf.Class, create:() => StartEndUserChatTurnRequest()),
    'GetEndUserAiToolsRequest': TypeInfo(TypeOf.Class, create:() => GetEndUserAiToolsRequest()),
    'InvokeEndUserAiToolRequest': TypeInfo(TypeOf.Class, create:() => InvokeEndUserAiToolRequest()),
    'BlockUserRequest': TypeInfo(TypeOf.Class, create:() => BlockUserRequest()),
    'SaveSystemUserWithPermissions': TypeInfo(TypeOf.Class, create:() => SaveSystemUserWithPermissions()),
    'SaveGuestUser': TypeInfo(TypeOf.Class, create:() => SaveGuestUser()),
    'SavePhoneUser': TypeInfo(TypeOf.Class, create:() => SavePhoneUser()),
    'SaveUserNameUser': TypeInfo(TypeOf.Class, create:() => SaveUserNameUser()),
    'SaveEmailUser': TypeInfo(TypeOf.Class, create:() => SaveEmailUser()),
    'SavePhoneUserNameWithPermissions': TypeInfo(TypeOf.Class, create:() => SavePhoneUserNameWithPermissions()),
    'SaveEmailUserNameWithPermissions': TypeInfo(TypeOf.Class, create:() => SaveEmailUserNameWithPermissions()),
    'SaveUserNameWithPermissions': TypeInfo(TypeOf.Class, create:() => SaveUserNameWithPermissions()),
    'DeleteUserRequest': TypeInfo(TypeOf.Class, create:() => DeleteUserRequest()),
    'GetUserRequest': TypeInfo(TypeOf.Class, create:() => GetUserRequest()),
    'GetUsersRequest': TypeInfo(TypeOf.Class, create:() => GetUsersRequest()),
    'GetUserPreferencesRequest': TypeInfo(TypeOf.Class, create:() => GetUserPreferencesRequest()),
    'GrantContactConsentRequest': TypeInfo(TypeOf.Class, create:() => GrantContactConsentRequest()),
    'InviteUserRequest': TypeInfo(TypeOf.Class, create:() => InviteUserRequest()),
    'FinishInvitationRequest': TypeInfo(TypeOf.Class, create:() => FinishInvitationRequest()),
    'LinkIdentityRequest': TypeInfo(TypeOf.Class, create:() => LinkIdentityRequest()),
    'MapAuthToUserRequest': TypeInfo(TypeOf.Class, create:() => MapAuthToUserRequest()),
    'AssignRolePermissionsRequest': TypeInfo(TypeOf.Class, create:() => AssignRolePermissionsRequest()),
    'SetContactRolesRequest': TypeInfo(TypeOf.Class, create:() => SetContactRolesRequest()),
    'SetContactTagSubscriptionRequest': TypeInfo(TypeOf.Class, create:() => SetContactTagSubscriptionRequest()),
    'UnblockUserRequest': TypeInfo(TypeOf.Class, create:() => UnblockUserRequest()),
    'UnsubscribeContactRequest': TypeInfo(TypeOf.Class, create:() => UnsubscribeContactRequest()),
    'UpdateUserRequest': TypeInfo(TypeOf.Class, create:() => UpdateUserRequest()),
    'UpdateUserPreferencesRequest': TypeInfo(TypeOf.Class, create:() => UpdateUserPreferencesRequest()),
    'ChangePasswordRequest': TypeInfo(TypeOf.Class, create:() => ChangePasswordRequest()),
    'RequestPasswordResetRequest': TypeInfo(TypeOf.Class, create:() => RequestPasswordResetRequest()),
    'ConfirmPasswordResetRequest': TypeInfo(TypeOf.Class, create:() => ConfirmPasswordResetRequest()),
    'SendTestPasswordResetRequest': TypeInfo(TypeOf.Class, create:() => SendTestPasswordResetRequest()),
    'PasskeyAuthenticationOptionsRequest': TypeInfo(TypeOf.Class, create:() => PasskeyAuthenticationOptionsRequest()),
    'VerifyPasskeyAuthenticationRequest': TypeInfo(TypeOf.Class, create:() => VerifyPasskeyAuthenticationRequest()),
    'ListPasskeysRequest': TypeInfo(TypeOf.Class, create:() => ListPasskeysRequest()),
    'RenamePasskeyRequest': TypeInfo(TypeOf.Class, create:() => RenamePasskeyRequest()),
    'RevokePasskeyRequest': TypeInfo(TypeOf.Class, create:() => RevokePasskeyRequest()),
    'UseRecoveryCodeRequest': TypeInfo(TypeOf.Class, create:() => UseRecoveryCodeRequest()),
    'RequestMagicLinkRequest': TypeInfo(TypeOf.Class, create:() => RequestMagicLinkRequest()),
    'ConsumeMagicLinkRequest': TypeInfo(TypeOf.Class, create:() => ConsumeMagicLinkRequest()),
    'HasPasskeyRequest': TypeInfo(TypeOf.Class, create:() => HasPasskeyRequest()),
    'StartEmailVerificationRequest': TypeInfo(TypeOf.Class, create:() => StartEmailVerificationRequest()),
    'ConfirmEmailVerificationRequest': TypeInfo(TypeOf.Class, create:() => ConfirmEmailVerificationRequest()),
    'PasskeyRegistrationOptionsRequest': TypeInfo(TypeOf.Class, create:() => PasskeyRegistrationOptionsRequest()),
    'VerifyPasskeyRegistrationRequest': TypeInfo(TypeOf.Class, create:() => VerifyPasskeyRegistrationRequest()),
    'RefreshPasskeyTokenRequest': TypeInfo(TypeOf.Class, create:() => RefreshPasskeyTokenRequest()),
    'PasskeyLogoutRequest': TypeInfo(TypeOf.Class, create:() => PasskeyLogoutRequest()),
    'FindMergedTermTreeRequest': TypeInfo(TypeOf.Class, create:() => FindMergedTermTreeRequest()),
    'FindTaxonomyTreeRequest': TypeInfo(TypeOf.Class, create:() => FindTaxonomyTreeRequest()),
    'FindTermsRequest': TypeInfo(TypeOf.Class, create:() => FindTermsRequest()),
    'FindTermsChildrenRequest': TypeInfo(TypeOf.Class, create:() => FindTermsChildrenRequest()),
    'FindTermTreeRequest': TypeInfo(TypeOf.Class, create:() => FindTermTreeRequest()),
    'GetDatabaseSchemaRequest': TypeInfo(TypeOf.Class, create:() => GetDatabaseSchemaRequest()),
    'GetDatabaseSchemasRequest': TypeInfo(TypeOf.Class, create:() => GetDatabaseSchemasRequest()),
    'AggregateRequest': TypeInfo(TypeOf.Class, create:() => AggregateRequest()),
    'ChangeResponsibilityRequest': TypeInfo(TypeOf.Class, create:() => ChangeResponsibilityRequest()),
    'CountRequest': TypeInfo(TypeOf.Class, create:() => CountRequest()),
    'DeleteManyRequest': TypeInfo(TypeOf.Class, create:() => DeleteManyRequest()),
    'DeleteOneRequest': TypeInfo(TypeOf.Class, create:() => DeleteOneRequest()),
    'DistinctRequest': TypeInfo(TypeOf.Class, create:() => DistinctRequest()),
    'ExecuteAggregateRequest': TypeInfo(TypeOf.Class, create:() => ExecuteAggregateRequest()),
    'FindRequest': TypeInfo(TypeOf.Class, create:() => FindRequest()),
    'FindOneRequest': TypeInfo(TypeOf.Class, create:() => FindOneRequest()),
    'FindOwnRequest': TypeInfo(TypeOf.Class, create:() => FindOwnRequest()),
    'InsertManyRequest': TypeInfo(TypeOf.Class, create:() => InsertManyRequest()),
    'InsertOneRequest': TypeInfo(TypeOf.Class, create:() => InsertOneRequest()),
    'ReplaceOneRequest': TypeInfo(TypeOf.Class, create:() => ReplaceOneRequest()),
    'UpdateManyRequest': TypeInfo(TypeOf.Class, create:() => UpdateManyRequest()),
    'UpdateOneRequest': TypeInfo(TypeOf.Class, create:() => UpdateOneRequest()),
    'CommitUploadRequest': TypeInfo(TypeOf.Class, create:() => CommitUploadRequest()),
    'GetFileContentRequest': TypeInfo(TypeOf.Class, create:() => GetFileContentRequest()),
    'PutFileContentRequest': TypeInfo(TypeOf.Class, create:() => PutFileContentRequest()),
    'DeleteFileApiRequest': TypeInfo(TypeOf.Class, create:() => DeleteFileApiRequest()),
    'DeleteManyFilesApiRequest': TypeInfo(TypeOf.Class, create:() => DeleteManyFilesApiRequest()),
    'DownloadFileApiRequest': TypeInfo(TypeOf.Class, create:() => DownloadFileApiRequest()),
    'GetFileByIdRequest': TypeInfo(TypeOf.Class, create:() => GetFileByIdRequest()),
    'GetFileInfoRequest': TypeInfo(TypeOf.Class, create:() => GetFileInfoRequest()),
    'GetSignedUrlRequest': TypeInfo(TypeOf.Class, create:() => GetSignedUrlRequest()),
    'ListFilesRequest': TypeInfo(TypeOf.Class, create:() => ListFilesRequest()),
    'GetPublicFileRequest': TypeInfo(TypeOf.Class, create:() => GetPublicFileRequest()),
    'RegisterFilesRequest': TypeInfo(TypeOf.Class, create:() => RegisterFilesRequest()),
    'List<RegisterFileItem>': TypeInfo(TypeOf.Class, create:() => <RegisterFileItem>[]),
    'RequestUploadUrlRequest': TypeInfo(TypeOf.Class, create:() => RequestUploadUrlRequest()),
    'UseFileRequest': TypeInfo(TypeOf.Class, create:() => UseFileRequest()),
    'RegisterOwnPushDeviceRequest': TypeInfo(TypeOf.Class, create:() => RegisterOwnPushDeviceRequest()),
    'GetOwnPushDevicesRequest': TypeInfo(TypeOf.Class, create:() => GetOwnPushDevicesRequest()),
    'DeleteOwnPushDeviceRequest': TypeInfo(TypeOf.Class, create:() => DeleteOwnPushDeviceRequest()),
    'DeleteOwnPushDeviceByTokenRequest': TypeInfo(TypeOf.Class, create:() => DeleteOwnPushDeviceByTokenRequest()),
    'GetOwnPushMessagesRequest': TypeInfo(TypeOf.Class, create:() => GetOwnPushMessagesRequest()),
    'MarkOwnPushMessageReadRequest': TypeInfo(TypeOf.Class, create:() => MarkOwnPushMessageReadRequest()),
    'MarkAllOwnPushMessagesReadRequest': TypeInfo(TypeOf.Class, create:() => MarkAllOwnPushMessagesReadRequest()),
    'WriteLogs': TypeInfo(TypeOf.Class, create:() => WriteLogs()),
    'List<WriteLogEntry>': TypeInfo(TypeOf.Class, create:() => <WriteLogEntry>[]),
    'CreatePaymentOrderRequest': TypeInfo(TypeOf.Class, create:() => CreatePaymentOrderRequest()),
    'List<PaymentOrderLineInput>': TypeInfo(TypeOf.Class, create:() => <PaymentOrderLineInput>[]),
    'GetPaymentOrderRequest': TypeInfo(TypeOf.Class, create:() => GetPaymentOrderRequest()),
    'GetPaymentOrdersRequest': TypeInfo(TypeOf.Class, create:() => GetPaymentOrdersRequest()),
    'StartPaymentCheckoutRequest': TypeInfo(TypeOf.Class, create:() => StartPaymentCheckoutRequest()),
    'GetCodeWorkflowWaitingRuns': TypeInfo(TypeOf.Class, create:() => GetCodeWorkflowWaitingRuns()),
    'ResumeCodeWorkflowRun': TypeInfo(TypeOf.Class, create:() => ResumeCodeWorkflowRun()),
    'OpenCodeWorkflowResumeLink': TypeInfo(TypeOf.Class, create:() => OpenCodeWorkflowResumeLink()),
    'UseCodeWorkflowResumeLink': TypeInfo(TypeOf.Class, create:() => UseCodeWorkflowResumeLink()),
    'GetCodeWorkflowRuns': TypeInfo(TypeOf.Class, create:() => GetCodeWorkflowRuns()),
    'GetCodeWorkflowRun': TypeInfo(TypeOf.Class, create:() => GetCodeWorkflowRun()),
    'GetCodeWorkflowRunLogs': TypeInfo(TypeOf.Class, create:() => GetCodeWorkflowRunLogs()),
    'ResumeCodeWorkflowRunByKey': TypeInfo(TypeOf.Class, create:() => ResumeCodeWorkflowRunByKey()),
    'RetryCodeWorkflowRunStep': TypeInfo(TypeOf.Class, create:() => RetryCodeWorkflowRunStep()),
    'CancelCodeWorkflowRun': TypeInfo(TypeOf.Class, create:() => CancelCodeWorkflowRun()),
    'GetNotificationInboxRequest': TypeInfo(TypeOf.Class, create:() => GetNotificationInboxRequest()),
    'GetUnreadCountRequest': TypeInfo(TypeOf.Class, create:() => GetUnreadCountRequest()),
    'MarkNotificationReadRequest': TypeInfo(TypeOf.Class, create:() => MarkNotificationReadRequest()),
    'MarkAllNotificationsReadRequest': TypeInfo(TypeOf.Class, create:() => MarkAllNotificationsReadRequest()),
    'SetUserAiPlan': TypeInfo(TypeOf.Class, create:() => SetUserAiPlan()),
    'CreateContactRequest': TypeInfo(TypeOf.Class, create:() => CreateContactRequest()),
    'DeleteContact': TypeInfo(TypeOf.Class, create:() => DeleteContact()),
    'GetContact': TypeInfo(TypeOf.Class, create:() => GetContact()),
    'GetAllContacts': TypeInfo(TypeOf.Class, create:() => GetAllContacts()),
    'MergeContactsRequest': TypeInfo(TypeOf.Class, create:() => MergeContactsRequest()),
    'RepairContactRolesRequest': TypeInfo(TypeOf.Class, create:() => RepairContactRolesRequest()),
    'UpdateContactRequest': TypeInfo(TypeOf.Class, create:() => UpdateContactRequest()),
    'AddContactIdentityRequest': TypeInfo(TypeOf.Class, create:() => AddContactIdentityRequest()),
    'PromoteContactIdentityRequest': TypeInfo(TypeOf.Class, create:() => PromoteContactIdentityRequest()),
    'RemoveContactIdentityRequest': TypeInfo(TypeOf.Class, create:() => RemoveContactIdentityRequest()),
    'MakeFilePrivateRequest': TypeInfo(TypeOf.Class, create:() => MakeFilePrivateRequest()),
    'MakeFilePublicRequest': TypeInfo(TypeOf.Class, create:() => MakeFilePublicRequest()),
    'MakeFolderPrivateRequest': TypeInfo(TypeOf.Class, create:() => MakeFolderPrivateRequest()),
    'MakeFolderPublicRequest': TypeInfo(TypeOf.Class, create:() => MakeFolderPublicRequest()),
    'GetFolderFiles': TypeInfo(TypeOf.Class, create:() => GetFolderFiles()),
    'CreateCollectionImport': TypeInfo(TypeOf.Class, create:() => CreateCollectionImport()),
    'DeleteCollectionImportRequest': TypeInfo(TypeOf.Class, create:() => DeleteCollectionImportRequest()),
    'GetCollectionImport': TypeInfo(TypeOf.Class, create:() => GetCollectionImport()),
    'GetCollectionImports': TypeInfo(TypeOf.Class, create:() => GetCollectionImports()),
    'RequestImportUploadUrlRequest': TypeInfo(TypeOf.Class, create:() => RequestImportUploadUrlRequest()),
    'AnalyzeImportFileRequest': TypeInfo(TypeOf.Class, create:() => AnalyzeImportFileRequest()),
    'CreateEmailCampaignRequest': TypeInfo(TypeOf.Class, create:() => CreateEmailCampaignRequest()),
    'DeleteEmailCampaignRequest': TypeInfo(TypeOf.Class, create:() => DeleteEmailCampaignRequest()),
    'GetEmailCampaign': TypeInfo(TypeOf.Class, create:() => GetEmailCampaign()),
    'GetEmailCampaigns': TypeInfo(TypeOf.Class, create:() => GetEmailCampaigns()),
    'GetEmailCampaignBatches': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignBatches()),
    'GetEmailCampaignBatchNotification': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignBatchNotification()),
    'GetEmailCampaignBatchNotifications': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignBatchNotifications()),
    'GetEmailCampaignStatistics': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignStatistics()),
    'PreviewEmailNotification': TypeInfo(TypeOf.Class, create:() => PreviewEmailNotification()),
    'RetryFailedEmailNotificationsRequest': TypeInfo(TypeOf.Class, create:() => RetryFailedEmailNotificationsRequest()),
    'StopEmailCampaignRequest': TypeInfo(TypeOf.Class, create:() => StopEmailCampaignRequest()),
    'GetEmailCampaignMessagesRequest': TypeInfo(TypeOf.Class, create:() => GetEmailCampaignMessagesRequest()),
    'CreateSmsCampaignRequest': TypeInfo(TypeOf.Class, create:() => CreateSmsCampaignRequest()),
    'DeleteSmsCampaign': TypeInfo(TypeOf.Class, create:() => DeleteSmsCampaign()),
    'GetSmsCampaign': TypeInfo(TypeOf.Class, create:() => GetSmsCampaign()),
    'GetSmsCampaigns': TypeInfo(TypeOf.Class, create:() => GetSmsCampaigns()),
    'GetSmsCampaignBatches': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignBatches()),
    'GetSmsCampaignBatchNotification': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignBatchNotification()),
    'GetSmsCampaignBatchNotifications': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignBatchNotifications()),
    'GetSmsCampaignStatistics': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignStatistics()),
    'PreviewSmsNotification': TypeInfo(TypeOf.Class, create:() => PreviewSmsNotification()),
    'RetryFailedSmsNotificationsRequest': TypeInfo(TypeOf.Class, create:() => RetryFailedSmsNotificationsRequest()),
    'StopSmsCampaignRequest': TypeInfo(TypeOf.Class, create:() => StopSmsCampaignRequest()),
    'GetSmsCampaignMessagesRequest': TypeInfo(TypeOf.Class, create:() => GetSmsCampaignMessagesRequest()),
    'GetPushCampaignAudienceCountRequest': TypeInfo(TypeOf.Class, create:() => GetPushCampaignAudienceCountRequest()),
    'CreatePushCampaignRequest': TypeInfo(TypeOf.Class, create:() => CreatePushCampaignRequest()),
    'DeletePushCampaignRequest': TypeInfo(TypeOf.Class, create:() => DeletePushCampaignRequest()),
    'GetPushCampaign': TypeInfo(TypeOf.Class, create:() => GetPushCampaign()),
    'GetPushCampaigns': TypeInfo(TypeOf.Class, create:() => GetPushCampaigns()),
    'GetPushCampaignBatches': TypeInfo(TypeOf.Class, create:() => GetPushCampaignBatches()),
    'GetPushCampaignBatchNotification': TypeInfo(TypeOf.Class, create:() => GetPushCampaignBatchNotification()),
    'GetPushCampaignBatchNotifications': TypeInfo(TypeOf.Class, create:() => GetPushCampaignBatchNotifications()),
    'GetPushCampaignStatistics': TypeInfo(TypeOf.Class, create:() => GetPushCampaignStatistics()),
    'PreviewPushNotification': TypeInfo(TypeOf.Class, create:() => PreviewPushNotification()),
    'RetryFailedPushNotificationsRequest': TypeInfo(TypeOf.Class, create:() => RetryFailedPushNotificationsRequest()),
    'StopPushCampaignRequest': TypeInfo(TypeOf.Class, create:() => StopPushCampaignRequest()),
    'GetPushCampaignMessagesRequest': TypeInfo(TypeOf.Class, create:() => GetPushCampaignMessagesRequest()),
});

