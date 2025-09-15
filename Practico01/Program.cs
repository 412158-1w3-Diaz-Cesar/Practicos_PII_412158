// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

using Practico01.Domain;
using Practico01.Services;

ArticleService oService = new ArticleService();

List<Article> la = new List<Article>();

if (la.Count > 0)
{
    foreach (Article A in la)
        Console.WriteLine(A);
}
else
    Console.WriteLine("No hay articulos.........");

