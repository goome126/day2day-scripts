function Show-Banner {
    Write-Host "`n===============================================" -ForegroundColor Cyan
    Write-Host "        EXCALIDRAW SYNC UTILITY" -ForegroundColor Cyan  
    Write-Host "===============================================`n" -ForegroundColor Cyan
}

# Main script
Show-Banner

# Check if the environment variables exist
if (-not $env:EXCALIDRAW_LOCAL_PATH) {
    Write-Host "Error: Environment variable EXCALIDRAW_LOCAL_PATH is not set." -ForegroundColor Red
    Write-Host "Please set it with: [System.Environment]::SetEnvironmentVariable('EXCALIDRAW_LOCAL_PATH', 'your_path', 'User')" -ForegroundColor Yellow
    exit 1
}

if (-not $env:EXCALIDRAW_REMOTE_PATH) {
    Write-Host "Error: Environment variable EXCALIDRAW_REMOTE_PATH is not set." -ForegroundColor Red
    Write-Host "Please set it with: [System.Environment]::SetEnvironmentVariable('EXCALIDRAW_REMOTE_PATH', 'your_remote_path', 'User')" -ForegroundColor Yellow
    exit 1
}

# Display the paths being used
Write-Host "Local path: $env:EXCALIDRAW_LOCAL_PATH" -ForegroundColor Green
Write-Host "Remote path: $env:EXCALIDRAW_REMOTE_PATH" -ForegroundColor Green
Write-Host "`nStarting synchronization...`n" -ForegroundColor White

# Run the rclone sync command
try {
    rclone sync -P $env:EXCALIDRAW_LOCAL_PATH $env:EXCALIDRAW_REMOTE_PATH
    Write-Host "`nSync completed successfully!" -ForegroundColor Green
}
catch {
    Write-Host "`nSync failed with error: $_" -ForegroundColor Red
}

Write-Host "`nThank you for using Excalidraw Sync Utility!" -ForegroundColor Cyan