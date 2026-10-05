/* Options:
Date: 2026-10-05 16:14:10
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

// @DataContract(Namespace="http://codemash.io/types/")
class RequestBase implements ICultureBasedRequest, IVersionBasedRequest, IHasCorrelationIdRequest, IConvertible
{
    /**
    * Specify culture code when your response from the API should be localised. E.g.: en
    */
    // @DataMember
    // @ApiMember(DataType="string", Description="Specify culture code when your response from the API should be localised. E.g.: en", Name="CultureCode", ParameterType="header")
    String? cultureCode;

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

    RequestBase({this.cultureCode,this.timeZoneId,this.version="",this.correlationId});
    RequestBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        cultureCode = json['cultureCode'];
        timeZoneId = json['timeZoneId'];
        version = json['version'] ?? "";
        correlationId = json['correlationId'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'cultureCode': cultureCode,
        'timeZoneId': timeZoneId,
        'version': version,
        'correlationId': correlationId
    };

    getTypeName() => "RequestBase";
    TypeContext? context = _ctx;
}

abstract class ICultureBasedRequest
{
    String? cultureCode;
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

    SaveUserWithRolesBase({this.roles=const []});
    SaveUserWithRolesBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        roles = JsonConverters.fromJson(json['roles'],'List<String>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'roles': JsonConverters.toJson(roles,'List<String>',context!)
    });

    getTypeName() => "SaveUserWithRolesBase";
    TypeContext? context = _ctx;
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

// @DataContract
class EchoLicenseDto implements IConvertible
{
    // @DataMember(Name="domain")
    String? domain;

    // @DataMember(Name="accountId")
    String? accountId;

    // @DataMember(Name="email")
    String? email;

    // @DataMember(Name="release")
    String? release;

    // @DataMember(Name="expire")
    int expire = 0;

    // @DataMember(Name="isTrial")
    bool? isTrial;

    // @DataMember(Name="cap")
    int cap = 0;

    EchoLicenseDto({this.domain,this.accountId,this.email,this.release,this.expire=0,this.isTrial,this.cap=0});
    EchoLicenseDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        domain = json['domain'];
        accountId = json['accountId'];
        email = json['email'];
        release = json['release'];
        expire = json['expire'] ?? 0;
        isTrial = json['isTrial'];
        cap = json['projectsCap'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'domain': domain,
        'accountId': accountId,
        'email': email,
        'release': release,
        'expire': expire,
        'isTrial': isTrial,
        'cap': cap
    };

    getTypeName() => "EchoLicenseDto";
    TypeContext? context = _ctx;
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

class EchoAgentDto implements IConvertible
{
    String mcpUrl = "";
    String? oAuthMetadataUrl;
    String installationType = "";
    String onboardingDocsUrl = "";
    String toolsUrl = "";

    EchoAgentDto({this.mcpUrl="",this.oAuthMetadataUrl,this.installationType="",this.onboardingDocsUrl="",this.toolsUrl=""});
    EchoAgentDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        mcpUrl = json['mcpUrl'] ?? "";
        oAuthMetadataUrl = json['oAuthMetadataUrl'];
        installationType = json['installationType'] ?? "";
        onboardingDocsUrl = json['onboardingDocsUrl'] ?? "";
        toolsUrl = json['toolsUrl'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'mcpUrl': mcpUrl,
        'oAuthMetadataUrl': oAuthMetadataUrl,
        'installationType': installationType,
        'onboardingDocsUrl': onboardingDocsUrl,
        'toolsUrl': toolsUrl
    };

    getTypeName() => "EchoAgentDto";
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

    AuthDto({this.id="",this.type,this.email,this.userName,this.registration,this.login,this.generalInfo,this.roles,this.pushDevices,this.tags,this.status,this.createdOn,this.modifiedOn});
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
        'modifiedOn': JsonConverters.toJson(modifiedOn,'DateTime',context!)
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
    String? description;

    // @DataMember
    Map<String,String?>? descriptions;

    // @DataMember
    List<TermMultiParentDto>? multiParents;

    // @DataMember
    dynamic? meta;

