# Stolen from https://gist.github.com/eugenet8k/535bf3c51d1fc7c31cb8784e55d4dae4

function __check_nvm --on-variable PWD
    if test -f .nvmrc
        set node_version (nvm version)
        set nvmrc_node_version (nvm version (cat .nvmrc))

        if [ $nvmrc_node_version = "N/A" ]
            nvm install
        else if [ $nvmrc_node_version != $node_version ]
            nvm use
        end

        set -gx X_NVM_DIRTY_FLAG 1
    else if set -q X_NVM_DIRTY_FLAG
        and [ (node --version) != (nvm version default) ]
        nvm use default
        set -e X_NVM_DIRTY_FLAG
    end
end

__check_nvm
