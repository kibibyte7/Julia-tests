using Plots

function animate_square()
    # Positions initiales du carré
    x = 0.0
    y = 0.0
    speed = 0.75
    direction_x = 0.5  # Direction du mouvement selon l'axe x
    direction_y = 0.1  # Direction du mouvement selon l'axe y
    bounces = 0
    # Création du graphique
    plt = plot(0:1, 0:1, xlims=(-10, 10), ylims=(-10, 10), aspect_ratio=:equal, legend=false)

    while true
    
        # Dessin du carré à la position actuelle
        square = Shape([(x, y), (x+1, y), (x+1, y+1), (x, y+1)])
        
        plot!(plt, square, seriestype=:shape)

        # Mise à jour des positions
        x += speed * direction_x
        y += speed * direction_y

        # Rebondissement sur les bords
        if x >= 10 || x <= -10
            direction_x *= -1  
            speed *= 1.025
            bounces += 1
            #playSound(bounce)
        end

        if y >= 10 || y <= -10
            direction_y *= -1
            speed *= 1.025;
            bounces += 1
            #playSound(bounce)
        end

        # Affichage du carré mis à jour
        display(plt)
        plot!(plt, erase=true)
    end
end

animate_square()
