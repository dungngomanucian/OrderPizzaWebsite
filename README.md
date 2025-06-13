# OrderPizzaWebsite

Ứng dụng web quản lý cửa hàng Pizza, sử dụng ASP.NET Core MVC và SQL Server, hỗ trợ CRUD menu, đặt hàng, thanh toán online, giao hàng tận nơi.

---

## 🚀 Khởi động dự án

1. **Tạo database**  
   Vào folder `Project1/QueryToCreateDatabase`, chạy các file `.sql` để tạo database `PizzaOnline` và các bảng cần thiết.

2. **Cập nhật `ConnectionString`**
   Mở file `Project1/Models/PizzaOnlineContext.cs`, tìm dòng:
   ```csharp
   optionsBuilder.UseSqlServer("Data Source=LAPTOP-CESR45S5\\SQLEXPRESS;Initial Catalog=PizzaOnline;Integrated Security=True;Connect Timeout=30;Encrypt=True;Trust Server Certificate=True;Application Intent=ReadWrite;Multi Subnet Failover=False");
   Thay thế phần trong dấu ngoặc kép bằng connection string của database mới tạo ở bước 1, ví dụ:
optionsBuilder.UseSqlServer("Data Source=MY-SERVER\\SQLEXPRESS;Initial Catalog=PizzaOnline;User ID=sa;Password=...");

3. **Khởi chạy dự án** 
    Mở Visual Studio → Build → Run (F5) để khởi động website. Ứng dụng sẽ chạy và kết nối với database.
