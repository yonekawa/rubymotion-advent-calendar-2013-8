class PhysicsLayer < Joybox::Core::Layer
  scene

  def on_enter
    init_world
    create_character

    on_touches_ended do |touches, event|
      @character.body.apply_force(force: [1000, 1000])
    end

    schedule_update do |delta|
      @world.step(delta: delta)
    end
  end

  def init_world
    @world = World.new(gravity: [0, -10])
    body = @world.new_body(position: [0, 0]) do
      edge_fixture start_point: [0, 0],
      end_point:   [Screen.width, 0]
      edge_fixture start_point: [0, Screen.height],
      end_point:   [Screen.width, Screen.height]
      edge_fixture start_point: [0, Screen.height],
      end_point:   [0, 0]
      edge_fixture start_point: [Screen.width, Screen.height],
      end_point:   [Screen.width, 0]
    end
  end

  def create_character
    @character_body = @world.new_body(
      position: Screen.center,
      type: KDynamicBodyType
    ) do
      polygon_fixture(
        box: [47, 48.5],
        friction: 0.7,
        density: 1.0
      )
    end

    @character = PhysicsSprite.new(file_name: 'character@2x.png', body: @character_body)
    self << @character
  end
end
