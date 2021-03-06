using INMEDIK.Models.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace INMEDIK.Models.Helpers
{
    public class PackageAux : ConceptAux
    {
        public List<PackageConceptAux> packageConceptAux { get; set; }
        public PackageAux()
        {
            this.packageConceptAux = new List<PackageConceptAux>();
        }
    }
    public class PackageResult : Result
    {
        public PackageAux data { get; set; }
    }
    public class PackageConceptAux
    {
        public ConceptAux conceptAux { get; set; }
        public int quantity { get; set; }
        public WarehouseAux warehouse { get; set; }
        public PackageConceptAux()
        {
            this.conceptAux = new ConceptAux();
            this.warehouse = new WarehouseAux();
        }
    }

    public class ProductAux
    {
        public int id { get; set; }
        public int sale_first { get; set; }
        public int sale_second { get; set; }
        public List<ProductWarehouseAux> productWarehouseAux { get; set; }
        public bool licenseRequired { get; set; }
        public string code { get; set; }
        public bool nurse { get; set; }

        public ProductAux()
        {
            this.productWarehouseAux = new List<ProductWarehouseAux>();
        }
    }

    public class ProductWarehouseAux
    {
        public WarehouseAux warehouseAux { get; set; }
        public int minStock { get; set; }

        public ProductWarehouseAux()
        {
            this.warehouseAux = new WarehouseAux();
        }
    }

    public class TestAux
    {
        public bool xray { get; set; }
        public bool laboratory { get; set; }
    }

    public class TotalConceptsAux
    {
        public decimal total { get; set; }
    }

    public class TotalConceptsResult : Result
    {
        public TotalConceptsAux data { get; set; }
        public List<TotalConceptsAux> data_list { get; set; }
        public NumericResult total { get; set; }

        public TotalConceptsResult()
        {
            data = new TotalConceptsAux();
            data_list = new List<TotalConceptsAux>();
            total = new NumericResult();
        }
    }

    public class vwAllConceptsAux
    {
        public int id { get; set; }
        public string name { get; set; }
        public decimal cost { get; set; }
        public decimal price { get; set; }
        public decimal discount { get; set; }
        public bool deleted { get; set; }
        public bool iva { get; set; }
        public decimal inStock { get; set; }

        public vwAllConceptsAux()
        {

        }
    }

    public class vwAllConceptsResult : Result
    {
        public vwAllConceptsAux data { get; set; }
        public List<vwAllConceptsAux> data_list { get; set; }
        public NumericResult total { get; set; }

        public vwAllConceptsResult()
        {
            data = new vwAllConceptsAux();
            data_list = new List<vwAllConceptsAux>();
            total = new NumericResult();
        }
    }

    public class vwAllProductsAux
    {
        public int id { get; set; }
        public string categoryName { get; set; }
        public string code { get; set; }
        public string name { get; set; }
        public decimal cost { get; set; }
        public decimal price { get; set; }
        public decimal discount { get; set; }
        public bool deleted { get; set; }
        public bool iva { get; set; }
        public int stock { get; set; }

        public vwAllProductsAux()
        {

        }
    }

    public class vwAllProductsResult : Result
    {
        public vwAllProductsAux data { get; set; }
        public List<vwAllProductsAux> data_list { get; set; }
        public NumericResult total { get; set; }

        public vwAllProductsResult()
        {
            data = new vwAllProductsAux();
            data_list = new List<vwAllProductsAux>();
            total = new NumericResult();
        }
    }

    public class ConceptAux
    {
        private string m_cat_name;
        public int id { get; set; }
        public int WarehouseConceptId { get; set; }
        public bool IsWarehouse { get; set; }
        public string name { get; set; }
        public CategoryAux categoryAux { get; set; }
        public decimal price { get; set; }
        public decimal cost { get; set; }
        public decimal discount { get; set; }
        public bool iva { get; set; }
        public ProductAux productAux { get; set; }
        public TestAux testAux { get; set; }
        public int stockAux { get; set; }
        public decimal dStock { get; set; }
        public bool active { get; set; }
        public int inStock { get; set; }
        public string categoryName
        {
            get
            {
                if (string.IsNullOrEmpty(this.m_cat_name))
                {
                    this.m_cat_name = this.categoryAux.name;
                }
                return this.m_cat_name;
            }
            set
            {
                this.m_cat_name = value;
            }
        }

        //Lista de descuento que incluyen a este producto
        public List<DiscountAux> discountList { get; set; }
        public List<CostInBranchAux> costInBranchAux { get; set; }
        public List<ConceptAux> WarehouseConcept { get; set; }
        public List<string> Errors { get; set; }

        public ConceptAux()
        {
            discountList = new List<DiscountAux>();
            categoryAux = new CategoryAux();
            productAux = new ProductAux();
            testAux = new TestAux();
            costInBranchAux = new List<CostInBranchAux>();
            Errors = new List<string>();
        }

        public void SeparateDuplicatesInWarehouseRequest()
        {
            var result = from concept in WarehouseConcept
                         group concept by concept.id into conceptResult
                         select new ConceptAux()
                         {
                             id = conceptResult.Key,
                             dStock = conceptResult.Sum(i => i.dStock)
                         };

            WarehouseConcept = result.ToList();
        }

        public void ValidateWarehouseRequest()
        {
            List<ConceptAux> InvalidConcepts = new List<ConceptAux>();
            string ErrorMessage = null;

            foreach (var concept in WarehouseConcept)
            {
                if (!concept.IsValidRequest())
                {
                    InvalidConcepts.Add(concept);
                }
            }

            if (InvalidConcepts.Count > 0)
            {
                foreach (var concept in InvalidConcepts)
                {
                    ErrorMessage = $"Partida {concept.WarehouseConceptId}: {concept.name} no es válido";
                    Errors.Add(ErrorMessage);
                }
                throw new Exception("Conceptos no válidos");
            }
        }

        private bool IsValidRequest()
        {
            return id > 0
                && dStock > 0;
        }
    }

    public class ConceptResult : Result
    {
        public ConceptAux data { get; set; }
        public List<ConceptAux> data_list { get; set; }
        public NumericResult total { get; set; }

        public ConceptResult()
        {
            this.data = new ConceptAux();
            this.data_list = new List<ConceptAux>();
            this.total = new NumericResult();
        }
    }

    public class ConceptHelper
    {
        public static ConceptResult GetConcepts(DTParameterModel filter)
        {
            ConceptResult result = new ConceptResult();
            string order = "";
            string orderColumn = "";
            if (!string.IsNullOrEmpty(filter.Order.First().Dir) && !string.IsNullOrEmpty(filter.Order.First().Data))
            {
                order = filter.Order.First().Dir;
                orderColumn = filter.Order.First().Data;
            }
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    var query = db.vwAllConcepts.Where(pt => !pt.Deleted);
                    foreach (DTColumn column in filter.Columns)
                    {
                        if (column.Data == "name" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.Name.Contains(column.Search.Value));
                        }
                        if (column.Data == "id" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.id.ToString().Contains(column.Search.Value));
                        }
                        if (column.Data == "inStock" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.InStock.ToString().Contains(column.Search.Value));
                        }
                        if (column.Data == "discount" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.Discount.ToString().Contains(column.Search.Value));
                        }
                        if (column.Data == "price" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.Price.ToString().Contains(column.Search.Value));
                        }
                        if (column.Data == "cost" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.Cost.ToString().Contains(column.Search.Value));
                        }
                        if (column.Data == "categoryName" && !String.IsNullOrEmpty(column.Search.Value))
                        {
                            query = query.Where(q => q.CategoryName.ToString().Contains(column.Search.Value));
                        }
                    }
                    if (!string.IsNullOrEmpty(order) && !string.IsNullOrEmpty(orderColumn))
                    {
                        if (orderColumn == "name")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.Name);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.Name);
                            }
                        }
                        if (orderColumn == "id")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.id);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.id);
                            }
                        }
                        if (orderColumn == "inStock")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.InStock);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.InStock);
                            }
                        }
                        if (orderColumn == "active")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.Deleted);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.Deleted);
                            }
                        }
                        if (orderColumn == "discount")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.Discount);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.Discount);
                            }
                        }
                        if (orderColumn == "price")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.Price);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.Price);
                            }
                        }
                        if (orderColumn == "cost")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.Cost);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.Cost);
                            }
                        }
                        if (orderColumn == "categoryName")
                        {
                            if (order.ToUpper() == "ASC")
                            {
                                query = query.OrderBy(q => q.CategoryName);
                            }
                            else
                            {
                                query = query.OrderByDescending(q => q.CategoryName);
                            }
                        }
                    }

                    result.total.value = query.Count();

                    query = query.Skip(filter.Start).Take(filter.Length);
                    foreach (vwAllConcepts concept in query.ToList())
                    {
                        ConceptAux aux = new ConceptAux();
                        DataHelper.fill(aux, concept);
                        aux.active = !concept.Deleted;
                        result.data_list.Add(aux);
                    }
                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }
        public static ConceptResult GetConceptsOfCategoryNoDiscount(string typed, string CategoryName, int ClinicId)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                SqlConnection conn = null;

                SqlDataReader rdr = null;
                try
                {
                    conn = new SqlConnection(db.Database.Connection.ConnectionString);
                    conn.Open();
                    SqlCommand command = new SqlCommand("dbo.sp_getConceptsAutoComplete", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("input", typed));
                    command.Parameters.Add(new SqlParameter("categoryName", CategoryName));

                    rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        int concept_id = Convert.ToInt32(rdr["id"]);
                        //id, categoryname, name, code
                        if (rdr["categoryname"].ToString() != "Paquetes")
                        {
                            //var discountDb = db.Discount.Where(d => d.DiscountTypeId == 4);

                            ConceptResult ConceptResult = GetConcept(concept_id);
                            ConceptAux aux = ConceptResult.data;
                            var stockDb = db.Stock.Where(s => s.ConceptId == concept_id && s.ClinicId == ClinicId);
                            aux.stockAux = (stockDb.ToList().Count > 0 ? stockDb.Sum(s => s.InStock) : 0);
                            result.data_list.Add(aux);
                        }
                        else
                        {
                            PackageResult packageResult = GetPackage(concept_id);
                            PackageAux aux = packageResult.data;
                            result.data_list.Add(aux);
                        }
                    }

                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                    if (rdr != null)
                    {
                        rdr.Close();
                    }
                }
            }
            return result;
        }
        public static ConceptResult GetConceptsOfCategory(string typed, string CategoryName, int ClinicId)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                //SqlConnection conn = null;

                //SqlDataReader rdr = null;
                try
                {
                    if (CategoryName == "Medicamentos")
                    {
                        var conceptResults = db.vwStock.Where(c => c.Name.Contains(typed)).ToList();
                        result.total.value = conceptResults.Count();
                        var conceptResult = conceptResults.Take(10);

                        foreach (vwStock item in conceptResult.ToList())
                        {
                            ConceptAux conceptAux = new ConceptAux();
                            DataHelper.fill(conceptAux, item);

                            result.data_list.Add(conceptAux);
                        }
                    }
                    else
                    {
                        var conceptResults = db.Concept.Where(c => c.Name.Contains(typed) && c.Category.Name == CategoryName).ToList();
                        result.total.value = conceptResults.Count();
                        var conceptResult = conceptResults.Take(10);

                        foreach (Concept item in conceptResult.ToList())
                        {
                            ConceptAux conceptAux = new ConceptAux();
                            DataHelper.fill(conceptAux.categoryAux, item.Category);
                            DataHelper.fill(conceptAux, item);

                            //conceptAux.listcategories.Add(conceptAux.categoryAux);
                            result.data_list.Add(conceptAux);
                        }
                    }
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
                //finally
                //{
                //    if (conn != null)
                //    {
                //        conn.Close();
                //    }
                //    if (rdr != null)
                //    {
                //        rdr.Close();
                //    }
                //}
            }
            return result;
        }

        public static ConceptResult GetConceptCategories(string data)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {

                }
                catch
                {

                }
            }
            return result;
        }

        public static ConceptResult GetConceptsOfCategory(string typed, string CategoryName, bool xray, bool lab, bool notExam, int ClinicId)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    List<int> productIdConceptList = new List<int>();
                    //si es un producto lo que se busca, entonces revizamos si lo que se escribio coincide con el codigo de barras del producto
                    if (CategoryName == "Productos")
                    {
                        //   productIdConceptList = db.Product.Where(p => p.Code.ToString().Contains(typed)).Select(p => p.ConceptId).ToList();
                    }

                    //buscamos que lo que se busca coincida con el nombre del concepto y en caso de ser producto
                    var query = db.Concept.Where(c => !c.Deleted && c.Category.Name == CategoryName && (c.Name.Contains(typed) || productIdConceptList.Contains(c.id)));

                    if (notExam)
                    {
                        query = db.Concept.Where(c => !c.Deleted && c.Category.Name == CategoryName && (c.Name.Contains(typed) || productIdConceptList.Contains(c.id)));
                    }
                    else if (xray)
                    {
                        query = query.Where(q => q.Test.FirstOrDefault().XRay);
                    }
                    else if (lab)
                    {
                        query = query.Where(q => q.Test.FirstOrDefault().Laboratory);
                    }
                    query = query.OrderBy(p => p.Name).Take(15);
                    foreach (Concept concept in query.ToList())
                    {
                        if (concept.Category.Name != "Paquetes")
                        {
                            ConceptResult ConceptResult = GetConcept(concept.id, ClinicId);
                            ConceptAux aux = ConceptResult.data;
                            var stockDb = db.Stock.Where(s => s.ConceptId == concept.id && s.ClinicId == ClinicId);
                            aux.stockAux = (stockDb.ToList().Count > 0 ? stockDb.Sum(s => s.InStock) : 0);
                            result.data_list.Add(aux);
                        }
                        else
                        {
                            PackageResult packageResult = GetPackage(concept.id);
                            PackageAux aux = packageResult.data;
                            result.data_list.Add(aux);
                        }
                    }
                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static ConceptResult GetConceptsTypeahead(string typed)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                SqlConnection conn = null;

                SqlDataReader rdr = null;
                try
                {
                    conn = new SqlConnection(db.Database.Connection.ConnectionString);
                    conn.Open();
                    SqlCommand command = new SqlCommand("dbo.sp_getConceptsAutoComplete", conn);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("input", typed));

                    rdr = command.ExecuteReader();
                    while (rdr.Read())
                    {
                        int concept_id = Convert.ToInt32(rdr["id"]);

                        if (rdr["categoryname"].ToString() != "Paquetes")
                        {
                            ConceptResult ConceptResult = GetConcept(concept_id);
                            ConceptAux aux = ConceptResult.data;
                            result.data_list.Add(aux);
                        }
                        else
                        {
                            PackageResult packageResult = GetPackage(concept_id);
                            PackageAux aux = packageResult.data;
                            result.data_list.Add(aux);
                        }
                    }

                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
                finally
                {
                    if (conn != null)
                    {
                        conn.Close();
                    }
                    if (rdr != null)
                    {
                        rdr.Close();
                    }
                }
            }
            return result;
        }

        public static TotalConceptsResult GetTotalConceptProducts()
        {
            TotalConceptsResult result = new TotalConceptsResult();

            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    decimal subtotal = 0;
                    decimal total = 0;
                    List<Stock> stockDb = db.Stock.Where(a => a.InStock > 0).ToList();
                    foreach (var stock in stockDb)
                    {
                        subtotal = stock.Iva ? (stock.Cost * 1.16m) * stock.InStock : (stock.Cost * stock.InStock);
                        total = total + subtotal;
                    }
                    result.success = true;
                    result.data.total = total;
                }
                catch (Exception e)
                {
                    result.success = false;
                    result.exception = e;
                    result.message = $"Ocurrió un error inesperado: {result.exception_message}";
                }
            }
            return result;
        }

        public static vwAllProductsResult GetProductsTypeahead(string typed, int clinicId)
        {
            vwAllProductsResult result = new vwAllProductsResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    var query = db.vwAllProducts.Where(c => !c.Deleted && (c.Name.Contains(typed) || c.Code.Contains(typed)));

                    query = query.OrderBy(p => p.Name).Take(15);
                    foreach (vwAllProducts product in query.ToList())
                    {
                        vwAllProductsAux aux = new vwAllProductsAux();
                        DataHelper.fill(aux, product);
                        var stockDb = db.Stock.Where(s => s.ConceptId == product.id && s.InStock > 0 && s.ClinicId == clinicId);
                        if (stockDb.Count() > 0)
                        {
                            aux.stock = (stockDb.ToList().Count > 0 ? stockDb.Sum(s => s.InStock) : 0);
                        }
                        result.data_list.Add(aux);
                    }
                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static ConceptResult GetConcept(int id)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    Concept concept = db.Concept.Where(pt => pt.id == id).FirstOrDefault();
                    if (concept != null)
                    {
                        result.data = new ConceptAux();
                        DataHelper.fill(result.data, concept);
                        result.data.active = !concept.Deleted;
                        DataHelper.fill(result.data.categoryAux, concept.Category);
                        switch (result.data.categoryName)
                        {
                            case "Productos":
                                Product p = concept.Product.FirstOrDefault();
                                if (p != null)
                                {
                                    DataHelper.fill(result.data.productAux, p);
                                    //if (!string.IsNullOrEmpty(p.Sale))
                                    //{
                                    //    string[] sale_val = p.Sale.Split('x');
                                    //    result.data.productAux.sale_first = Convert.ToInt32(sale_val[0]);
                                    //    result.data.productAux.sale_second = Convert.ToInt32(sale_val[1]);
                                    //}
                                }

                                foreach (var pw in p.ProductWarehouse)
                                {
                                    ProductWarehouseAux aux = new ProductWarehouseAux();
                                    DataHelper.fill(aux.warehouseAux, pw.Warehouse);
                                    aux.minStock = pw.MinStock;
                                    result.data.productAux.productWarehouseAux.Add(aux);
                                }

                                break;
                            case "Exámenes":
                                var t = concept.Test.FirstOrDefault();
                                if (t != null)
                                {
                                    DataHelper.fill(result.data.testAux, t);
                                }
                                break;
                        }
                        result.success = true;
                    }
                    else
                    {
                        result.success = false;
                        result.message = "Concepto no encontrada.";
                        return result;
                    }
                }

                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }
        public static ConceptResult GetConcept(int id, int clinicId)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    Concept concept = db.Concept.Where(pt => pt.id == id).FirstOrDefault();
                    if (concept != null)
                    {
                        result.data = new ConceptAux();
                        DataHelper.fill(result.data, concept);
                        result.data.active = !concept.Deleted;
                        DataHelper.fill(result.data.categoryAux, concept.Category);
                        DateTime currDate = DateTime.UtcNow;

                        //TODO: Convertir busqueda de descuentos a procedure
                        List<Discount> dbDiscount =
                            db.Discount
                            .Where(d => !d.Deleted
                            && d.DiscountConcept.Any(dc => dc.ConceptId == id)
                            && d.Clinic.Any(c => c.id == clinicId)
                            && d.StartDate <= currDate
                            && d.EndDate >= currDate
                            )
                            .ToList();
                        if (dbDiscount.Count > 0)
                        {
                            Discount directDisc = dbDiscount.Where(d => d.DiscountType.Code == "Direct").FirstOrDefault();
                            if (directDisc != null)
                            {
                                DiscountConcept directDiscConcept = directDisc.DiscountConcept.Where(dc => dc.ConceptId == id).FirstOrDefault();
                                if (directDiscConcept != null)
                                {
                                    result.data.price = concept.Price - (concept.Price * (directDiscConcept.Percentage / 100));
                                }
                            }

                            foreach (Discount item in dbDiscount.Where(d => d.DiscountType.Code == "Percentage" || d.DiscountType.Code == "Combo"))
                            {
                                DiscountAux tempDiscount = new DiscountAux();
                                DataHelper.fill(tempDiscount, item);
                                DataHelper.fill(tempDiscount.discountTypeAux, item.DiscountType);

                                foreach (var dcon in item.DiscountConcept)
                                {
                                    DiscountConceptAux tempDiscConcept = new DiscountConceptAux();
                                    DataHelper.fill(tempDiscConcept, dcon);
                                    DataHelper.fill(tempDiscConcept.conceptAux, dcon.Concept);
                                    tempDiscount.discountConceptAux.Add(tempDiscConcept);
                                }

                                result.data.discountList.Add(tempDiscount);
                            }
                        }


                        switch (result.data.categoryName)
                        {
                            case "Productos":
                                Product p = concept.Product.FirstOrDefault();
                                if (p != null)
                                {
                                    DataHelper.fill(result.data.productAux, p);
                                    //if (!string.IsNullOrEmpty(p.Sale))
                                    //{
                                    //    string[] sale_val = p.Sale.Split('x');
                                    //    result.data.productAux.sale_first = Convert.ToInt32(sale_val[0]);
                                    //    result.data.productAux.sale_second = Convert.ToInt32(sale_val[1]);
                                    //}
                                }

                                foreach (var pw in p.ProductWarehouse)
                                {
                                    ProductWarehouseAux aux = new ProductWarehouseAux();
                                    DataHelper.fill(aux.warehouseAux, pw.Warehouse);
                                    aux.minStock = pw.MinStock;
                                    result.data.productAux.productWarehouseAux.Add(aux);
                                }

                                break;
                            case "Exámenes":
                                var t = concept.Test.FirstOrDefault();
                                if (t != null)
                                {
                                    DataHelper.fill(result.data.testAux, t);
                                }
                                break;
                        }
                        result.success = true;
                    }
                    else
                    {
                        result.success = false;
                        result.message = "Concepto no encontrada.";
                        return result;
                    }
                }

                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }
        public static ConceptResult GetConceptsWarehouse(int warehouseId)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    List<Concept> dbConcepts = db.Concept.Where(c => c.Product.FirstOrDefault().ProductWarehouse.Any()).ToList();
                    foreach (Concept dbConcept in dbConcepts)
                    {
                        ConceptAux concept = new ConceptAux();
                        DataHelper.fill(concept, dbConcept);
                        concept.active = !dbConcept.Deleted;
                        DataHelper.fill(concept.categoryAux, dbConcept.Category);
                        DataHelper.fill(concept.productAux, dbConcept.Product);
                        foreach (ProductWarehouse pw in dbConcept.Product.FirstOrDefault().ProductWarehouse)
                        {
                            ProductWarehouseAux aux = new ProductWarehouseAux();
                            DataHelper.fill(aux.warehouseAux, pw.Warehouse);
                            aux.minStock = pw.MinStock;
                            concept.productAux.productWarehouseAux.Add(aux);
                        }
                        result.data_list.Add(concept);
                    }
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static Result SaveConcept(ConceptAux conceptAux)
        {
            Result result = new Result();
            GenericResult conceptExisting = ConceptExistingInDataBase(conceptAux);
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    if (conceptAux.id != 0)
                    {
                        Concept concept = db.Concept.Where(pt => pt.id == conceptAux.id).FirstOrDefault();
                        if (concept != null)
                        {
                            if (conceptExisting.bool_value)
                            {
                                if (conceptExisting.integer_value == conceptAux.id)
                                {
                                    concept.Name = conceptAux.name;
                                    concept.CategoryId = conceptAux.categoryAux.id;
                                    concept.Cost = conceptAux.cost;
                                    concept.Discount = conceptAux.discount;
                                    concept.Price = conceptAux.price;
                                    concept.Iva = conceptAux.iva;
                                    concept.Deleted = false;
                                    switch (conceptAux.categoryAux.name)
                                    {
                                        case "Productos":
                                            var product = concept.Product.FirstOrDefault();
                                            var ConceptProduct = conceptAux.productAux;

                                            if (product == null)
                                            {
                                                product = db.Product.Create();
                                                if (ConceptProduct.sale_first != 0 && ConceptProduct.sale_second != 0)
                                                {
                                                  //  product.Sale = String.Format("{0}x{1}", ConceptProduct.sale_first, ConceptProduct.sale_second);
                                                }
                                                product.LicenseRequired = ConceptProduct.licenseRequired;
                                                product.Code = conceptAux.productAux.code;
                                                concept.Product.Add(product);
                                            }
                                            else
                                            {
                                                if (ConceptProduct.sale_first != 0 && ConceptProduct.sale_second != 0)
                                                {
                                                   // product.Sale = String.Format("{0}x{1}", ConceptProduct.sale_first, ConceptProduct.sale_second);
                                                }
                                                else
                                                {
                                                //    product.Sale = string.Empty;
                                                }
                                                product.LicenseRequired = ConceptProduct.licenseRequired;
                                                product.Nurse = ConceptProduct.nurse;
                                                product.Code = conceptAux.productAux.code;
                                            }
                                            product.ProductWarehouse.Clear();
                                            foreach (var war in ConceptProduct.productWarehouseAux)
                                            {
                                                ProductWarehouse pw = db.ProductWarehouse.Create();
                                                pw.MinStock = war.minStock;
                                                pw.WarehouseId = war.warehouseAux.id;
                                                product.ProductWarehouse.Add(pw);
                                            }
                                            db.Test.RemoveRange(concept.Test);
                                            break;
                                        case "Exámenes":
                                            var test = concept.Test.FirstOrDefault();
                                            var ConceptTest = conceptAux.testAux;
                                            if (test == null)
                                            {
                                                test = db.Test.Create();
                                                test.XRay = ConceptTest.xray;
                                                test.Laboratory = ConceptTest.laboratory;

                                                concept.Test.Add(test);
                                            }
                                            else
                                            {
                                                test.XRay = ConceptTest.xray;
                                                test.Laboratory = ConceptTest.laboratory;
                                            }
                                            db.Product.RemoveRange(concept.Product);
                                            break;
                                    }

                                    db.SaveChanges();
                                    result.success = true;
                                }
                                else
                                {
                                    result.message = conceptExisting.message;
                                    result.success = false;
                                }
                            }
                            else
                            {
                                concept.Name = conceptAux.name;
                                concept.CategoryId = conceptAux.categoryAux.id;
                                concept.Cost = conceptAux.cost;
                                concept.Discount = conceptAux.discount;
                                concept.Price = conceptAux.price;
                                concept.Iva = conceptAux.iva;
                                concept.Deleted = false;
                                switch (conceptAux.categoryAux.name)
                                {
                                    case "Productos":
                                        var product = concept.Product.FirstOrDefault();
                                        var ConceptProduct = conceptAux.productAux;

                                        if (product == null)
                                        {
                                            product = db.Product.Create();
                                            if (ConceptProduct.sale_first != 0 && ConceptProduct.sale_second != 0)
                                            {
                                             //   product.Sale = String.Format("{0}x{1}", ConceptProduct.sale_first, ConceptProduct.sale_second);
                                            }
                                            product.LicenseRequired = ConceptProduct.licenseRequired;
                                            product.Code = conceptAux.productAux.code;
                                            concept.Product.Add(product);
                                        }
                                        else
                                        {
                                            if (ConceptProduct.sale_first != 0 && ConceptProduct.sale_second != 0)
                                            {
                                             //   product.Sale = String.Format("{0}x{1}", ConceptProduct.sale_first, ConceptProduct.sale_second);
                                            }
                                            else
                                            {
                                             //   product.Sale = string.Empty;
                                            }
                                            product.LicenseRequired = ConceptProduct.licenseRequired;
                                            product.Nurse = ConceptProduct.nurse;
                                            product.Code = conceptAux.productAux.code;
                                        }
                                        product.ProductWarehouse.Clear();
                                        foreach (var war in ConceptProduct.productWarehouseAux)
                                        {
                                            ProductWarehouse pw = db.ProductWarehouse.Create();
                                            pw.MinStock = war.minStock;
                                            pw.WarehouseId = war.warehouseAux.id;
                                            product.ProductWarehouse.Add(pw);
                                        }
                                        db.Test.RemoveRange(concept.Test);
                                        break;
                                    case "Exámenes":
                                        var test = concept.Test.FirstOrDefault();
                                        var ConceptTest = conceptAux.testAux;
                                        if (test == null)
                                        {
                                            test = db.Test.Create();
                                            test.XRay = ConceptTest.xray;
                                            test.Laboratory = ConceptTest.laboratory;

                                            concept.Test.Add(test);
                                        }
                                        else
                                        {
                                            test.XRay = ConceptTest.xray;
                                            test.Laboratory = ConceptTest.laboratory;
                                        }
                                        db.Product.RemoveRange(concept.Product);
                                        break;
                                }

                                db.SaveChanges();
                                result.success = true;
                            }
                        }
                        else
                        {
                            result.success = false;
                            result.message = "Concepto no encontrada.";
                            return result;
                        }
                    }
                    else
                    {
                        if (!conceptExisting.bool_value && conceptExisting.success)
                        {
                            Concept concept = db.Concept.Create();
                            concept.Name = conceptAux.name;
                            concept.CategoryId = conceptAux.categoryAux.id;
                            concept.Cost = conceptAux.cost;
                            concept.Discount = conceptAux.discount;
                            concept.Price = conceptAux.price;
                            concept.Iva = conceptAux.iva;
                            concept.Deleted = false;
                            concept.IsWarehouse = false;
                            switch (conceptAux.categoryAux.name)
                            {
                                case "Productos":
                                    var product = db.Product.Create();
                                    var ConceptProduct = conceptAux.productAux;
                                    if (ConceptProduct.sale_first != 0 && ConceptProduct.sale_second != 0)
                                    {
                                      //  product.Sale = String.Format("{0}x{1}", ConceptProduct.sale_first, ConceptProduct.sale_second);
                                    }
                                    product.LicenseRequired = ConceptProduct.licenseRequired;
                                    product.Nurse = ConceptProduct.nurse;
                                    product.Code = conceptAux.productAux.code;
                                    concept.Product.Add(product);
                                    product.ProductWarehouse.Clear();
                                    foreach (var war in ConceptProduct.productWarehouseAux)
                                    {
                                        ProductWarehouse pw = db.ProductWarehouse.Create();
                                        pw.MinStock = war.minStock;
                                        pw.WarehouseId = war.warehouseAux.id;
                                        product.ProductWarehouse.Add(pw);
                                    }
                                    break;
                                case "Exámenes":
                                    var test = db.Test.Create();
                                    var ConceptTest = conceptAux.testAux;
                                    test.XRay = ConceptTest.xray;
                                    test.Laboratory = ConceptTest.laboratory;
                                    concept.Test.Add(test);

                                    break;
                            }

                            db.Concept.Add(concept);
                            db.SaveChanges();
                            result.success = true;
                        }
                        else
                        {
                            result.message = conceptExisting.message;
                            result.success = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        private static GenericResult ConceptExistingInDataBase(ConceptAux conceptAux)
        {
            GenericResult result = new GenericResult() { bool_value = false };
            using (dbINMEDIK model = new dbINMEDIK())
            {
                try
                {
                    var conceptExistingByName = model.vwAllConcepts.Where(product => product.Name == conceptAux.name).FirstOrDefault();

                    //Inicio para existencia de producto
                    if (conceptAux.categoryAux.name == "Productos")
                    {

                        //Verificar que no exista el nombre del concepto no exista en un paquete
                        var nameConceptExisting = model.vwAllConcepts.Where(concept => concept.Name == conceptAux.name).FirstOrDefault();
                        if (nameConceptExisting != null)
                        {
                            string category = nameConceptExisting.CategoryName;
                            result.message = "Este nombre de registro ya existe en la categoría de " + category;
                            return result;
                        }

                        var productExistingByName = model.Product.Where(product => product.Concept.Name == conceptAux.name).FirstOrDefault();
                        var productExistingByCode = model.Product.Where(product => product.Code == conceptAux.productAux.code).FirstOrDefault();

                        /*Se verifica que ninguno de los dos sea null*/
                        if (productExistingByName != null && productExistingByCode != null)
                        {
                            result.bool_value = true;
                            /*Este if se ejecuta siempre que se va a editar o crear un concepto y se valida que si los dos registros
                            que se encontraron tienen el mismo id, si es así el concepto se podra editar sin problemas*/
                            if (productExistingByName.id == productExistingByCode.id)
                            {
                                result.integer_value = conceptAux.id;
                                return result;
                            }
                            else
                            {
                                /*Si uno de los dos es null, se tendrá que comprobar cual de los dos fue el que si trajo un registro
                                 y luego se compararán los id para verificar que si son diferentes del que se quiere editar o crear*/
                                if (productExistingByName.id != conceptAux.productAux.id)
                                {
                                    result.message = "Nombre producto ya existente en la base de datos";
                                    result.integer_value = productExistingByName.id;
                                }
                                if (productExistingByCode.id != conceptAux.productAux.id)
                                {
                                    result.message = "Código de producto ya existente en la base de datos";
                                    result.integer_value = productExistingByCode.id;
                                }
                                return result;
                            }
                        }
                        else
                        {
                            /*Si alguno de los dos es null  entonces hay que verificar cual de los dos son null*/
                            if (productExistingByCode != null)
                            {
                                if (productExistingByCode.id != conceptAux.productAux.id)
                                {
                                    result.bool_value = true;
                                    result.message = "Codigo de producto ya existente en la base de datos";
                                    result.integer_value = productExistingByCode.id;
                                    return result;
                                }
                            }
                            else
                            {
                                if (productExistingByName != null)
                                {
                                    if (conceptExistingByName.id != conceptAux.productAux.id)
                                    {
                                        result.bool_value = true;
                                        result.message = "Nombre de producto ya existente en la base de datos";
                                        result.integer_value = productExistingByName.id;
                                        return result;
                                    }
                                }
                                else
                                {
                                    result.success = true;
                                    return result;
                                }
                            }
                        }
                    }
                    //Fin filtro para verificar existencia de producto
                    if (conceptExistingByName != null)
                    {
                        if (conceptExistingByName.id != conceptAux.id)
                        {
                            string category = conceptExistingByName.CategoryName;
                            result.bool_value = true;
                            result.message = "Este nombre de registro ya existe en la categoría de " + category;
                            result.integer_value = conceptExistingByName.id;
                            return result;
                        }
                    }
                    else
                    {
                        result.success = true;
                        return result;
                    }
                }
                catch (Exception error)
                {
                    result.success = false;
                    result.message = error.Message;
                }
            }
            return result;
        }

        public static Result SavePackage(PackageAux packageAux)
        {
            GenericResult packageExisting = PackageExistingInDataBase(packageAux);
            Result result = new Result();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    if (packageAux.id != 0)
                    {
                        var package = db.Package.Where(p => p.id == packageAux.id).FirstOrDefault();
                        if (package != null)
                        {
                            if (packageExisting.bool_value)
                            {
                                //verificar que tenga el mismo id para poder modificarlo
                                if (packageExisting.integer_value == packageAux.id)
                                {
                                    package.Name = packageAux.name;
                                    package.CategoryId = packageAux.categoryAux.id;
                                    package.Cost = packageAux.cost;
                                    package.Discount = packageAux.discount;
                                    package.Price = packageAux.price;
                                    package.Iva = packageAux.iva;
                                    package.Deleted = !packageAux.active;

                                    package.PackageConcept.Clear();
                                    foreach (var packageConcept in packageAux.packageConceptAux)
                                    {
                                        PackageConcept pc = db.PackageConcept.Create();
                                        pc.ConceptId = packageConcept.conceptAux.id;
                                        pc.Quantity = packageConcept.quantity;
                                        package.PackageConcept.Add(pc);
                                    }

                                    db.SaveChanges();
                                    result.success = true;
                                }
                                else
                                {
                                    result.success = false;
                                    result.message = packageExisting.message;
                                }
                            }
                            else
                            {
                                //editar porque no existe el nombre de paquete en la base  de datos
                                package.Name = packageAux.name;
                                package.CategoryId = packageAux.categoryAux.id;
                                package.Cost = packageAux.cost;
                                package.Discount = packageAux.discount;
                                package.Price = packageAux.price;
                                package.Iva = packageAux.iva;
                                package.Deleted = !packageAux.active;

                                package.PackageConcept.Clear();
                                foreach (var packageConcept in packageAux.packageConceptAux)
                                {
                                    PackageConcept pc = db.PackageConcept.Create();
                                    pc.ConceptId = packageConcept.conceptAux.id;
                                    pc.Quantity = packageConcept.quantity;
                                    package.PackageConcept.Add(pc);
                                }

                                db.SaveChanges();
                                result.success = true;
                            }
                        }
                        else
                        {
                            //el paquete no se podra editar porque ya no existe en la base de datos
                            result.message = "Producto no encontrado";
                            result.success = false;
                        }
                    }
                    else
                    {
                        if (!packageExisting.bool_value && packageExisting.success)
                        {
                            Package package = db.Package.Create();
                            package.Name = packageAux.name;
                            package.CategoryId = packageAux.categoryAux.id;
                            package.Cost = packageAux.cost;
                            package.Discount = packageAux.discount;
                            package.Price = packageAux.price;
                            package.Iva = packageAux.iva;

                            foreach (var packageConcept in packageAux.packageConceptAux)
                            {
                                PackageConcept pc = db.PackageConcept.Create();
                                pc.ConceptId = packageConcept.conceptAux.id;
                                pc.Quantity = packageConcept.quantity;
                                package.PackageConcept.Add(pc);
                            }

                            db.Package.Add(package);
                            db.SaveChanges();
                            result.success = true;
                        }
                        else
                        {
                            result.success = false;
                            result.message = packageExisting.message;
                        }
                    }
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Error inesperado" + result.exception_message;
                }
            }
            return result;
        }

        private static GenericResult PackageExistingInDataBase(PackageAux packageAux)
        {
            GenericResult result = new GenericResult();
            result.bool_value = false;
            using (dbINMEDIK model = new dbINMEDIK())
            {
                try
                {
                    var packageExistingInDataBase = model.Package.Where(package => package.Name == packageAux.name).FirstOrDefault();
                    if (packageExistingInDataBase != null)
                    {
                        if (packageExistingInDataBase.id != packageAux.id)
                        {
                            result.bool_value = true;
                            result.message = "El nombre del paquete ya existe en la base de datos";
                            result.integer_value = packageExistingInDataBase.id;
                            result.success = true;
                            return result;
                        }
                    }
                    else
                    {
                        var nameConceptExisting = model.Package.Where(concept => concept.Name == packageAux.name).FirstOrDefault();
                        if (nameConceptExisting != null)
                        {
                            if (nameConceptExisting.id != packageAux.id)
                            {
                                result.bool_value = true;
                                result.message = "este nombre de registro ya existe en la categoría de " + nameConceptExisting.Category.Name;
                                result.integer_value = packageAux.id;
                                result.success = true;
                                return result;
                            }
                            else
                            {
                                result.success = true;
                                return result;
                            }
                        }
                        else
                        {
                            result.success = true;
                            return result;
                        }
                    }
                }
                catch (Exception error)
                {
                    result.success = false;
                    result.message = error.Message;
                }
                return result;
            }
        }


        public static Result DeleteConcept(ConceptAux conceptAux)
        {
            Result result = new Result();
            UserResult userRes = UserHelper.GetUser(HttpContext.Current.User.Identity.Name);
            if (!userRes.success)
            {
                return userRes;
            }
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    if (conceptAux.id != 0)
                    {
                        Concept concept = db.Concept.Where(pt => pt.id == conceptAux.id).FirstOrDefault();
                        if (concept != null)
                        {
                            concept.Deleted = true;
                            db.SaveChanges();
                            result.success = true;
                        }
                        else
                        {
                            result.success = false;
                            result.message = "Concepto no encontrada.";
                            return result;
                        }
                    }
                    else
                    {
                        result.success = false;
                        result.message = "No se ha seleccionado una concepto a borrar.";
                        return result;
                    }
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static ConceptResult GetConceptsSelect()
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    var query = db.Concept.Where(c => !c.Deleted);
                    query = query.OrderBy(p => p.Name);
                    foreach (Concept county in query.ToList())
                    {
                        ConceptAux aux = new ConceptAux();
                        DataHelper.fill(aux, county);
                        result.data_list.Add(aux);
                    }
                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static Result DeletePackage(PackageAux packageAux)
        {
            Result result = new Result();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    if (packageAux.id != 0)
                    {
                        Package package = db.Package.Where(pt => pt.id == packageAux.id).FirstOrDefault();
                        if (package != null)
                        {
                            package.Deleted = true;
                            db.SaveChanges();
                            result.success = true;
                        }
                        else
                        {
                            result.success = false;
                            result.message = "Concepto no encontrada.";
                            return result;
                        }
                    }
                    else
                    {
                        result.success = false;
                        result.message = "No se ha seleccionado una concepto a borrar.";
                        return result;
                    }
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static PackageResult GetPackage(int id)
        {
            PackageResult result = new PackageResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    Package package = db.Package.Where(pt => pt.id == id).FirstOrDefault();
                    if (package != null)
                    {
                        result.data = new PackageAux();
                        DataHelper.fill(result.data, package);
                        result.data.active = !package.Deleted;
                        DataHelper.fill(result.data.categoryAux, package.Category);

                        foreach (PackageConcept pc in package.PackageConcept)
                        {
                            PackageConceptAux aux = new PackageConceptAux();
                            DataHelper.fill(aux.conceptAux, pc.Concept);
                            aux.quantity = pc.Quantity;
                            result.data.packageConceptAux.Add(aux);
                        }

                        result.success = true;
                    }
                    else
                    {
                        result.success = false;
                        result.message = "Concepto no encontrada.";
                        return result;
                    }
                }

                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static ConceptResult GetConceptsOfProducts(string typed, int ClinicId)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    List<int> productIdConceptList = new List<int>();

                    // productIdConceptList = db.Product.Where(p => p.Code.ToString().Contains(typed)).Select(p => p.ConceptId).ToList();

                    //buscamos que lo que se busca coincida con el nombre del concepto y en caso de ser producto
                    var query = db.vwAllConcepts.Where(c => !c.Deleted && c.CategoryName == "Productos" && (c.Name.Contains(typed) || productIdConceptList.Contains(c.id)));

                    query = query.OrderBy(p => p.Name).Take(15);
                    foreach (vwAllConcepts concept in query.ToList())
                    {
                        ConceptResult ConceptResult = GetConcept(concept.id);
                        ConceptAux aux = ConceptResult.data;
                        result.data_list.Add(aux);
                    }
                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static ConceptResult GetConceptsOfProductsWithDiscounts(string typed, string discountType)
        {
            ConceptResult result = new ConceptResult();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    List<int> productIdConceptList = new List<int>();

                    // productIdConceptList = db.Product.Where(p => p.Code.ToString().Contains(typed)).Select(p => p.ConceptId).ToList();

                    //buscamos que lo que se busca coincida con el nombre del concepto y en caso de ser producto
                    var query = db.Concept.Where(c => !c.Deleted && c.Category.Name != "Paquetes" && (c.Name.Contains(typed) || productIdConceptList.Contains(c.id)));

                    query = query.OrderBy(p => p.Name).Take(15);
                    foreach (Concept concept in query.ToList())
                    {
                        ConceptResult ConceptResult = GetConcept(concept.id);
                        foreach (DiscountConcept dbDiscount in concept.DiscountConcept.Where(d => d.Discount.Deleted == false && d.Discount.DiscountType.Code == discountType))
                        {
                            DiscountAux tempDiscount = new DiscountAux();
                            DataHelper.fill(tempDiscount, dbDiscount.Discount);
                            foreach (DiscountConcept dbDisConcept in dbDiscount.Discount.DiscountConcept)
                            {
                                DiscountConceptAux tempDiscon = new DiscountConceptAux();
                                DataHelper.fill(tempDiscon, dbDisConcept);
                                DataHelper.fill(tempDiscon.conceptAux, dbDisConcept.Concept);
                                tempDiscount.discountConceptAux.Add(tempDiscon);
                            }
                            foreach (Clinic dbClinic in dbDiscount.Discount.Clinic)
                            {
                                ClinicAux tempClinic = new ClinicAux();
                                DataHelper.fill(tempClinic, dbClinic);
                                tempDiscount.clinicList.Add(tempClinic);
                            }
                            ConceptResult.data.discountList.Add(tempDiscount);
                        }
                        ConceptAux aux = ConceptResult.data;
                        result.data_list.Add(aux);
                    }
                    result.success = true;
                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static Result ExistingValidation(PackageConceptAux concept, int clinicId)
        {
            Result result = new Result();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    if (concept != null)
                    {

                        List<Stock> stock_lst = db.Stock.Where(s => s.ConceptId == concept.conceptAux.id && s.ClinicId == clinicId).ToList();

                        if (stock_lst.Count > 0)
                        {
                            if (stock_lst.Sum(s => s.InStock) >= concept.quantity)
                            {
                                result.success = true;
                            }
                            else
                            {
                                result.success = false;
                                result.message = "Solo existen " + stock_lst.Sum(s => s.InStock) + " en stock.";
                            }
                        }
                        else
                        {
                            result.success = false;
                            result.message = "No existe " + concept.conceptAux.name + " en stock.";
                        }
                    }
                    else
                    {
                        result.success = false;
                        result.message = "No hay conceptos a guardar.";
                        return result;
                    }

                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static Result SaveShippingWarehouse(List<PackageConceptAux> concepts, UserResult user, ClinicResult clinic)
        {
            Result result = new Result();
            using (dbINMEDIK db = new dbINMEDIK())
            {
                try
                {
                    if (!user.success)
                    {
                        return user;
                    }

                    if (concepts.Count > 0)
                    {

                        foreach (PackageConceptAux item in concepts)
                        {
                            List<Stock> stock_lst = db.Stock.Where(s => s.ConceptId == item.conceptAux.id && s.ClinicId == clinic.data.id && s.InStock > 0).OrderBy(s => s.Created).ToList();

                            foreach (Stock item2 in stock_lst)
                            {
                                if (item2.InStock != 0 && item.warehouse != null)
                                {

                                    WarehouseSuply waresuply = new WarehouseSuply();
                                    waresuply.StockId = item2.id;
                                    waresuply.ConceptId = item2.ConceptId;
                                    waresuply.WarehouseId = item.warehouse.id;
                                    waresuply.Created = DateTime.UtcNow;
                                    waresuply.Employeid = db.Employee.FirstOrDefault(e => e.UserId == user.Id).id;
                                    waresuply.ClinicId = clinic.data.id.Value;

                                    if (item2.InStock <= item.quantity)
                                    {
                                        item.quantity = item.quantity - item2.InStock;
                                        waresuply.quantity = item2.InStock;
                                        item2.InStock = 0;
                                        db.WarehouseSuply.Add(waresuply);
                                    }
                                    else
                                    {
                                        item2.InStock = item2.InStock - item.quantity;
                                        waresuply.quantity = item.quantity;
                                        db.WarehouseSuply.Add(waresuply);
                                    }
                                }
                            }
                        }

                        db.SaveChanges();
                        result.success = true;
                    }
                    else
                    {
                        result.success = false;
                        result.message = "No hay conceptos a guardar.";
                        return result;
                    }

                }
                catch (Exception ex)
                {
                    result.success = false;
                    result.exception = ex;
                    result.message = "Ocurrió un error inesperado. " + result.exception_message;
                }
            }
            return result;
        }

        public static Result IsValidWarehouseRequest(ConceptAux conceptAux)
        {
            Result res = new Result();
            try
            {
                conceptAux.ValidateWarehouseRequest();
                conceptAux.SeparateDuplicatesInWarehouseRequest();
                res.success = true;
            }
            catch (Exception e)
            {
                res.success = false;
                res.errors = conceptAux.Errors;
                res.exception = e;
            }

            return res;
        }
    }
}