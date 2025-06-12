use PizzaOnline

--INSERT ROLE
INSERT [dbo].tRole ([Role_ID], [Code], [Name], [Last_Modified_date], [Last_Modified_by], [Created_date], [Created_by]) values
(1, N'QTV', N'Quản trị viên', GETDATE(), N'Super Admin', GETDATE(), N'Super Admin'),
(2, N'USER', N'Người dùng', GETDATE(), N'Super Admin', GETDATE(), N'Super Admin'),
(3, N'USER', N'Siêu Quản trị viên', GETDATE(), N'Super Admin', GETDATE(), N'Super Admin')