// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/proxy/beacon/BeaconProxy.sol";

/// @dev See {IHookCoveredCall}.
/// @dev The HookCoveredCall is a BeaconProxy, which allows the implemenation of the protocol to be upgraded in the
/// future. Further, each covered call is mapped to a specific ERC-721 contract address -- meaning there is one covered
/// call contract per collection.
contract HookCoveredCall is BeaconProxy {
  constructor(
    address beacon,
    address nftAddress,
    address protocol,
    address hookVaultFactory,
    address preapprovedMarketplace
  )
    BeaconProxy(
      beacon,
      abi.encodeWithSignature(
        "initialize(address,address,address,address)",
        protocol,
        nftAddress,
        hookVaultFactory,
        preapprovedMarketplace
      )
    )
  {}
}
