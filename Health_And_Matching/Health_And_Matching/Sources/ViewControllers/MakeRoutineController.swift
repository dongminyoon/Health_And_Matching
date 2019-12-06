//
//  MakeRoutineController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class MakeRoutineController: UIViewController {
    @IBOutlet weak var dictionaryTableView: UITableView!
    @IBOutlet weak var routineTableView: UITableView!
    
    // 넘겨줄 고객의 ID을 가지고 있어야함
    // Dictionary 정보 가지고 있어야함
    // 추가된 운동 리스트 가지고 있어야함
    
    private var dictionaryTableDataSource: DictionaryTableDataSource = DictionaryTableDataSource()
    private var dictionaryTableDelegate: DictionaryTableDelegate = DictionaryTableDelegate()
    private var routineTableDataSource: RoutineTableDataSource = RoutineTableDataSource()
    private var routineTableDelegate: RoutineTableDelegate = RoutineTableDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "루틴만들기"
        dictionaryTableView.dataSource = dictionaryTableDataSource
        dictionaryTableView.delegate = dictionaryTableDelegate
        routineTableView.dataSource = routineTableDataSource
        routineTableView.delegate = routineTableDelegate
    }
}
