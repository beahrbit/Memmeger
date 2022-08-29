using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System.Reflection;

using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

public class IgnoreReversePropertyFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema schema, SchemaFilterContext schemaFilterContext)
    {
        if (schema.Properties.Count == 0)
            return;

        var excludedNames = schemaFilterContext.Type
            .GetProperties()
            .Where(p => p.GetCustomAttribute<InversePropertyAttribute>() != null)
            .Select(p => char.ToLowerInvariant(p.Name[0]) + p.Name.Substring(1));

        foreach (var name in excludedNames)
        {
            if (schema.Properties.ContainsKey(name))
                schema.Properties.Remove(name);
        }
    }
}

public class ChangeKeyAttributeRequiredFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema schema, SchemaFilterContext schemaFilterContext)
    {
        if (schema.Properties.Count == 0)
            return;

        IEnumerable<string> keys = schemaFilterContext.Type
            .GetProperties()
            .Where(p => p.GetCustomAttribute<KeyAttribute>() != null)
            .Select(p => char.ToLowerInvariant(p.Name[0]) + p.Name.Substring(1));

        if (keys == null || !keys.Any()) 
            return;

        if (schema.Required == null)
        {
            schema.Required = (ISet<string>) new List<string>();
        }

        foreach (string key in keys)
        {
            schema.Required.Add(key);
        }
    }
}