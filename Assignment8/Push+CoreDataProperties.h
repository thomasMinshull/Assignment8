//
//  Push+CoreDataProperties.h
//  
//
//  Created by thomas minshull on 2016-02-21.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Push.h"

NS_ASSUME_NONNULL_BEGIN

@interface Push (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *message;

@end

NS_ASSUME_NONNULL_END
