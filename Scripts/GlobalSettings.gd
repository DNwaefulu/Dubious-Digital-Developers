extends Node

signal brightness_updated(value)


func toggle_fullscreen(toggle):
  OS.window_fullscreen = toggle
  Save.game_data.fullscreen_on = toggle
  Save.save_data()
  
  
func toggle_vsync(toggle):
  OS.vsync_enabled = toggle
  Save.game_data.vsync_on = toggle
  Save.save_data()
  
func update_brightness(value):
  emit_signal("brightness_updated", value)
  Save.game_data.brightness = value
  Save.save_data()
  
  
func update_master_vol(vol):
  AudioServer.set_bus_volume_db(0, vol)
  Save.game_data.master_vol = vol
  Save.save_data()
  
  
func update_music_vol(vol):
  AudioServer.set_bus_volume_db(1, vol)
  
    
func update_sfx_vol(vol):
  AudioServer.set_bus_volume_db(2, vol)
