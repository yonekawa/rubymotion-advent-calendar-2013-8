class MainScene < Joybox::Core::Scene
  def on_enter
    main_layer = MainLayer.new
    self << main_layer
  end
end
