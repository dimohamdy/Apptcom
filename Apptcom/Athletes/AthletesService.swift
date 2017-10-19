//
//  AthletesService.swift
//  Apptcom
//
//  Created by BinaryBoy on 10/18/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import ObjectMapper
import Alamofire
import RxSwift
import RxAlamofire


class AthletesService {
    
    private let disposeBag:DisposeBag = DisposeBag()
    
    func getAthleteObservable() -> Observable<[Athlete]> {
        
        return Observable<[Athlete]>.create({ (observer) -> Disposable in
          
            
            
            RxAlamofire.request(.get, "https://gist.githubusercontent.com/Bassem-Samy/f227855df4d197d3737c304e9377c4d4/raw/ece2a30b16a77ee58091886bf6d3445946e10a23/athletes.josn", encoding: JSONEncoding.default).responseJSON().subscribe(onNext: { response in
                //            debugPrint(response)
                // Map via ObjectMapper
                let result:Result? = Mapper<Result>().map(JSONObject:response.result.value)!
                if let _ = result{
                    observer.onNext((result?.athletes)!)
                    
                }else{
                    observer.onError(response.error!)
                }
//                self.loading.value = false
                observer.onCompleted()
                
                
            }).addDisposableTo(self.disposeBag)
        
            //Return an AnonymousDisposable
            return Disposables.create(with: {
                //Cancel the connection if disposed
            })

            
        })
    }

}
