/*
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ABI46_0_0RCTScrollContentShadowView.h"

#import <ABI46_0_0yoga/ABI46_0_0Yoga.h>

#import "ABI46_0_0RCTUtils.h"

@implementation ABI46_0_0RCTScrollContentShadowView

- (void)layoutWithMetrics:(ABI46_0_0RCTLayoutMetrics)layoutMetrics layoutContext:(ABI46_0_0RCTLayoutContext)layoutContext
{
  if (layoutMetrics.layoutDirection == UIUserInterfaceLayoutDirectionRightToLeft) {
    // Motivation:
    // Yoga place `contentView` on the right side of `scrollView` when RTL layout is enforced.
    // That breaks everything; it is completely pointless to (re)position `contentView`
    // because it is `contentView`'s job. So, we work around it here.

    layoutContext.absolutePosition.x += layoutMetrics.frame.size.width;
    layoutMetrics.frame.origin.x = 0;
  }

  [super layoutWithMetrics:layoutMetrics layoutContext:layoutContext];
}

@end
