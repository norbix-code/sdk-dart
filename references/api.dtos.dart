/* Options:
Date: 2026-09-04 14:55:41
Version: 10.08
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

class EmailAddress implements IConvertible
{
    String address = "";

    EmailAddress({this.address=""});
    EmailAddress.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        address = json['address'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'address': address
    };

    getTypeName() => "EmailAddress";
    TypeContext? context = _ctx;
}

class DisplayName implements IConvertible
{
    String value = "";

    DisplayName({this.value=""});
    DisplayName.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "DisplayName";
    TypeContext? context = _ctx;
}

abstract class AggregateId
{
    String value = "";

    AggregateId({this.value=""});
    AggregateId.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "AggregateId";
    TypeContext? context = _ctx;
}

class AccountId extends AggregateId implements IHasDomainEntityId, IConvertible
{
    AccountId();
    AccountId.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "AccountId";
    TypeContext? context = _ctx;
}

class UtcDateTime implements IConvertible
{
    UtcDateTime();
    UtcDateTime.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "UtcDateTime";
    TypeContext? context = _ctx;
}

enum TimeUnit
{
    Ticks,
    Milliseconds,
    Seconds,
    Minutes,
    Hours,
}

class ExpirationToken implements IConvertible
{
    int items = 0;
    TimeUnit? unit;
    int value = 0;

    ExpirationToken({this.items=0,this.unit,this.value=0});
    ExpirationToken.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        items = json['items'] ?? 0;
        unit = JsonConverters.fromJson(json['unit'],'TimeUnit',context!);
        value = json['value'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'items': items,
        'unit': JsonConverters.toJson(unit,'TimeUnit',context!),
        'value': value
    };

    getTypeName() => "ExpirationToken";
    TypeContext? context = _ctx;
}

class CodeMashSubscriptionId extends AggregateId implements IConvertible
{
    CodeMashSubscriptionId();
    CodeMashSubscriptionId.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "CodeMashSubscriptionId";
    TypeContext? context = _ctx;
}

class ProjectId extends AggregateId implements IHasDomainEntityId, IConvertible
{
    ProjectId();
    ProjectId.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "ProjectId";
    TypeContext? context = _ctx;
}

class IntegrationId extends AggregateId implements IHasDomainEntityId, IConvertible
{
    IntegrationId();
    IntegrationId.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "IntegrationId";
    TypeContext? context = _ctx;
}

enum ResourceRefKind
{
    Contact,
    Document,
    File,
    PaymentCustomer,
    Order,
    Payment,
    Product,
    Integration,
}

abstract class ResourceRef
{
    ProjectId? projectId;
    IntegrationId? integrationId;
    ResourceRefKind? kind;

    ResourceRef({this.projectId,this.integrationId,this.kind});
    ResourceRef.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        projectId = JsonConverters.fromJson(json['projectId'],'ProjectId',context!);
        integrationId = JsonConverters.fromJson(json['integrationId'],'IntegrationId',context!);
        kind = JsonConverters.fromJson(json['kind'],'ResourceRefKind',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'projectId': JsonConverters.toJson(projectId,'ProjectId',context!),
        'integrationId': JsonConverters.toJson(integrationId,'IntegrationId',context!),
        'kind': JsonConverters.toJson(kind,'ResourceRefKind',context!)
    };

    getTypeName() => "ResourceRef";
    TypeContext? context = _ctx;
}

enum ResourceSource
{
    Norbix,
    Stripe,
    Shopify,
    PayPal,
    Adyen,
    Mollie,
    Paddle,
    LemonSqueezy,
    AppleInApp,
    GoogleInApp,
    AuthorizeNet,
    Braintree,
    CheckOutCom,
    WooCommerce,
    Magento,
    Worldpay,
}

class PaymentCustomerRef extends ResourceRef implements IConvertible
{
    ResourceRefKind? kind;
    ResourceSource? source;
    String externalId = "";

    PaymentCustomerRef({this.kind,this.source,this.externalId=""});
    PaymentCustomerRef.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        kind = JsonConverters.fromJson(json['kind'],'ResourceRefKind',context!);
        source = JsonConverters.fromJson(json['source'],'ResourceSource',context!);
        externalId = json['externalId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'kind': JsonConverters.toJson(kind,'ResourceRefKind',context!),
        'source': JsonConverters.toJson(source,'ResourceSource',context!),
        'externalId': externalId
    });

    getTypeName() => "PaymentCustomerRef";
    TypeContext? context = _ctx;
}

class Quantity implements IConvertible
{
    int value = 0;

    Quantity({this.value=0});
    Quantity.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? 0;
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "Quantity";
    TypeContext? context = _ctx;
}

class CodeMashManagedServiceSubscription implements IConvertible
{
    CodeMashSubscriptionId? subscriptionId;
    PaymentCustomerRef? paymentCustomerRef;
    String refSubscriptionId = "";
    UtcDateTime? issuedOn;
    UtcDateTime? willExpireOn;
    Quantity? projectCap;
    bool? isTrial;

    CodeMashManagedServiceSubscription({this.subscriptionId,this.paymentCustomerRef,this.refSubscriptionId="",this.issuedOn,this.willExpireOn,this.projectCap,this.isTrial});
    CodeMashManagedServiceSubscription.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        subscriptionId = JsonConverters.fromJson(json['subscriptionId'],'CodeMashSubscriptionId',context!);
        paymentCustomerRef = JsonConverters.fromJson(json['paymentCustomerRef'],'PaymentCustomerRef',context!);
        refSubscriptionId = json['refSubscriptionId'] ?? "";
        issuedOn = JsonConverters.fromJson(json['issuedOn'],'UtcDateTime',context!);
        willExpireOn = JsonConverters.fromJson(json['willExpireOn'],'UtcDateTime',context!);
        projectCap = JsonConverters.fromJson(json['projectCap'],'Quantity',context!);
        isTrial = json['isTrial'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'subscriptionId': JsonConverters.toJson(subscriptionId,'CodeMashSubscriptionId',context!),
        'paymentCustomerRef': JsonConverters.toJson(paymentCustomerRef,'PaymentCustomerRef',context!),
        'refSubscriptionId': refSubscriptionId,
        'issuedOn': JsonConverters.toJson(issuedOn,'UtcDateTime',context!),
        'willExpireOn': JsonConverters.toJson(willExpireOn,'UtcDateTime',context!),
        'projectCap': JsonConverters.toJson(projectCap,'Quantity',context!),
        'isTrial': isTrial
    };

    getTypeName() => "CodeMashManagedServiceSubscription";
    TypeContext? context = _ctx;
}

class DomainUrl implements IConvertible
{
    Uri? value;

    DomainUrl({this.value});
    DomainUrl.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = JsonConverters.fromJson(json['value'],'Uri',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': JsonConverters.toJson(value,'Uri',context!)
    };

    getTypeName() => "DomainUrl";
    TypeContext? context = _ctx;
}

class CodeMashLicense extends CodeMashManagedServiceSubscription implements IConvertible
{
    DomainUrl? domain;
    AccountId? accountId;
    bool? isEnterprise;

    CodeMashLicense({this.domain,this.accountId,this.isEnterprise});
    CodeMashLicense.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        domain = JsonConverters.fromJson(json['domain'],'DomainUrl',context!);
        accountId = JsonConverters.fromJson(json['accountId'],'AccountId',context!);
        isEnterprise = json['isEnterprise'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'domain': JsonConverters.toJson(domain,'DomainUrl',context!),
        'accountId': JsonConverters.toJson(accountId,'AccountId',context!),
        'isEnterprise': isEnterprise
    });

    getTypeName() => "CodeMashLicense";
    TypeContext? context = _ctx;
}

class Tag implements IConvertible
{
    Tag();
    Tag.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "Tag";
    TypeContext? context = _ctx;
}

class TagDescription implements IConvertible
{
    DisplayName? displayName;
    String? description;

    TagDescription({this.displayName,this.description});
    TagDescription.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        displayName = JsonConverters.fromJson(json['displayName'],'DisplayName',context!);
        description = json['description'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'displayName': JsonConverters.toJson(displayName,'DisplayName',context!),
        'description': description
    };

    getTypeName() => "TagDescription";
    TypeContext? context = _ctx;
}

// @DataContract
class MessageTranslation<TContent> implements IConvertible
{
    MessageTranslation();
    MessageTranslation.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "MessageTranslation<$TContent>";
    TypeContext? context = _ctx;
}

class TagTranslation extends MessageTranslation<TagDescription> implements IConvertible
{
    TagTranslation();
    TagTranslation.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "TagTranslation";
    TypeContext? context = _ctx;
}

abstract class BaseTagDefinition
{
    Tag? tag;
    List<TagTranslation> translations = [];

    BaseTagDefinition({this.tag,this.translations=const []});
    BaseTagDefinition.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        tag = JsonConverters.fromJson(json['tag'],'Tag',context!);
        translations = JsonConverters.fromJson(json['translations'],'List<TagTranslation>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'tag': JsonConverters.toJson(tag,'Tag',context!),
        'translations': JsonConverters.toJson(translations,'List<TagTranslation>',context!)
    };

    getTypeName() => "BaseTagDefinition";
    TypeContext? context = _ctx;
}

class GroupDefinition extends BaseTagDefinition implements IConvertible
{
    GroupDefinition();
    GroupDefinition.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "GroupDefinition";
    TypeContext? context = _ctx;
}

enum CommunicationChannel
{
    Transactional,
    Marketing,
    System,
}

enum DeliveryChannel
{
    Email,
    Push,
    Sms,
    WebPush,
    InApp,
    ChatBot,
    ChatPlatform,
}

class TagDefinition extends BaseTagDefinition implements IConvertible
{
    Map<DeliveryChannel,bool?> defaultDelivery = {};

    TagDefinition({this.defaultDelivery=const {}});
    TagDefinition.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        defaultDelivery = JsonConverters.fromJson(json['defaultDelivery'],'Map<DeliveryChannel,bool?>',context!) ?? {};
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'defaultDelivery': JsonConverters.toJson(defaultDelivery,'Map<DeliveryChannel,bool?>',context!)
    });

    getTypeName() => "TagDefinition";
    TypeContext? context = _ctx;
}

// @DataContract
class ProjectName implements IConvertible
{
    // @DataMember
    String name = "";

    // @DataMember
    String uniqueName = "";

    ProjectName({this.name="",this.uniqueName=""});
    ProjectName.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        name = json['name'] ?? "";
        uniqueName = json['uniqueName'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'name': name,
        'uniqueName': uniqueName
    };

    getTypeName() => "ProjectName";
    TypeContext? context = _ctx;
}

class NorbixRegion implements IConvertible
{
    String code = "";

    NorbixRegion({this.code=""});
    NorbixRegion.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        code = json['code'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'code': code
    };

    getTypeName() => "NorbixRegion";
    TypeContext? context = _ctx;
}

enum Continent
{
    Africa,
    Antarctica,
    Asia,
    Europe,
    NorthAmerica,
    Oceania,
    SouthAmerica,
}

// @DataContract
class ProjectRegion implements IConvertible
{
    // @DataMember
    NorbixRegion? region;

    // @DataMember
    String? name;

    // @DataMember
    Continent? continent;

    ProjectRegion({this.region,this.name,this.continent});
    ProjectRegion.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        region = JsonConverters.fromJson(json['region'],'NorbixRegion',context!);
        name = json['name'];
        continent = JsonConverters.fromJson(json['continent'],'Continent',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'region': JsonConverters.toJson(region,'NorbixRegion',context!),
        'name': name,
        'continent': JsonConverters.toJson(continent,'Continent',context!)
    };

    getTypeName() => "ProjectRegion";
    TypeContext? context = _ctx;
}

class Language implements IConvertible
{
    String code = "";
    String name = "";

    Language({this.code="",this.name=""});
    Language.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        code = json['code'] ?? "";
        name = json['name'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'code': code,
        'name': name
    };

    getTypeName() => "Language";
    TypeContext? context = _ctx;
}

class FileResourceId implements IConvertible
{
    String value = "";

    FileResourceId({this.value=""});
    FileResourceId.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "FileResourceId";
    TypeContext? context = _ctx;
}

class FileChecksum implements IConvertible
{
    String algorithm = "";
    String hash = "";

    FileChecksum({this.algorithm="",this.hash=""});
    FileChecksum.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        algorithm = json['algorithm'] ?? "";
        hash = json['hash'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'algorithm': algorithm,
        'hash': hash
    };

    getTypeName() => "FileChecksum";
    TypeContext? context = _ctx;
}

// @DataContract
class FileResource implements IConvertible
{
    // @DataMember
    FileResourceId? id;

    // @DataMember
    String originalFileName = "";

    // @DataMember
    String Extension = "";

    // @DataMember
    int? sizeBytes;

    // @DataMember
    FileChecksum? checksum;

    // @DataMember
    String storedFileName = "";

    FileResource({this.id,this.originalFileName="",this.Extension="",this.sizeBytes,this.checksum,this.storedFileName=""});
    FileResource.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'FileResourceId',context!);
        originalFileName = json['originalFileName'] ?? "";
        Extension = json['extension'] ?? "";
        sizeBytes = json['sizeBytes'];
        checksum = JsonConverters.fromJson(json['checksum'],'FileChecksum',context!);
        storedFileName = json['storedFileName'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'FileResourceId',context!),
        'originalFileName': originalFileName,
        'extension': Extension,
        'sizeBytes': sizeBytes,
        'checksum': JsonConverters.toJson(checksum,'FileChecksum',context!),
        'storedFileName': storedFileName
    };

    getTypeName() => "FileResource";
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
class FileResourceRef implements IConvertible
{
    // @DataMember(Order=1)
    FileResource? resource;

    // @DataMember(Order=2)
    IntegrationId? integrationId;

    // @DataMember(Order=3)
    FileProvider? provider;

    // @DataMember(Order=4)
    String path = "";

    FileResourceRef({this.resource,this.integrationId,this.provider,this.path=""});
    FileResourceRef.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        resource = JsonConverters.fromJson(json['resource'],'FileResource',context!);
        integrationId = JsonConverters.fromJson(json['integrationId'],'IntegrationId',context!);
        provider = JsonConverters.fromJson(json['provider'],'FileProvider',context!);
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'resource': JsonConverters.toJson(resource,'FileResource',context!),
        'integrationId': JsonConverters.toJson(integrationId,'IntegrationId',context!),
        'provider': JsonConverters.toJson(provider,'FileProvider',context!),
        'path': path
    };

    getTypeName() => "FileResourceRef";
    TypeContext? context = _ctx;
}

class ProjectLogo implements IConvertible
{
    FileResourceRef? fileResource;
    String publicUrl = "";

    ProjectLogo({this.fileResource,this.publicUrl=""});
    ProjectLogo.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        fileResource = JsonConverters.fromJson(json['fileResource'],'FileResourceRef',context!);
        publicUrl = json['publicUrl'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'fileResource': JsonConverters.toJson(fileResource,'FileResourceRef',context!),
        'publicUrl': publicUrl
    };

    getTypeName() => "ProjectLogo";
    TypeContext? context = _ctx;
}

class ProjectIcon implements IConvertible
{
    FileResourceRef? fileResource;
    String publicUrl = "";

    ProjectIcon({this.fileResource,this.publicUrl=""});
    ProjectIcon.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        fileResource = JsonConverters.fromJson(json['fileResource'],'FileResourceRef',context!);
        publicUrl = json['publicUrl'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'fileResource': JsonConverters.toJson(fileResource,'FileResourceRef',context!),
        'publicUrl': publicUrl
    };

    getTypeName() => "ProjectIcon";
    TypeContext? context = _ctx;
}

// @DataContract
class BrandColor implements IConvertible
{
    // @DataMember
    String value = "";

    BrandColor({this.value=""});
    BrandColor.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "BrandColor";
    TypeContext? context = _ctx;
}

// @DataContract
class TimeZone implements IConvertible
{
    // @DataMember
    String zoneId = "";

    TimeZone({this.zoneId=""});
    TimeZone.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        zoneId = json['zoneId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'zoneId': zoneId
    };

    getTypeName() => "TimeZone";
    TypeContext? context = _ctx;
}

// @DataContract
class GroupTags implements IConvertible
{
    // @DataMember
    Tag? group;

    // @DataMember
    List<Tag> tags = [];

    GroupTags({this.group,this.tags=const []});
    GroupTags.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        group = JsonConverters.fromJson(json['group'],'Tag',context!);
        tags = JsonConverters.fromJson(json['tags'],'List<Tag>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'group': JsonConverters.toJson(group,'Tag',context!),
        'tags': JsonConverters.toJson(tags,'List<Tag>',context!)
    };

    getTypeName() => "GroupTags";
    TypeContext? context = _ctx;
}

// @DataContract
class ProjectCommunicationChannel implements IConvertible
{
    // @DataMember
    CommunicationChannel? channel;

    // @DataMember
    List<GroupTags> groups = [];

    ProjectCommunicationChannel({this.channel,this.groups=const []});
    ProjectCommunicationChannel.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        channel = JsonConverters.fromJson(json['channel'],'CommunicationChannel',context!);
        groups = JsonConverters.fromJson(json['groups'],'List<GroupTags>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'channel': JsonConverters.toJson(channel,'CommunicationChannel',context!),
        'groups': JsonConverters.toJson(groups,'List<GroupTags>',context!)
    };

    getTypeName() => "ProjectCommunicationChannel";
    TypeContext? context = _ctx;
}

// @DataContract
class ProjectCommunication implements IConvertible
{
    // @DataMember
    List<ProjectCommunicationChannel> channels = [];

    // @DataMember
    List<GroupDefinition> groups = [];

    // @DataMember
    List<TagDefinition> tags = [];

    ProjectCommunication({this.channels=const [],this.groups=const [],this.tags=const []});
    ProjectCommunication.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        channels = JsonConverters.fromJson(json['channels'],'List<ProjectCommunicationChannel>',context!) ?? [];
        groups = JsonConverters.fromJson(json['groups'],'List<GroupDefinition>',context!) ?? [];
        tags = JsonConverters.fromJson(json['tags'],'List<TagDefinition>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'channels': JsonConverters.toJson(channels,'List<ProjectCommunicationChannel>',context!),
        'groups': JsonConverters.toJson(groups,'List<GroupDefinition>',context!),
        'tags': JsonConverters.toJson(tags,'List<TagDefinition>',context!)
    };

    getTypeName() => "ProjectCommunication";
    TypeContext? context = _ctx;
}

class AuthId implements IHasDomainEntityId, IConvertible
{
    String value = "";

    AuthId({this.value=""});
    AuthId.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "AuthId";
    TypeContext? context = _ctx;
}

class DeviceId implements IConvertible
{
    String id = "";

    DeviceId({this.id=""});
    DeviceId.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id
    };

    getTypeName() => "DeviceId";
    TypeContext? context = _ctx;
}

enum DeviceType
{
    Unknown,
    Phone,
    Tablet,
    Desktop,
    Tv,
}

class PushDeviceToken implements IConvertible
{
    String token = "";

    PushDeviceToken({this.token=""});
    PushDeviceToken.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        token = json['token'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'token': token
    };

    getTypeName() => "PushDeviceToken";
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
class PushDeviceDeliveryToken implements IConvertible
{
    // @DataMember
    PushDeviceToken? pushDeviceToken;

    // @DataMember
    PushDeviceDeliveryFamily? deliveryFamily;

    PushDeviceDeliveryToken({this.pushDeviceToken,this.deliveryFamily});
    PushDeviceDeliveryToken.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        pushDeviceToken = JsonConverters.fromJson(json['pushDeviceToken'],'PushDeviceToken',context!);
        deliveryFamily = JsonConverters.fromJson(json['deliveryFamily'],'PushDeviceDeliveryFamily',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'pushDeviceToken': JsonConverters.toJson(pushDeviceToken,'PushDeviceToken',context!),
        'deliveryFamily': JsonConverters.toJson(deliveryFamily,'PushDeviceDeliveryFamily',context!)
    };

    getTypeName() => "PushDeviceDeliveryToken";
    TypeContext? context = _ctx;
}

// @DataContract
class PushDevice implements IConvertible
{
    // @DataMember
    DeviceId? id;

    // @DataMember
    String? brand;

    // @DataMember
    String? manufacturer;

    // @DataMember
    String? modelName;

    // @DataMember
    String? deviceName;

    // @DataMember
    DeviceType? deviceType;

    // @DataMember
    String? osName;

    // @DataMember
    String? osVersion;

    // @DataMember
    int? platformApiLevel;

    // @DataMember
    PushDeviceDeliveryToken? token;

    PushDevice({this.id,this.brand,this.manufacturer,this.modelName,this.deviceName,this.deviceType,this.osName,this.osVersion,this.platformApiLevel,this.token});
    PushDevice.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'DeviceId',context!);
        brand = json['brand'];
        manufacturer = json['manufacturer'];
        modelName = json['modelName'];
        deviceName = json['deviceName'];
        deviceType = JsonConverters.fromJson(json['deviceType'],'DeviceType',context!);
        osName = json['osName'];
        osVersion = json['osVersion'];
        platformApiLevel = json['platformApiLevel'];
        token = JsonConverters.fromJson(json['token'],'PushDeviceDeliveryToken',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'DeviceId',context!),
        'brand': brand,
        'manufacturer': manufacturer,
        'modelName': modelName,
        'deviceName': deviceName,
        'deviceType': JsonConverters.toJson(deviceType,'DeviceType',context!),
        'osName': osName,
        'osVersion': osVersion,
        'platformApiLevel': platformApiLevel,
        'token': JsonConverters.toJson(token,'PushDeviceDeliveryToken',context!)
    };

    getTypeName() => "PushDevice";
    TypeContext? context = _ctx;
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

class Env implements IConvertible
{
    String value = "";
    bool? isProd;

    Env({this.value="",this.isProd});
    Env.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        isProd = json['isProd'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value,
        'isProd': isProd
    };

    getTypeName() => "Env";
    TypeContext? context = _ctx;
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

    Env? resolvedEnv;
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

    /**
    * Paging
    */
    // @ApiMember(DataType="object", Description="Paging", Name="paging", ParameterType="body")
    PagingArgs? paging;

    CodeMashListPaginationRequestBase({this.projectId="",this.env,this.resolvedEnv,this.startingAfter,this.endingBefore,this.pageSize,this.paging});
    CodeMashListPaginationRequestBase.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        projectId = json['projectId'] ?? "";
        env = json['env'];
        resolvedEnv = JsonConverters.fromJson(json['resolvedEnv'],'Env',context!);
        startingAfter = json['startingAfter'];
        endingBefore = json['endingBefore'];
        pageSize = json['pageSize'];
        paging = JsonConverters.fromJson(json['paging'],'PagingArgs',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'projectId': projectId,
        'env': env,
        'resolvedEnv': JsonConverters.toJson(resolvedEnv,'Env',context!),
        'startingAfter': startingAfter,
        'endingBefore': endingBefore,
        'pageSize': pageSize,
        'paging': JsonConverters.toJson(paging,'PagingArgs',context!)
    });

    getTypeName() => "CodeMashListPaginationRequestBase";
    TypeContext? context = _ctx;
}

