protocol MyView: class {
}

protocol MyRoutable {
}

class MyPresenter {

    weak var view: MyView?

    private let router: MyRoutable

    init(router: MyRoutable) {
        self.router = router
    }
    
}

class MyViewController: ViewController, MyView {

    private let presenter: MyPresenter

    init(presenter: MyPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init coder not implemented")
    }
}

class MyConnector: MyRoutable {
    func assembleView() -> UIViewController {
        let presenter = MyPresenter(router: self)
        let viewController = MyViewController(presenter: presenter)
        presenter.view = viewController
        return viewController
    }
}