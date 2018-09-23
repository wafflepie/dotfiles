function fish_greeting
    set_color $fish_color_autosuggestion
    fortune -a
    echo ""
    set_color normal
end
