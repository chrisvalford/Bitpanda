//
//  Commodity.swift
//  Bitpanda
//
//  Created by Christopher Alford on 22/3/22.
//  Copyright © 2022 Digital+Marine. All rights reserved.
//

import Foundation

struct Commodity: Codable, Identifiable {
    let id: String
    let type: String
    let attributes: CommodityAttributes
}

struct CommodityAttributes: Codable {
    let symbol: String
    let name: String
    let sort: Int
    let assetTypeName: String
    let assetGroupName: String
    let urlCheckAddress: String
    let urlCheckTransaction: String
    let buyActive: Bool
    let sellActive: Bool
    let withdrawActive: Bool
    let depositActive: Bool
    let transferActive: Bool
    let available: Bool
    let maintenanceEnabled: Bool
    let minBuyEur: String
    let minSellEur: String
    let minWithdrawEur: String
    let defaultSellAmount: String
    let precisionForFiatPrice: Int
    let precisionForCoins: Int
    let precisionForTx: Int
    let walletMinDeposit: String
    let walletSmallDeposit: String
    let walletSmallDepositFee: String
    let avgPrice: String
    let color: String
    let walletWithdrawFee: String
    let change24H: String
    let change24HAmount: String
    let change1W: String
    let change1WAmount: String
    let change1M: String
    let change1MAmount: String
    let change1Y: String
    let change1YAmount: String
    let logo: URL
    let logoDark: URL
    let supportDestinationTag: Bool
    let androidSupportedVersion: String?
    let iosSupportedVersion: String?
    let circulatingSupply: String
    let allowedUnverified: Bool
    let allowedDocumented: Bool
    let allowedVerified: Bool
    let ieoPhases: [IeoPhase]
    let info: String
    let unavailableReason: String
    let maintenanceReason: String
    let walletInfo: String
    let extraInfo: String
    let investmentInfo: String?
    let infoIntegration: String
    let infoDeu: String
    let infoEng: String
    let infoFra: String
    let unavailableReasonDeu: String
    let unavailableReasonEng: String
    let unavailableReasonFra: String
    let maintenanceReasonDeu: String
    let maintenanceReasonEng: String
    let maintenanceReasonFra: String
    let walletInfoDeu: String
    let walletInfoEng: String
    let walletInfoFra: String
    let extraInfoDeu: String
    let extraInfoEng: String
    let extraInfoFra: String
    let investmentInfoDeu: String?
    let investmentInfoEng: String?
    let investmentInfoFra: String?
    let infoIntegrationDeu: String
    let infoIntegrationEng: String
    let infoIntegrationFra: String
}

/*
 {
   "type": "cryptocoin",
   "attributes": {
     "symbol": "BTC",
     "name": "Bitcoin",
     "sort": 10,
     "asset_type_name": "cryptocoin",
     "asset_group_name": "coin",
     "url_check_address": "https://www.blockchain.com/btc/address/%s",
     "url_check_transaction": "https://www.blockchain.com/btc/tx/%s",
     "buy_active": true,
     "sell_active": true,
     "withdraw_active": true,
     "deposit_active": true,
     "transfer_active": true,
     "available": true,
     "maintenance_enabled": false,
     "min_buy_eur": "0.06",
     "min_sell_eur": "1",
     "min_withdraw_eur": "8.94",
     "default_sell_amount": "1",
     "precision_for_fiat_price": 2,
     "precision_for_coins": 4,
     "precision_for_tx": 8,
     "wallet_min_deposit": "0.05000000",
     "wallet_small_deposit": "0.05000000",
     "wallet_small_deposit_fee": "0.00010000",
     "avg_price": "8936.50",
     "color": "#F7931A",
     "wallet_withdraw_fee": "0.0000300000000000",
     "change_24h": "-3.0714208301723",
     "change_24h_amount": "-283.18",
     "change_1w": "5.946739954511",
     "change_1w_amount": "501.60",
     "change_1m": "23.066338254923",
     "change_1m_amount": "1674.97",
     "change_1y": "179.11244265518",
     "change_1y_amount": "5734.74",
     "logo": "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/btc.svg",
     "logo_dark": "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/btc_dark.svg",
     "support_destination_tag": false,
     "android_supported_version": "0.0.1",
     "ios_supported_version": "1.0.0",
     "circulating_supply": "18209712.00000000",
     "allowed_unverified": false,
     "allowed_documented": true,
     "allowed_verified": true,
     "ieo_phases": [],
     "info": "",
     "unavailable_reason": "Wallet under maintenance due to an update. We are working hard to bring it back online as soon as possible.",
     "maintenance_reason": "BTC wallets are in maintenance and currently set to trade only (buy and sell). We are working hard to bring them back online as soon as possible.",
     "wallet_info": "",
     "extra_info": "",
     "investment_info": "",
     "info_integration": "",
     "info_deu": "",
     "info_eng": "",
     "info_fra": "",
     "unavailable_reason_deu": "Aufgrund eines Updates befindet sich die Wallet im Wartungsmodus. Wir bemühen uns die Wallet so schnell wie möglich wieder online zu bringen.",
     "unavailable_reason_eng": "Wallet under maintenance due to an update. We are working hard to bring it back online as soon as possible.",
     "unavailable_reason_fra": "Wallet en maintenance en raison d'une mise à jour. Nous travaillons pour le remettre en ligne dès que possible.",
     "maintenance_reason_deu": "BTC Wallets befinden sich zur Zeit im Wartungsmodus und sind auf Trade Only (Kaufen und verkaufen) eingestellt. Wir bemühen uns die Wallets so schnell wie möglich wieder online zu bringen.",
     "maintenance_reason_eng": "BTC wallets are in maintenance and currently set to trade only (buy and sell). We are working hard to bring them back online as soon as possible.",
     "maintenance_reason_fra": "Les BTC wallets sont en cours de maintenance et actuellement disponibles qu'en trade only (achat et vente). Nous travaillons pour les remettre en ligne dès que possible.",
     "wallet_info_deu": "",
     "wallet_info_eng": "",
     "wallet_info_fra": "",
     "extra_info_deu": "",
     "extra_info_eng": "",
     "extra_info_fra": "",
     "investment_info_deu": "",
     "investment_info_eng": "",
     "investment_info_fra": "",
     "info_integration_deu": "",
     "info_integration_eng": "",
     "info_integration_fra": ""
   },
   "id": "1"
 }
 */
