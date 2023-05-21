# Defining URL
$url = "https://geolocation-db.com/jsonp/"

# Making the request and parsing the response
$response = Invoke-RestMethod -Uri $url -Method Get

# Removing "callback(" and ")"
$response = $response -replace "^[^\(]*\(" -replace "\)[^\)]*$"

# Converting from JSON
$json = $response | ConvertFrom-Json

# Get the location of the desktop
$desktop = [Environment]::GetFolderPath("Desktop")

# Write latitude and longitude to a file on the desktop
$latitude_longitude = "Latitude: $($json.latitude) Longitude: $($json.longitude)"
Set-Content -Path "$desktop\file.txt" -Value $latitude_longitude