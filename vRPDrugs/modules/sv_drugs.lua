-- vRP TUNNEL/PROXY
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_Drugs")

-- RESOURCE TUNNEL/PROXY
ElementDrugsSV = {}
Tunnel.bindInterface("vRP_Drugs",ElementDrugsSV)
Proxy.addInterface("vRP_Drugs",ElementDrugsSV)
vRPDrugsClient = Tunnel.getInterface("vRP_Drugs","vRP_Drugs")

function ElementDrugsSV.IsPlayerNearCoords(source, coords, radius)
  local distance = #(GetEntityCoords(GetPlayvRPed(source)) - coords)
  if distance < (radius + 0.00001) then
    return true
  end
  return false
end
