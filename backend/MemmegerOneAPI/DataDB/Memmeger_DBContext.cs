using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace MemmegerOneAPI.DataDB
{
    public partial class Memmeger_DBContext : DbContext
    {
        public Memmeger_DBContext()
        {
        }

        public Memmeger_DBContext(DbContextOptions<Memmeger_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TestTable> TestTables { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=memmeger.database.windows.net;Initial Catalog=Memmeger_DB;Persist Security Info=True;User ID=Mammeger;Password=Bremsnitz08?!");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<TestTable>(entity =>
            {
                entity.HasKey(e => e.NutzerId)
                    .HasName("PK__TestTabl__C0768D35664E4BFC");

                entity.ToTable("TestTable");

                entity.Property(e => e.NutzerId)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("NutzerID");

                entity.Property(e => e.Benutzername)
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasNoKey();

                entity.Property(e => e.Email)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.UserId)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("User_ID");

                entity.Property(e => e.Username)
                    .HasMaxLength(200)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
