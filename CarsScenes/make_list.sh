for file in *.tscn; do
    echo "load(\"res://CarsScenes/$file\"),"
done
