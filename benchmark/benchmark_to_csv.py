import csv

size = ["5000", "15000", "30000", "50000"]
output = [["" for i in range(20)] for j in range(4)]

for k in range(4):
    f = open("../logs/db_" + size[k] + "_log.txt")
    i = 0
    index = 0

    for line in f:
        if i % 2 == 0:
            index = int(line.strip().split("_")[1].split(".")[0]) - 1
        else:
            d = line.split()
            x = d[4]
            y = d[-2]
            output[k][index] = int(x)+ int(y)

        i += 1

with open('output.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["", "Database 5000", "Database 15000", "Database 30000", "Database 50000"])

    for i in range(20):
        writer.writerow(["Query " + str(i + 1), output[0][i], output[1][i], output[2][i], output[3][i]])
