# ``UMC_KREAM``

UMC (University Mobile Club) 1주차부터 10주차까지의 참고용 과제 코드입니다. 
3주차 6주차 9주차 이렇게 3주 간격으로 올리도록 하겠습니다.

## Overview
> 2024 / 10 / 12 (토): __3주차 과제까지 참고 코드 완성__ <br>
> 2024 / 11 / 14 (목): __6주차 과제까지 참고 코드 완성__ <br>
> 2024 / 12 / 03 (화): __9주차 과제까지 참고 코드 완성__

모바일 앱 개발에 관심 있는 초보자와 열정적인 개발자들에게 기본적인 개념, 프레임워크, 모범 사례 등을 이해하는 데 도움을 주기 위해 설계되었습니다. 각 과제는 이전 주에 배운 내용을 바탕으로 점진적으로 실력을 키울 수 있도록 구성되어 있어, 앱 개발에 대한 탄탄한 기초를 제공합니다.

## Tree 구조
```
├── README.md
├── UMC_KREAM
│   ├── UMC_KREAM
│   │   ├── App
│   │   │   ├── AppDelegate.swift
│   │   │   └── SceneDelegate.swift
│   │   ├── Common
│   │   │   └── Components
│   │   │       ├── CustomNavigationTitle.swift
│   │   │       ├── PurchaseBottomBackground.swift
│   │   │       ├── PurchaseButton.swift
│   │   │       └── ShippingButton.swift
│   │   ├── Data
│   │   │   ├── Enum
│   │   │   │   ├── KakaoLoginError.swift
│   │   │   │   ├── PurchaseButtonType.swift
│   │   │   │   └── ShippingButtonType.swift
│   │   │   ├── Models
│   │   │   │   ├── HomeCellModel.swift
│   │   │   │   ├── PurchaseModel.swift
│   │   │   │   ├── Request
│   │   │   │   ├── Response
│   │   │   │   │   ├── SearchResponse.swift
│   │   │   │   │   └── UserInfoResponse.swift
│   │   │   │   ├── SavedProduct.swift
│   │   │   │   ├── SearchModel.swift
│   │   │   │   ├── SizeModel.swift
│   │   │   │   ├── UserInfo.swift
│   │   │   │   └── UserKeychainInfo.swift
│   │   │   └── Protocol
│   │   │       ├── BaseURLProtocol.swift
│   │   │       ├── CellHeaderProtocol.swift
│   │   │       ├── ProductCellProtocol.swift
│   │   │       ├── PurchaseButtonProtocol.swift
│   │   │       └── RequiredCellProtocol.swift
│   │   ├── Documentation.docc
│   │   │   ├── Documentation.md
│   │   │   └── Resources
│   │   ├── Info.plist
│   │   ├── Presentation
│   │   │   ├── Home
│   │   │   │   ├── Controller
│   │   │   │   │   ├── HomeSegmentControl.swift
│   │   │   │   │   └── HomeViewController.swift
│   │   │   │   └── Views
│   │   │   │       ├── CollectionView
│   │   │   │       │   ├── Cell
│   │   │   │       │   │   ├── AdBannerCell.swift
│   │   │   │       │   │   ├── BaseCollectionCell.swift
│   │   │   │       │   │   ├── ProductGridCell.swift
│   │   │   │       │   │   ├── RecommendationCell.swift
│   │   │   │       │   │   └── UserStoryCell.swift
│   │   │   │       │   ├── CollectionLayout
│   │   │   │       │   │   └── HomeCollectionLayout.swift
│   │   │   │       │   ├── Footer
│   │   │   │       │   │   └── SectionSeparatorFooter.swift
│   │   │   │       │   └── Header
│   │   │   │       │       └── BaseCellHeader.swift
│   │   │   │       ├── HomeHeaderView.swift
│   │   │   │       └── HomeView.swift
│   │   │   ├── Login
│   │   │   │   ├── LoginView.swift
│   │   │   │   └── LoginViewController.swift
│   │   │   ├── MainTabBarController.swift
│   │   │   ├── My
│   │   │   │   ├── ViewControllers
│   │   │   │   │   ├── MyPageManageViewController.swift
│   │   │   │   │   └── MyPageViewController.swift
│   │   │   │   └── Views
│   │   │   │       ├── MyPageTopView.swift
│   │   │   │       ├── MyPageView.swift
│   │   │   │       └── ProfileManagerView.swift
│   │   │   ├── Purchase
│   │   │   │   ├── Cells
│   │   │   │   │   ├── PurchaseCell.swift
│   │   │   │   │   └── SizeCell.swift
│   │   │   │   ├── ViewControllers
│   │   │   │   │   ├── PurchaseViewController.swift
│   │   │   │   │   └── SelectSizeViewController.swift
│   │   │   │   └── Views
│   │   │   │       ├── PurchaseSelectSizeView.swift
│   │   │   │       └── PurchaseView.swift
│   │   │   ├── Saved
│   │   │   │   ├── SavedViewController.swift
│   │   │   │   └── Views
│   │   │   │       ├── SavedTableViewCell.swift
│   │   │   │       └── SavedView.swift
│   │   │   ├── Search
│   │   │   │   ├── ViewControllers
│   │   │   │   │   └── SearchViewController.swift
│   │   │   │   └── Views
│   │   │   │       ├── SearchResultView.swift
│   │   │   │       └── SearchView.swift
│   │   │   ├── Shop
│   │   │   │   └── ShopViewController.swift
│   │   │   └── Style
│   │   │       └── StyleViewController.swift
│   │   ├── Resouces
│   │   │   ├── Assets.xcassets
│   │   │   │   ├── AccentColor.colorset
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── AppIcon.appiconset
│   │   │   │   │   └── Contents.json
│   │   │   │   ├── Contents.json
│   │   │   │   ├── Home
│   │   │   │   │   ├── Cell
│   │   │   │   │   │   ├── AdBannerCell
│   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   └── adverImage.imageset
│   │   │   │   │   │   │       ├── Contents.json
│   │   │   │   │   │   │       └── adverImage.pdf
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   ├── GridCell
│   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   ├── GridCell1.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── a_1fce9fccf725480db7cdeb40fac317a7.png.jpg
│   │   │   │   │   │   │   ├── GridCell2.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── a_ff77e0c164864c429412023a4f2e3af0.png.jpg
│   │   │   │   │   │   │   ├── GridCell3.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── a_193d8f4ecbbc432bb83414ee46d66a58.png.jpg
│   │   │   │   │   │   │   ├── GridCell4.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── a_08a7510565524c25bd38baaa90ace48c.png.jpg
│   │   │   │   │   │   │   ├── GridCell5.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── a_5f48c4ce505443ac999cf59787539636.png.jpg
│   │   │   │   │   │   │   └── GridCell6.imageset
│   │   │   │   │   │   │       ├── Contents.json
│   │   │   │   │   │   │       └── a_5a55ee26f4524f72bd150f21a262c9af.png.jpg
│   │   │   │   │   │   ├── RecommendCell
│   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   ├── homeCell1.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell1.pdf
│   │   │   │   │   │   │   ├── homeCell10.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell10.pdf
│   │   │   │   │   │   │   ├── homeCell2.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell2.pdf
│   │   │   │   │   │   │   ├── homeCell3.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell3.pdf
│   │   │   │   │   │   │   ├── homeCell4.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell4.pdf
│   │   │   │   │   │   │   ├── homeCell5.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell5.png
│   │   │   │   │   │   │   ├── homeCell6.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell6.png
│   │   │   │   │   │   │   ├── homeCell7.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell7.pdf
│   │   │   │   │   │   │   ├── homeCell8.imageset
│   │   │   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   │   │   └── homeCell8.pdf
│   │   │   │   │   │   │   └── homeCell9.imageset
│   │   │   │   │   │   │       ├── Contents.json
│   │   │   │   │   │   │       └── homeCell9.pdf
│   │   │   │   │   │   └── UserStoryCell
│   │   │   │   │   │       ├── Contents.json
│   │   │   │   │   │       ├── userCell1.imageset
│   │   │   │   │   │       │   ├── Contents.json
│   │   │   │   │   │       │   └── cap-2923682_1280.jpg
│   │   │   │   │   │       ├── userCell2.imageset
│   │   │   │   │   │       │   ├── Contents.json
│   │   │   │   │   │       │   └── portrait-5378357_1280.jpg
│   │   │   │   │   │       ├── userCell3.imageset
│   │   │   │   │   │       │   ├── Contents.json
│   │   │   │   │   │       │   └── person-4733756_1280.jpg
│   │   │   │   │   │       ├── userCell4.imageset
│   │   │   │   │   │       │   ├── Contents.json
│   │   │   │   │   │       │   └── woman-1869158_1280.jpg
│   │   │   │   │   │       └── userCell5.imageset
│   │   │   │   │   │           ├── Contents.json
│   │   │   │   │   │           └── ocean-2203720_1280.jpg
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   └── bell.imageset
│   │   │   │   │       ├── Contents.json
│   │   │   │   │       └── bell.pdf
│   │   │   │   ├── Login
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── apple.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── apple.pdf
│   │   │   │   │   ├── kakao.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── kakao.pdf
│   │   │   │   │   └── logo.imageset
│   │   │   │   │       ├── Contents.json
│   │   │   │   │       └── logo.pdf
│   │   │   │   ├── Mypage
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── camera.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── camera.pdf
│   │   │   │   │   ├── option.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── option.pdf
│   │   │   │   │   └── profile.imageset
│   │   │   │   │       ├── Contents.json
│   │   │   │   │       └── profile.pdf
│   │   │   │   ├── Purchase
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── purchase1.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── purchase1.pdf
│   │   │   │   │   ├── purchase2.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── purchase2.pdf
│   │   │   │   │   ├── purchase3.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── purchase3.pdf
│   │   │   │   │   ├── purchase4.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── purchase4.pdf
│   │   │   │   │   ├── purchase5.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── purchase5.pdf
│   │   │   │   │   ├── purchase6.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── purchase6.pdf
│   │   │   │   │   └── purchase7.imageset
│   │   │   │   │       ├── Contents.json
│   │   │   │   │       └── purchase7.pdf
│   │   │   │   ├── Saved
│   │   │   │   │   ├── 1.imageset
│   │   │   │   │   │   ├── 1.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 2.imageset
│   │   │   │   │   │   ├── 2.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 3.imageset
│   │   │   │   │   │   ├── 3.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 4.imageset
│   │   │   │   │   │   ├── 4.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 5.imageset
│   │   │   │   │   │   ├── 5.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 6.imageset
│   │   │   │   │   │   ├── 6.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 7.imageset
│   │   │   │   │   │   ├── 7.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── 8.imageset
│   │   │   │   │   │   ├── 8.png
│   │   │   │   │   │   └── Contents.json
│   │   │   │   │   ├── Contents.json
│   │   │   │   │   ├── notTag.imageset
│   │   │   │   │   │   ├── Contents.json
│   │   │   │   │   │   └── notTag.png
│   │   │   │   │   └── tag.imageset
│   │   │   │   │       ├── Contents.json
│   │   │   │   │       └── tag.pdf
│   │   │   │   └── Tab
│   │   │   │       ├── Contents.json
│   │   │   │       ├── Home.imageset
│   │   │   │       │   ├── Contents.json
│   │   │   │       │   └── Home.pdf
│   │   │   │       ├── My.imageset
│   │   │   │       │   ├── Contents.json
│   │   │   │       │   └── My.pdf
│   │   │   │       ├── Saved.imageset
│   │   │   │       │   ├── Contents.json
│   │   │   │       │   └── Saved.pdf
│   │   │   │       ├── Shop.imageset
│   │   │   │       │   ├── Contents.json
│   │   │   │       │   └── Shop.pdf
│   │   │   │       └── Style.imageset
│   │   │   │           ├── Contents.json
│   │   │   │           └── Style.pdf
│   │   │   ├── ImageDown.swift
│   │   │   ├── KeychainManager.swift
│   │   │   ├── KingfisherExtend.swift
│   │   │   ├── SecretClass.swift
│   │   │   └── secret.xcconfig
│   │   └── Service
│   │       ├── KakaoLoginManager.swift
│   │       └── Search
│   │           ├── SearchManager.swift
│   │           └── SearchRouter.swift
│   └── UMC_KREAM.xcodeproj
│       ├── project.pbxproj
│       ├── project.xcworkspace
│       │   ├── contents.xcworkspacedata
│       │   ├── xcshareddata
│       │   │   ├── IDEWorkspaceChecks.plist
│       │   │   └── swiftpm
│       │   │       ├── Package.resolved
│       │   │       └── configuration
│       │   └── xcuserdata
│       │       └── jeong-uichan.xcuserdatad
│       │           └── UserInterfaceState.xcuserstate
│       └── xcuserdata
│           └── jeong-uichan.xcuserdatad
│               ├── xcdebugger
│               │   └── Breakpoints_v2.xcbkptlist
│               └── xcschemes
│                   └── xcschememanagement.plist
└── UMC_KREAM 설명서.doccarchive
    ├── css
    │   ├── 866.60f074fd.css
    │   ├── 989.4f123103.css
    │   ├── documentation-topic.91c07ba9.css
    │   ├── index.3a335429.css
    │   ├── topic.4be8f56d.css
    │   └── tutorials-overview.7942d777.css
    ├── data
    │   └── documentation
    │       ├── umc_kream
    │       │   ├── appdelegate
    │       │   │   ├── application(_:configurationforconnecting:options:).json
    │       │   │   ├── application(_:diddiscardscenesessions:).json
    │       │   │   ├── application(_:didfinishlaunchingwithoptions:).json
    │       │   │   ├── main().json
    │       │   │   └── uiapplicationdelegate-implementations.json
    │       │   ├── appdelegate.json
    │       │   ├── description
    │       │   │   ├── init(title:subtitle:).json
    │       │   │   ├── subtitle.json
    │       │   │   └── title.json
    │       │   ├── description.json
    │       │   ├── developertoolssupport
    │       │   │   ├── imageresource
    │       │   │   │   ├── apple.json
    │       │   │   │   ├── camera.json
    │       │   │   │   ├── home.json
    │       │   │   │   ├── kakao.json
    │       │   │   │   ├── logo.json
    │       │   │   │   ├── my.json
    │       │   │   │   ├── option.json
    │       │   │   │   ├── profile.json
    │       │   │   │   ├── saved.json
    │       │   │   │   ├── shop.json
    │       │   │   │   ├── style.json
    │       │   │   │   └── tag.json
    │       │   │   └── imageresource.json
    │       │   ├── developertoolssupport.json
    │       │   ├── homeviewcontroller
    │       │   │   └── viewdidload().json
    │       │   ├── homeviewcontroller.json
    │       │   ├── loginview
    │       │   │   ├── idtextfield.json
    │       │   │   ├── init(coder:).json
    │       │   │   ├── init(frame:).json
    │       │   │   ├── loginbtn.json
    │       │   │   └── pwdtextfield.json
    │       │   ├── loginview.json
    │       │   ├── loginviewcontroller
    │       │   │   ├── userinfo.json
    │       │   │   └── viewdidload().json
    │       │   ├── loginviewcontroller.json
    │       │   ├── maintabbarcontroller
    │       │   │   └── viewdidload().json
    │       │   ├── maintabbarcontroller.json
    │       │   ├── mypagemanageviewcontroller
    │       │   │   ├── clickedbtn(_:).json
    │       │   │   ├── didtap().json
    │       │   │   └── viewdidload().json
    │       │   ├── mypagemanageviewcontroller.json
    │       │   ├── mypagetopview
    │       │   │   ├── init(coder:).json
    │       │   │   ├── init(frame:).json
    │       │   │   ├── profilemanagebtn.json
    │       │   │   └── profilesharebtn.json
    │       │   ├── mypagetopview.json
    │       │   ├── mypageview
    │       │   │   ├── init(coder:).json
    │       │   │   ├── init(frame:).json
    │       │   │   └── topview.json
    │       │   ├── mypageview.json
    │       │   ├── mypageviewcontroller
    │       │   │   ├── changepage().json
    │       │   │   └── viewdidload().json
    │       │   ├── mypageviewcontroller.json
    │       │   ├── profilemanagerview
    │       │   │   ├── idcheckbtn.json
    │       │   │   ├── idtextfield.json
    │       │   │   ├── idtitle.json
    │       │   │   ├── init(coder:).json
    │       │   │   ├── init(frame:).json
    │       │   │   ├── pwdcheckbtn.json
    │       │   │   └── pwdtextfield.json
    │       │   ├── profilemanagerview.json
    │       │   ├── savedproduct
    │       │   │   ├── description.json
    │       │   │   ├── imagename.json
    │       │   │   ├── init(imagename:description:price:).json
    │       │   │   └── price.json
    │       │   ├── savedproduct.json
    │       │   ├── savedproductdata
    │       │   │   ├── datalist.json
    │       │   │   └── init().json
    │       │   ├── savedproductdata.json
    │       │   ├── savedtableviewcell
    │       │   │   ├── awakefromnib().json
    │       │   │   ├── configure(model:).json
    │       │   │   ├── identifier.json
    │       │   │   ├── init(coder:).json
    │       │   │   ├── init(style:reuseidentifier:).json
    │       │   │   ├── prepareforreuse().json
    │       │   │   └── setselected(_:animated:).json
    │       │   ├── savedtableviewcell.json
    │       │   ├── savedview
    │       │   │   ├── init(coder:).json
    │       │   │   ├── init(frame:productcount:).json
    │       │   │   ├── productcount.json
    │       │   │   └── tableview.json
    │       │   ├── savedview.json
    │       │   ├── savedviewcontroller
    │       │   │   ├── data.json
    │       │   │   ├── tableview(_:cellforrowat:).json
    │       │   │   ├── tableview(_:numberofrowsinsection:).json
    │       │   │   ├── uitableviewdatasource-implementations.json
    │       │   │   └── viewdidload().json
    │       │   ├── savedviewcontroller.json
    │       │   ├── scenedelegate
    │       │   │   ├── scene(_:willconnectto:options:).json
    │       │   │   ├── scenedidbecomeactive(_:).json
    │       │   │   ├── scenediddisconnect(_:).json
    │       │   │   ├── scenedidenterbackground(_:).json
    │       │   │   ├── scenewillenterforeground(_:).json
    │       │   │   ├── scenewillresignactive(_:).json
    │       │   │   └── window.json
    │       │   ├── scenedelegate.json
    │       │   ├── shopviewcontroller
    │       │   │   └── viewdidload().json
    │       │   ├── shopviewcontroller.json
    │       │   ├── styleviewcontroller
    │       │   │   └── viewdidload().json
    │       │   ├── styleviewcontroller.json
    │       │   ├── uikit
    │       │   │   ├── uiimage
    │       │   │   │   ├── apple.json
    │       │   │   │   ├── camera.json
    │       │   │   │   ├── home.json
    │       │   │   │   ├── kakao.json
    │       │   │   │   ├── logo.json
    │       │   │   │   ├── my.json
    │       │   │   │   ├── option.json
    │       │   │   │   ├── profile.json
    │       │   │   │   ├── saved.json
    │       │   │   │   ├── shop.json
    │       │   │   │   ├── style.json
    │       │   │   │   └── tag.json
    │       │   │   └── uiimage.json
    │       │   ├── uikit.json
    │       │   ├── userinfo
    │       │   │   ├── id.json
    │       │   │   ├── init(id:pwd:).json
    │       │   │   ├── loaduserdefaults().json
    │       │   │   ├── pwd.json
    │       │   │   └── saveuserdefaults().json
    │       │   └── userinfo.json
    │       └── umc_kream.json
    ├── developer-og-twitter.jpg
    ├── developer-og.jpg
    ├── documentation
    │   └── umc_kream
    │       ├── appdelegate
    │       │   ├── application(_:configurationforconnecting:options:)
    │       │   │   └── index.html
    │       │   ├── application(_:diddiscardscenesessions:)
    │       │   │   └── index.html
    │       │   ├── application(_:didfinishlaunchingwithoptions:)
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   ├── main()
    │       │   │   └── index.html
    │       │   └── uiapplicationdelegate-implementations
    │       │       └── index.html
    │       ├── description
    │       │   ├── index.html
    │       │   ├── init(title:subtitle:)
    │       │   │   └── index.html
    │       │   ├── subtitle
    │       │   │   └── index.html
    │       │   └── title
    │       │       └── index.html
    │       ├── developertoolssupport
    │       │   ├── imageresource
    │       │   │   ├── apple
    │       │   │   │   └── index.html
    │       │   │   ├── camera
    │       │   │   │   └── index.html
    │       │   │   ├── home
    │       │   │   │   └── index.html
    │       │   │   ├── index.html
    │       │   │   ├── kakao
    │       │   │   │   └── index.html
    │       │   │   ├── logo
    │       │   │   │   └── index.html
    │       │   │   ├── my
    │       │   │   │   └── index.html
    │       │   │   ├── option
    │       │   │   │   └── index.html
    │       │   │   ├── profile
    │       │   │   │   └── index.html
    │       │   │   ├── saved
    │       │   │   │   └── index.html
    │       │   │   ├── shop
    │       │   │   │   └── index.html
    │       │   │   ├── style
    │       │   │   │   └── index.html
    │       │   │   └── tag
    │       │   │       └── index.html
    │       │   └── index.html
    │       ├── homeviewcontroller
    │       │   ├── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── index.html
    │       ├── loginview
    │       │   ├── idtextfield
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   ├── init(coder:)
    │       │   │   └── index.html
    │       │   ├── init(frame:)
    │       │   │   └── index.html
    │       │   ├── loginbtn
    │       │   │   └── index.html
    │       │   └── pwdtextfield
    │       │       └── index.html
    │       ├── loginviewcontroller
    │       │   ├── index.html
    │       │   ├── userinfo
    │       │   │   └── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── maintabbarcontroller
    │       │   ├── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── mypagemanageviewcontroller
    │       │   ├── clickedbtn(_:)
    │       │   │   └── index.html
    │       │   ├── didtap()
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── mypagetopview
    │       │   ├── index.html
    │       │   ├── init(coder:)
    │       │   │   └── index.html
    │       │   ├── init(frame:)
    │       │   │   └── index.html
    │       │   ├── profilemanagebtn
    │       │   │   └── index.html
    │       │   └── profilesharebtn
    │       │       └── index.html
    │       ├── mypageview
    │       │   ├── index.html
    │       │   ├── init(coder:)
    │       │   │   └── index.html
    │       │   ├── init(frame:)
    │       │   │   └── index.html
    │       │   └── topview
    │       │       └── index.html
    │       ├── mypageviewcontroller
    │       │   ├── changepage()
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── profilemanagerview
    │       │   ├── idcheckbtn
    │       │   │   └── index.html
    │       │   ├── idtextfield
    │       │   │   └── index.html
    │       │   ├── idtitle
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   ├── init(coder:)
    │       │   │   └── index.html
    │       │   ├── init(frame:)
    │       │   │   └── index.html
    │       │   ├── pwdcheckbtn
    │       │   │   └── index.html
    │       │   └── pwdtextfield
    │       │       └── index.html
    │       ├── savedproduct
    │       │   ├── description
    │       │   │   └── index.html
    │       │   ├── imagename
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   ├── init(imagename:description:price:)
    │       │   │   └── index.html
    │       │   └── price
    │       │       └── index.html
    │       ├── savedproductdata
    │       │   ├── datalist
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   └── init()
    │       │       └── index.html
    │       ├── savedtableviewcell
    │       │   ├── awakefromnib()
    │       │   │   └── index.html
    │       │   ├── configure(model:)
    │       │   │   └── index.html
    │       │   ├── identifier
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   ├── init(coder:)
    │       │   │   └── index.html
    │       │   ├── init(style:reuseidentifier:)
    │       │   │   └── index.html
    │       │   ├── prepareforreuse()
    │       │   │   └── index.html
    │       │   └── setselected(_:animated:)
    │       │       └── index.html
    │       ├── savedview
    │       │   ├── index.html
    │       │   ├── init(coder:)
    │       │   │   └── index.html
    │       │   ├── init(frame:productcount:)
    │       │   │   └── index.html
    │       │   ├── productcount
    │       │   │   └── index.html
    │       │   └── tableview
    │       │       └── index.html
    │       ├── savedviewcontroller
    │       │   ├── data
    │       │   │   └── index.html
    │       │   ├── index.html
    │       │   ├── tableview(_:cellforrowat:)
    │       │   │   └── index.html
    │       │   ├── tableview(_:numberofrowsinsection:)
    │       │   │   └── index.html
    │       │   ├── uitableviewdatasource-implementations
    │       │   │   └── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── scenedelegate
    │       │   ├── index.html
    │       │   ├── scene(_:willconnectto:options:)
    │       │   │   └── index.html
    │       │   ├── scenedidbecomeactive(_:)
    │       │   │   └── index.html
    │       │   ├── scenediddisconnect(_:)
    │       │   │   └── index.html
    │       │   ├── scenedidenterbackground(_:)
    │       │   │   └── index.html
    │       │   ├── scenewillenterforeground(_:)
    │       │   │   └── index.html
    │       │   ├── scenewillresignactive(_:)
    │       │   │   └── index.html
    │       │   └── window
    │       │       └── index.html
    │       ├── shopviewcontroller
    │       │   ├── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── styleviewcontroller
    │       │   ├── index.html
    │       │   └── viewdidload()
    │       │       └── index.html
    │       ├── uikit
    │       │   ├── index.html
    │       │   └── uiimage
    │       │       ├── apple
    │       │       │   └── index.html
    │       │       ├── camera
    │       │       │   └── index.html
    │       │       ├── home
    │       │       │   └── index.html
    │       │       ├── index.html
    │       │       ├── kakao
    │       │       │   └── index.html
    │       │       ├── logo
    │       │       │   └── index.html
    │       │       ├── my
    │       │       │   └── index.html
    │       │       ├── option
    │       │       │   └── index.html
    │       │       ├── profile
    │       │       │   └── index.html
    │       │       ├── saved
    │       │       │   └── index.html
    │       │       ├── shop
    │       │       │   └── index.html
    │       │       ├── style
    │       │       │   └── index.html
    │       │       └── tag
    │       │           └── index.html
    │       └── userinfo
    │           ├── id
    │           │   └── index.html
    │           ├── index.html
    │           ├── init(id:pwd:)
    │           │   └── index.html
    │           ├── loaduserdefaults()
    │           │   └── index.html
    │           ├── pwd
    │           │   └── index.html
    │           └── saveuserdefaults()
    │               └── index.html
    ├── downloads
    │   └── com.app.UMC-KREAM
    ├── favicon.ico
    ├── favicon.svg
    ├── images
    │   └── com.app.UMC-KREAM
    ├── img
    │   ├── added-icon.832a5d2c.svg
    │   ├── deprecated-icon.7bf1740a.svg
    │   └── modified-icon.efb2697d.svg
    ├── index
    │   ├── availability.index
    │   ├── data.mdb
    │   ├── index.json
    │   └── navigator.index
    ├── index.html
    ├── js
    │   ├── 104.fe5974d0.js
    │   ├── 337.274a8ccc.js
    │   ├── 842.49774dc9.js
    │   ├── 866.eea4607d.js
    │   ├── chunk-vendors.bdb7cbba.js
    │   ├── documentation-topic.09a6ef86.js
    │   ├── highlight-js-bash-js.702f0c5c.js
    │   ├── highlight-js-c-js.063069d3.js
    │   ├── highlight-js-cpp-js.458a9ae4.js
    │   ├── highlight-js-css-js.bfc4251f.js
    │   ├── highlight-js-custom-markdown.78c9f6ed.js
    │   ├── highlight-js-custom-swift.738731d1.js
    │   ├── highlight-js-diff-js.4db9a783.js
    │   ├── highlight-js-http-js.f78e83c2.js
    │   ├── highlight-js-java-js.4fe21e94.js
    │   ├── highlight-js-javascript-js.dfc9d16d.js
    │   ├── highlight-js-json-js.2a1856ba.js
    │   ├── highlight-js-llvm-js.26121771.js
    │   ├── highlight-js-markdown-js.a2f456af.js
    │   ├── highlight-js-objectivec-js.74dea052.js
    │   ├── highlight-js-perl-js.da6eda82.js
    │   ├── highlight-js-php-js.c458ffa4.js
    │   ├── highlight-js-python-js.60354774.js
    │   ├── highlight-js-ruby-js.7272231f.js
    │   ├── highlight-js-scss-js.adcd11a2.js
    │   ├── highlight-js-shell-js.0ad5b20f.js
    │   ├── highlight-js-swift-js.bdd5bff5.js
    │   ├── highlight-js-xml-js.0d78f903.js
    │   ├── index.a08b31d0.js
    │   ├── topic.37e71576.js
    │   └── tutorials-overview.acb09e8a.js
    ├── metadata.json
    └── videos
        └── com.app.UMC-KREAM
```
