// Copyright 2020 Parity Technologies (UK) Ltd.
// This file is part of Polkadot.

// Polkadot is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// Polkadot is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with Polkadot.  If not, see <http://www.gnu.org/licenses/>.

use xcm::latest::{MultiAsset, MultiLocation, XcmContext};

/// Filters assets/location pairs.
///
/// Can be amalgamated into tuples. If any item returns `true`, it short-circuits, else `false` is returned.
pub trait FilterAssetLocation {
	/// A filter to distinguish between asset/location pairs.
	fn filter_asset_location(
		asset: &MultiAsset,
		origin: &MultiLocation,
		context: XcmContext,
	) -> bool;
}

#[impl_trait_for_tuples::impl_for_tuples(30)]
impl FilterAssetLocation for Tuple {
	fn filter_asset_location(
		what: &MultiAsset,
		origin: &MultiLocation,
		context: XcmContext,
	) -> bool {
		for_tuples!( #(
			if Tuple::filter_asset_location(what, origin, context.clone()) { return true }
		)* );
		log::trace!(
			target: "xcm::filter_asset_location",
			"got filtered: what: {:?}, origin: {:?}, context: {:?}",
			what,
			origin,
			context,
		);
		false
	}
}
