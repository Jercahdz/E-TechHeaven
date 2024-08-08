using e_tech_heaven.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;

namespace e_tech_heaven.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, AppDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        //Get: Articulos
        public async Task<IActionResult> Index()
        {
            return View(await _context.ETechHeavenDB.ToListAsync());
        }

        //Get: Articulos/Detalle/{id}
        public async Task<IActionResult> Articulo(int id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var articulos = await _context.ETechHeavenDB.FirstOrDefaultAsync(m => m.ArticuloId == id);

            if (articulos == null)
            {
                return NotFound();
            }

            return View(articulos);
        }

       public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
