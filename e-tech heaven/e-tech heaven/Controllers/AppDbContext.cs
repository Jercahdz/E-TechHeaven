using Microsoft.VisualBasic;
using System.Collections.Generic;
using e_tech_heaven.Models;
using Microsoft.EntityFrameworkCore;

namespace e_tech_heaven.Controllers
{
    public class AppDbContext : DbContext
        {
            public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
            {
            }
            public DbSet<Articulos> ETechHeavenDB { get; set; }

            protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            {
                optionsBuilder.UseSqlServer("Server=localhost\\SQLEXPRESS01;Database=master;Trusted_Connection=True;TrustServerCertificate=True;");
            }
        }
}
