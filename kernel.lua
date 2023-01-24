local data_mgr = require(script.modules.cache_module)

if data_mgr.start_process(100,'Kernel') == true then
	print('kernel started')
else
	script.Parent.Parent:Kick('kernel start failed')
end

spawn(function()
	while wait() do
		local is_found = false
		for _,v in pairs(data_mgr.get_processes()) do
			if v == 'Kernel' then
				is_found = true
			end
		end
		if is_found == false then
			game.Players.LocalPlayer:Kick('Kernel error : 2x01')
		end
	end
end)
