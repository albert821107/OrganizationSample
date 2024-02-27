using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using OrganizationSample;
using System.Globalization;

namespace OrganizationSample.Controllers;

[ApiController]
[Route("[controller]")]
public class SearchController : ControllerBase
{
    public SearchController() { }

    [HttpGet]
    public List<PolicyHolder> SearchPolicyHolder()
    {
        List<PolicyHolder> policyHolders = new List<PolicyHolder>();

        string connectionString = "data source=127.0.0.1;initial catalog=sample;persist security info=True;user id=sa;password=Sample01;multipleactiveresultsets=True;";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string sqlQuery = "SELECT *FROM PolicyHolder";

            using (SqlCommand command = new SqlCommand(sqlQuery, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        PolicyHolder policyHolder = new PolicyHolder
                        {
                            Code = reader["code"].ToString(),
                            Name = reader["name"].ToString(),
                            RegistrationDate = Convert.ToDateTime(reader["registration_date"], CultureInfo.InvariantCulture),
                            IntroducerCode = reader["introducer_code"].ToString()
                        };

                        policyHolders.Add(policyHolder);
                    }
                }
            }

            return policyHolders;
        }
    }

    [HttpGet("{id}", Name = "GetWeatherForecastById")]
    public WeatherForecast SearchTopPolicyHolder(int id)
    {
        return null;
    }
}
