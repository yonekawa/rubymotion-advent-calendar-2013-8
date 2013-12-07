class MainScene < SKScene
  def initWithSize(size)
    super(size)
    self.physicsBody = SKPhysicsBody.bodyWithEdgeLoopFromRect(CGRectMake(0, 0, self.size.width, self.size.height))
    self
  end

  def createCharacter(location)
    character = SKSpriteNode.alloc.initWithImageNamed('character')
    character.name = "character"
    character.physicsBody = SKPhysicsBody.bodyWithRectangleOfSize(character.size)
    character.physicsBody.dynamic = true
    character.position = [location.x, location.y]
    character
  end

  def touchesBegan(touches, withEvent: event)
    touch = touches.anyObject
    location = touch.locationInView(touch.view)

    character = createCharacter(location)
    self.addChild(character)
  end
end
