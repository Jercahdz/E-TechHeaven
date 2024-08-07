using System.ComponentModel.DataAnnotations;

namespace e_tech_heaven.Models
{
    public class Usuario
    {
        public int Id { get; set; }

        [Required]
        [StringLength(250)]
        public string NombreUsuario { get; set; }

        [Required]
        [StringLength(100)]
        public string Correo { get; set; }

        [Required]
        [StringLength(255)]
        public string Contrasena { get; set; }
              
        [Required]
        [StringLength (10)]
        public string Estado { get; set; }

        [Required]
        [StringLength(30)]
        public long Cedula { get; set; }

        [Required]
        [StringLength(50)]
        public int Telefono { get; set; }

        [Required]
        [StringLength(50)]

        public string Role { get; set; }

    }
}
