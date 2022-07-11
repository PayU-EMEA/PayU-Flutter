// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionCard _$TransactionCardFromJson(Map<String, dynamic> json) =>
    TransactionCard(
      json['cardInstallmentProposal'] == null
          ? null
          : TransactionCardInstallmentProposal.fromJson(
              json['cardInstallmentProposal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransactionCardToJson(TransactionCard instance) =>
    <String, dynamic>{
      'cardInstallmentProposal': instance.cardInstallmentProposal,
    };
