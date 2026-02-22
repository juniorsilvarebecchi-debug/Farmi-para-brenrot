-- Farm para Brenroti - Fuja do Tsunami
-- Script loadstring para automação de farm

local game = game
local workspace = workspace
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Configurações
local FARM_ENABLED = true
local FARM_SPEED = 0.5 -- Velocidade do farm (0.1 a 1.0)
local AUTO_RESPAWN = true

-- Função para farmar brenroti
local function farmBrenroti()
    while FARM_ENABLED do
        pcall(function()
            -- Procura por brenroti no workspace
            local brenroti = workspace:FindFirstChild("Brenroti") or workspace:FindFirstChildOfClass("Part")
            
            if brenroti then
                -- Move o personagem em direção ao brenroti
                Character:MoveTo(brenroti.Position + Vector3.new(0, 3, 0))
                
                -- Tenta coletar/farmar
                if brenroti:FindFirstChild("TouchInterest") then
                    Humanoid:MoveTo(brenroti.Position)
                end
            end
        end)
        
        wait(FARM_SPEED)
    end
end

-- Inicia o farm
farmBrenroti()

print("✓ Script de farm iniciado!")