require "palette"

meu_sprite = "sprites/effects/PNG/Explosions/explosion/frame0000.png"

function loop(frame)
    
    for i = 1, #Palette do
        local color = Palette[i]
        ui.palset(i - 1, color)
    end

    ui.clip(0,0,480,270)
    ui.camera(0,0)
    ui.cls(Palette.hex(0x45283c))
    
    ui.print("Teste jogo!", 32, 32, Palette.hex(0xFFFFFF))
    ui.spr(Sprites.sprites.effects.PNG.Explosions.explosion.frame0000, 100, 80)
end 