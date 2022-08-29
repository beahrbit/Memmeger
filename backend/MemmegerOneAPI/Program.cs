global using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers().AddJsonOptions(options => 
{ 
    // disable dependency cycle error
    options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
    options.JsonSerializerOptions.WriteIndented = true;
});

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "MemmegerOneAPI", Version = "v1" });

    // Apply Filters for documentation
    c.SchemaFilter<IgnoreReversePropertyFilter>();
    c.SchemaFilter<ChangeKeyAttributeRequiredFilter>();

    // Sets Nullable flags appropriately
    c.SupportNonNullableReferenceTypes(); 
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("v1/swagger.yaml", "MemmegerOneAPI");
    });
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

// after UseHttpsRedirection()
app.UseCors(builder =>
{
    builder.AllowAnyOrigin()
        .AllowAnyMethod()
        .AllowAnyHeader();
});
// before Authentification() and Authorization()

app.UseAuthorization();

app.MapControllers();

app.Run();
