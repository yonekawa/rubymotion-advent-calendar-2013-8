class ViewController < UIViewController
  def viewDidLoad
    super

    self.view = SKView.alloc.initWithSize(self.view.bounds.size)

    view = self.view
    scene = MainScene.sceneWithSize(view.bounds.size)
    scene.scaleMode = SKSceneScaleModeAspectFill

    view.presentScene(scene)
  end
end
