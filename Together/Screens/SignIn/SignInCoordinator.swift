
import UIKit


protocol SignInCoordination {
    
    func showMain()
    //создаем main презентер
    
    func showRestorePassword()
    // создаем restore презетер
    
    func showRegisterAccount()
    // создаем register презентер
}


final class SignInCoordinator: BaseCoordirator {
    
    //MARK: - Private properties
    private let navController: UINavigationController
    
    
    //MARK: - Init
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    
    //MARK: - Open properties
    override func start() {
        let vc = SignInViewController()
        let presenter = SignInPresenter(view: vc, coordinator: self)
        vc.presenter = presenter
        
        navController.pushViewController(vc, animated: false)
    }
}


//MARK: - SignInCoordination
extension SignInCoordinator: SignInCoordination {
    
    func showMain() {
        UserDefaults.standard.set(true, forKey: "UID")
        let mainCoordinator = MainCoordinator(navController: navController)
        self.parentCoordinator?.setDependence(withChildCoordinator: mainCoordinator)
        mainCoordinator.start()
        self.parentCoordinator?.didFinish(coordinator: self)
    }
    
    func showRestorePassword() {
        let restorePasswordCoordinator = RestorePasswordCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: restorePasswordCoordinator)
        restorePasswordCoordinator.start()
        //self.parentCoordinator?.didFinish(coordinator: self)
    }
    
    func showRegisterAccount() {
        let registerAccountCoordinator = RegisterAccountCoordinator(navController: navController)
        self.setDependence(withChildCoordinator: registerAccountCoordinator)
        registerAccountCoordinator.start()
        //self.parentCoordinator?.didFinish(coordinator: self)
    }

}