    // @DataMember
    List<TermTreeDto>? children;

    TermTreeDto({this.id="",this.taxonomyId,this.taxonomyName,this.parentId,this.order,this.name,this.names,this.description,this.descriptions,this.multiParents,this.meta,this.children});
    TermTreeDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        taxonomyId = json['taxonomyId'];
        taxonomyName = json['taxonomyName'];
        parentId = json['parentId'];
        order = json['order'];
        name = json['name'];
        names = JsonConverters.toStringMap(json['names']);
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
    String? description;

    // @DataMember
    Map<String,String?>? descriptions;

    // @DataMember
    List<TermMultiParentDto>? multiParents;

    // @DataMember
    dynamic? meta;

    TermDto({this.id="",this.taxonomyId,this.taxonomyName,this.parentId,this.order,this.name,this.names,this.description,this.descriptions,this.multiParents,this.meta});
    TermDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        taxonomyId = json['taxonomyId'];
        taxonomyName = json['taxonomyName'];
        parentId = json['parentId'];
        order = json['order'];
        name = json['name'];
        names = JsonConverters.toStringMap(json['names']);
        description = json['description'];
        descriptions = JsonConverters.toStringMap(json['descriptions']);
        multiParents = JsonConverters.fromJson(json['multiParents'],'List<TermMultiParentDto>',context!);
        meta = JsonConverters.fromJson(json['meta'],'dynamic',context!);
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
        'description': description,
        'descriptions': descriptions,
        'multiParents': JsonConverters.toJson(multiParents,'List<TermMultiParentDto>',context!),
        'meta': JsonConverters.toJson(meta,'dynamic',context!)
    };

    getTypeName() => "TermDto";
    TypeContext? context = _ctx;
}

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

class SchemaSettingsDto implements IConvertible
{
    // @DataMember
    bool? softDelete;

    // @DataMember
    bool? hasRecordOwner;

    // @DataMember
    String? description;

    SchemaSettingsDto({this.softDelete,this.hasRecordOwner,this.description});
    SchemaSettingsDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        softDelete = json['softDelete'];
        hasRecordOwner = json['hasRecordOwner'];
        description = json['description'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'softDelete': softDelete,
        'hasRecordOwner': hasRecordOwner,
        'description': description
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
class TriggerDto implements IHasViewId, IConvertible
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
    String? savedByAuthId;

    TriggerDto({this.type,this.viewId="",this.name="",this.thenAction,this.description,this.isEnabled,this.activationCode,this.savedByAuthId});
    TriggerDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        type = JsonConverters.fromJson(json['type'],'TriggerType',context!);
        viewId = json['viewId'] ?? "";
        name = json['name'] ?? "";
        thenAction = JsonConverters.fromJson(json['thenAction'],'TriggerActionDto',context!);
        description = json['description'];
        isEnabled = json['isEnabled'];
        activationCode = json['activationCode'];
        savedByAuthId = json['savedByAuthId'];
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
        'savedByAuthId': savedByAuthId
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
    String id = "";

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

    FileResourceDto({this.id="",this.originalFileName="",this.Extension="",this.storedFileName="",this.sizeBytes,this.checksum});
    FileResourceDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
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

// @DataContract
class IntegrationTestResultItemDto implements IConvertible
{
    // @DataMember
    String operation = "";

    // @DataMember
    String result = "";

    // @DataMember
    IReadOnlyList<String>? errors;

    IntegrationTestResultItemDto({this.operation="",this.result="",this.errors});
    IntegrationTestResultItemDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        operation = json['operation'] ?? "";
        result = json['result'] ?? "";
        errors = JsonConverters.fromJson(json['errors'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'operation': operation,
        'result': result,
        'errors': JsonConverters.toJson(errors,'IReadOnlyList<String>',context!)
    };

    getTypeName() => "IntegrationTestResultItemDto";
    TypeContext? context = _ctx;
}

abstract class IBindableContract
{
}

abstract class IHasViewId
{
    String viewId = "";
}

abstract class ICursorArgs
{
    String field = "";
    int order = 0;
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

    StringFieldDto({this.format,this.pattern,this.minLength,this.maxLength,this.translateOptions});
    StringFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        format = json['format'];
        pattern = json['pattern'];
        minLength = json['minLength'];
        maxLength = json['maxLength'];
        translateOptions = JsonConverters.fromJson(json['translateOptions'],'IReadOnlyDictionary<String,String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'format': format,
        'pattern': pattern,
        'minLength': minLength,
        'maxLength': maxLength,
        'translateOptions': JsonConverters.toJson(translateOptions,'IReadOnlyDictionary<String,String>',context!)
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

    DecimalFieldDto({this.minimum,this.maximum,this.multipleOf});
    DecimalFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minimum = JsonConverters.toDouble(json['minimum']);
        maximum = JsonConverters.toDouble(json['maximum']);
        multipleOf = JsonConverters.toDouble(json['multipleOf']);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minimum': minimum,
        'maximum': maximum,
        'multipleOf': multipleOf
    });

    getTypeName() => "DecimalFieldDto";
    TypeContext? context = _ctx;
}

class CurrencyFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<String>? allowedCurrencies;

    CurrencyFieldDto({this.allowedCurrencies});
    CurrencyFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        allowedCurrencies = JsonConverters.fromJson(json['allowedCurrencies'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'allowedCurrencies': JsonConverters.toJson(allowedCurrencies,'IReadOnlyList<String>',context!)
    });

    getTypeName() => "CurrencyFieldDto";
    TypeContext? context = _ctx;
}

class BooleanFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    BooleanFieldDto();
    BooleanFieldDto.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "BooleanFieldDto";
    TypeContext? context = _ctx;
}

class DateFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    int? minimum;

    // @DataMember
    int? maximum;

    DateFieldDto({this.minimum,this.maximum});
    DateFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minimum = json['minimum'];
        maximum = json['maximum'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minimum': minimum,
        'maximum': maximum
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

    IntegerFieldDto({this.minimum,this.maximum});
    IntegerFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        minimum = json['minimum'];
        maximum = json['maximum'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'minimum': minimum,
        'maximum': maximum
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
    TagsFieldDto();
    TagsFieldDto.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "TagsFieldDto";
    TypeContext? context = _ctx;
}

class FileFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    IReadOnlyList<String>? storages;

    FileFieldDto({this.storages});
    FileFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        storages = JsonConverters.fromJson(json['storages'],'IReadOnlyList<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'storages': JsonConverters.toJson(storages,'IReadOnlyList<String>',context!)
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

    TaxonomySelectionFieldDto({this.taxonomyId,this.multiple});
    TaxonomySelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        taxonomyId = json['taxonomyId'];
        multiple = json['multiple'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'taxonomyId': taxonomyId,
        'multiple': multiple
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

    UserSelectionFieldDto({this.multiple});
    UserSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        multiple = json['multiple'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'multiple': multiple
    });

    getTypeName() => "UserSelectionFieldDto";
    TypeContext? context = _ctx;
}

class RoleSelectionFieldDto extends JsonSchemaFieldDto implements IConvertible
{
    // @DataMember
    bool? multiple;

    RoleSelectionFieldDto({this.multiple});
    RoleSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        multiple = json['multiple'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'multiple': multiple
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

    EnumSelectionFieldDto({this.values,this.multiple});
    EnumSelectionFieldDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        values = JsonConverters.fromJson(json['values'],'IReadOnlyList<String>',context!);
        multiple = json['multiple'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'values': JsonConverters.toJson(values,'IReadOnlyList<String>',context!),
        'multiple': multiple
    });

    getTypeName() => "EnumSelectionFieldDto";
    TypeContext? context = _ctx;
}

class EchoResponse implements IConvertible
{
    String? containerName;
    String ip = "";
    CodeMashRelease? release;
    CodeMashRuntime? runtime;
    String managedServiceHubUrl = "";
    String managedServiceApiUrl = "";
    String hubUrl = "";
    String apiUrl = "";
    String apiVersion = "";
    String hubVersion = "";
    String mjmlUrl = "";
    String? adminUrlTemplate;
    EchoLicenseDto? license;
    String? askForEnterpriseLicenseEmail;
    bool? emailServiceConfigured;
    String? rootBootstrapPasswordSource;
    List<EchoRegionDto>? regions;
    bool? isProductionInstallation;
    String licensingMode = "";
    int? graceDaysLeft;
    String? installationDomain;
    String? licensingDocsUrl;
    EchoAgentDto? agent;

    EchoResponse({this.containerName,this.ip="",this.release,this.runtime,this.managedServiceHubUrl="",this.managedServiceApiUrl="",this.hubUrl="",this.apiUrl="",this.apiVersion="",this.hubVersion="",this.mjmlUrl="",this.adminUrlTemplate,this.license,this.askForEnterpriseLicenseEmail,this.emailServiceConfigured,this.rootBootstrapPasswordSource,this.regions,this.isProductionInstallation,this.licensingMode="",this.graceDaysLeft,this.installationDomain,this.licensingDocsUrl,this.agent});
    EchoResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        containerName = json['containerName'];
        ip = json['ip'] ?? "";
        release = JsonConverters.fromJson(json['release'],'CodeMashRelease',context!);
        runtime = JsonConverters.fromJson(json['runtime'],'CodeMashRuntime',context!);
        managedServiceHubUrl = json['managedServiceHubUrl'] ?? "";
        managedServiceApiUrl = json['managedServiceApiUrl'] ?? "";
        hubUrl = json['hubUrl'] ?? "";
        apiUrl = json['apiUrl'] ?? "";
        apiVersion = json['apiVersion'] ?? "";
        hubVersion = json['hubVersion'] ?? "";
        mjmlUrl = json['mjmlUrl'] ?? "";
        adminUrlTemplate = json['adminUrlTemplate'];
        license = JsonConverters.fromJson(json['license'],'EchoLicenseDto',context!);
        askForEnterpriseLicenseEmail = json['askForEnterpriseLicenseEmail'];
        emailServiceConfigured = json['emailServiceConfigured'];
        rootBootstrapPasswordSource = json['rootBootstrapPasswordSource'];
        regions = JsonConverters.fromJson(json['regions'],'List<EchoRegionDto>',context!);
        isProductionInstallation = json['isProductionInstallation'];
        licensingMode = json['licensingMode'] ?? "";
        graceDaysLeft = json['graceDaysLeft'];
        installationDomain = json['installationDomain'];
        licensingDocsUrl = json['licensingDocsUrl'];
        agent = JsonConverters.fromJson(json['agent'],'EchoAgentDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'containerName': containerName,
        'ip': ip,
        'release': JsonConverters.toJson(release,'CodeMashRelease',context!),
        'runtime': JsonConverters.toJson(runtime,'CodeMashRuntime',context!),
        'managedServiceHubUrl': managedServiceHubUrl,
        'managedServiceApiUrl': managedServiceApiUrl,
        'hubUrl': hubUrl,
        'apiUrl': apiUrl,
        'apiVersion': apiVersion,
        'hubVersion': hubVersion,
        'mjmlUrl': mjmlUrl,
        'adminUrlTemplate': adminUrlTemplate,
        'license': JsonConverters.toJson(license,'EchoLicenseDto',context!),
        'askForEnterpriseLicenseEmail': askForEnterpriseLicenseEmail,
        'emailServiceConfigured': emailServiceConfigured,
        'rootBootstrapPasswordSource': rootBootstrapPasswordSource,
        'regions': JsonConverters.toJson(regions,'List<EchoRegionDto>',context!),
        'isProductionInstallation': isProductionInstallation,
        'licensingMode': licensingMode,
        'graceDaysLeft': graceDaysLeft,
        'installationDomain': installationDomain,
        'licensingDocsUrl': licensingDocsUrl,
        'agent': JsonConverters.toJson(agent,'EchoAgentDto',context!)
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

// @DataContract
class TestFilesIntegrationResponse extends ResponseBase implements IConvertible
{
    // @DataMember
    IReadOnlyList<IntegrationTestResultItemDto>? items;

    TestFilesIntegrationResponse({this.items});
    TestFilesIntegrationResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        items = JsonConverters.fromJson(json['items'],'IReadOnlyList<IntegrationTestResultItemDto>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'items': JsonConverters.toJson(items,'IReadOnlyList<IntegrationTestResultItemDto>',context!)
    });

    getTypeName() => "TestFilesIntegrationResponse";
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
class SaveGuestUser extends SaveUser implements IReturn<IdResponse>, IConvertible, IPost
{
    SaveGuestUser();
    SaveGuestUser.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() => IdResponse();
    getResponseTypeName() => "IdResponse";
    getTypeName() => "SaveGuestUser";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/user-name", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveUserNameUser extends SaveUser implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String password = "";

    // @DataMember
    String userName = "";

    SaveUserNameUser({this.password="",this.userName=""});
    SaveUserNameUser.fromJson(Map<String, dynamic> json) { fromMap(json); }

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
    getTypeName() => "SaveUserNameUser";
    TypeContext? context = _ctx;
}

/**
* Membership
*/
// @Route("/{version}/membership/auth/register/email", "POST")
// @Api(Description="Membership")
// @DataContract
class SaveEmailUser extends SaveUser implements IReturn<IdResponse>, IConvertible, IPost
{
    // @DataMember
    String password = "";

    // @DataMember
    String email = "";

    SaveEmailUser({this.password="",this.email=""});
    SaveEmailUser.fromJson(Map<String, dynamic> json) { fromMap(json); }

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
    getTypeName() => "SaveEmailUser";
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

    GetUsersRequest({this.databaseIntegrationId,this.includePermissions,this.userShouldHavePushDevice,this.userShouldHaveEmail,this.includeMeta,this.roleNames,this.userIds});
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
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'databaseIntegrationId': databaseIntegrationId,
        'includePermissions': includePermissions,
        'userShouldHavePushDevice': userShouldHavePushDevice,
        'userShouldHaveEmail': userShouldHaveEmail,
        'includeMeta': includeMeta,
        'roleNames': JsonConverters.toJson(roleNames,'List<String>',context!),
        'userIds': JsonConverters.toJson(userIds,'List<String>',context!)
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
    * Email address the invitation is sent to.
    */
    // @DataMember
    // @ApiMember(Description="Email address the invitation is sent to.", IsRequired=true)
    String email = "";

    /**
    * Database integration id. Optional — defaults to the request environment's default integration.
    */
    // @DataMember
    // @ApiMember(Description="Database integration id. Optional — defaults to the request environment's default integration.")
    String? databaseIntegrationId;

    InviteUserRequest({this.email="",this.databaseIntegrationId});
    InviteUserRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        email = json['email'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'email': email,
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
class ChangePasswordRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
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

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
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
class ConfirmPasswordResetRequest extends CodeMashRequestBase implements IReturn<PasskeyOkResponse>, IConvertible, IPost
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

    createResponse() => PasskeyOkResponse();
    getResponseTypeName() => "PasskeyOkResponse";
    getTypeName() => "ConfirmPasswordResetRequest";
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
    // @DataMember
    String taxonomyName = "";

    // @DataMember
    String? databaseIntegrationId;

    FindMergedTermTreeRequest({this.taxonomyName="",this.databaseIntegrationId});
    FindMergedTermTreeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        taxonomyName = json['taxonomyName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
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
    // @DataMember
    bool? includeTerms;

    // @DataMember
    String? databaseIntegrationId;

    FindTaxonomyTreeRequest({this.includeTerms,this.databaseIntegrationId});
    FindTaxonomyTreeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        includeTerms = json['includeTerms'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
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
    // @DataMember
    String taxonomyName = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    bool? sortDescending;

    // @DataMember
    PagingArgs? pagingArgs;

    FindTermsRequest({this.taxonomyName="",this.databaseIntegrationId,this.filter,this.sortDescending,this.pagingArgs});
    FindTermsRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        taxonomyName = json['taxonomyName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        sortDescending = json['sortDescending'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
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
    // @DataMember
    String taxonomyName = "";

    // @DataMember
    String parentId = "";

    // @DataMember
    String? databaseIntegrationId;

    // @DataMember
    String? filter;

    // @DataMember
    PagingArgs? pagingArgs;

    FindTermsChildrenRequest({this.taxonomyName="",this.parentId="",this.databaseIntegrationId,this.filter,this.pagingArgs});
    FindTermsChildrenRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        taxonomyName = json['taxonomyName'] ?? "";
        parentId = json['parentId'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
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
    // @DataMember
    String taxonomyName = "";

    // @DataMember
    String? rootTermId;

    // @DataMember
    int? depth;

    // @DataMember
    String? databaseIntegrationId;

    FindTermTreeRequest({this.taxonomyName="",this.rootTermId,this.depth,this.databaseIntegrationId});
    FindTermTreeRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        taxonomyName = json['taxonomyName'] ?? "";
        rootTermId = json['rootTermId'];
        depth = json['depth'];
        databaseIntegrationId = json['databaseIntegrationId'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
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

    DeleteManyRequest({this.collectionName="",this.databaseIntegrationId,this.filter=""});
    DeleteManyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter
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

    FindRequest({this.collectionName="",this.databaseIntegrationId,this.filter,this.schemaVersion,this.pagingArgs,this.sortBy,this.sortOrder});
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
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'schemaVersion': schemaVersion,
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!),
        'sortBy': sortBy,
        'sortOrder': sortOrder
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

    FindOneRequest({this.collectionName="",this.id="",this.databaseIntegrationId});
    FindOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

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

    FindOwnRequest({this.collectionName="",this.databaseIntegrationId,this.filter,this.schemaVersion,this.pagingArgs});
    FindOwnRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'];
        schemaVersion = json['schemaVersion'];
        pagingArgs = JsonConverters.fromJson(json['pagingArgs'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'schemaVersion': schemaVersion,
        'pagingArgs': JsonConverters.toJson(pagingArgs,'PagingArgs',context!)
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
    String update = "";

    UpdateManyRequest({this.collectionName="",this.databaseIntegrationId,this.filter="",this.update=""});
    UpdateManyRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        filter = json['filter'] ?? "";
        update = json['update'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'databaseIntegrationId': databaseIntegrationId,
        'filter': filter,
        'update': update
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

    UpdateOneRequest({this.collectionName="",this.id="",this.databaseIntegrationId,this.update=""});
    UpdateOneRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        collectionName = json['collectionName'] ?? "";
        id = json['id'] ?? "";
        databaseIntegrationId = json['databaseIntegrationId'];
        update = json['update'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'collectionName': collectionName,
        'id': id,
        'databaseIntegrationId': databaseIntegrationId,
        'update': update
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

    CommitUploadRequest({this.filesIntegrationId="",this.path="",this.contentType,this.sizeBytes,this.fileName});
    CommitUploadRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        contentType = json['contentType'];
        sizeBytes = json['sizeBytes'];
        fileName = json['fileName'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'contentType': contentType,
        'sizeBytes': sizeBytes,
        'fileName': fileName
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

    RequestUploadUrlRequest({this.filesIntegrationId="",this.path="",this.contentType="",this.expirationSeconds});
    RequestUploadUrlRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        path = json['path'] ?? "";
        contentType = json['contentType'] ?? "";
        expirationSeconds = json['expirationSeconds'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId,
        'path': path,
        'contentType': contentType,
        'expirationSeconds': expirationSeconds
    });

    createResponse() => RequestUploadUrlResponse();
    getResponseTypeName() => "RequestUploadUrlResponse";
    getTypeName() => "RequestUploadUrlRequest";
    TypeContext? context = _ctx;
}

/**
* Files
*/
// @Route("/{version}/files/{filesIntegrationId}/test", "POST")
// @Api(Description="Files")
// @DataContract
class TestFilesIntegrationRequest extends CodeMashRequestBase implements IReturn<TestFilesIntegrationResponse>, IConvertible, IPost
{
    // @DataMember
    String filesIntegrationId = "";

    TestFilesIntegrationRequest({this.filesIntegrationId=""});
    TestFilesIntegrationRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        filesIntegrationId = json['filesIntegrationId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'filesIntegrationId': filesIntegrationId
    });

    createResponse() => TestFilesIntegrationResponse();
    getResponseTypeName() => "TestFilesIntegrationResponse";
    getTypeName() => "TestFilesIntegrationRequest";
    TypeContext? context = _ctx;
}

TypeContext _ctx = TypeContext(library: 'localhost', types: <String, TypeInfo> {
    'RequestBase': TypeInfo(TypeOf.Class, create:() => RequestBase()),
    'ICultureBasedRequest': TypeInfo(TypeOf.Interface),
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
    'CodeMashListPaginationRequestBase': TypeInfo(TypeOf.Class, create:() => CodeMashListPaginationRequestBase()),
    'IPasskeyCeremonyRequest': TypeInfo(TypeOf.Interface),
    'CursorArgs': TypeInfo(TypeOf.Class, create:() => CursorArgs()),
    'PagingArgs': TypeInfo(TypeOf.Class, create:() => PagingArgs()),
    'CodeMashRelease': TypeInfo(TypeOf.Enum, enumValues:CodeMashRelease.values),
    'CodeMashRuntime': TypeInfo(TypeOf.Enum, enumValues:CodeMashRuntime.values),
    'EchoLicenseDto': TypeInfo(TypeOf.Class, create:() => EchoLicenseDto()),
    'EchoRegionDto': TypeInfo(TypeOf.Class, create:() => EchoRegionDto()),
    'EchoAgentDto': TypeInfo(TypeOf.Class, create:() => EchoAgentDto()),
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
    'JsonSchemaFieldDto': TypeInfo(TypeOf.AbstractClass),
    'DataSchemaDto': TypeInfo(TypeOf.Class, create:() => DataSchemaDto()),
    'List<JsonSchemaFieldDto>': TypeInfo(TypeOf.Class, create:() => <JsonSchemaFieldDto>[]),
    'VisualSchemaDto': TypeInfo(TypeOf.Class, create:() => VisualSchemaDto()),
    'SchemaSettingsDto': TypeInfo(TypeOf.Class, create:() => SchemaSettingsDto()),
    'SchemaEmbedSettingsDto': TypeInfo(TypeOf.Class, create:() => SchemaEmbedSettingsDto()),
    'TriggerType': TypeInfo(TypeOf.Enum, enumValues:TriggerType.values),
    'TriggerActionType': TypeInfo(TypeOf.Enum, enumValues:TriggerActionType.values),
    'TriggerActionDto': TypeInfo(TypeOf.AbstractClass),
    'TriggerDto': TypeInfo(TypeOf.Class, create:() => TriggerDto()),
    'SchemaDto': TypeInfo(TypeOf.Class, create:() => SchemaDto()),
    'List<TriggerDto>': TypeInfo(TypeOf.Class, create:() => <TriggerDto>[]),
    'SchemaListProjection': TypeInfo(TypeOf.Class, create:() => SchemaListProjection()),
    'FileChecksumDto': TypeInfo(TypeOf.Class, create:() => FileChecksumDto()),
    'FileResourceDto': TypeInfo(TypeOf.Class, create:() => FileResourceDto()),
    'FileProvider': TypeInfo(TypeOf.Enum, enumValues:FileProvider.values),
    'FileResourceRefDto': TypeInfo(TypeOf.Class, create:() => FileResourceRefDto()),
    'PublicFolderDto': TypeInfo(TypeOf.Class, create:() => PublicFolderDto()),
    'IntegrationTestResultItemDto': TypeInfo(TypeOf.Class, create:() => IntegrationTestResultItemDto()),
    'IReadOnlyList<String>': TypeInfo(TypeOf.Class, create:() => IReadOnlyList<String>()),
    'IBindableContract': TypeInfo(TypeOf.Interface),
    'IHasViewId': TypeInfo(TypeOf.Interface),
    'ICursorArgs': TypeInfo(TypeOf.Interface),
    'StringFieldDto': TypeInfo(TypeOf.Class, create:() => StringFieldDto()),
    'IReadOnlyDictionary<String,String>': TypeInfo(TypeOf.Class, create:() => IReadOnlyDictionary<String,String>()),
    'DecimalFieldDto': TypeInfo(TypeOf.Class, create:() => DecimalFieldDto()),
    'CurrencyFieldDto': TypeInfo(TypeOf.Class, create:() => CurrencyFieldDto()),
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
    'GetUserResponse': TypeInfo(TypeOf.Class, create:() => GetUserResponse()),
    'GetUsersResponse': TypeInfo(TypeOf.Class, create:() => GetUsersResponse()),
    'PaginatedResponse<AuthDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<AuthDto>()),
    'GetUserPreferencesResponse': TypeInfo(TypeOf.Class, create:() => GetUserPreferencesResponse()),
    'PasskeyOkResponse': TypeInfo(TypeOf.Class, create:() => PasskeyOkResponse()),
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
    'GetFileInfoResponse': TypeInfo(TypeOf.Class, create:() => GetFileInfoResponse()),
    'GetSignedUrlResponse': TypeInfo(TypeOf.Class, create:() => GetSignedUrlResponse()),
    'ListFilesResponse': TypeInfo(TypeOf.Class, create:() => ListFilesResponse()),
    'PaginatedResponse<FileResourceRefDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<FileResourceRefDto>()),
    'List<PublicFolderDto>': TypeInfo(TypeOf.Class, create:() => <PublicFolderDto>[]),
    'RequestUploadUrlResponse': TypeInfo(TypeOf.Class, create:() => RequestUploadUrlResponse()),
    'TestFilesIntegrationResponse': TypeInfo(TypeOf.Class, create:() => TestFilesIntegrationResponse()),
    'IReadOnlyList<IntegrationTestResultItemDto>': TypeInfo(TypeOf.Class, create:() => IReadOnlyList<IntegrationTestResultItemDto>()),
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
    'SaveUserNameUser': TypeInfo(TypeOf.Class, create:() => SaveUserNameUser()),
    'SaveEmailUser': TypeInfo(TypeOf.Class, create:() => SaveEmailUser()),
    'SavePhoneUser': TypeInfo(TypeOf.Class, create:() => SavePhoneUser()),
    'SavePhoneUserNameWithPermissions': TypeInfo(TypeOf.Class, create:() => SavePhoneUserNameWithPermissions()),
    'SaveEmailUserNameWithPermissions': TypeInfo(TypeOf.Class, create:() => SaveEmailUserNameWithPermissions()),
    'SaveUserNameWithPermissions': TypeInfo(TypeOf.Class, create:() => SaveUserNameWithPermissions()),
    'DeleteUserRequest': TypeInfo(TypeOf.Class, create:() => DeleteUserRequest()),
    'GetUserRequest': TypeInfo(TypeOf.Class, create:() => GetUserRequest()),
    'GetUsersRequest': TypeInfo(TypeOf.Class, create:() => GetUsersRequest()),
    'GetUserPreferencesRequest': TypeInfo(TypeOf.Class, create:() => GetUserPreferencesRequest()),
    'GrantContactConsentRequest': TypeInfo(TypeOf.Class, create:() => GrantContactConsentRequest()),
    'InviteUserRequest': TypeInfo(TypeOf.Class, create:() => InviteUserRequest()),
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
    'GetFileInfoRequest': TypeInfo(TypeOf.Class, create:() => GetFileInfoRequest()),
    'GetSignedUrlRequest': TypeInfo(TypeOf.Class, create:() => GetSignedUrlRequest()),
    'ListFilesRequest': TypeInfo(TypeOf.Class, create:() => ListFilesRequest()),
    'GetPublicFileRequest': TypeInfo(TypeOf.Class, create:() => GetPublicFileRequest()),
    'RequestUploadUrlRequest': TypeInfo(TypeOf.Class, create:() => RequestUploadUrlRequest()),
    'TestFilesIntegrationRequest': TypeInfo(TypeOf.Class, create:() => TestFilesIntegrationRequest()),
});

