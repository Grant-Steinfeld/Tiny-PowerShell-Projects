# WOD (Workout of the Day)

Create a program that will read a CSV `-f` or `-file` of exercises (default `exercises.csv`) and create a Workout of the Day

```
C:\> ./wod.ps1 -s 2

Exercise Reps
-------- ----
Pullups    21
Plank      43
Crunches   30
Lunges     28
```

The program should accept an alternate `-file`

```
C:\> ./wod.ps1 -f ./inputs/silly-exercises.csv -seed 1

Exercise             Reps
--------             ----
Erstwhile Lunges       14
Masochistic Eardowns   15
Hanging Chads          73
Rock Squats            32
```

The file structure looks like this

```
C:\> cat .\inputs\exercises.csv
exercise,reps
Burpees,20-50
Situps,40-100
Pushups,25-75
Squats,20-50
Pullups,10-30
Hand-stand pushups,5-20
Lunges,20-40
Plank,30-60
Crunches,20-30
```

The program should accept an `-n` or `-num` argument to control the number of exercises which are randomly chosen from the input file.

The "Reps" value will be randomly chosen from the given low/high range in the "reps" column

```
C:\> ./wod.ps1 -n 2

Exercise Reps
-------- ----
Pushups    73
Burpees    43
```

The program should accept a `-s` or `-seed` value for the random seed to ensure reproducibility

```
C:\> ./wod.ps1 -s 1

Exercise           Reps
--------           ----
Burpees              28
Lunges               25
Hand-stand pushups   14
Situps               73
```

As well as a `-e` or `-easy` flag to indicate that the reps should be halved

```
C:\> ./wod.ps1 -s 1 -e

Exercise           Reps
--------           ----
Burpees              14
Lunges               12
Hand-stand pushups    7
Situps               36
```