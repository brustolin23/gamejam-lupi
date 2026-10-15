require "palette"
require "sprites"

local NUM_QUADROS = 13
local CADENCIA = 3
i = 0

explosoes = {}

function criar_explosao(x, y)
    table.insert(explosoes, { x = x, y = y, t = 0 })
end

local function atualizar_explosoes()
    for i = #explosoes, 1, -1 do
        local e = explosoes[i]
        e.t = e.t + 1
        if e.t // CADENCIA >= NUM_QUADROS then
            table.remove(explosoes, i)
        end
    end
end

--//função de explodir
local function desenhar_explosoes()
    for _, e in ipairs(explosoes) do
        local quadro = e.t // CADENCIA + 1
        local chave = string.format("%02d", quadro)
        ui.spr(Sprites.fx.explosion[chave], e.x, e.y)
    end
end

function loop(frame)
    for i = 1, #Palette do
        ui.palset(i - 1, Palette[i])
    end

    ui.clip(0, 0, 480, 270)
    ui.camera(0, 0)
    ui.cls(Palette.hex(0x45283c))

    if ui.btnp(BTN_Z) then
        criar_explosao(100, 80)
        i = i+1
    end

    atualizar_explosoes()
    ui.print("Z = explodir "..i, 32, 32, Palette.hex(0xFFFFFF))
    desenhar_explosoes()
end