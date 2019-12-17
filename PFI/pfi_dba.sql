--Creation de la connection pour Matieux Powers
USE [master]
GO
CREATE LOGIN [MF_dba] WITH PASSWORD=N'027', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [MF_dba]
GO
use [dbdev];
GO
use [master];
GO
USE [dbdev]
GO
CREATE USER [MF_dba] FOR LOGIN [MF_dba]
GO
USE [dbdev]
GO
ALTER ROLE [db_owner] ADD MEMBER [MF_dba]
GO
use [dbrsh];
GO
use [dbdev];
GO
USE [dbrsh]
GO
CREATE USER [MF_dba] FOR LOGIN [MF_dba]
GO
USE [dbrsh]
GO
ALTER ROLE [db_owner] ADD MEMBER [MF_dba]
GO

--Creation des connection pour les employers