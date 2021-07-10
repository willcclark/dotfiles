set -gx EDITOR vim

function conf
switch $argv
    case sway
         $EDITOR ~/.config/sway/config
    case '*'
        echo I have no idea where the configuration for $argv is
end
end
