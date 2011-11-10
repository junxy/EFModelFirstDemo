
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/10/2011 11:13:15
-- Generated from EDMX file: E:\MyProjects\LearnProjects\MvcApplicationModelFirstDemo\MvcApplication\ModelBlog.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DatabaseBlog];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UsersPost]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_UsersPost];
GO
IF OBJECT_ID(N'[dbo].[FK_PostCategories]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Posts] DROP CONSTRAINT [FK_PostCategories];
GO
IF OBJECT_ID(N'[dbo].[FK_PostTags_Post]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Post];
GO
IF OBJECT_ID(N'[dbo].[FK_PostTags_Tags]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostTags] DROP CONSTRAINT [FK_PostTags_Tags];
GO
IF OBJECT_ID(N'[dbo].[FK_CommentPost]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_CommentPost];
GO
IF OBJECT_ID(N'[dbo].[FK_UsersUserExtra]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_UsersUserExtra];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Posts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Posts];
GO
IF OBJECT_ID(N'[dbo].[Categories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Categories];
GO
IF OBJECT_ID(N'[dbo].[Comments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comments];
GO
IF OBJECT_ID(N'[dbo].[Tags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tags];
GO
IF OBJECT_ID(N'[dbo].[UserExtras]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserExtras];
GO
IF OBJECT_ID(N'[dbo].[PostTags]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostTags];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Passowrd] nvarchar(max)  NOT NULL,
    [IsAdmin] bit  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [UserExtras_UserID] int  NOT NULL
);
GO

-- Creating table 'Posts'
CREATE TABLE [dbo].[Posts] (
    [PostID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [PublishedDate] datetime  NOT NULL,
    [Auther] int  NOT NULL,
    [Category] int  NOT NULL,
    [User_UserID] int  NOT NULL,
    [Categories_CategoryID] int  NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [CategoryID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [dbo].[Comments] (
    [CommentID] int IDENTITY(1,1) NOT NULL,
    [Content] nvarchar(max)  NOT NULL,
    [PostID] nvarchar(max)  NOT NULL,
    [Posts_PostID] int  NOT NULL
);
GO

-- Creating table 'Tags'
CREATE TABLE [dbo].[Tags] (
    [TagID] int IDENTITY(1,1) NOT NULL,
    [TagName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'UserExtras'
CREATE TABLE [dbo].[UserExtras] (
    [UserID] int  NOT NULL,
    [LastIP] nvarchar(max)  NOT NULL,
    [LsatDate] datetime  NOT NULL
);
GO

-- Creating table 'PostTags'
CREATE TABLE [dbo].[PostTags] (
    [Post_PostID] int  NOT NULL,
    [Tags_TagID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [PostID] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [PK_Posts]
    PRIMARY KEY CLUSTERED ([PostID] ASC);
GO

-- Creating primary key on [CategoryID] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([CategoryID] ASC);
GO

-- Creating primary key on [CommentID] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([CommentID] ASC);
GO

-- Creating primary key on [TagID] in table 'Tags'
ALTER TABLE [dbo].[Tags]
ADD CONSTRAINT [PK_Tags]
    PRIMARY KEY CLUSTERED ([TagID] ASC);
GO

-- Creating primary key on [UserID] in table 'UserExtras'
ALTER TABLE [dbo].[UserExtras]
ADD CONSTRAINT [PK_UserExtras]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [Post_PostID], [Tags_TagID] in table 'PostTags'
ALTER TABLE [dbo].[PostTags]
ADD CONSTRAINT [PK_PostTags]
    PRIMARY KEY NONCLUSTERED ([Post_PostID], [Tags_TagID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [User_UserID] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [FK_UsersPost]
    FOREIGN KEY ([User_UserID])
    REFERENCES [dbo].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersPost'
CREATE INDEX [IX_FK_UsersPost]
ON [dbo].[Posts]
    ([User_UserID]);
GO

-- Creating foreign key on [Categories_CategoryID] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [FK_PostCategories]
    FOREIGN KEY ([Categories_CategoryID])
    REFERENCES [dbo].[Categories]
        ([CategoryID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostCategories'
CREATE INDEX [IX_FK_PostCategories]
ON [dbo].[Posts]
    ([Categories_CategoryID]);
GO

-- Creating foreign key on [Post_PostID] in table 'PostTags'
ALTER TABLE [dbo].[PostTags]
ADD CONSTRAINT [FK_PostTags_Post]
    FOREIGN KEY ([Post_PostID])
    REFERENCES [dbo].[Posts]
        ([PostID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Tags_TagID] in table 'PostTags'
ALTER TABLE [dbo].[PostTags]
ADD CONSTRAINT [FK_PostTags_Tags]
    FOREIGN KEY ([Tags_TagID])
    REFERENCES [dbo].[Tags]
        ([TagID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PostTags_Tags'
CREATE INDEX [IX_FK_PostTags_Tags]
ON [dbo].[PostTags]
    ([Tags_TagID]);
GO

-- Creating foreign key on [Posts_PostID] in table 'Comments'
ALTER TABLE [dbo].[Comments]
ADD CONSTRAINT [FK_CommentPost]
    FOREIGN KEY ([Posts_PostID])
    REFERENCES [dbo].[Posts]
        ([PostID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentPost'
CREATE INDEX [IX_FK_CommentPost]
ON [dbo].[Comments]
    ([Posts_PostID]);
GO

-- Creating foreign key on [UserExtras_UserID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_UsersUserExtra]
    FOREIGN KEY ([UserExtras_UserID])
    REFERENCES [dbo].[UserExtras]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersUserExtra'
CREATE INDEX [IX_FK_UsersUserExtra]
ON [dbo].[Users]
    ([UserExtras_UserID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------