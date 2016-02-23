//
//  Push+CoreDataProperties.m
//  Assignment8
//
//  Created by thomas minshull on 2016-02-23.
//  Copyright © 2016 thomas minshull. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Push+CoreDataProperties.h"

@implementation Push (CoreDataProperties)

@dynamic creationDate;
@dynamic message;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    
    self.creationDate = [NSDate date];
}

@end
