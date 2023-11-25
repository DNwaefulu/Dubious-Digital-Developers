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
  var bus_name = "Master"
  var bus_index = AudioServer.get_bus_index(bus_name)
  var dbvol = linear2db(vol)
  AudioServer.set_bus_volume_db(bus_index, dbvol)
  # Revert db to linear to fit in the range of [0, 1]
  Save.game_data.master_vol = vol
  Save.save_data()
  
  
func update_music_vol(vol):
  var bus_name = "Music"
  var bus_index = AudioServer.get_bus_index(bus_name)
  var dbvol = linear2db(vol)
  AudioServer.set_bus_volume_db(bus_index, dbvol)
  # Revert db to linear to fit in the range of [0, 1]
  Save.game_data.music_vol = vol
  Save.save_data()
  
    
func update_sfx_vol(vol):
  var bus_name = "SFX"
  var bus_index = AudioServer.get_bus_index(bus_name)
  var dbvol = linear2db(vol)
  AudioServer.set_bus_volume_db(bus_index, dbvol)
  # Revert db to linear to fit in the range of [0, 1]
  Save.game_data.sfx_vol = vol
  Save.save_data()
