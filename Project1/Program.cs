﻿using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.EntityFrameworkCore;
using Project1.Models;
using Project1.Repository_Menu;
using Project1.Services;

var builder = WebApplication.CreateBuilder(args);

//đã xóa cookies google

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", policy =>
        policy.RequireRole("1", "3")); // Chỉ các Roles có giá trị là 1 (Admin) hoặc 3 (Sub-admin) mới được truy cập
});
// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDistributedMemoryCache();

var connectionString = builder.Configuration.GetConnectionString("PizzaOnlineContext");
builder.Services.AddDbContext<PizzaOnlineContext>(x=>x.UseSqlServer(connectionString));
builder.Services.AddScoped<EmailService>();
builder.Services.AddScoped<IMenuRepository, MenuRepository>();
builder.Services.AddHttpContextAccessor();
//Thêm Session
//Begin
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30); // Thời gian tồn tại của session
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});
//End

// đăng ký VnPayClient dạng Singleton() - chỉ có 1 instance duy nhất trong toàn ứng dụng
builder.Services.AddSingleton<IVnPayService, VnPayService>();

// đăng ký PaypalClient dạng Singleton()
builder.Services.AddSingleton(x => new PaypalClient(
        builder.Configuration["PaypalOptions:AppId"],
        builder.Configuration["PaypalOptions:AppSecret"],
        builder.Configuration["PaypalOptions:Mode"]
));

builder.Services.AddSingleton<ExchangeRateService>();
builder.Services.Configure<ExchangeRateApiOptions>(
    builder.Configuration.GetSection("ExchangeRateApi")
);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

//kích hoạt session
app.UseSession();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Welcome}/{action=WelcomePage}/{id?}");

app.Run();
