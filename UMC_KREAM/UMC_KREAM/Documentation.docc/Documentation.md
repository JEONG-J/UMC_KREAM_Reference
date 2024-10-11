# ``UMC_KREAM``

UMC (University Mobile Club) 1주차부터 10주차까지의 참고용 과제 코드입니다. 
3주차 6주차 9주차 이렇게 3주 간격으로 올리도록 하겠습니다.



## Overview
> 2024 / 10 / 12 (토): __3주차 과제까지 참고 코드 완성__

모바일 앱 개발에 관심 있는 초보자와 열정적인 개발자들에게 기본적인 개념, 프레임워크, 모범 사례 등을 이해하는 데 도움을 주기 위해 설계되었습니다. 각 과제는 이전 주에 배운 내용을 바탕으로 점진적으로 실력을 키울 수 있도록 구성되어 있어, 앱 개발에 대한 탄탄한 기초를 제공합니다.

---

## Composition

* __App__
    * AppDelegate.swift: 앱의 생명주기 및 초기 설정을 담당하는 파일입니다.
    * SceneDelegate.swift: 씬 기반의 앱 생명주기를 관리하며, UIKit의 멀티윈도우 환경을 지원합니다.
* __Data__
    * Models
        * SavedProduct.swift: 사용자가 저장한 제품 정보를 관리하는 모델 파일입니다.
        * UserInfo.swift: 사용자 정보를 저장하고 관리하는 모델 파일입니다. 사용자 데이터 구조를 정의하고 관련 로직을 포함합니다.
* __Documentation__
    * Documentation.docc: 프로젝트의 문서를 관리하는 파일로, API 및 기능 설명을 포함합니다.
    * Documentation.md: 프로젝트의 개요와 설명을 담은 마크다운 형식의 문서입니다.
* __Presentation__
    * Home
        * HomeViewController.swift: 홈 화면을 관리하는 뷰 컨트롤러로, 사용자에게 가장 먼저 보여지는 화면입니다.
* __Login__
    * LoginView.swift: 로그인 화면의 UI 레이아웃을 정의한 뷰입니다.
    * LoginViewController.swift: 로그인 화면을 관리하며, 사용자 인증을 처리하는 뷰 컨트롤러입니다.
* __My__
    * ViewControllers
        * MyPageManageViewController.swift: 마이 페이지에서 사용자가 자신의 정보를 관리할 수 있는 기능을 제공하는 뷰 컨트롤러입니다.
        * MyPageViewController.swift: 마이 페이지의 메인 화면을 담당하며, 사용자의 프로필 및 설정을 표시합니다.
    * Views
        * MyPageTopView.swift: 마이 페이지 화면의 상단부를 담당하는 UI 컴포넌트로, 프로필이나 사용자 정보를 표시하는 뷰를 구성합니다.
    * MyPageView.swift: 마이 페이지 화면의 UI 레이아웃을 정의한 뷰입니다.
    * ProfileManagerView.swift: 사용자 프로필 관리 화면의 UI 레이아웃을 정의한 뷰입니다.
* __Saved__
    * SavedViewController.swift: 사용자가 저장한 항목을 보여주는 뷰 컨트롤러입니다.
    * Views
        * SavedView.swift: 저장된 항목 화면의 UI 레이아웃을 정의한 뷰입니다.
        * SavedTableViewCell.swift: 저장된 항목을 나타내는 테이블 뷰 셀입니다.
* __Shop__
    * ShopViewController.swift: 쇼핑 관련 콘텐츠를 표시하며, 제품 리스트나 상품 정보를 제공합니다.
* __Style__
    * StyleViewController.swift: 스타일 관련 콘텐츠를 관리하는 뷰 컨트롤러입니다.
* MainTabBarController.swift: UITabBarController를 사용하여 앱 내의 다양한 화면을 탭 형식으로 제공하며, 네비게이션의 중심이 됩니다.
* __Resources__
    * Assets.xcassets: 앱에서 사용하는 이미지와 색상 등 리소스를 관리합니다.
        * Login: 로그인 화면에 사용되는 리소스를 포함합니다.
        * Mypage: 마이 페이지와 관련된 리소스를 포함합니다.
        * Saved: 사용자가 저장한 항목에 대한 리소스를 포함합니다.
        * Tab: 탭 바 아이콘과 관련된 리소스를 포함합니다.
    * Info.plist: 앱의 설정과 관련된 메타데이터를 관리합니다.
* __외부 라이브러리__
    * SnapKit 5.7.1: 오토 레이아웃을 코드로 쉽게 작성할 수 있게 도와주는 라이브러리로, UI 요소의 레이아웃을 정의하는 데 사용됩니다.
