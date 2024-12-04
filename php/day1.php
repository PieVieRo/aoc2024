<?php
function parse(string $filepath) {
    $file = fopen($filepath, "r") or die("file not found");
    $input = fread($file, filesize($filepath));
    fclose($file);
    $ids = explode("\n", $input);
    array_pop($ids);
    foreach($ids as &$id) { 
        $id = array_map("intval", explode("   ", $id));
    } unset($id);
    $ids = array_map(null, ...$ids);
    return $ids;
}

function firstHalf(array $ids) {
    sort($ids[0], SORT_NUMERIC);
    sort($ids[1], SORT_NUMERIC);

    $distances = array();
    for($i = 0; $i < count($ids[0]); $i++) {
        $distance =  abs($ids[0][$i] - $ids[1][$i]);
        array_push($distances, $distance);
    }
    return array_sum($distances) . "\n";
}

function secondHalf(array $ids) { 
    $left = $ids[0];
    $right = $ids[1];
    $values = array_count_values($right);
    $appear = array_intersect($left, array_keys($values));
    $score = 0;
    foreach($appear as $num) {
        $score += $num * $values[$num];
    }
    return $score;
}

const filepath = "../day1.txt";
$ids = parse(filepath);
echo firstHalf($ids);
echo secondHalf($ids);

