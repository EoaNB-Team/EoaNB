months = [-1, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def rdc(s_y,s_m,s_d,d):
	d += s_d
	e_y = s_y + d // 365
	d = d % 365
	m = s_m
	while d > months[m]:
		d -= months[m]
		if m == 12:
			m = 1
			e_y += 1
		else:
			m += 1
	if d == 0:
		m -= 1
		d = months[m]
	print("The end date is ",e_y,".",m,".",d,sep="")


while True:
	print("Press enter without anything for the 1857 start date.")
	yearString =  input("Enter the year of the KDE effect (the year in the name): ")
	print("")

	if yearString == "":
		y = 1857
		m = 5
		d = 11
	else:
		y = int(yearString)
		m = 1
		d = 1

	r = int(input("Enter the amount of days from the specified start date: "))
	rdc(y,m,d,r)
	print("")

