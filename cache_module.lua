local hardware = script.Parent.Parent.hardware --hardware folder
local ram = hardware.Data.cache --cache folder
local module = {
	start_process = function (size,name)
		size = tonumber(size)
		local is_sucess = false
		for _,v in pairs(ram:GetChildren()) do
			if v.Usage.Value + size <= v.Value then
				v.Usage.Value = v.Usage.Value + size
				local new = Instance.new('Folder',script.Parent.Parent.system.processes) --process folder
				new.Name = name
				local new2 = Instance.new('IntValue',new) --size value
				new2.Name = 'space'
				new2.Value = size
				local new3 = Instance.new('StringValue',new) --slot
				new3.Name = 'slot'
				new3.Value = v.Name
				is_sucess = true
				return true
			end
		end
		if is_sucess == false then
			return false --if user dont have enough space
		end
	end,
	end_process = function (name)
		for _,v in pairs(script.Parent.Parent.system.processes:GetChildren()) do
			if v.Name == name then
				local size = v.space.Value
				local name2 = v.slot.Value
				ram[name2].Usage.Value = ram[name2].Usage.Value - size
				v:Destroy()
			end
		end
	end,
	get_processes = function ()
		local final = {}
		for _,v in pairs(script.Parent.Parent.system.processes:GetChildren()) do
			table.insert(final,v.Name)
		end
		return final
	end,
}

return module
