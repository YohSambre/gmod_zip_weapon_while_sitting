-- suggest by Jamesinator
concommand.Add( "disable_weapons_in_vehicles", function( ply, cmd, args )
    ply:SetAllowWeaponsInVehicle( false )
end )

hook.Add( "PlayerSay", "DisableWeaponsInVehicles", function( ply, text )
	if ( string.lower( text ) == "/dwiv" ) then
		ply:SetAllowWeaponsInVehicle( false )
		return ""
	end
end)

local function MagicPower(ply, ent)
    ply:SetAllowWeaponsInVehicle(true)
end
hook.Add("PlayerEnteredVehicle", "ZIPWEAPONSWHILESITTING", MagicPower)

-- requested and hoped for by many people, have fun my friends ㋡ !
hook.Add("EntityFireBullets", "ZIPBADFIXFORSELFDAMAGE", function(ply, data)
    if ply:IsPlayer() then
        if ply:InVehicle() then
            local veh = ply:GetVehicle()
            	if IsValid(veh) then
                	data.IgnoreEntity = veh
                		data.Callback = function() 
                		end
            		end
        		end
    		elseif ply:IsNPC() then
        return true
    end
end)
