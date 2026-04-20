#  PART 1

# Task 1,2
with open("students.txt") as f:
    students = f.read().splitlines()
print(students)
print(len(students))

# Task 3
unique = set(students)
print(unique)

# Task 4
count = {}
for s in students:
    if s in count:
        count[s] += 1
    else:
        count[s] = 1
print(count)

# Task 5
with open("unique_students.txt", "w") as f:
    for s in unique:
        f.write(s + "\n")


#  PART 2

# Task 6,7
import json
data = json.load(open("marks.json"))

for s in data["students"]:
    print(s["name"], s["marks"])

# Task 8
top_name = ""
top_marks = 0
for s in data["students"]:
    if s["marks"] > top_marks:
        top_marks = s["marks"]
        top_name = s["name"]
print(top_name)

# Task 9
low_name = ""
low_marks = 999
for s in data["students"]:
    if s["marks"] < low_marks:
        low_marks = s["marks"]
        low_name = s["name"]
print(low_name)

# Task 10
total = 0
for s in data["students"]:
    total += s["marks"]
print(total / len(data["students"]))

# Task 11
for s in data["students"]:
    if s["course"] == "Python":
        print(s["name"])

# Task 12
course_count = {}
for s in data["students"]:
    c = s["course"]
    if c in course_count:
        course_count[c] += 1
    else:
        course_count[c] = 1
print(course_count)


#PART 3

# Task 13,14
import csv
attendance = []
with open("attendance.csv") as f:
    reader = csv.DictReader(f)
    for row in reader:
        attendance.append(row)
print(attendance)

# Task 15
percent = {}
for a in attendance:
    name = a["name"]
    p = (int(a["days_present"]) / int(a["total_days"])) * 100
    percent[name] = p
print(percent)

# Task 16
for n in percent:
    if percent[n] < 80:
        print(n)

# Task 17
best = ""
best_val = 0
for n in percent:
    if percent[n] > best_val:
        best_val = percent[n]
        best = n
print(best)


#  PART 4

# Task 18
marks_list = []
for s in data["students"]:
    marks_list.append(s["marks"])

print(max(marks_list))
print(min(marks_list))
print(sum(marks_list))

# Task 19
courses = []
for s in data["students"]:
    courses.append(s["course"])
print(tuple(courses))

# Task 20
print(set(courses))

# Task 21
marks_dict = {}
for s in data["students"]:
    marks_dict[s["name"]] = s["marks"]
print(marks_dict)

# Task 22
print(percent)


#  PART 5

# Task 23
for s in data["students"]:
    if s["marks"] >= 50:
        print(s["name"], "Pass")
    else:
        print(s["name"], "Fail")

# Task 24
for s in data["students"]:
    m = s["marks"]
    if m >= 90:
        print(s["name"], "A")
    elif m >= 75:
        print(s["name"], "B")
    elif m >= 50:
        print(s["name"], "C")
    else:
        print(s["name"], "Fail")

# Task 25
for s in data["students"]:
    name = s["name"]
    if s["marks"] > 80 and percent[name] > 85:
        print(name)


#  PART 6

# Task 26
def load_names():
    return open("students.txt").read().splitlines()

# Task 27
def load_marks():
    import json
    return json.load(open("marks.json"))

# Task 28
def load_attendance():
    import csv
    data = []
    for r in csv.DictReader(open("attendance.csv")):
        data.append(r)
    return data

# Task 29
def avg_marks(data):
    t = 0
    for s in data["students"]:
        t += s["marks"]
    return t / len(data["students"])

# Task 30
def att_percent(a):
    return (int(a["days_present"]) / int(a["total_days"])) * 100

# Task 31
def topper(data):
    name = ""
    m = 0
    for s in data["students"]:
        if s["marks"] > m:
            m = s["marks"]
            name = s["name"]
    return name

# Task 32
def grade(m):
    if m >= 90:
        return "A"
    elif m >= 75:
        return "B"
    elif m >= 50:
        return "C"
    else:
        return "Fail"


#  PART 7

# Task 33
final = {}

for s in data["students"]:
    name = s["name"]
    final[name] = {
        "marks": s["marks"],
        "course": s["course"],
        "attendance": percent[name]
    }

# Task 34
for n in final:
    print(n, final[n]["marks"], final[n]["attendance"], final[n]["course"], grade(final[n]["marks"]))

# Task 35
for n in final:
    if final[n]["marks"] >= 75 and final[n]["attendance"] >= 80:
        print(n)

# Task 36
for n in final:
    if final[n]["marks"] < 75 or final[n]["attendance"] < 80:
        print(n)


#  PART 8

# Task 37
with open("report.txt", "w") as f:
    f.write("Student Report\n")
    for n in final:
        f.write(n + " Marks:" + str(final[n]["marks"]) +
                " Attendance:" + str(final[n]["attendance"]) +
                " Grade:" + grade(final[n]["marks"]) + "\n")

# Task 38
with open("eligible_students.txt", "w") as f:
    for n in final:
        if final[n]["marks"] >= 75 and final[n]["attendance"] >= 80:
            f.write(n + "\n")


#  FINAL

# Task 39
print(topper(data))
print( best)
print( avg_marks(data))
for n in final:
    if final[n]["marks"] >= 75 and final[n]["attendance"] >= 80:
        print(n)
for n in final:
    if final[n]["marks"] < 75 or final[n]["attendance"] < 80:
        print(n)