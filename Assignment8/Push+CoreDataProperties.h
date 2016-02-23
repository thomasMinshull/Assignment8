//
//  Push+CoreDataProperties.h
//  Assignment8
//
//  Created by thomas minshull on 2016-02-23.
//  Copyright © 2016 thomas minshull. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Push.h"

NS_ASSUME_NONNULL_BEGIN

@interface Push (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *creationDate;
@property (nullable, nonatomic, retain) NSString *message;

@end

NS_ASSUME_NONNULL_END
