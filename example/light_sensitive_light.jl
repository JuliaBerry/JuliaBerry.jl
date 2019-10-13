while true
	if read(ExplorerHat.analog[1]) < 0.5
		on(ExplorerHat.output[1])
	else
		off(ExplorerHat.output[1])
        end
	sleep(1)
end
