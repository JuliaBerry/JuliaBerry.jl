while true
	if read(ExplorerHat.input[1]) == 1
		on(ExplorerHat.motor[1], 50)
		sleep(0.5)
		off(ExplorerHat.motor[1])
	end
        sleep(0.2)
end
