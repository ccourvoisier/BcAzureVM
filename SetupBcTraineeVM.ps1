Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco feature enable -n allowGlobalConfirmation
choco install git.install --params "/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf"
choco install postman
choco install microsoft-edge

code --install-extension waldo.al-extension-pack

Copy-FileFromBCContainer -containerName navserver -containerPath 'C:\Applications\TestFramework\TestLibraries\Any\Microsoft_Any.app' -localPath 'c:\Microsoft_Any.app'
Copy-FileFromBCContainer -containerName navserver -containerPath 'C:\Applications\TestFramework\TestLibraries\Assert\Microsoft_Library Assert.app' -localPath 'c:\Microsoft_Library Assert.app'
Copy-FileFromBCContainer -containerName navserver -containerPath 'C:\Applications\TestFramework\TestRunner\Microsoft_Test Runner.app' -localPath 'c:\Microsoft_Test Runner.app'
Copy-FileFromBCContainer -containerName navserver -containerPath 'C:\Applications\BaseApp\Test\Microsoft_Tests-TestLibraries.app' -localPath 'c:\Microsoft_Tests-TestLibraries.app'
Copy-FileFromBCContainer -containerName navserver -containerPath 'C:\Applications\System Application\test\Microsoft_System Application Test Library.app' -localPath 'c:\Microsoft_System Application Test Library.app'
Copy-FileFromBCContainer -containerName navserver -containerPath 'C:\Applications\System Application\test\Microsoft_System Application Test.app' -localPath 'c:\Microsoft_System Application Test.app'


Publish-NavContainerApp -containerName 'navserver' -appFile 'c:\Microsoft_Any.app' -skipVerification -sync -install
Publish-NavContainerApp -containerName 'navserver' -appFile 'c:\Microsoft_Library Assert.app' -skipVerification -sync -install
Publish-NavContainerApp -containerName 'navserver' -appFile 'c:\Microsoft_Test Runner.app' -skipVerification -sync -install
Publish-NavContainerApp -containerName 'navserver' -appFile  'c:\Microsoft_System Application Test Library.app' -skipVerification -sync -install
Publish-NavContainerApp -containerName 'navserver' -appFile  'c:\Microsoft_System Application Test.app' -skipVerification -sync -install
Publish-NavContainerApp -containerName 'navserver' -appFile  'c:\Microsoft_Tests-TestLibraries.app' -skipVerification -sync -install