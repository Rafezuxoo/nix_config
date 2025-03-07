if status is-interactive
    set fish_greeting ""
    set fish_key_bindings fish_vi_key_bindings
    fastfetch -l small

    # Commands to run in interactive sessions can go here
    oh-my-posh init fish --config /home/raf/.config/oh_my_posh/tokyo-minimal.omp.json | source
    zoxide init fish | source
end
