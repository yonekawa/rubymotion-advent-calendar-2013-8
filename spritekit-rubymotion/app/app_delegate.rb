class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    view_controller = ViewController.alloc.init
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = view_controller
    @window.makeKeyAndVisible

    true
  end
end
