import os
#Goes through all the files in current directory, assumes script lies next to files
dir = os.listdir(os.getcwd())
for filename in dir:
	#Declare list for later use
	newLines = []
	#Check whether current file is not self
	if filename != "removereligion.py":
		with open(filename, 'U') as f:
			#Read whole file and split each line into array
			lines = f.read().split('\n')
			#Iterate through each line
			for line in lines:
				#Line is not religion line
				if not "religion_" in line:
					#Line added to list
					newLines.append(line)
		with open(filename, "w") as f:
			#Join the newLines list with \n's and write to line
			f.write("\n".join(newLines))
	#File is self
	else:
		print "Encountered self, skipping.")
input("Press enter to exit the script.")
