//
//  QRScanResources.swift
//  X-Wallet
//
//  Created by Duc Le on 9/15/24.
//

import QRScanner
import Style

struct QRScanResources: QRScannerResources {
    var selectFromPhotos: String { Localized.Library.selectFromPhotoLibrary }
    var openSettings: String { Localized.Common.openSettings }
    var tryAgain: String { Localized.Common.tryAgain }

    var dismissSystemImage: String { SystemImage.chevronDown }
    var gallerySystemImage: String { SystemImage.photo }
}
