//
//  Patient.h
//  09 Delegates
//
//  Created by user167101 on 3/13/20.
//  Copyright © 2020 user167101. All rights reserved.
//

#ifndef Patient_h
#define Patient_h
// Чтобы класс видел делегат
//@protocol PatientDelegate;

@interface Patient : NSObject
typedef void (^HandlePatient) (Patient* patient);

@property (assign, nonatomic) float temperature;
@property (strong, nonatomic) NSString* name;
//@property (weak, nonatomic) id <PatientDelegate> delegate;

- (void) didBecomeIll:(HandlePatient) patientCompletion withPatient:(Patient*)patient;
- (void) takePill;
- (void) makeShot;
- (void) eatHerb;

@end

//@protocol PatientDelegate
//@required
//- (void) patientGetHealing:(Patient*)patient;
//
//@end

#endif /* Patient_h */
