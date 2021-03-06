param($rootPath, $toolsPath, $package, $project)

# Bail out if Set-IsCheckedOut is disabled (probably because you're running an incompatible version of NuGet)
if (-not (Get-Command Set-IsCheckedOut -ErrorAction SilentlyContinue))  { return }

# Try to delete the solution-level config file, if there is one
if ($project) {
	$solutionDir = [System.IO.Path]::GetDirectoryName($project.DTE.Solution.FullName)
	$configFile = Join-Path $solutionDir "scaffolding.config"
	if (Test-Path $configFile) {
		Set-IsCheckedOut $configFile
		del $configFile
	}
}