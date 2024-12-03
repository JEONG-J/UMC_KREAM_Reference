//
//  SearchViewController.swift
//  UMC_KREAM
//
//  Created by 7기 중앙 iOS 파트장 정의찬/제옹 on 11/29/24.
//

import UIKit

/// 검색 뷰 컨트롤러
/// 피그마 7주차 구현을 위한 뷰 컨트롤러입니다.
/// 네비게이션 컨트롤러가 아니기 때문에, 해당 뷰를 부르기 위해 NavigationController를 통해 불러와야 합니다. 그래야 상단 네비게이션 아이템을 불러올 수 있습니다.
class SearchViewController: UIViewController {
    
    
    /// 실시간 검색 및 검색 결과 데이터를 받아오는 API Manager
    private let searchAPI = SearchManager()
    
    /// 실시간 검색 데이터 저장 배열
    private var searchResults: [Product] = []
    
    /// 실시간 검색 시, 키보드 타이핑 시간 측정해서 실시간 검색시간 이루어지도록 설정
    private var searchTimer: Timer?
    
    /// 최근 검색어 단어 표시를 위함, 최근 검색어 단어 저장 및 불러오기 기능
    private var searchModel = SearchModel()
    
    
    // MARK: - Cycle
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        loadRecentSearches()
        setupSearchBarActions()
    }
    
    // MARK: - Property
    
    /// 검색 화면 뷰, 해당 뷰는 검색 바 클릭했을 때 처음 뜨는 검색 뷰로 최근 검색 단어만 보이게 된다.
    private lazy var searchView: SearchView = {
        let searchView = SearchView()
        searchView.searchBar.delegate = self
        return searchView
    }()
    
    /// 검색 결과 화면 뷰, 해당 뷰는 실시간 검색 뷰 및 검색 결과 단어들을 보이게 된다.
    private lazy var searchResultView: SearchResultView = {
        let searchResultView = SearchResultView()
        return searchResultView
    }()
    
    // MARK: - Setup Methods
    
    /// 네비게이션 조정 함수
    private func setupNavigationBar() {
        searchView.searchBar.delegate = self
        self.navigationItem.titleView = searchView.searchBar
        
        self.navigationItem.hidesBackButton = true
        let customBackButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), style: .plain, target: self, action: #selector(backAction))
            self.navigationItem.leftBarButtonItem = customBackButton
    }
    
    /// 최근 검색어 단어를 클릭했을 때 일어나는 사건에 대해 정의
    /// 1. 최근 검색어 버튼 클릭 시, 검색 필터에 해당 값이 적용돼야 한다.
    /// 2. 해당 검색어 버튼의 검색어로 검색이 바로 진행돼야 한다.
    private func setupSearchBarActions() {
        searchView.onSearchButtonClicked = { [weak self] keyword in
            self?.searchView.searchBar.text = keyword
            self?.performSearch(query: keyword)
        }
    }
    
    /// 뒤로가기 버튼 클릭 시, 이전 화면으로 돌아가기
    @objc private func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Search Methods
    /// 검색 수행 함수
    /// - Parameter query: 검색 바의 필터에 넣은 값
    private func performSearch(query: String) {
        
        guard !query.isEmpty else { return }
        
        searchAPI.fetchSearchResults(query: query) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let searchResponse):
                self.searchResults = searchResponse.products
                self.updateSearchResults()
                self.changeSearchView()
            case .failure(let error):
                print("Search API error:", error)
                self.showErrorMessage(error)
            }
        }
    }
    
    /// 최근 검색어 데이터를 불러오고, 최근 검색어를 띄우는 뷰에 적용하여 뷰에 등장 시킨다.
    private func loadRecentSearches() {
        let recentSearches = searchModel.loadRecentSearchWord()
        searchView.updateRecentSearchButton(recentSearches)
    }
    
    /// 검색필터에 넣은 검색어를 최근 검색어로 젖아한다. 또한 저장 후, 뷰에 바로 나타날 수 있도록 등장시킨다.
    /// - Parameter query: 검색 핕터에 넣은 검색어
    private func saveSearchQuery(_ query: String) {
        let updatedSearches = searchModel.saveSearchQuery(query)
        searchView.updateRecentSearchButton(updatedSearches)
    }
    
    /// 검색 진행 시, 최근 검색어를 보이는 뷰가 아닌 검색 결과를 보이는 뷰로 전환하도록 한다.
    /// 뷰 컨트롤러 자신의 뷰 자체를 바꾸면 된다.
    private func changeSearchView() {
        self.view = searchResultView
    }
    
    /// 검색 결과로 받아온 데이터들을 뷰에 등장시키기 위함
    private func updateSearchResults() {
        let productTitles = searchResults.map { $0.title }
        searchResultView.updateResult(productTitles)
    }
    
    /// 실시간 검색 중, 입력 속도를 조정하여 결과를 받아오도록 함
    /// - Parameter query: 검색 데이터 입력중인 데이터
    private func performRealTimeSearch(with query: String) {
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            self?.performSearch(query: query)
        }
    }
    
    /// APIf로 데이터를 받아오지 못했을 때, 사용자에게 알리기 위한 Alert
    /// - Parameter error: API 에러 메시지
    private func showErrorMessage(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    /// 검색 필터에 값이 있을 경우, 없을 경우 액션 처리 나눔
    /// - Parameters:
    ///   - searchBar: 현재 뷰의 검색바
    ///   - searchText: 검색바가 들고 있는 검색 데이터 값
    /* 검색바에 값이 없으면 최근 검색어를 보이는 뷰로 전환, 검색바에 값이 있으면 실시간 검색 기능으로 간주 */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.view = searchView
        } else {
            performRealTimeSearch(with: searchText)
        }
    }
    
    /// 키보드에서 엔터를 클릭 시 일어나는 상황 정리
    /// - Parameter searchBar: 현재 뷰의 검색바
    /* 검색바에서 값을 입력하고 키보드에서 엔터를 클릭 시 api로 값을 받아오고, 최근 검색어로 저장하고, 검색 액션을 종료함 */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        performSearch(query: query)
        self.saveSearchQuery(query)
        searchBar.resignFirstResponder()
    }
    
    /// 검색바에서 x버튼 즉, 취소 버튼 클릭시 행동
    /// - Parameter searchBar: 해당 뷰의 검색바
    /* 검색 취소 시 값을 비우고 검색 결과의 데이터 전부 삭제 */
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchResults.removeAll()
        updateSearchResults()
    }
}
