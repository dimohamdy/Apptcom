//
//  AthletesPresenter.swift
//  Apptcom
//
//  Created by BinaryBoy on 10/18/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import RxSwift

class AthletesPresenter {

    private var athletesService:AthletesService? =  nil
    // MARK: Private properties
    private let disposeBag = DisposeBag()
    
    // MARK: Outputs
    public var dataSource: Observable<[Athlete]>? = nil
    public var athletes: [Athlete]? = nil

    init(athletesService:AthletesService) {
        self.athletesService = athletesService
        dataSource = createAthletesObservable()

    }
    
    func createAthletesObservable() -> Observable<[Athlete]> {
        
        return Observable<[Athlete]>.create({ (observer) -> Disposable in
            
            
            self.athletesService!.getAthleteObservable().subscribe(onNext: { athletes in
                self.athletes = athletes
                observer.onNext(athletes)
                
            }, onError: { error in
                observer.onError(error)
            }, onCompleted: {
                //Complete the sequence
                observer.onCompleted()
            }, onDisposed: {
                //Return an AnonymousDisposable
            })
            
            
        })
    }

}
