//
//  Boxer.h
//  03 Properties
//
//  Created by user167101 on 3/11/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#ifndef Boxer_h
#define Boxer_h
@interface Boxer : NSObject

// assign (аналог unowned) - не становится null при удалении.
// обращение к такому полю поле удаления приводу к крашу
// copy - копирует и создает strong ссылку там, куда копируем
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSInteger age;
@property (assign, nonatomic) float weight;
@property (assign, nonatomic) float height;

@end

#endif /* Boxer_h */
