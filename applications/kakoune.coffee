# Driving kakoune
#echo eval -client unnamed0 %{ exec %{ o helloworld \<esc\> } } | kak -p ecat

# Finding active kakoune session/whether kakoune
#diannao:eCatalog (14:56) $ tmux list-panes -F "#{pane_active} | #T"
#0 | Classes/MainViewController.m 415:36  1 sel - unnamed0@[ecat] - Kakoune
#0 | Classes/DataObject.h 45:12  1 sel - unnamed2@[ecat] - Kakoune
#0 | Classes/CatalogViewController.m 381:57  1 sel - unnamed1@[ecat] - Kakoune
#0 | Classes/EditStackViewController.swift 31:15  1 sel - unnamed3@[ecat] - Kakoune
#1 | ~/Library/jimmyconf/.tmux.conf 5:35  prompt - unnamed0@[65593] - Kakoune
#0 | *scratch* 1:1  prompt - unnamed0@[60549] - Kakoune


#idea:
# have kakoune ensure it publishes its context@session in the window title bar
# check the window title bar to determine if kakoune is active
