require "main"

Frame = 0

meu_sprite = ui.sprite("sprites/effects/PNG/Explosions/explosion/frame0000.png")

function update()
    Frame = Frame + 1
    loop(Frame)
    ui.spr(meu_sprite, 100, 80)
end 