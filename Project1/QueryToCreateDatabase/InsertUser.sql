use PizzaOnline

--INSERT USER
INSERT [dbo].tUser ([User_ID], [Role_ID], [Google_ID], [Code], [Nickname], [Password], [Email], [Address], [First_name], [Last_name], 
[Point], [PhoneNumber], [ResetToken], [ResetTokenExpiry], [Created_by], [Created_date], [Last_Modified_by], [Last_Modified_date], [Deleted], [IsGoogleAccount], [RememberMe]) values
(1, 3, null, N'QTV01' , N'Admin', 12345, N'thinhan0606@gmail.com', N'Ngọc Thụy, Long Biên, Hà Nội', null, null, 10000, '0365223698', null, null, null, GETDATE(), NULL, GETDATE(), 0, 0, 0)