local VORPMenu = {} 

TriggerEvent("vorp_menu:getData",function(cb)
 VORPMenu = cb
end)

-- animations 
local animations = { -- Put your animName list here
	"annoyed_punctuate_l_001",
  "frustrated_punctuate_f_002",
  "neutral_punctuate_fl_003",
  "neutral_get_attention_l_003",
  "negative_disbelief_l_001",
  "frustrated_punctuate_f_003",
  "neutral_punctuate_fl_002",
  "negative_punctuate_l_002",
  "neutral_get_attention_l_002",
  "uninterested_wave_fl_001",
  "frustrated_punctuate_f_001",
  "neutral_punctuate_fl_001",
  "negative_disagree_l_001",
  "confused_punctuate_l_001",
  "negative_disagree_f_001",
  "neutral_get_attention_l_001",
  "neutral_fidget_shakearms_f_001",
  "frustrated_punctuate_l_002",
  "neutral_fidget_rubnose_l_001",
  "annoyed_punctuate_l_002",
  "negative_punctuate_l_001",
  "negative_disbelief_l_003",
  "neutral_fidget_rubchin_l_001",
  "confused_punctuate_f_002",
  "negative_disbelief_l_002",
  "neutral_fidget_jawscratch_l_001",
  "neutral_point_down_l_001",
  "neutral_look_around_f_001",
  "frustrated_punctuate_l_001",
  "neutral_punctuate_l_006",
  "confused_punctuate_f_003",
  "neutral_punctuate_l_005",
  "neutral_punctuate_l_003",
  "neutral_halt_quiet_l_001",
  "neutral_punctuate_l_002",
  "neutral_punctuate_l_001",
  "neutral_get_attention_l_004",
  "negative_punctuate_l_003",
  "happy_wave_fl_001",
  "happy_laugh_f_003",
  "happy_laugh_f_002",
  "happy_laugh_f_001",
  "happy_cheer_l_001",
  "calm_down_f_006",
  "happy_cheer_f_003",
  "happy_cheer_f_002",
  "calm_down_f_005",
  "happy_cheer_f_001",
  "calm_down_f_003",
  "calm_down_f_002",
  "angry_dismiss_l_001",
  "annoyed_dismiss_l_001",
  "angry_taunt_l_001",
  "annoyed_sulk_f_003",
  "embarrassed_l_01",
  "angry_point_l_004",
  "embarrassed_f_001",
  "angry_point_l_001",
  "defensive_plead_f_001",
  "annoyed_dismiss_l_002",
  "damn_it_l_002",
  "annoyed_sulk_f_002",
  "damn_it_l_001",
  "angry_dismiss_f_001",
  "damn_it_f_002",
  "angry_point_l_002",
  "cough_medium_l_002",
  "annoyed_confused_f_001",
  "cough_low_l_001",
  "cough_high_l_001",
  "angry_dismiss_fl_001",
  "annoyed_sulk_f_001",
  "confused_punctuate_002",
  "angry_dismiss_fl_003",
  "angry_point_l_003",
  "confused_punctuate_001",
  "catch_rt_01",
  "negative_shrug_l_001",
  "neutral_appease_l_001",
  "neutral_dismiss_l_001",
  "neutral_dismiss_l_002",
  "neutral_point_bl_001",
  "neutral_point_l_001",
  "neutral_point_l_002",
  "neutral_point_l_003",
  "neutral_point_l_004",
  "neutral_shrug_f_001",
  "neutral_shrug_f_002",
  "neutral_shrug_f_003",
  "neutral_shrug_l_001",
  "neutral_shrug_l_002",
  "neutral_wave_fl_001",
  "neutral_wave_fl_002",
  "positive_look_up_f_001",
  "positive_nod_f_001",
  "sarcastic_wave_fl_001",
  "stern_punctuate_l_001",
  "stern_punctuate_l_002",
  "stern_punctuate_l_003",
  "stern_punctuate_l_004",
  "thank_you_f_001",
  "thank_you_f_002",
  "throw_lt_01",

}

local animDict = "ai_gestures@gen_male@standing@speaker@rt_hand" -- Change your animDict here

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, 0x156F7119) then
            VORPMenu.CloseAll()
            ClearPedTasks(PlayerPedId())
        end
    end
end)

function OpenMenu()

	VORPMenu.CloseAll()
	   local MenuElements = {}
	   for i, animation in ipairs(animations) do
		   table.insert(MenuElements, { 
			   label = animation,
			   value = animation,
			   desc = "Press ENTER for play " .. animation
		   })
	   end
	   VORPMenu.Open("default",GetCurrentResourceName(),"vorp_menu_OpenMenu",
	   {
		   title = "Animation Menu",
		   subtext = "Choose an animation",
		   align = "top-right", 
		   elements = MenuElements, 
	   },
   
	   function(data, menu)
		local animName = data.current.value
		   if data.current.value then
			RequestAnimDict(animDict)	
			while not HasAnimDictLoaded(animDict) do
				Citizen.Wait(100)
			end
			TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, 999999999, 1, 0, true, 0, false, 0, false)
		   end
	   end)
end


RegisterCommand('testanim', function()
    OpenMenu()
end, false)