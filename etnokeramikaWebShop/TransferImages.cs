using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using eshopBL;

namespace etnokeramikaWebShop
{
    public class TransferImages
    {
        string path = @"c:/!dealStudio/Web sajtovi/etnokeramika eshop/eshop/eshop/images/";
        string connectionString = "Server = sql5032.smarterasp.net; Database=DB_A0BDD4_etnokeramika20temp;User ID = DB_A0BDD4_etnokeramika20temp_admin; Password=DjD3jc38o";

        public void Start()
        {
            DataTable images = loadImages();
            for(int i = 0; i < images.Rows.Count; i++)
            {
                if(images.Rows[i]["productImageUrlID"].ToString() == string.Empty)
                { 
                    if(checkImage(images.Rows[i]["imageUrl"].ToString()))
                    { 
                        int productImageUrlID = saveImage(images.Rows[i]["imageUrl"].ToString());
                        if(productImageUrlID > 0)
                            updateImage(images.Rows[i]["imageUrl"].ToString(), 0, productImageUrlID);
                    }
                }
            }
        }

        private bool checkImage(string imageUrl)
        {
            bool exists = false;
            using (SqlConnection objConn = new SqlConnection(connectionString))
            {
                using (SqlCommand objComm = new SqlCommand("SELECT productImageUrlID FROM productImageUrl WHERE imageUrl = @imageUrl", objConn))
                {
                    objConn.Open();
                    objComm.Parameters.Add("@imageUrl", SqlDbType.NVarChar, 200).Value = imageUrl;
                    using (SqlDataReader reader = objComm.ExecuteReader())
                    {
                        if (reader.HasRows)
                            exists = true;                           
                    }
                }
            }
            return exists;
        }

        private DataTable loadImages()
        {
            DataTable images = new DataTable();
            using (SqlConnection objConn = new SqlConnection(connectionString))
            {
                using (SqlCommand objComm = new SqlCommand("SELECT * FROM productImageUrl", objConn))
                {
                    objConn.Open();                    
                    using (SqlDataReader reader = objComm.ExecuteReader())
                    {
                        images.Load(reader);
                    }
                }
            }
            return images;
        }

        private int saveImage(string imageUrl)
        {
            try
            { 
                Image image = Image.FromFile(path + imageUrl);
                string fullPath = HttpContext.Current.Server.MapPath(new ProductBL().CreateNewImageName(0)) + imageUrl.Substring(imageUrl.IndexOf('.'));
                image.Save(fullPath);
                new ProductBL().CreateProductImages(fullPath);
                return int.Parse(fullPath.Substring(fullPath.LastIndexOf("\\") + 1, fullPath.IndexOf(".jpg") - fullPath.LastIndexOf("\\") - 1));
            }
            catch(Exception ex)
            {
                return -1;
            }
        }

        private bool updateImage(string imageUrl, int sortOrder, int productImageUrlID)
        {
            using (SqlConnection objConn = new SqlConnection(connectionString))
            {
                using (SqlCommand objComm = new SqlCommand("UPDATE productImageUrl SET imageUrl = @imageUrl, sortOrder = @sortOrder, productImageUrlID = @productImageUrlID WHERE imageUrl = @oldImageUrl", objConn))
                {
                    objConn.Open();
                    //objComm.CommandType = CommandType.StoredProcedure;
                    objComm.Parameters.Add("@imageUrl", SqlDbType.NVarChar, 200).Value = productImageUrlID.ToString() + ".jpg";
                    objComm.Parameters.Add("@sortOrder", SqlDbType.Int).Value = sortOrder;
                    objComm.Parameters.Add("@productImageUrlID", SqlDbType.Int).Value = productImageUrlID;
                    objComm.Parameters.Add("@oldImageUrl", SqlDbType.NVarChar, 200).Value = imageUrl;

                    objComm.ExecuteNonQuery();
                }
            }
            return true;
        }

        private int getMaxID()
        {
            int maxID = 0;
            using (SqlConnection objConn = new SqlConnection(connectionString))
            {
                using (SqlCommand objComm = new SqlCommand("SELECT ISNULL(MAX(productImageUrlID), 0) FROM productImageUrl", objConn))
                {
                    using (SqlDataReader reader = objComm.ExecuteReader())
                    {
                        while (reader.Read())
                            maxID = reader.GetInt32(0);
                    }
                }
            }
            return maxID + 1;
        }
    }
}