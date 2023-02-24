// To parse this JSON data, do
//
//     final btcSources = btcSourcesFromJson(jsonString);

import 'dart:convert';

BtcSources btcSourcesFromJson(String str) => BtcSources.fromJson(json.decode(str));

String btcSourcesToJson(BtcSources data) => json.encode(data.toJson());

class BtcSources {
    BtcSources({
        this.status,
        this.sources,
    });

    String? status;
    List<SourceModel>? sources;

    factory BtcSources.fromJson(Map<String, dynamic> json) => BtcSources(
        status: json["status"],
        sources: List<SourceModel>.from(json["sources"].map((x) => SourceModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "sources": List<dynamic>.from(sources!.map((x) => x.toJson())),
    };
}

class SourceModel {
    SourceModel({
        this.id,
        this.name,
        this.description,
        this.url,
        this.category,
        this.language,
        this.country,
    });

    String? id;
    String? name;
    String? description;
    String? url;
    String? category;
    String? language;
    String? country;

    factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "url": url,
        "category": category,
        "language": language,
        "country": country,
    };
}
