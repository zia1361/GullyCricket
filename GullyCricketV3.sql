/****** Object:  Database [GullyCricketV2]    Script Date: 06/08/2022 10:01:20 AM ******/
CREATE DATABASE [GullyCricketV2] ON  PRIMARY 
( NAME = N'GullyCricketV2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GullyCricketV2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GullyCricketV2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\GullyCricketV2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GullyCricketV2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GullyCricketV2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GullyCricketV2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GullyCricketV2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GullyCricketV2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GullyCricketV2] SET ARITHABORT OFF 
GO
ALTER DATABASE [GullyCricketV2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GullyCricketV2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GullyCricketV2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GullyCricketV2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GullyCricketV2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GullyCricketV2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GullyCricketV2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GullyCricketV2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GullyCricketV2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GullyCricketV2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GullyCricketV2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GullyCricketV2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GullyCricketV2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GullyCricketV2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GullyCricketV2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GullyCricketV2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GullyCricketV2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GullyCricketV2] SET RECOVERY FULL 
GO
ALTER DATABASE [GullyCricketV2] SET  MULTI_USER 
GO
ALTER DATABASE [GullyCricketV2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GullyCricketV2] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GullyCricketV2', N'ON'
GO
/****** Object:  Table [dbo].[BowlStatus]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BowlStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BowlStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BowlStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchScore]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchScore](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchId] [int] NOT NULL,
	[BatsmanId] [int] NOT NULL,
	[BowlerId] [int] NOT NULL,
	[BowlStatusId] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_MatchScore] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchStatus]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MatchStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MatchStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerType]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PLayerType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](50) NOT NULL,
	[RegisteredOn] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamPlayers]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamPlayers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[IsPlaying] [bit] NOT NULL,
 CONSTRAINT [PK_TeamPlayers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TournamentName] [varchar](50) NOT NULL,
	[RegisteredOn] [datetime] NOT NULL,
	[WinnerId] [int] NULL,
 CONSTRAINT [PK_Tournament] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentMatches]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentMatches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[Team1Id] [int] NOT NULL,
	[Team2Id] [int] NOT NULL,
	[MatchStatusId] [int] NOT NULL,
	[StartingDate] [datetime] NOT NULL,
	[TossWinningTeamId] [int] NULL,
	[WinnerTeamId] [int] NULL,
	[TargetScore] [int] NULL,
	[CurrentInningTeamId] [int] NULL,
 CONSTRAINT [PK_TournamentMatches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentTeams]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentTeams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentTeams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[LoginId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[ProfileImageURL] [varchar](50) NULL,
	[RegisteredOn] [datetime] NOT NULL,
	[IsVerified] [bit] NOT NULL,
	[PlayerId] [varchar](50) NULL,
	[PlayerTypeId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 06/08/2022 10:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BowlStatus] ON 

INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (1, N'Wd')
INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (2, N'NB')
INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (3, N'B')
INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (4, N'LB')
INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (5, N'Dot')
INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (6, N'W')
INSERT [dbo].[BowlStatus] ([Id], [BowlStatusName]) VALUES (7, N'Bowl')
SET IDENTITY_INSERT [dbo].[BowlStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[MatchStatus] ON 

INSERT [dbo].[MatchStatus] ([Id], [MatchStatusName]) VALUES (1, N'Pending')
INSERT [dbo].[MatchStatus] ([Id], [MatchStatusName]) VALUES (2, N'InProgress')
INSERT [dbo].[MatchStatus] ([Id], [MatchStatusName]) VALUES (3, N'Completed')
INSERT [dbo].[MatchStatus] ([Id], [MatchStatusName]) VALUES (4, N'Drawn')
SET IDENTITY_INSERT [dbo].[MatchStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerType] ON 

INSERT [dbo].[PlayerType] ([Id], [PlayerTypeName]) VALUES (1, N'Batsman')
INSERT [dbo].[PlayerType] ([Id], [PlayerTypeName]) VALUES (2, N'Bowler')
INSERT [dbo].[PlayerType] ([Id], [PlayerTypeName]) VALUES (3, N'All Rounder')
SET IDENTITY_INSERT [dbo].[PlayerType] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([Id], [TeamName], [RegisteredOn], [UserId]) VALUES (2, N'Nazimabad fighters', CAST(N'2022-06-08T09:53:13.820' AS DateTime), 1)
INSERT [dbo].[Team] ([Id], [TeamName], [RegisteredOn], [UserId]) VALUES (3, N'North Karachi fighters', CAST(N'2022-06-08T09:53:21.813' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournament] ON 

INSERT [dbo].[Tournament] ([Id], [UserId], [TournamentName], [RegisteredOn], [WinnerId]) VALUES (1, 1, N'Sindh Trophy', CAST(N'2022-06-08T00:38:27.307' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Tournament] OFF
GO
SET IDENTITY_INSERT [dbo].[TournamentMatches] ON 

INSERT [dbo].[TournamentMatches] ([Id], [TournamentId], [Team1Id], [Team2Id], [MatchStatusId], [StartingDate], [TossWinningTeamId], [WinnerTeamId], [TargetScore], [CurrentInningTeamId]) VALUES (2, 1, 2, 3, 1, CAST(N'2022-06-08T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TournamentMatches] OFF
GO
SET IDENTITY_INSERT [dbo].[TournamentTeams] ON 

INSERT [dbo].[TournamentTeams] ([Id], [TournamentId], [TeamId]) VALUES (4, 1, 2)
INSERT [dbo].[TournamentTeams] ([Id], [TournamentId], [TeamId]) VALUES (5, 1, 3)
SET IDENTITY_INSERT [dbo].[TournamentTeams] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [LoginId], [Password], [UserTypeId], [ProfileImageURL], [RegisteredOn], [IsVerified], [PlayerId], [PlayerTypeId]) VALUES (1, N'Nauman', N'1n@gmail.com', N'n-123', N'786', 1, N'1-DSC_0021.JPG', CAST(N'2022-05-30T20:51:56.560' AS DateTime), 1, N'2022-1', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [LoginId], [Password], [UserTypeId], [ProfileImageURL], [RegisteredOn], [IsVerified], [PlayerId], [PlayerTypeId]) VALUES (2, N'nomibawla', N'2nomibawla@f.v', N'2nomibawlaa', N'nomibawla', 1, NULL, CAST(N'2022-05-30T20:56:20.027' AS DateTime), 0, N'2022-2', NULL)
INSERT [dbo].[Users] ([Id], [Name], [Email], [LoginId], [Password], [UserTypeId], [ProfileImageURL], [RegisteredOn], [IsVerified], [PlayerId], [PlayerTypeId]) VALUES (3, N'ali', N'3ddddddddfd@gmail.com', N'3aaa', N'hjgf', 1, NULL, CAST(N'2022-05-30T21:14:29.990' AS DateTime), 0, N'2022-3', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([Id], [UserTypeName]) VALUES (1, N'Player')
INSERT [dbo].[UserType] ([Id], [UserTypeName]) VALUES (2, N'Organizer')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[MatchScore]  WITH CHECK ADD  CONSTRAINT [FK_MatchScore_BowlStatus] FOREIGN KEY([BowlStatusId])
REFERENCES [dbo].[BowlStatus] ([Id])
GO
ALTER TABLE [dbo].[MatchScore] CHECK CONSTRAINT [FK_MatchScore_BowlStatus]
GO
ALTER TABLE [dbo].[MatchScore]  WITH CHECK ADD  CONSTRAINT [FK_MatchScore_TournamentMatches] FOREIGN KEY([MatchId])
REFERENCES [dbo].[TournamentMatches] ([Id])
GO
ALTER TABLE [dbo].[MatchScore] CHECK CONSTRAINT [FK_MatchScore_TournamentMatches]
GO
ALTER TABLE [dbo].[MatchScore]  WITH CHECK ADD  CONSTRAINT [FK_MatchScore_TournamentTeams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[TournamentTeams] ([Id])
GO
ALTER TABLE [dbo].[MatchScore] CHECK CONSTRAINT [FK_MatchScore_TournamentTeams]
GO
ALTER TABLE [dbo].[MatchScore]  WITH CHECK ADD  CONSTRAINT [FK_MatchScore_Users] FOREIGN KEY([BatsmanId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MatchScore] CHECK CONSTRAINT [FK_MatchScore_Users]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Team_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Team_Users]
GO
ALTER TABLE [dbo].[TeamPlayers]  WITH CHECK ADD  CONSTRAINT [FK_TeamPlayers_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TeamPlayers] CHECK CONSTRAINT [FK_TeamPlayers_Team]
GO
ALTER TABLE [dbo].[TeamPlayers]  WITH CHECK ADD  CONSTRAINT [FK_TeamPlayers_Users] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TeamPlayers] CHECK CONSTRAINT [FK_TeamPlayers_Users]
GO
ALTER TABLE [dbo].[Tournament]  WITH CHECK ADD  CONSTRAINT [FK_Tournament_Team] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Tournament] CHECK CONSTRAINT [FK_Tournament_Team]
GO
ALTER TABLE [dbo].[Tournament]  WITH CHECK ADD  CONSTRAINT [FK_Tournament_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Tournament] CHECK CONSTRAINT [FK_Tournament_Users]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_MatchStatus] FOREIGN KEY([MatchStatusId])
REFERENCES [dbo].[MatchStatus] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_MatchStatus]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_Team] FOREIGN KEY([Team1Id])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_Team]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_Team1] FOREIGN KEY([Team2Id])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_Team1]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_Team2] FOREIGN KEY([WinnerTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_Team2]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_Team3] FOREIGN KEY([CurrentInningTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_Team3]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_Team4] FOREIGN KEY([TossWinningTeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_Team4]
GO
ALTER TABLE [dbo].[TournamentMatches]  WITH CHECK ADD  CONSTRAINT [FK_TournamentMatches_Tournament] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([Id])
GO
ALTER TABLE [dbo].[TournamentMatches] CHECK CONSTRAINT [FK_TournamentMatches_Tournament]
GO
ALTER TABLE [dbo].[TournamentTeams]  WITH CHECK ADD  CONSTRAINT [FK_TournamentTeams_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[TournamentTeams] CHECK CONSTRAINT [FK_TournamentTeams_Team]
GO
ALTER TABLE [dbo].[TournamentTeams]  WITH CHECK ADD  CONSTRAINT [FK_TournamentTeams_Tournament] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([Id])
GO
ALTER TABLE [dbo].[TournamentTeams] CHECK CONSTRAINT [FK_TournamentTeams_Tournament]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_PLayerType] FOREIGN KEY([PlayerTypeId])
REFERENCES [dbo].[PlayerType] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_PLayerType]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserType] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserType] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserType]
GO
ALTER DATABASE [GullyCricketV2] SET  READ_WRITE 
GO
