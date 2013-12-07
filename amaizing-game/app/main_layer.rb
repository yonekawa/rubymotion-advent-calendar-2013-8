class MainLayer < Joybox::Core::Layer
  def on_enter
    @character = Sprite.new(
      file_name: 'sprites/character@2x.png',
      position: Screen.center,
      alive: true
    )

    move_by_action = Move.by(position: [300, 0], duration: 2.0)
    ease_exponential_in_action = Ease.exponential_in(action: move_by_action)
    rotate_by_action = Rotate.by(angle: 360.0, duration: 3.0)

    # sequence_action = Sequence.with(actions:[ease_exponential_in_action, rotate_by_action])
    # blink_action = Blink.with(times: 10, duration: 10.0)

    spawn_action = Spawn.with(actions:[ease_exponential_in_action, rotate_by_action])
    @character.run_action spawn_action

    self << @character

    @enemy = Sprite.new(
      file_name: 'sprites/enemy@2x.png',
      position: [Screen.width - 100, Screen.half_height].to_point
    )

    self << @enemy

    schedule_update do |dt|
      check_for_collisions if @character[:alive]
    end
  end

  def check_for_collisions
    if CGRectIntersectsRect(@character.bounding_box, @enemy.bounding_box)
      @character.stop_all_actions
      blink_action = Blink.with(times: 10, duration: 10.0)
      @character.run_action(blink_action)
      @character[:alive] = false
    end
  end
end