abstract class IPasskeyCeremonyRequest
{
}

abstract class Integration implements IIntegrationIdentification, IHasDomainEntityId
{
    IntegrationId? integrationId;
    Env? env;
    String capability = "";
    bool? isSystemOwned;
    DisplayName? integrationName;
    bool? isEnabled;
    bool? isConfigured;
    DateTime? lastIntegrationTestAtUtc;
    bool? lastIntegrationTestSucceeded;
    IReadOnlyList<String>? lastIntegrationTestErrorMessages;
    DateTime? humanDeliveryConfirmedAtUtc;
    bool? isApprovedThatItWorks;

    Integration({this.integrationId,this.env,this.capability="",this.isSystemOwned,this.integrationName,this.isEnabled,this.isConfigured,this.lastIntegrationTestAtUtc,this.lastIntegrationTestSucceeded,this.lastIntegrationTestErrorMessages,this.humanDeliveryConfirmedAtUtc,this.isApprovedThatItWorks});
    Integration.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        integrationId = JsonConverters.fromJson(json['integrationId'],'IntegrationId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        capability = JsonConverters.fromJson(json['capability'],'String',context!) ?? "";
        isSystemOwned = json['isSystemOwned'];
        integrationName = JsonConverters.fromJson(json['integrationName'],'DisplayName',context!);
        isEnabled = json['isEnabled'];
        isConfigured = json['isConfigured'];
        lastIntegrationTestAtUtc = JsonConverters.fromJson(json['lastIntegrationTestAtUtc'],'DateTime',context!);
        lastIntegrationTestSucceeded = json['lastIntegrationTestSucceeded'];
        lastIntegrationTestErrorMessages = JsonConverters.fromJson(json['lastIntegrationTestErrorMessages'],'IReadOnlyList<String>',context!);
        humanDeliveryConfirmedAtUtc = JsonConverters.fromJson(json['humanDeliveryConfirmedAtUtc'],'DateTime',context!);
        isApprovedThatItWorks = json['isApprovedThatItWorks'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'integrationId': JsonConverters.toJson(integrationId,'IntegrationId',context!),
        'env': JsonConverters.toJson(env,'Env',context!),
        'capability': JsonConverters.toJson(capability,'String',context!),
        'isSystemOwned': isSystemOwned,
        'integrationName': JsonConverters.toJson(integrationName,'DisplayName',context!),
        'isEnabled': isEnabled,
        'isConfigured': isConfigured,
        'lastIntegrationTestAtUtc': JsonConverters.toJson(lastIntegrationTestAtUtc,'DateTime',context!),
        'lastIntegrationTestSucceeded': lastIntegrationTestSucceeded,
        'lastIntegrationTestErrorMessages': JsonConverters.toJson(lastIntegrationTestErrorMessages,'IReadOnlyList<String>',context!),
        'humanDeliveryConfirmedAtUtc': JsonConverters.toJson(humanDeliveryConfirmedAtUtc,'DateTime',context!),
        'isApprovedThatItWorks': isApprovedThatItWorks
    };

    getTypeName() => "Integration";
    TypeContext? context = _ctx;
}

// @DataContract
enum PushProvider
{
    AppleApns,
    SafariWeb,
    SafariPush,
    AndroidFirebase,
    ChromeWeb,
    FirefoxWeb,
    EdgeWeb,
    ChromePush,
    CodeMashIosApp,
    CodeMashAndroidApp,
    CodeMashSafariPlugin,
    CodeMashSafariWeb,
    CodeMashChromePlugin,
    CodeMashChromeWeb,
    Expo,
    Fake,
}

abstract class PushIntegration extends Integration
{
    PushProvider? provider;

