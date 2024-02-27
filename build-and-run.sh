compilerPath='/home/wilsha/PlaydateSDK-1.9.0/bin/pdc'
simulatorPath='/home/wilsha/PlaydateSDK-1.9.0/bin/PlaydateSimulator'
sourcePath='./Source'
outputPath='./output.pdx'

# pdc [sourcepath] [outputpath]

echo "Compiler path:  $compilerPath"
echo "Simulator path: $simulatorPath"
echo "Source path:    $sourcePath"
echo "Output path:    $outputPath"
echo ""

echo "Compile source..."
$compilerPath $sourcePath $outputPath

echo "Opening simulator..."
$simulatorPath $outputPath
