# Update Entitiy Framework

1. Installation: https://docs.microsoft.com/de-de/ef/core/cli/dotnet
2. open project in Visual Studio
3. open PM-console (Ansicht -> weitere Fenster -> Paket-Manager-Konsole)
4. run `Scaffold-DbContext "Data Source=memmeger.database.windows.net;Initial Catalog=Memmeger_DB;Persist Security Info=True;User ID=Mammeger;Password=Bremsnitz08?!" Microsoft.EntityFrameworkCore.SqlServer -DataAnnotations -OutputDir DataDB -f`

# Videos watched

https://www.youtube.com/watch?v=kMCNTLnna04&t=824s
https://www.youtube.com/watch?v=Fbf_ua2t6v4&t=3199s

# TOPICS

- generating .yaml spec: https://khalidabuhakmeh.com/generate-aspnet-core-openapi-spec-at-build-time
- WIP:
  - https://stackoverflow.com/questions/41005730/how-to-configure-swashbuckle-to-ignore-property-on-model
  - https://github.com/domaindrivendev/Swashbuckle.AspNetCore/issues/498
