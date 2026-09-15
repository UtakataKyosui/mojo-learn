from std.python import Python, PythonObject


def read_scores(path: String) raises -> Float64:
    var csv = Python.import_module("csv")
    var builtins = Python.import_module("builtins")

    var file = builtins.open(path, "r", newline="")
    var reader = csv.DictReader(file)

    var total = Float64(0)
    var count = 0
    for row in reader:
        var name = String(py=row["name"])
        var age = Int(py=builtins.int(row["age"]))
        var score = Float64(py=builtins.float(row["score"]))
        print(name, age, score)
        total += score
        count += 1

    file.close()
    return total / Float64(count)


def main() raises:
    var avg = read_scores("examples/data/sample.csv")
    print("average score:", avg)
