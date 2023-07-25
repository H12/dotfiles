function print_heading
	echo
	echo -n $argv[1]
	sleep 0.1; echo -n ".";
	sleep 0.1; echo -n ".";
	sleep 0.1; echo -n ".";
	echo
	sleep 0.1
end

function condense_cargo_output
	set -l c "Compiling"
	set -l d "Downloaded"

	set -f prev_match "No Match"
	while read -l line
		set -l curr_match (string match --regex "$c|$d" $line)

		string match --regex ".*crates\.io*" "$line" &> /dev/null
		set -l updating_index $status

		if test $curr_match
			if test $curr_match = $prev_match
				echo -ne "\r\e[K$line"
			else
				if test $prev_match = $c -o $prev_match = $d
					echo
				end

				echo -n $line
			end

			set -f prev_match $curr_match
		else
			if test $prev_match = $c -o $prev_match = $d
				echo
			end

			if test $updating_index -ne 0
				echo $line
			end

			set -f prev_match "No Match"
		end
	end
end