    PushIntegration({this.provider});
    PushIntegration.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        provider = JsonConverters.fromJson(json['provider'],'PushProvider',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'provider': JsonConverters.toJson(provider,'PushProvider',context!)
    });

    getTypeName() => "PushIntegration";
    TypeContext? context = _ctx;
}

class TemplateId implements IConvertible
{
    String value = "";

    TemplateId({this.value=""});
    TemplateId.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = json['value'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': value
    };

    getTypeName() => "TemplateId";
    TypeContext? context = _ctx;
}

// @DataContract
abstract class Template<TMessageContent> implements IBindableContract
{
    // @DataMember
    TemplateId? templateId;

    // @DataMember
    DisplayName? templateName;

    // @DataMember
    List<MessageTranslation<TMessageContent>> translations = [];

    // @DataMember
    CommunicationChannel? communicationChannel;

    // @DataMember
    bool? isActive;

    // @DataMember
    String? description;

    // @DataMember
    List<Tag>? tags;

    // @DataMember
    IntegrationId? fileIntegrationId;

    // @DataMember
    Env? env;

    Template({this.templateId,this.templateName,this.translations=const [],this.communicationChannel,this.isActive,this.description,this.tags,this.fileIntegrationId,this.env});
    Template.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        templateId = JsonConverters.fromJson(json['templateId'],'TemplateId',context!);
        templateName = JsonConverters.fromJson(json['templateName'],'DisplayName',context!);
        translations = JsonConverters.fromJson(json['translations'],'List<MessageTranslation<TMessageContent>>',context!) ?? [];
        communicationChannel = JsonConverters.fromJson(json['communicationChannel'],'CommunicationChannel',context!);
        isActive = json['isActive'];
        description = json['description'];
        tags = JsonConverters.fromJson(json['tags'],'List<Tag>',context!);
        fileIntegrationId = JsonConverters.fromJson(json['fileIntegrationId'],'IntegrationId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'templateId': JsonConverters.toJson(templateId,'TemplateId',context!),
        'templateName': JsonConverters.toJson(templateName,'DisplayName',context!),
        'translations': JsonConverters.toJson(translations,'List<MessageTranslation<TMessageContent>>',context!),
        'communicationChannel': JsonConverters.toJson(communicationChannel,'CommunicationChannel',context!),
        'isActive': isActive,
        'description': description,
        'tags': JsonConverters.toJson(tags,'List<Tag>',context!),
        'fileIntegrationId': JsonConverters.toJson(fileIntegrationId,'IntegrationId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "Template<$TMessageContent>";
    TypeContext? context = _ctx;
}

// @DataContract
class TemplateCode implements IConvertible
{
    TemplateCode();
    TemplateCode.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "TemplateCode";
    TypeContext? context = _ctx;
}

// @DataContract
class PushTitle implements IConvertible
{
    // @DataMember
    TemplateCode? value;

    PushTitle({this.value});
    PushTitle.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = JsonConverters.fromJson(json['value'],'TemplateCode',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': JsonConverters.toJson(value,'TemplateCode',context!)
    };

    getTypeName() => "PushTitle";
    TypeContext? context = _ctx;
}

class PushBody implements IConvertible
{
    TemplateCode? value;

    PushBody({this.value});
    PushBody.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        value = JsonConverters.fromJson(json['value'],'TemplateCode',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'value': JsonConverters.toJson(value,'TemplateCode',context!)
    };

    getTypeName() => "PushBody";
    TypeContext? context = _ctx;
}

// @DataContract
class PushMessageContent implements IConvertible
{
    // @DataMember(Order=1)
    PushTitle? title;

    // @DataMember(Order=1)
    PushTitle? subTitle;

    // @DataMember(Order=2)
    PushBody? body;

    PushMessageContent({this.title,this.subTitle,this.body});
    PushMessageContent.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        title = JsonConverters.fromJson(json['title'],'PushTitle',context!);
        subTitle = JsonConverters.fromJson(json['subTitle'],'PushTitle',context!);
        body = JsonConverters.fromJson(json['body'],'PushBody',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'title': JsonConverters.toJson(title,'PushTitle',context!),
        'subTitle': JsonConverters.toJson(subTitle,'PushTitle',context!),
        'body': JsonConverters.toJson(body,'PushBody',context!)
    };

    getTypeName() => "PushMessageContent";
    TypeContext? context = _ctx;
}

// @DataContract
class PushTemplate extends Template<PushMessageContent> implements IConvertible
{
    PushTemplate();
    PushTemplate.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    getTypeName() => "PushTemplate";
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

enum TriggerType
{
    Membership,
    Schema,
    Files,
    Payments,
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

    TriggerDto({this.type,this.viewId="",this.name="",this.thenAction,this.description,this.isEnabled,this.activationCode});
    TriggerDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        type = JsonConverters.fromJson(json['type'],'TriggerType',context!);
        viewId = json['viewId'] ?? "";
        name = json['name'] ?? "";
        thenAction = JsonConverters.fromJson(json['thenAction'],'TriggerActionDto',context!);
        description = json['description'];
        isEnabled = json['isEnabled'];
        activationCode = json['activationCode'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'type': JsonConverters.toJson(type,'TriggerType',context!),
        'viewId': viewId,
        'name': name,
        'thenAction': JsonConverters.toJson(thenAction,'TriggerActionDto',context!),
        'description': description,
        'isEnabled': isEnabled,
        'activationCode': activationCode
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
    List<TriggerDto>? triggers;

    SchemaDto({this.viewId="",this.schemaName="",this.schemaSlug,this.version=0,this.metaSchemaVersion=0,this.dataSchema,this.visualSchema,this.publishedAt,this.settings,this.triggers});
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

    SchemaListProjection({this.viewId="",this.schemaName="",this.schemaTitle="",this.latestVersion,this.hasDraft,this.metaSchemaVersion=0,this.description});
    SchemaListProjection.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        viewId = json['viewId'] ?? "";
        schemaName = json['schemaName'] ?? "";
        schemaTitle = json['schemaTitle'] ?? "";
        latestVersion = json['latestVersion'];
        hasDraft = json['hasDraft'];
        metaSchemaVersion = json['metaSchemaVersion'] ?? 0;
        description = json['description'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'viewId': viewId,
        'schemaName': schemaName,
        'schemaTitle': schemaTitle,
        'latestVersion': latestVersion,
        'hasDraft': hasDraft,
        'metaSchemaVersion': metaSchemaVersion,
        'description': description
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

    FileResourceRefDto({this.resource,this.integrationId="",this.provider,this.path=""});
    FileResourceRefDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        resource = JsonConverters.fromJson(json['resource'],'FileResourceDto',context!);
        integrationId = json['integrationId'] ?? "";
        provider = JsonConverters.fromJson(json['provider'],'FileProvider',context!);
        path = json['path'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'resource': JsonConverters.toJson(resource,'FileResourceDto',context!),
        'integrationId': integrationId,
        'provider': JsonConverters.toJson(provider,'FileProvider',context!),
        'path': path
    };

    getTypeName() => "FileResourceRefDto";
    TypeContext? context = _ctx;
}

abstract class IHasDomainEntityId
{
    String viewId = "";
}

abstract class IIntegrationIdentification
{
    IntegrationId? integrationId;
    String capability = "";
    bool? isSystemOwned;
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

    EchoResponse({this.containerName,this.ip="",this.release,this.runtime,this.managedServiceHubUrl="",this.managedServiceApiUrl="",this.hubUrl="",this.apiUrl="",this.apiVersion="",this.hubVersion="",this.mjmlUrl="",this.adminUrlTemplate,this.license,this.askForEnterpriseLicenseEmail,this.emailServiceConfigured,this.rootBootstrapPasswordSource,this.regions,this.isProductionInstallation,this.licensingMode="",this.graceDaysLeft,this.installationDomain,this.licensingDocsUrl});
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
        'licensingDocsUrl': licensingDocsUrl
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

    PublicProjectConfigDto({this.displayName="",this.adminPortalEnabled,this.branding,this.auth});
    PublicProjectConfigDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        displayName = json['displayName'] ?? "";
        adminPortalEnabled = json['adminPortalEnabled'];
        branding = JsonConverters.fromJson(json['branding'],'PublicBrandDto',context!);
        auth = JsonConverters.fromJson(json['auth'],'PublicAuthDto',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'adminPortalEnabled': adminPortalEnabled,
        'branding': JsonConverters.toJson(branding,'PublicBrandDto',context!),
        'auth': JsonConverters.toJson(auth,'PublicAuthDto',context!)
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

class AskChatResponse extends ResponseBase implements IConvertible
{
    String? result;

    AskChatResponse({this.result});
    AskChatResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        result = json['result'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'result': result
    });

    getTypeName() => "AskChatResponse";
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

    ListFilesResponse({this.list,this.folders});
    ListFilesResponse.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        list = JsonConverters.fromJson(json['list'],'PaginatedResponse<FileResourceRefDto>',context!);
        folders = JsonConverters.fromJson(json['folders'],'List<String>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'list': JsonConverters.toJson(list,'PaginatedResponse<FileResourceRefDto>',context!),
        'folders': JsonConverters.toJson(folders,'List<String>',context!)
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

class AccountCreated implements IConvertible, IPost
{
    EmailAddress? email;
    DisplayName? displayName;
    AccountId? accountId;
    UtcDateTime? createdOn;

    AccountCreated({this.email,this.displayName,this.accountId,this.createdOn});
    AccountCreated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        email = JsonConverters.fromJson(json['email'],'EmailAddress',context!);
        displayName = JsonConverters.fromJson(json['displayName'],'DisplayName',context!);
        accountId = JsonConverters.fromJson(json['accountId'],'AccountId',context!);
        createdOn = JsonConverters.fromJson(json['createdOn'],'UtcDateTime',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'email': JsonConverters.toJson(email,'EmailAddress',context!),
        'displayName': JsonConverters.toJson(displayName,'DisplayName',context!),
        'accountId': JsonConverters.toJson(accountId,'AccountId',context!),
        'createdOn': JsonConverters.toJson(createdOn,'UtcDateTime',context!)
    };

    getTypeName() => "AccountCreated";
    TypeContext? context = _ctx;
}

class AccountVerified implements IConvertible, IPost
{
    AccountVerified();
    AccountVerified.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "AccountVerified";
    TypeContext? context = _ctx;
}

class AccountSetAsActive implements IConvertible, IPost
{
    AccountSetAsActive();
    AccountSetAsActive.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "AccountSetAsActive";
    TypeContext? context = _ctx;
}

class AccountValidationTokenIssued implements IConvertible, IPost
{
    ExpirationToken? expiration;

    AccountValidationTokenIssued({this.expiration});
    AccountValidationTokenIssued.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        expiration = JsonConverters.fromJson(json['expiration'],'ExpirationToken',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'expiration': JsonConverters.toJson(expiration,'ExpirationToken',context!)
    };

    getTypeName() => "AccountValidationTokenIssued";
    TypeContext? context = _ctx;
}

class AccountBlocked implements IConvertible, IPost
{
    AccountBlocked();
    AccountBlocked.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "AccountBlocked";
    TypeContext? context = _ctx;
}

class AccountProfileUpdated implements IConvertible, IPost
{
    DisplayName? displayName;
    EmailAddress? billingEmail;
    EmailAddress? operationsEmail;
    EmailAddress? securityEmail;

    AccountProfileUpdated({this.displayName,this.billingEmail,this.operationsEmail,this.securityEmail});
    AccountProfileUpdated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        displayName = JsonConverters.fromJson(json['displayName'],'DisplayName',context!);
        billingEmail = JsonConverters.fromJson(json['billingEmail'],'EmailAddress',context!);
        operationsEmail = JsonConverters.fromJson(json['operationsEmail'],'EmailAddress',context!);
        securityEmail = JsonConverters.fromJson(json['securityEmail'],'EmailAddress',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'displayName': JsonConverters.toJson(displayName,'DisplayName',context!),
        'billingEmail': JsonConverters.toJson(billingEmail,'EmailAddress',context!),
        'operationsEmail': JsonConverters.toJson(operationsEmail,'EmailAddress',context!),
        'securityEmail': JsonConverters.toJson(securityEmail,'EmailAddress',context!)
    };

    getTypeName() => "AccountProfileUpdated";
    TypeContext? context = _ctx;
}

class AccountSetAsInactive implements IConvertible, IPost
{
    AccountSetAsInactive();
    AccountSetAsInactive.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "AccountSetAsInactive";
    TypeContext? context = _ctx;
}

class AccountUnregistered implements IConvertible, IPost
{
    AccountUnregistered();
    AccountUnregistered.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "AccountUnregistered";
    TypeContext? context = _ctx;
}

class LicenseCreated implements IConvertible, IPost
{
    CodeMashLicense? license;

    LicenseCreated({this.license});
    LicenseCreated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        license = JsonConverters.fromJson(json['license'],'CodeMashLicense',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'license': JsonConverters.toJson(license,'CodeMashLicense',context!)
    };

    getTypeName() => "LicenseCreated";
    TypeContext? context = _ctx;
}

class CustomerCreated implements IConvertible, IPost
{
    PaymentCustomerRef? paymentCustomerRef;

    CustomerCreated({this.paymentCustomerRef});
    CustomerCreated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        paymentCustomerRef = JsonConverters.fromJson(json['paymentCustomerRef'],'PaymentCustomerRef',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'paymentCustomerRef': JsonConverters.toJson(paymentCustomerRef,'PaymentCustomerRef',context!)
    };

    getTypeName() => "CustomerCreated";
    TypeContext? context = _ctx;
}

class SubscriptionChanged implements IConvertible, IPost
{
    CodeMashManagedServiceSubscription? subscription;

    SubscriptionChanged({this.subscription});
    SubscriptionChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        subscription = JsonConverters.fromJson(json['subscription'],'CodeMashManagedServiceSubscription',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'subscription': JsonConverters.toJson(subscription,'CodeMashManagedServiceSubscription',context!)
    };

    getTypeName() => "SubscriptionChanged";
    TypeContext? context = _ctx;
}

class SubscriptionCanceled implements IConvertible, IPost
{
    PaymentCustomerRef? paymentCustomerRef;
    String subscriptionId = "";

    SubscriptionCanceled({this.paymentCustomerRef,this.subscriptionId=""});
    SubscriptionCanceled.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        paymentCustomerRef = JsonConverters.fromJson(json['paymentCustomerRef'],'PaymentCustomerRef',context!);
        subscriptionId = json['subscriptionId'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => {
        'paymentCustomerRef': JsonConverters.toJson(paymentCustomerRef,'PaymentCustomerRef',context!),
        'subscriptionId': subscriptionId
    };

    getTypeName() => "SubscriptionCanceled";
    TypeContext? context = _ctx;
}

class ProjectCommunicationGroupSaved implements IConvertible, IPost
{
    GroupDefinition? group;
    CommunicationChannel? channel;
    CommunicationChannel? originChannel;

    ProjectCommunicationGroupSaved({this.group,this.channel,this.originChannel});
    ProjectCommunicationGroupSaved.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        group = JsonConverters.fromJson(json['group'],'GroupDefinition',context!);
        channel = JsonConverters.fromJson(json['channel'],'CommunicationChannel',context!);
        originChannel = JsonConverters.fromJson(json['originChannel'],'CommunicationChannel',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'group': JsonConverters.toJson(group,'GroupDefinition',context!),
        'channel': JsonConverters.toJson(channel,'CommunicationChannel',context!),
        'originChannel': JsonConverters.toJson(originChannel,'CommunicationChannel',context!)
    };

    getTypeName() => "ProjectCommunicationGroupSaved";
    TypeContext? context = _ctx;
}

class ProjectCommunicationTagFromGroupDeleted implements IConvertible, IPost
{
    Tag? groupTag;
    Tag? removedTag;

    ProjectCommunicationTagFromGroupDeleted({this.groupTag,this.removedTag});
    ProjectCommunicationTagFromGroupDeleted.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        groupTag = JsonConverters.fromJson(json['groupTag'],'Tag',context!);
        removedTag = JsonConverters.fromJson(json['removedTag'],'Tag',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'groupTag': JsonConverters.toJson(groupTag,'Tag',context!),
        'removedTag': JsonConverters.toJson(removedTag,'Tag',context!)
    };

    getTypeName() => "ProjectCommunicationTagFromGroupDeleted";
    TypeContext? context = _ctx;
}

class ProjectCommunicationGroupDeleted implements IConvertible, IPost
{
    Tag? groupTag;

    ProjectCommunicationGroupDeleted({this.groupTag});
    ProjectCommunicationGroupDeleted.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        groupTag = JsonConverters.fromJson(json['groupTag'],'Tag',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'groupTag': JsonConverters.toJson(groupTag,'Tag',context!)
    };

    getTypeName() => "ProjectCommunicationGroupDeleted";
    TypeContext? context = _ctx;
}

class ProjectCommunicationTagSaved implements IConvertible, IPost
{
    TagDefinition? tag;
    Tag? groupTag;
    CommunicationChannel? channel;

    ProjectCommunicationTagSaved({this.tag,this.groupTag,this.channel});
    ProjectCommunicationTagSaved.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        tag = JsonConverters.fromJson(json['tag'],'TagDefinition',context!);
        groupTag = JsonConverters.fromJson(json['groupTag'],'Tag',context!);
        channel = JsonConverters.fromJson(json['channel'],'CommunicationChannel',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'tag': JsonConverters.toJson(tag,'TagDefinition',context!),
        'groupTag': JsonConverters.toJson(groupTag,'Tag',context!),
        'channel': JsonConverters.toJson(channel,'CommunicationChannel',context!)
    };

    getTypeName() => "ProjectCommunicationTagSaved";
    TypeContext? context = _ctx;
}

class ProjectCommunicationTagDeleted implements IConvertible, IPost
{
    Tag? tag;

    ProjectCommunicationTagDeleted({this.tag});
    ProjectCommunicationTagDeleted.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        tag = JsonConverters.fromJson(json['tag'],'Tag',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'tag': JsonConverters.toJson(tag,'Tag',context!)
    };

    getTypeName() => "ProjectCommunicationTagDeleted";
    TypeContext? context = _ctx;
}

class ProjectCreated implements IConvertible, IPost
{
    ProjectId? id;
    ProjectName? name;
    IntegrationId? databaseIntegrationId;
    ProjectRegion? primaryRegion;
    List<ProjectRegion>? additionalRegions;
    String? description;
    bool? isProvisioning;

    ProjectCreated({this.id,this.name,this.databaseIntegrationId,this.primaryRegion,this.additionalRegions,this.description,this.isProvisioning});
    ProjectCreated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'ProjectId',context!);
        name = JsonConverters.fromJson(json['name'],'ProjectName',context!);
        databaseIntegrationId = JsonConverters.fromJson(json['databaseIntegrationId'],'IntegrationId',context!);
        primaryRegion = JsonConverters.fromJson(json['primaryRegion'],'ProjectRegion',context!);
        additionalRegions = JsonConverters.fromJson(json['additionalRegions'],'List<ProjectRegion>',context!);
        description = json['description'];
        isProvisioning = json['isProvisioning'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'ProjectId',context!),
        'name': JsonConverters.toJson(name,'ProjectName',context!),
        'databaseIntegrationId': JsonConverters.toJson(databaseIntegrationId,'IntegrationId',context!),
        'primaryRegion': JsonConverters.toJson(primaryRegion,'ProjectRegion',context!),
        'additionalRegions': JsonConverters.toJson(additionalRegions,'List<ProjectRegion>',context!),
        'description': description,
        'isProvisioning': isProvisioning
    };

    getTypeName() => "ProjectCreated";
    TypeContext? context = _ctx;
}

class ProjectDeleted implements IConvertible, IPost
{
    ProjectDeleted();
    ProjectDeleted.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "ProjectDeleted";
    TypeContext? context = _ctx;
}

class ProjectActivated implements IConvertible, IPost
{
    ProjectActivated();
    ProjectActivated.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "ProjectActivated";
    TypeContext? context = _ctx;
}

class ProjectDisabled implements IConvertible, IPost
{
    ProjectDisabled();
    ProjectDisabled.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "ProjectDisabled";
    TypeContext? context = _ctx;
}

class ProjectNameChanged implements IConvertible, IPost
{
    ProjectName? projectName;

    ProjectNameChanged({this.projectName});
    ProjectNameChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        projectName = JsonConverters.fromJson(json['projectName'],'ProjectName',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'projectName': JsonConverters.toJson(projectName,'ProjectName',context!)
    };

    getTypeName() => "ProjectNameChanged";
    TypeContext? context = _ctx;
}

class ProjectDescriptionChanged implements IConvertible, IPost
{
    String? description;

    ProjectDescriptionChanged({this.description});
    ProjectDescriptionChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        description = json['description'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'description': description
    };

    getTypeName() => "ProjectDescriptionChanged";
    TypeContext? context = _ctx;
}

class ProjectMarketingUrlChanged implements IConvertible, IPost
{
    DomainUrl? url;

    ProjectMarketingUrlChanged({this.url});
    ProjectMarketingUrlChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        url = JsonConverters.fromJson(json['url'],'DomainUrl',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'url': JsonConverters.toJson(url,'DomainUrl',context!)
    };

    getTypeName() => "ProjectMarketingUrlChanged";
    TypeContext? context = _ctx;
}

class ProjectAllowedOriginsChanged implements IConvertible, IPost
{
    List<DomainUrl>? origins;

    ProjectAllowedOriginsChanged({this.origins});
    ProjectAllowedOriginsChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        origins = JsonConverters.fromJson(json['origins'],'List<DomainUrl>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'origins': JsonConverters.toJson(origins,'List<DomainUrl>',context!)
    };

    getTypeName() => "ProjectAllowedOriginsChanged";
    TypeContext? context = _ctx;
}

class ProjectDefaultLanguageChanged implements IConvertible, IPost
{
    Language? language;

    ProjectDefaultLanguageChanged({this.language});
    ProjectDefaultLanguageChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        language = JsonConverters.fromJson(json['language'],'Language',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'language': JsonConverters.toJson(language,'Language',context!)
    };

    getTypeName() => "ProjectDefaultLanguageChanged";
    TypeContext? context = _ctx;
}

class ProjectLanguagesChanged implements IConvertible, IPost
{
    List<Language> languages = [];

    ProjectLanguagesChanged({this.languages=const []});
    ProjectLanguagesChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        languages = JsonConverters.fromJson(json['languages'],'List<Language>',context!) ?? [];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'languages': JsonConverters.toJson(languages,'List<Language>',context!)
    };

    getTypeName() => "ProjectLanguagesChanged";
    TypeContext? context = _ctx;
}

class ProjectLogoChanged implements IConvertible, IPost
{
    ProjectLogo? logo;

    ProjectLogoChanged({this.logo});
    ProjectLogoChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        logo = JsonConverters.fromJson(json['logo'],'ProjectLogo',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'logo': JsonConverters.toJson(logo,'ProjectLogo',context!)
    };

    getTypeName() => "ProjectLogoChanged";
    TypeContext? context = _ctx;
}

class ProjectIconChanged implements IConvertible, IPost
{
    ProjectIcon? icon;

    ProjectIconChanged({this.icon});
    ProjectIconChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        icon = JsonConverters.fromJson(json['icon'],'ProjectIcon',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'icon': JsonConverters.toJson(icon,'ProjectIcon',context!)
    };

    getTypeName() => "ProjectIconChanged";
    TypeContext? context = _ctx;
}

class ProjectMainColorChanged implements IConvertible, IPost
{
    BrandColor? color;

    ProjectMainColorChanged({this.color});
    ProjectMainColorChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        color = JsonConverters.fromJson(json['color'],'BrandColor',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'color': JsonConverters.toJson(color,'BrandColor',context!)
    };

    getTypeName() => "ProjectMainColorChanged";
    TypeContext? context = _ctx;
}

class ProjectAccentColorChanged implements IConvertible, IPost
{
    BrandColor? color;

    ProjectAccentColorChanged({this.color});
    ProjectAccentColorChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        color = JsonConverters.fromJson(json['color'],'BrandColor',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'color': JsonConverters.toJson(color,'BrandColor',context!)
    };

    getTypeName() => "ProjectAccentColorChanged";
    TypeContext? context = _ctx;
}

class ProjectRegionsChanged implements IConvertible, IPost
{
    ProjectRegion? primaryRegion;
    List<ProjectRegion>? additionalRegions;

    ProjectRegionsChanged({this.primaryRegion,this.additionalRegions});
    ProjectRegionsChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        primaryRegion = JsonConverters.fromJson(json['primaryRegion'],'ProjectRegion',context!);
        additionalRegions = JsonConverters.fromJson(json['additionalRegions'],'List<ProjectRegion>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'primaryRegion': JsonConverters.toJson(primaryRegion,'ProjectRegion',context!),
        'additionalRegions': JsonConverters.toJson(additionalRegions,'List<ProjectRegion>',context!)
    };

    getTypeName() => "ProjectRegionsChanged";
    TypeContext? context = _ctx;
}

class ProjectTimeZoneChanged implements IConvertible, IPost
{
    TimeZone? timeZone;

    ProjectTimeZoneChanged({this.timeZone});
    ProjectTimeZoneChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        timeZone = JsonConverters.fromJson(json['timeZone'],'TimeZone',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'timeZone': JsonConverters.toJson(timeZone,'TimeZone',context!)
    };

    getTypeName() => "ProjectTimeZoneChanged";
    TypeContext? context = _ctx;
}

class ProjectPaymentZonesChanged implements IConvertible, IPost
{
    List<TimeZone>? paymentZones;

    ProjectPaymentZonesChanged({this.paymentZones});
    ProjectPaymentZonesChanged.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        paymentZones = JsonConverters.fromJson(json['paymentZones'],'List<TimeZone>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'paymentZones': JsonConverters.toJson(paymentZones,'List<TimeZone>',context!)
    };

    getTypeName() => "ProjectPaymentZonesChanged";
    TypeContext? context = _ctx;
}

class ProjectCommunicationSet implements IConvertible, IPost
{
    ProjectCommunication? projectCommunication;

    ProjectCommunicationSet({this.projectCommunication});
    ProjectCommunicationSet.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        projectCommunication = JsonConverters.fromJson(json['projectCommunication'],'ProjectCommunication',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'projectCommunication': JsonConverters.toJson(projectCommunication,'ProjectCommunication',context!)
    };

    getTypeName() => "ProjectCommunicationSet";
    TypeContext? context = _ctx;
}

class AccountUserPushDeviceCreated implements IConvertible, IPost
{
    AuthId? authId;
    PushDevice? pushDevice;

    AccountUserPushDeviceCreated({this.authId,this.pushDevice});
    AccountUserPushDeviceCreated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        authId = JsonConverters.fromJson(json['authId'],'AuthId',context!);
        pushDevice = JsonConverters.fromJson(json['pushDevice'],'PushDevice',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'authId': JsonConverters.toJson(authId,'AuthId',context!),
        'pushDevice': JsonConverters.toJson(pushDevice,'PushDevice',context!)
    };

    getTypeName() => "AccountUserPushDeviceCreated";
    TypeContext? context = _ctx;
}

/**
* AI
*/
// @Route("/{version}/chat/complete", "POST")
// @Api(Description="AI")
// @DataContract
class AskChatRequest extends CodeMashRequestBase implements IReturn<AskChatResponse>, IConvertible, IPost
{
    // @DataMember
    String prompt = "";

    AskChatRequest({this.prompt=""});
    AskChatRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        prompt = json['prompt'] ?? "";
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'prompt': prompt
    });

    createResponse() => AskChatResponse();
    getResponseTypeName() => "AskChatResponse";
    getTypeName() => "AskChatRequest";
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

class PushIntegrationSaved implements IConvertible, IPost
{
    PushIntegration? integration;

    PushIntegrationSaved({this.integration});
    PushIntegrationSaved.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        integration = JsonConverters.fromJson(json['integration'],'PushIntegration',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'integration': JsonConverters.toJson(integration,'PushIntegration',context!)
    };

    getTypeName() => "PushIntegrationSaved";
    TypeContext? context = _ctx;
}

class PushIntegrationRenamed implements IConvertible, IPost
{
    IntegrationId? id;
    DisplayName? name;
    Env? env;

    PushIntegrationRenamed({this.id,this.name,this.env});
    PushIntegrationRenamed.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'IntegrationId',context!);
        name = JsonConverters.fromJson(json['name'],'DisplayName',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'IntegrationId',context!),
        'name': JsonConverters.toJson(name,'DisplayName',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushIntegrationRenamed";
    TypeContext? context = _ctx;
}

class PushIntegrationSetAsDefault implements IConvertible, IPost
{
    Env? env;
    IntegrationId? id;

    PushIntegrationSetAsDefault({this.env,this.id});
    PushIntegrationSetAsDefault.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        id = JsonConverters.fromJson(json['id'],'IntegrationId',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'env': JsonConverters.toJson(env,'Env',context!),
        'id': JsonConverters.toJson(id,'IntegrationId',context!)
    };

    getTypeName() => "PushIntegrationSetAsDefault";
    TypeContext? context = _ctx;
}

class PushIntegrationDeleted implements IConvertible, IPost
{
    IntegrationId? id;
    Env? env;

    PushIntegrationDeleted({this.id,this.env});
    PushIntegrationDeleted.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'IntegrationId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'IntegrationId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushIntegrationDeleted";
    TypeContext? context = _ctx;
}

class PushIntegrationEnabled implements IConvertible, IPost
{
    IntegrationId? id;
    Env? env;

    PushIntegrationEnabled({this.id,this.env});
    PushIntegrationEnabled.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'IntegrationId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'IntegrationId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushIntegrationEnabled";
    TypeContext? context = _ctx;
}

class PushIntegrationDisabled implements IConvertible, IPost
{
    IntegrationId? id;
    Env? env;

    PushIntegrationDisabled({this.id,this.env});
    PushIntegrationDisabled.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = JsonConverters.fromJson(json['id'],'IntegrationId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': JsonConverters.toJson(id,'IntegrationId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushIntegrationDisabled";
    TypeContext? context = _ctx;
}

class PushServiceEstablished implements IConvertible, IPost
{
    List<PushTemplate>? defaultTemplates;

    PushServiceEstablished({this.defaultTemplates});
    PushServiceEstablished.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        defaultTemplates = JsonConverters.fromJson(json['defaultTemplates'],'List<PushTemplate>',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'defaultTemplates': JsonConverters.toJson(defaultTemplates,'List<PushTemplate>',context!)
    };

    getTypeName() => "PushServiceEstablished";
    TypeContext? context = _ctx;
}

class PushServiceEnabled implements IConvertible, IPost
{
    PushServiceEnabled();
    PushServiceEnabled.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "PushServiceEnabled";
    TypeContext? context = _ctx;
}

class PushServiceDisabled implements IConvertible, IPost
{
    PushServiceDisabled();
    PushServiceDisabled.fromJson(Map<String, dynamic> json) : super();
    fromMap(Map<String, dynamic> json) {
        return this;
    }

    Map<String, dynamic> toJson() => {};
    getTypeName() => "PushServiceDisabled";
    TypeContext? context = _ctx;
}

class PushTemplateCreated implements IConvertible, IPost
{
    TemplateId? templateId;
    DisplayName? displayName;
    List<MessageTranslation<PushMessageContent>> translations = [];
    CommunicationChannel? channel;
    String? description;
    List<Tag>? tags;
    Env? env;

    PushTemplateCreated({this.templateId,this.displayName,this.translations=const [],this.channel,this.description,this.tags,this.env});
    PushTemplateCreated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        templateId = JsonConverters.fromJson(json['templateId'],'TemplateId',context!);
        displayName = JsonConverters.fromJson(json['displayName'],'DisplayName',context!);
        translations = JsonConverters.fromJson(json['translations'],'List<MessageTranslation<PushMessageContent>>',context!) ?? [];
        channel = JsonConverters.fromJson(json['channel'],'CommunicationChannel',context!);
        description = json['description'];
        tags = JsonConverters.fromJson(json['tags'],'List<Tag>',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'templateId': JsonConverters.toJson(templateId,'TemplateId',context!),
        'displayName': JsonConverters.toJson(displayName,'DisplayName',context!),
        'translations': JsonConverters.toJson(translations,'List<MessageTranslation<PushMessageContent>>',context!),
        'channel': JsonConverters.toJson(channel,'CommunicationChannel',context!),
        'description': description,
        'tags': JsonConverters.toJson(tags,'List<Tag>',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushTemplateCreated";
    TypeContext? context = _ctx;
}

class PushTemplateUpdated implements IConvertible, IPost
{
    TemplateId? templateId;
    DisplayName? displayName;
    List<MessageTranslation<PushMessageContent>> translations = [];
    CommunicationChannel? channel;
    String? description;
    List<Tag>? tags;
    Env? env;

    PushTemplateUpdated({this.templateId,this.displayName,this.translations=const [],this.channel,this.description,this.tags,this.env});
    PushTemplateUpdated.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        templateId = JsonConverters.fromJson(json['templateId'],'TemplateId',context!);
        displayName = JsonConverters.fromJson(json['displayName'],'DisplayName',context!);
        translations = JsonConverters.fromJson(json['translations'],'List<MessageTranslation<PushMessageContent>>',context!) ?? [];
        channel = JsonConverters.fromJson(json['channel'],'CommunicationChannel',context!);
        description = json['description'];
        tags = JsonConverters.fromJson(json['tags'],'List<Tag>',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'templateId': JsonConverters.toJson(templateId,'TemplateId',context!),
        'displayName': JsonConverters.toJson(displayName,'DisplayName',context!),
        'translations': JsonConverters.toJson(translations,'List<MessageTranslation<PushMessageContent>>',context!),
        'channel': JsonConverters.toJson(channel,'CommunicationChannel',context!),
        'description': description,
        'tags': JsonConverters.toJson(tags,'List<Tag>',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushTemplateUpdated";
    TypeContext? context = _ctx;
}

class PushTemplateDeleted implements IConvertible, IPost
{
    TemplateId? templateId;
    Env? env;

    PushTemplateDeleted({this.templateId,this.env});
    PushTemplateDeleted.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        templateId = JsonConverters.fromJson(json['templateId'],'TemplateId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'templateId': JsonConverters.toJson(templateId,'TemplateId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushTemplateDeleted";
    TypeContext? context = _ctx;
}

class PushTemplateArchived implements IConvertible, IPost
{
    TemplateId? templateId;
    Env? env;

    PushTemplateArchived({this.templateId,this.env});
    PushTemplateArchived.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        templateId = JsonConverters.fromJson(json['templateId'],'TemplateId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'templateId': JsonConverters.toJson(templateId,'TemplateId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushTemplateArchived";
    TypeContext? context = _ctx;
}

class PushTemplateUnArchived implements IConvertible, IPost
{
    TemplateId? templateId;
    Env? env;

    PushTemplateUnArchived({this.templateId,this.env});
    PushTemplateUnArchived.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        templateId = JsonConverters.fromJson(json['templateId'],'TemplateId',context!);
        env = JsonConverters.fromJson(json['env'],'Env',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'templateId': JsonConverters.toJson(templateId,'TemplateId',context!),
        'env': JsonConverters.toJson(env,'Env',context!)
    };

    getTypeName() => "PushTemplateUnArchived";
    TypeContext? context = _ctx;
}

class PushTemplateMirrored implements IConvertible, IPost
{
    PushTemplate? template;

    PushTemplateMirrored({this.template});
    PushTemplateMirrored.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        template = JsonConverters.fromJson(json['template'],'PushTemplate',context!);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'template': JsonConverters.toJson(template,'PushTemplate',context!)
    };

    getTypeName() => "PushTemplateMirrored";
    TypeContext? context = _ctx;
}

TypeContext _ctx = TypeContext(library: 'localhost', types: <String, TypeInfo> {
    'RequestBase': TypeInfo(TypeOf.Class, create:() => RequestBase()),
    'ICultureBasedRequest': TypeInfo(TypeOf.Interface),
    'IVersionBasedRequest': TypeInfo(TypeOf.Interface),
    'IHasCorrelationIdRequest': TypeInfo(TypeOf.Interface),
    'EmailAddress': TypeInfo(TypeOf.Class, create:() => EmailAddress()),
    'DisplayName': TypeInfo(TypeOf.Class, create:() => DisplayName()),
    'AggregateId': TypeInfo(TypeOf.AbstractClass),
    'AccountId': TypeInfo(TypeOf.Class, create:() => AccountId()),
    'UtcDateTime': TypeInfo(TypeOf.Class, create:() => UtcDateTime()),
    'TimeUnit': TypeInfo(TypeOf.Enum, enumValues:TimeUnit.values),
    'ExpirationToken': TypeInfo(TypeOf.Class, create:() => ExpirationToken()),
    'CodeMashSubscriptionId': TypeInfo(TypeOf.Class, create:() => CodeMashSubscriptionId()),
    'ProjectId': TypeInfo(TypeOf.Class, create:() => ProjectId()),
    'IntegrationId': TypeInfo(TypeOf.Class, create:() => IntegrationId()),
    'ResourceRefKind': TypeInfo(TypeOf.Enum, enumValues:ResourceRefKind.values),
    'ResourceRef': TypeInfo(TypeOf.AbstractClass),
    'ResourceSource': TypeInfo(TypeOf.Enum, enumValues:ResourceSource.values),
    'PaymentCustomerRef': TypeInfo(TypeOf.Class, create:() => PaymentCustomerRef()),
    'Quantity': TypeInfo(TypeOf.Class, create:() => Quantity()),
    'CodeMashManagedServiceSubscription': TypeInfo(TypeOf.Class, create:() => CodeMashManagedServiceSubscription()),
    'DomainUrl': TypeInfo(TypeOf.Class, create:() => DomainUrl()),
    'Uri': TypeInfo(TypeOf.Class, create:() => Uri()),
    'CodeMashLicense': TypeInfo(TypeOf.Class, create:() => CodeMashLicense()),
    'Tag': TypeInfo(TypeOf.Class, create:() => Tag()),
    'TagDescription': TypeInfo(TypeOf.Class, create:() => TagDescription()),
    'MessageTranslation<TContent>': TypeInfo(TypeOf.GenericDef,create:() => MessageTranslation()),
    'TagTranslation': TypeInfo(TypeOf.Class, create:() => TagTranslation()),
    'BaseTagDefinition': TypeInfo(TypeOf.AbstractClass),
    'List<TagTranslation>': TypeInfo(TypeOf.Class, create:() => <TagTranslation>[]),
    'GroupDefinition': TypeInfo(TypeOf.Class, create:() => GroupDefinition()),
    'CommunicationChannel': TypeInfo(TypeOf.Enum, enumValues:CommunicationChannel.values),
    'DeliveryChannel': TypeInfo(TypeOf.Enum, enumValues:DeliveryChannel.values),
    'TagDefinition': TypeInfo(TypeOf.Class, create:() => TagDefinition()),
    'Map<DeliveryChannel,bool?>': TypeInfo(TypeOf.Class, create:() => Map<DeliveryChannel,bool?>()),
    'ProjectName': TypeInfo(TypeOf.Class, create:() => ProjectName()),
    'NorbixRegion': TypeInfo(TypeOf.Class, create:() => NorbixRegion()),
    'Continent': TypeInfo(TypeOf.Enum, enumValues:Continent.values),
    'ProjectRegion': TypeInfo(TypeOf.Class, create:() => ProjectRegion()),
    'Language': TypeInfo(TypeOf.Class, create:() => Language()),
    'FileResourceId': TypeInfo(TypeOf.Class, create:() => FileResourceId()),
    'FileChecksum': TypeInfo(TypeOf.Class, create:() => FileChecksum()),
    'FileResource': TypeInfo(TypeOf.Class, create:() => FileResource()),
    'FileProvider': TypeInfo(TypeOf.Enum, enumValues:FileProvider.values),
    'FileResourceRef': TypeInfo(TypeOf.Class, create:() => FileResourceRef()),
    'ProjectLogo': TypeInfo(TypeOf.Class, create:() => ProjectLogo()),
    'ProjectIcon': TypeInfo(TypeOf.Class, create:() => ProjectIcon()),
    'BrandColor': TypeInfo(TypeOf.Class, create:() => BrandColor()),
    'TimeZone': TypeInfo(TypeOf.Class, create:() => TimeZone()),
    'GroupTags': TypeInfo(TypeOf.Class, create:() => GroupTags()),
    'List<Tag>': TypeInfo(TypeOf.Class, create:() => <Tag>[]),
    'ProjectCommunicationChannel': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationChannel()),
    'List<GroupTags>': TypeInfo(TypeOf.Class, create:() => <GroupTags>[]),
    'ProjectCommunication': TypeInfo(TypeOf.Class, create:() => ProjectCommunication()),
    'List<ProjectCommunicationChannel>': TypeInfo(TypeOf.Class, create:() => <ProjectCommunicationChannel>[]),
    'List<GroupDefinition>': TypeInfo(TypeOf.Class, create:() => <GroupDefinition>[]),
    'List<TagDefinition>': TypeInfo(TypeOf.Class, create:() => <TagDefinition>[]),
    'AuthId': TypeInfo(TypeOf.Class, create:() => AuthId()),
    'DeviceId': TypeInfo(TypeOf.Class, create:() => DeviceId()),
    'DeviceType': TypeInfo(TypeOf.Enum, enumValues:DeviceType.values),
    'PushDeviceToken': TypeInfo(TypeOf.Class, create:() => PushDeviceToken()),
    'PushDeviceDeliveryFamily': TypeInfo(TypeOf.Enum, enumValues:PushDeviceDeliveryFamily.values),
    'PushDeviceDeliveryToken': TypeInfo(TypeOf.Class, create:() => PushDeviceDeliveryToken()),
    'PushDevice': TypeInfo(TypeOf.Class, create:() => PushDevice()),
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
    'Env': TypeInfo(TypeOf.Class, create:() => Env()),
    'CursorArgs': TypeInfo(TypeOf.Class, create:() => CursorArgs()),
    'PagingArgs': TypeInfo(TypeOf.Class, create:() => PagingArgs()),
    'CodeMashListPaginationRequestBase': TypeInfo(TypeOf.Class, create:() => CodeMashListPaginationRequestBase()),
    'IPasskeyCeremonyRequest': TypeInfo(TypeOf.Interface),
    'Integration': TypeInfo(TypeOf.AbstractClass),
    'IReadOnlyList<String>': TypeInfo(TypeOf.Class, create:() => IReadOnlyList<String>()),
    'PushProvider': TypeInfo(TypeOf.Enum, enumValues:PushProvider.values),
    'PushIntegration': TypeInfo(TypeOf.AbstractClass),
    'TemplateId': TypeInfo(TypeOf.Class, create:() => TemplateId()),
    'Template<TMessageContent>': TypeInfo(TypeOf.GenericDef,create:() => Template()),
    'List<MessageTranslation<TMessageContent>>': TypeInfo(TypeOf.Class, create:() => <MessageTranslation<TMessageContent>>[]),
    'MessageTranslation<TMessageContent>': TypeInfo(TypeOf.Class, create:() => MessageTranslation<TMessageContent>()),
    'TMessageContent': TypeInfo(TypeOf.Class, create:() => TMessageContent()),
    'TemplateCode': TypeInfo(TypeOf.Class, create:() => TemplateCode()),
    'PushTitle': TypeInfo(TypeOf.Class, create:() => PushTitle()),
    'PushBody': TypeInfo(TypeOf.Class, create:() => PushBody()),
    'PushMessageContent': TypeInfo(TypeOf.Class, create:() => PushMessageContent()),
    'PushTemplate': TypeInfo(TypeOf.Class, create:() => PushTemplate()),
    'CodeMashRelease': TypeInfo(TypeOf.Enum, enumValues:CodeMashRelease.values),
    'CodeMashRuntime': TypeInfo(TypeOf.Enum, enumValues:CodeMashRuntime.values),
    'EchoLicenseDto': TypeInfo(TypeOf.Class, create:() => EchoLicenseDto()),
    'EchoRegionDto': TypeInfo(TypeOf.Class, create:() => EchoRegionDto()),
    'PublicBrandDto': TypeInfo(TypeOf.Class, create:() => PublicBrandDto()),
    'PublicPasswordPolicyDto': TypeInfo(TypeOf.Class, create:() => PublicPasswordPolicyDto()),
    'PublicAuthDto': TypeInfo(TypeOf.Class, create:() => PublicAuthDto()),
    'ErrorDto': TypeInfo(TypeOf.Class, create:() => ErrorDto()),
    'List<ErrorDto>': TypeInfo(TypeOf.Class, create:() => <ErrorDto>[]),
    'CodeMashResponseStatus': TypeInfo(TypeOf.Class, create:() => CodeMashResponseStatus()),
    'ResponseBase': TypeInfo(TypeOf.Class, create:() => ResponseBase()),
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
    'TriggerType': TypeInfo(TypeOf.Enum, enumValues:TriggerType.values),
    'TriggerActionType': TypeInfo(TypeOf.Enum, enumValues:TriggerActionType.values),
    'TriggerActionDto': TypeInfo(TypeOf.AbstractClass),
    'TriggerDto': TypeInfo(TypeOf.Class, create:() => TriggerDto()),
    'SchemaDto': TypeInfo(TypeOf.Class, create:() => SchemaDto()),
    'List<TriggerDto>': TypeInfo(TypeOf.Class, create:() => <TriggerDto>[]),
    'SchemaListProjection': TypeInfo(TypeOf.Class, create:() => SchemaListProjection()),
    'FileChecksumDto': TypeInfo(TypeOf.Class, create:() => FileChecksumDto()),
    'FileResourceDto': TypeInfo(TypeOf.Class, create:() => FileResourceDto()),
    'FileResourceRefDto': TypeInfo(TypeOf.Class, create:() => FileResourceRefDto()),
    'IHasDomainEntityId': TypeInfo(TypeOf.Interface),
    'IIntegrationIdentification': TypeInfo(TypeOf.Interface),
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
    'AskChatResponse': TypeInfo(TypeOf.Class, create:() => AskChatResponse()),
    'GetUserResponse': TypeInfo(TypeOf.Class, create:() => GetUserResponse()),
    'GetUsersResponse': TypeInfo(TypeOf.Class, create:() => GetUsersResponse()),
    'PaginatedResponse<AuthDto>': TypeInfo(TypeOf.Class, create:() => PaginatedResponse<AuthDto>()),
    'GetUserPreferencesResponse': TypeInfo(TypeOf.Class, create:() => GetUserPreferencesResponse()),
    'PasskeyCeremonyOptionsResponse': TypeInfo(TypeOf.Class, create:() => PasskeyCeremonyOptionsResponse()),
    'PasskeyAuthTokensResponse': TypeInfo(TypeOf.Class, create:() => PasskeyAuthTokensResponse()),
    'PasskeyListResponse': TypeInfo(TypeOf.Class, create:() => PasskeyListResponse()),
    'List<PasskeyListItemDto>': TypeInfo(TypeOf.Class, create:() => <PasskeyListItemDto>[]),
    'PasskeyOkResponse': TypeInfo(TypeOf.Class, create:() => PasskeyOkResponse()),
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
    'RequestUploadUrlResponse': TypeInfo(TypeOf.Class, create:() => RequestUploadUrlResponse()),
    'Echo': TypeInfo(TypeOf.Class, create:() => Echo()),
    'GetPublicProjectConfig': TypeInfo(TypeOf.Class, create:() => GetPublicProjectConfig()),
    'GetPublicProjectLegal': TypeInfo(TypeOf.Class, create:() => GetPublicProjectLegal()),
    'AccountCreated': TypeInfo(TypeOf.Class, create:() => AccountCreated()),
    'AccountVerified': TypeInfo(TypeOf.Class, create:() => AccountVerified()),
    'AccountSetAsActive': TypeInfo(TypeOf.Class, create:() => AccountSetAsActive()),
    'AccountValidationTokenIssued': TypeInfo(TypeOf.Class, create:() => AccountValidationTokenIssued()),
    'AccountBlocked': TypeInfo(TypeOf.Class, create:() => AccountBlocked()),
    'AccountProfileUpdated': TypeInfo(TypeOf.Class, create:() => AccountProfileUpdated()),
    'AccountSetAsInactive': TypeInfo(TypeOf.Class, create:() => AccountSetAsInactive()),
    'AccountUnregistered': TypeInfo(TypeOf.Class, create:() => AccountUnregistered()),
    'LicenseCreated': TypeInfo(TypeOf.Class, create:() => LicenseCreated()),
    'CustomerCreated': TypeInfo(TypeOf.Class, create:() => CustomerCreated()),
    'SubscriptionChanged': TypeInfo(TypeOf.Class, create:() => SubscriptionChanged()),
    'SubscriptionCanceled': TypeInfo(TypeOf.Class, create:() => SubscriptionCanceled()),
    'ProjectCommunicationGroupSaved': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationGroupSaved()),
    'ProjectCommunicationTagFromGroupDeleted': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationTagFromGroupDeleted()),
    'ProjectCommunicationGroupDeleted': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationGroupDeleted()),
    'ProjectCommunicationTagSaved': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationTagSaved()),
    'ProjectCommunicationTagDeleted': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationTagDeleted()),
    'ProjectCreated': TypeInfo(TypeOf.Class, create:() => ProjectCreated()),
    'List<ProjectRegion>': TypeInfo(TypeOf.Class, create:() => <ProjectRegion>[]),
    'ProjectDeleted': TypeInfo(TypeOf.Class, create:() => ProjectDeleted()),
    'ProjectActivated': TypeInfo(TypeOf.Class, create:() => ProjectActivated()),
    'ProjectDisabled': TypeInfo(TypeOf.Class, create:() => ProjectDisabled()),
    'ProjectNameChanged': TypeInfo(TypeOf.Class, create:() => ProjectNameChanged()),
    'ProjectDescriptionChanged': TypeInfo(TypeOf.Class, create:() => ProjectDescriptionChanged()),
    'ProjectMarketingUrlChanged': TypeInfo(TypeOf.Class, create:() => ProjectMarketingUrlChanged()),
    'ProjectAllowedOriginsChanged': TypeInfo(TypeOf.Class, create:() => ProjectAllowedOriginsChanged()),
    'List<DomainUrl>': TypeInfo(TypeOf.Class, create:() => <DomainUrl>[]),
    'ProjectDefaultLanguageChanged': TypeInfo(TypeOf.Class, create:() => ProjectDefaultLanguageChanged()),
    'ProjectLanguagesChanged': TypeInfo(TypeOf.Class, create:() => ProjectLanguagesChanged()),
    'List<Language>': TypeInfo(TypeOf.Class, create:() => <Language>[]),
    'ProjectLogoChanged': TypeInfo(TypeOf.Class, create:() => ProjectLogoChanged()),
    'ProjectIconChanged': TypeInfo(TypeOf.Class, create:() => ProjectIconChanged()),
    'ProjectMainColorChanged': TypeInfo(TypeOf.Class, create:() => ProjectMainColorChanged()),
    'ProjectAccentColorChanged': TypeInfo(TypeOf.Class, create:() => ProjectAccentColorChanged()),
    'ProjectRegionsChanged': TypeInfo(TypeOf.Class, create:() => ProjectRegionsChanged()),
    'ProjectTimeZoneChanged': TypeInfo(TypeOf.Class, create:() => ProjectTimeZoneChanged()),
    'ProjectPaymentZonesChanged': TypeInfo(TypeOf.Class, create:() => ProjectPaymentZonesChanged()),
    'List<TimeZone>': TypeInfo(TypeOf.Class, create:() => <TimeZone>[]),
    'ProjectCommunicationSet': TypeInfo(TypeOf.Class, create:() => ProjectCommunicationSet()),
    'AccountUserPushDeviceCreated': TypeInfo(TypeOf.Class, create:() => AccountUserPushDeviceCreated()),
    'AskChatRequest': TypeInfo(TypeOf.Class, create:() => AskChatRequest()),
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
    'DeleteFileApiRequest': TypeInfo(TypeOf.Class, create:() => DeleteFileApiRequest()),
    'DeleteManyFilesApiRequest': TypeInfo(TypeOf.Class, create:() => DeleteManyFilesApiRequest()),
    'DownloadFileApiRequest': TypeInfo(TypeOf.Class, create:() => DownloadFileApiRequest()),
    'GetFileInfoRequest': TypeInfo(TypeOf.Class, create:() => GetFileInfoRequest()),
    'GetSignedUrlRequest': TypeInfo(TypeOf.Class, create:() => GetSignedUrlRequest()),
    'ListFilesRequest': TypeInfo(TypeOf.Class, create:() => ListFilesRequest()),
    'RequestUploadUrlRequest': TypeInfo(TypeOf.Class, create:() => RequestUploadUrlRequest()),
    'PushIntegrationSaved': TypeInfo(TypeOf.Class, create:() => PushIntegrationSaved()),
    'PushIntegrationRenamed': TypeInfo(TypeOf.Class, create:() => PushIntegrationRenamed()),
    'PushIntegrationSetAsDefault': TypeInfo(TypeOf.Class, create:() => PushIntegrationSetAsDefault()),
    'PushIntegrationDeleted': TypeInfo(TypeOf.Class, create:() => PushIntegrationDeleted()),
    'PushIntegrationEnabled': TypeInfo(TypeOf.Class, create:() => PushIntegrationEnabled()),
    'PushIntegrationDisabled': TypeInfo(TypeOf.Class, create:() => PushIntegrationDisabled()),
    'PushServiceEstablished': TypeInfo(TypeOf.Class, create:() => PushServiceEstablished()),
    'List<PushTemplate>': TypeInfo(TypeOf.Class, create:() => <PushTemplate>[]),
    'PushServiceEnabled': TypeInfo(TypeOf.Class, create:() => PushServiceEnabled()),
    'PushServiceDisabled': TypeInfo(TypeOf.Class, create:() => PushServiceDisabled()),
    'PushTemplateCreated': TypeInfo(TypeOf.Class, create:() => PushTemplateCreated()),
    'List<MessageTranslation<PushMessageContent>>': TypeInfo(TypeOf.Class, create:() => <MessageTranslation<PushMessageContent>>[]),
    'MessageTranslation<PushMessageContent>': TypeInfo(TypeOf.Class, create:() => MessageTranslation<PushMessageContent>()),
    'PushTemplateUpdated': TypeInfo(TypeOf.Class, create:() => PushTemplateUpdated()),
    'PushTemplateDeleted': TypeInfo(TypeOf.Class, create:() => PushTemplateDeleted()),
    'PushTemplateArchived': TypeInfo(TypeOf.Class, create:() => PushTemplateArchived()),
    'PushTemplateUnArchived': TypeInfo(TypeOf.Class, create:() => PushTemplateUnArchived()),
    'PushTemplateMirrored': TypeInfo(TypeOf.Class, create:() => PushTemplateMirrored()),
});

